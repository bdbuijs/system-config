{ ... }: {
  system = {
    stateVersion = 1;
    primaryUser = "bram";
    system.activationScripts.postActivation.text = ''
      echo "Applying user-specific settings for ${primaryUser}..."
      sudo -u "${primaryUser}" /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      echo "Finished applying user-specific settings."'';
    keyboard.enableKeyMapping = true;
    defaults = {
      CustomUserPreferences = {
        NSGlobalDomain.WebKitDeveloperExtras = true;
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.Safari" = {
          # Privacy: don’t send search queries to Apple
          UniversalSearchEnabled = false;
          SuppressSearchSuggestions = true;
          # Press Tab to highlight each item on a web page
          WebKitTabToLinksPreferenceKey = true;
          ShowFullURLInSmartSearchField = true;
          # Prevent Safari from opening ‘safe’ files automatically after downloading
          AutoOpenSafeDownloads = false;
          IncludeInternalDebugMenu = true;
          IncludeDevelopMenu = true;
          WebKitDeveloperExtrasEnabledPreferenceKey = true;
          WebAutomaticSpellingCorrectionEnabled = false;
          AutoFillFromAddressBook = false;
          AutoFillCreditCardData = false;
          AutoFillMiscellaneousForms = false;
          WarnAboutFraudulentWebsites = true;
          WebKitJavaEnabled = false;
          WebKitJavaScriptCanOpenWindowsAutomatically = false;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks" = true;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled" = false;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled" = false;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles" = false;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically" = false;
        };
        "com.apple.mail" = {
          # Disable inline attachments (just show the icons)
          DisableInlineAttachmentViewing = true;
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.print.PrintingPrefs" = {
          # Automatically quit printer app once the print jobs complete
          "Quit When Finished" = true;
        };
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          # Check for software updates daily, not just once per week
          ScheduleFrequency = 1;
          # Download newly available updates in background
          AutomaticDownload = 1;
          # Install System data files & security updates
          CriticalUpdateInstall = 1;
        };
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
        # Turn on app auto-update
        "com.apple.commerce".AutoUpdate = true;
      };
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain.AppleScrollerPagingBehavior = true;
      NSGlobalDomain.AppleShowAllExtensions = true;
      NSGlobalDomain.InitialKeyRepeat = 20;
      NSGlobalDomain.KeyRepeat = 2;
      NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
      NSGlobalDomain."com.apple.swipescrolldirection" = false;
      dock.autohide = true;
      dock.autohide-delay = 0.0;
      dock.autohide-time-modifier = 0.0;
      dock.mineffect = "scale";
      dock.mru-spaces = false;
      dock.show-recents = false;
      dock.showhidden = true;
      finder.AppleShowAllExtensions = true;
      finder.ShowPathbar = true;
      finder.ShowStatusBar = true;
      finder._FXShowPosixPathInTitle = true;
      loginwindow.PowerOffDisabledWhileLoggedIn = true;
      loginwindow.RestartDisabledWhileLoggedIn = true;
      screensaver.askForPassword = true;
      screensaver.askForPasswordDelay = 7;
      trackpad.TrackpadThreeFingerDrag = true;
    };
  };
}
