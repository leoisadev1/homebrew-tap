cask "better-monitor" do
  version "0.1.5"
  sha256 "db6f896b281573b159c1f885ba0b5b049c9a7b695007dc027ce823a7a3232986"

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
