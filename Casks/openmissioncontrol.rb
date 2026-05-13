cask "openmissioncontrol" do
  version "1.0,7"
  sha256 "88f9727f040b72edc5de60d1e6618d175ee9b7ddb9a4fa84519ba6bb22da6de5"

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
