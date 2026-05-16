cask "better-monitor" do
  version "0.1.3"
  sha256 "0da588193128183681feb7d0dbc1564b74fb3a0bb27fc24db836fd5ec5d9c127"

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
