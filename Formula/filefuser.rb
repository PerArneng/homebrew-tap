class Filefuser < Formula
  desc "CLI tool to fuse files together"
  homepage "https://github.com/PerArneng/filefuser"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.5.0/filefuser-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "4d4e35aec64990281c6ee2296b117b0fdb2ba99aee50d3acc7afdee1ac07e758"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.5.0/filefuser-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "767b55d9e788c15306b88dae851632cf10cd52fadc9f98683dc4e1a69a7c9acb"
    end

    def install
      bin.install "filefuser"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.5.0/filefuser-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1212bef537fc17893be444c152fbcda83e38a3aae916cd0ef75fce96e82fe91e"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/filefuser/releases/download/v0.5.0/filefuser-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d073281ffcf981fcee933c6f2c58eaa334a593abbbec74acfbb97000754f2ea2"
    end

    def install
      bin.install "filefuser"
    end
  end

  test do
    system "\#<built-in function bin>/filefuser", "--help"
  end
end
