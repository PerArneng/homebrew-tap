class Gitwho < Formula
  desc "A powerful CLI tool that analyzes git history to identify contributors responsible for files or directories in a git repository."
  homepage "https://github.com/PerArneng/gitwho"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.1.0/gitwho_1.1.0_darwin_amd64.tar.gz"
      sha256 "cdd0654f4c741984e798be3db05bb9ba404355f2a3f0a4706a7ee29563fa22ff"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.1.0/gitwho_1.1.0_darwin_arm64.tar.gz"
      sha256 "4bd6baba1e002a91454097289461c197ac1b73e6c68ae91e2f41d29c9b98dd65"
    end

    def install
      bin.install "gitwho"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.1.0/gitwho_1.1.0_linux_amd64.tar.gz"
      sha256 "3f27034c3e31a085fc972a8aaf19dd326cf81f4eb7d8d2ee42d723429cdaf4e0"
    elsif Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.1.0/gitwho_1.1.0_linux_386.tar.gz"
      sha256 "48ffcb662897ccbe26926e49461949b27df45c306867a6b940c6bf250278bfa5"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.1.0/gitwho_1.1.0_linux_arm64.tar.gz"
      sha256 "94fe53ad5c3d63e2c80df8ab4ba604c246e31eac3e6daf554119125eb882c3ec"
    end

    def install
      bin.install "gitwho"
    end
  end

  test do
    system "#{bin}/gitwho", "--help"
  end
end
