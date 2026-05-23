cask "isle" do
  version "0.1.5"
  sha256 "b01b5bcb4b7090683044793a3a40b1006e7f2b84116139accbe83a59af5fd863"

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
