cask "openmissioncontrol" do
  version "1.0,11"
  sha256 "7471aaf547382a28e515123b67e4027d1769203f8c4e7c3856c277dfc4568baf"

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
