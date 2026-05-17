cask "better-monitor" do
  version "0.1.8"
  sha256 "31485983f8e06deef75a9b58dfdb1fbd9df2df17fb5825dc8c535cada381d5e3"

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
