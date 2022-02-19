defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES #Show a path bar in the finder that shows the exact location
defaults write com.apple.finder ShowPathbar -bool true #Adds the path bar to the bottom of the finder
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false #Stop the automatic save to iCloud thing
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false #Remove the Warning Before Changing a File Extension in OSX
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" #Changes Default Finder View to List
defaults write com.apple.finder WarnOnEmptyTrash -bool false #Removes Warning Before Emptying Trash
defaults write com.apple.finder DisableAllAnimations -bool true #Disable Finder Animations
defaults write com.apple.finder FXICloudDriveDesktop -bool NO #Doesn't Sync Desktop to iCloud
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool NO #Removes iCloud Desktop from Finder Sidebar
defaults write com.apple.finder ShowStatusBar -bool YES #Shows Status Bar in Finder
defaults write com.apple.finder SidebariCloudDriveSectionDisclosedState -bool NO #Makes Sure iCloud Drive is Showing in Finder Sidebar
defaults write com.apple.finder FXArrangeGroupViewBy -string "Kind"
defaults write com.apple.dock autohide-time-modifier -int 0 #Sets Dock Autohide Time to O Seconds
defaults write com.apple.dock autohide -bool true #Turns Dock Autohide ON
defaults write com.apple.dock magnification -bool  NO #Turns of Dock Magnification
defaults write com.apple.dock orientation -string  left #Moving the Dock to the left Side of the Screen
defaults write com.apple.dock minimize-to-application -bool YES #Minimizing Applications to Their Respective Application Icon
defaults write com.apple.dock showhidden -string  YES #Shows Hidden Applications in Dock
defaults write com.apple.NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool FALSE #Remove Save to iCloud Functionality
defaults write com.apple.NSGlobalDomain AppleShowAllExtensions -bool YES #Shows All File Extensions Always
defaults write com.apple.NSGlobalDomain AppleShowScrollBars -string "WhenScrolling" #Showing Scroll Bars Only When Scrolling
defaults write com.apple.NSGlobalDomain NSAutomaticCapitalizationEnabled -bool NO #Disabling Automatic Capitalization
defaults write com.apple.appstore WebKitDeveloperExtras -bool true #Enabling Developer Stuff in App Store
defaults write com.apple.appstore ShowDebugMenu -bool true
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool TRUE #Delete Preview Window History On Close
defaults write com.apple.TextEdit RichText -int 0 #Sets Texedit to Automatically Open in Plain Text
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

killall dock
killall Finder
killall SystemUIServer
killall Mail
killall TextEdit
killall QuickTimePlayerX
killall Photos
