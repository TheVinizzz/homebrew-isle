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

  zap trash: [
    "~/Library/Preferences/app.isle.macos.plist",
    "~/Library/Caches/app.isle.macos",
    "~/Library/Saved Application State/app.isle.macos.savedState",
  ]
end
