

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
