

# Setup alias
# Shorter alias for using emacs as client without graphics
em_alias="alias 'em'='emacsclient -nw -create-frame --alternate-editor=\"\"'"

# Use emacs as client
emacs_alias="alias 'emacs'='emacsclient -create-frame --alternate-editor=\"\"'"

TARGET_FILE=$HOME/.bashrc

# Only add append aliases if not already in TARGET_FILE
if  grep -q "$em_alias" "$TARGET_FILE" ; then
        echo 'em alias exists, do nothing' ; 
else
        echo 'em alias does not exist, adding alias' ; 
	echo $em_alias >> $TARGET_FILE
fi


if  grep -q "$emacs_alias" "$TARGET_FILE" ; then
        echo 'emacs alias exists, do nothing' ; 
else
        echo 'emacs alias does not exist, adding alias' ; 
	echo $emacs_alias >> $TARGET_FILE
fi


function removeSymlink() {
	if [ -h ${1} ]; then
	    # Existing symlink 
	    echo "Removing existing symlink: ${1}"
	    rm ${1} 
	fi
}

function backup() {
	dateStr=$(date +%Y-%m-%d-%H%M)
	if [ -f ${1} ]; then
	        echo "${1} exists, backing up"
	        mv ${1} "${1}"-"$dateStr".bak
	fi
}

function cleanup(){
	removeSymlink ${1}
	backup ${1}
}
cleanup $HOME/.emacs
cleanup $HOME/.emacs.d
cleanup $HOME/.config/emacs

# Symlink dotfiles
ln -s $PWD/emacs $HOME/.config/emacs
