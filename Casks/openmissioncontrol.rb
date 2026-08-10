cask "openmissioncontrol" do
  version "1.0,9"
  sha256 "ea3685ad3cd317bd3bbbb9de449bb86814858ac292877502d45dbb0b2e6813dd"

  url "https://github.com/nohackjustnoobb/OpenMissionControl/releases/download/v#{version.csv.first}%2B#{version.csv.second}/OpenMissionControl.dmg"
  name "Open Mission Control"
  desc "Open-source alternative to Mission Control Plus"
  homepage "https://github.com/nohackjustnoobb/OpenMissionControl"

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
