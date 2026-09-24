cask "openmissioncontrol" do
  version "1.1.0"
  sha256 "34e6c628bcc31648d342468f65c4caea1d9ec569fc3e988615fd8fb2b50b5ef0"

  url "https://github.com/nohackjustnoobb/OpenMissionControl/releases/download/v#{version}/OpenMissionControl.dmg"
  name "Open Mission Control"
  desc "Open-source alternative to Mission Control Plus"
  homepage "https://github.com/nohackjustnoobb/OpenMissionControl"

  depends_on :macos

  app "Open Mission Control.app"

  # Silently remove the quarantine tag post-installation
  postflight do
    system_command "xattr",
                   args:         [
                     "-r", "-d", "com.apple.quarantine",
                     "#{appdir}/Open Mission Control.app"
                   ],
                   # Prevents installation from failing if the user already stripped it
                   must_succeed: false,
                   sudo:         false
  end

  zap trash: [
    "~/Library/Application Support/Open Mission Control",
    "~/Library/Preferences/*OpenMissionControl*.plist",
  ]
end
