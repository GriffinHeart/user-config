git submodule init

git submodule update

----
For Mac


to export iTerm2 settings: 

plutil -convert xml1 ~/Library/Preferences/com.googlecode.iterm2.plist -o ./com.googlecode.iterm2.plist


to import:

plutil -convert binary1 com.googlecode.iterm2.plist -o ~/Library/Preferences/com.googlecode.iterm2.plist

ln -s src/personal/user-config/.gitignore_global .gitignore_global
