LastPass => Pass Importer
=========================

This script allows you to take your passwords and secure notes from your
[LastPass](http://lastpass.com) vault and import them into
[Pass](http://zx2c4.com/projects/password-store/), an elegant Unix password
manager.

Usage
-----

Go to [lastpass.com](lastpass.com) and sign in. Next click on your username in the top-right
corner. In the drop-down meny that appears, click "Export". After filling in
your details again, copy the text and save it somewhere on your disk. Make sure
you copy the whole thing, and resist the temptation to "Save Page As" - the
script doesn't like HTML.

Now, [download](https://raw.github.com/asayers/lastpass-importer/master/lastpass_importer.rb) the importer script and make it executable (`chmod +x lastpass_importer.rb`). Fire up a terminal and run the importer script, passing the
file you saved as an argument. It sould look something like this:
`./lastpass_importer.rb path/to/passwords_file`

And that's it! If you're having any problems, please [contact me](mailto:alex.sayers@gmail.com) or [post an issue](https://github.com/asayers/lastpass-importer/issues).

Licence
-------

    Copyright (c) 2012, Alex Sayers
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met: 

    1. Redistributions of source code must retain the above copyright notice, this
       list of conditions and the following disclaimer. 
    2. Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution. 

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
