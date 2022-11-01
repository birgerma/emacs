

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

emacs_file=$HOME/.emacs
emacs_dir=$HOME/.emacs.d
# Remove current symlinks
if [ -h $emacs_file ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${emacs_file}"
    rm ${emacs_dir} 
fi

if [ -h $emacs_dir ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${emacs_file}"
    rm ${emacs_dir} 
fi

# Back up existing configuration files
dateStr=$(date +%Y-%m-%d-%H%M)
if [ -f "$emacs_file" ]; then
	echo "$emacs_file exists, backing up"
	mv emacs_file "$emacs_file"-"$dateStr".bak
fi

if [ -d "$emacs_dir" ]; then
	echo "$emacs_dir exists, backing up"
	mv $emacs_dir "$emacs_dir"-"dateStr".bak
fi

# Symlink dotfiles
ln -s $PWD/.emacs.d $HOME/.emacs.d
