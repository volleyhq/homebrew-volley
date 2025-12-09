class Volley < Formula
  desc "Volley CLI - Webhook forwarding for local development"
  homepage "https://github.com/volleyhq/volley-cli"
  url "https://github.com/volleyhq/volley-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 ""
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/volleyhq/volley-cli/releases/download/v0.1.2/volley-darwin-amd64.tar.gz"
      sha256 "675549b1c4873c3be763caba9e595a1d0ee010ffa6819442338a62fabb1bf67c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/volleyhq/volley-cli/releases/download/v0.1.2/volley-darwin-arm64.tar.gz"
      sha256 "0da83f4b4c72fc2f29d3cba945414c55cec452b1f4a57b47fe3b30046143a3b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/volleyhq/volley-cli/releases/download/v0.1.2/volley-linux-amd64.tar.gz"
      sha256 "0371bbcbd2fc7139cb71e9213a583e8d72acb781a524bd445675854f4d297aa6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/volleyhq/volley-cli/releases/download/v0.1.2/volley-linux-arm64.tar.gz"
      sha256 "2fe53335b5b0ad1d5873e28bfe9aacac8f9038bb60aded49073ce3a7e650abea"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "volley-darwin-amd64" => "volley"
      else
        bin.install "volley-darwin-arm64" => "volley"
      end
    else
      if Hardware::CPU.intel?
        bin.install "volley-linux-amd64" => "volley"
      else
        bin.install "volley-linux-arm64" => "volley"
      end
    end
  end

  test do
    system "#{bin}/volley", "--version"
  end
end

