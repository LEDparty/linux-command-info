# About

A script that tells you everything you need to know about command line 
computer programs in linux. It's designed to work out of the box on all
linux systems (at the ones with the core GNU tools installed).

Lots of linux commands are designed to provide information about other
commands, but this one tells you the path and executable status, location,
size, path name, and filetype of commands and scripts all at once:

<pre><code>
cp is in $PATH and is executable

Location: /usr/bin

Path to file: /usr/bin/cp

File Size: 141848 Bytes

File Type: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV),
dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,
BuildID[sha1]=485614c781fe6f39bb22e75c26b25377662006f6, for
GNU/Linux 3.2.0, stripped
</pre></code>

# Installation and use

Copy and paste these commands for a fast install and test use:

<pre><code>
git clone https://github.com/LEDparty/linux-command-info
cd linux-command-info
</pre></code>

You will be ready to run the program, but can also run this to make the
script available through any directory:

<pre><code>
sudo install cmd-info.sh /usr/local/bin
</pre></code>

That will make running the command easier, but you might want to omit that
step if you're not sure if you this script on your computer.

If you ommitted the install command, run it like this from the command
line in the `linux-command-info` directory you just created:

<pre><code>
./cmd-info.sh [command name]
</pre></code>

If you fully installed the script:

<pre><code>
cmd-info.sh [command name]
</pre></code>

This script can be really helpful for understanding your installed software,
diagnosing various problems, and identifying conflicts.
