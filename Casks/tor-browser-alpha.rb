cask "tor-browser-alpha" do
  version "12.5a7"
  sha256 "d0a87ad43f5463d5574766b020fb53f617f96bc046dc1804c02f3756f09c6341"

  url "https://dist.torproject.org/torbrowser/#{version}/TorBrowser-#{version}-macos_ALL.dmg"
  name "Tor Browser"
  desc "Web browser focusing on security"
  homepage "https://www.torproject.org/"

  livecheck do
    url "https://www.torproject.org/download/alpha/"
    regex(%r{href=.*?/TorBrowser[._-]v?(\d+(?:.\d+)*)[._-]macos[._-]ALL\.dmg}i)
  end

  auto_updates true
  conflicts_with cask: "tor-browser"

  app "Tor Browser.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.tor browser.sfl*",
    "~/Library/Application Support/TorBrowser-Data",
    "~/Library/Preferences/org.mozilla.tor browser.plist",
    "~/Library/Preferences/org.torproject.torbrowser.plist",
    "~/Library/SavedApplicationState/org.torproject.torbrowser.savedState",
  ]
end
