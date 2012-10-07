#! /usr/bin/env ruby
#
# LastPass Importer
# by Alex Sayers (github.com/asayers)
#
# Reads CSV files exported from LastPass and imports them into Pass (http://zx2c4.com/projects/password-store/)
#

# Set this variable to place all uncategorised records into a particular group
DEFAULT_GROUP = ""

class Note
  def initialize name, url, username, password, extra, grouping, fav
    @name, @url, @username, @password, @extra, @grouping, @fav = name, url, username, password, extra, grouping, fav
  end

  def name
    s = ""
    s << @grouping + "/" unless @grouping.empty?
    s << @name
    s.gsub(/ /, "_").gsub(/'/, "")
  end

  def to_s
    s = ""
    s << "#{@password}\n---\n"
    s << "#{@grouping} / " unless @grouping.empty?
    s << "#{@name}\n"
    s << "username: #{@username}\n" unless @username.empty?
    s << "password: #{@password}\n" unless @password.empty?
    s << "url: #{@url}\n" unless @url == "http://sn"
    s << "#{@extra}\n" unless @extra.nil?
    return s
  end
end

# Check for a filename
if ARGV.empty?
  puts "Usage: import <file>      import records from specified file"
  exit 0
end

# Get filename of csv file
filename = ARGV.join(" ")
puts "Reading '#{filename}'..."

# Extract individual records
entries = []
entry = ""
begin
  file = File.open(filename)
  file.each do |line|
    if line =~ /^http/
      entries.push(entry)
      entry = ""
    end
    entry += line
  end
  entries.push(entry)
  entries.shift
  puts "#{entries.length} records found!"
rescue
  puts "Couldn't find #{filename}!"
  exit 1
end

# Parse records and create Note objects
notes = []
entries.each do |e|
  args = e.split(",")
  url = args.shift
  username = args.shift
  password = args.shift
  fav = args.pop
  grouping = args.pop
  grouping = DEFAULT_GROUP if grouping.empty?
  name = args.pop
  extra = args.join(",")[1...-1]
  
  notes << Note.new(name, url, username, password, extra, grouping, fav)
end
puts "Records parsed: #{notes.length}"

successful = 0
errors = []
notes.each do |n|
  print "Creating record #{n.name}..."
  IO.popen("pass insert -m '#{n.name}' > /dev/null", 'w') do |io|
    io.puts n
  end
  if $? == 0
    puts " done!"
    successful += 1
  else
    puts " error!"
    errors << n
  end
end
puts "#{successful} records successfully imported!"

if errors
  puts "There were #{errors.length} errors:"
  errors.each { |e| print e.name + (e == errors.last ? ".\n" : ", ")}
  puts "These probably occurred because there were multiple entries with the same name."
end
