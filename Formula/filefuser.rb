class Filefuser < Formula
  desc "CLI tool to fuse files together"
  homepage "https://github.com/PerArneng/filefuser"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.4.0/filefuser-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "4b0c3edf0f08df49cb6115647f844c01f9e62bc64e52f7aa8c32844957945a30"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.4.0/filefuser-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "08c4d2683e5de20dde0fedc42e7927d966c33d7ad8645700262a1cd44fac284b"
    end

    def install
      bin.install "filefuser"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.4.0/filefuser-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dce53a87e03eeaafe47ad75bca1b5c85f0b3908e418a874947c80feb9bd1906d"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.4.0/filefuser-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc29d9ef3ef385cdefd1f5ef82cd1ee424c455a4292d2752c285239f666eb309"
    end

    def install
      bin.install "filefuser"
    end
  end

  test do
    system "\#<built-in function bin>/filefuser", "--help"
  end
end
