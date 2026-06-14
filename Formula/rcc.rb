class Rcc < Formula
  desc "Transparent Claude Code hook that compacts code reads to cut token use"
  homepage "https://github.com/AymericP/rcc-ai"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AymericP/rcc-ai/releases/download/v0.3.0/rcc-aarch64-apple-darwin.tar.gz"
      sha256 "b2b1121a899d0538d236322d2da572ddaa783930ef3612d1996dd5ba27814ece"
    end
    on_intel do
      url "https://github.com/AymericP/rcc-ai/releases/download/v0.3.0/rcc-x86_64-apple-darwin.tar.gz"
      sha256 "f36406f157dadc1f9a58206c6ddb92e19784c1dbaaa9240d2723d9a6d7e608b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AymericP/rcc-ai/releases/download/v0.3.0/rcc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fddb9f233bca084bb64f3b52a43c8959f7930d8c780d29ed8475dfc463f47c0a"
    end
  end

  def install
    bin.install "rcc"
  end

  def caveats
    <<~EOS
      Wire up the Claude Code hooks (writes ~/.claude/settings.json, backed up first):
        rcc init --global
      Then restart Claude Code. Watch your savings grow with:
        rcc gain
    EOS
  end

  test do
    assert_match "rcc #{version}", shell_output("#{bin}/rcc --version")
  end
end
