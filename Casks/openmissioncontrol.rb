cask "openmissioncontrol" do
  version "1.0,10"
  sha256 "759c77454b7ab31ad02bed45d9ea997415837d89501f93dbb7186e1c0c6917da"

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
