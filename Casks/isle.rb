cask "isle" do
  version "0.1.6"
  sha256 "fac99efa3e1a86a9056faa9afb8549ca9fcd08ae64064c78831674dce0fd3aac"

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
