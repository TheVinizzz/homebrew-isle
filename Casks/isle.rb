cask "isle" do
  version "0.1.3"
  sha256 "d08411aa49ff7008538249326487a25fa9728f16f6b45bb1abd612b97b40047e"

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
