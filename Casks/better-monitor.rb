cask "better-monitor" do
  version "0.1.7"
  sha256 "f582a22b5603745f7799e9a0e5e52768a3027d07037ffdf1450542d1fd239d5a"

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
