# env alias
alias ll="ls -alF"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Setting PATH for Python 3.6

# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
