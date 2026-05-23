cask "isle" do
  version "0.1.8"
  sha256 "0b5cfeef3abce15226782ed4c7cbd79f498d909d422903c07f3b29a4eb020b8c"

  url "https://github.com/TheVinizzz/Isle/releases/download/v#{version}/Isle-#{version}.dmg",
      verified: "github.com/TheVinizzz/Isle/"
  name "Isle"
  desc "Turn your MacBook notch into an interactive island — music, calendar, FX rates"
  homepage "https://github.com/TheVinizzz/Isle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Isle.app"

  # Isle is ad-hoc signed (no paid Apple Developer ID). macOS Gatekeeper
  # blocks the first launch unless the quarantine attribute is removed.
  # Same pattern used by the boring-notch and SourceGit casks.
  postflight do
    app_path = appdir/"Isle.app"
    next unless app_path.exist?
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", app_path]
  end

  uninstall quit: "app.isle.macos"

  zap trash: [
    "~/Library/Preferences/app.isle.macos.plist",
    "~/Library/Caches/app.isle.macos",
    "~/Library/Saved Application State/app.isle.macos.savedState",
  ]

  caveats <<~CAVEATS
    If macOS still blocks Isle on first launch, run once:

      xattr -dr com.apple.quarantine /Applications/Isle.app

    Or open System Settings → Privacy & Security → scroll to
    "Isle was blocked" → Open Anyway.
  CAVEATS
end
