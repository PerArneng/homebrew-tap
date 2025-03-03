class Filefuser < Formula
  desc "CLI tool to fuse files together"
  homepage "https://github.com/PerArneng/filefuser"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.3.0/filefuser-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "565b1912b9c9771ea5a303740ad7accdd73d86b5bf329d9fbdf8835bb8da9322"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.3.0/filefuser-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "814ba101a1a3713c90b820f43a8278b3813bea26ecce2755b2b9716e67673f77"
    end

    def install
      bin.install "filefuser"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.3.0/filefuser-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f46c70e974c740e853230bf8e8d5f6feb7206f286921b56f70060a9aa626eaa"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.3.0/filefuser-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fd0a438005f815a30c44469b670241343556ab2e2b9b6e8d371a5cf3410ea9b"
    end

    def install
      bin.install "filefuser"
    end
  end

  test do
    system "#{bin}/filefuser", "--help"
  end
end
