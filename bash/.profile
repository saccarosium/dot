# This file is only here because some brain-dead
# applications require it.

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

##
# Your previous /Users/sacca/.profile file was backed up as /Users/sacca/.profile.macports-saved_2021-11-23_at_22:13:33
##

# MacPorts Installer addition on 2021-11-23_at_22:13:33: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

