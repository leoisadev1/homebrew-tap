cask "better-monitor" do
  version "0.1.2"
  sha256 "f46952af2fe062c37f5c2ef0497d5f309484c2ed890f0621defba194c187a2a0"

  url "https://github.com/leoisadev1/better-monitor/releases/download/v#{version}/Better-Monitor-#{version}.zip"
  name "Better Monitor"
  desc "Native macOS system monitor built with SwiftUI and AppKit"
  homepage "https://github.com/leoisadev1/better-monitor"

  depends_on macos: ">= :sonoma"

  app "Better Monitor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Better Monitor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Better Monitor",
    "~/Library/Caches/dev.leo.better-monitor",
    "~/Library/Preferences/dev.leo.better-monitor.plist",
    "~/Library/Saved Application State/dev.leo.better-monitor.savedState",
  ]
end
