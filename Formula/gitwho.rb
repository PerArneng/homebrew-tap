class Gitwho < Formula
  desc "A powerful CLI tool that analyzes git history to identify contributors responsible for files or directories in a git repository."
  homepage "https://github.com/PerArneng/gitwho"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.0.2/gitwho_1.0.2_darwin_amd64.tar.gz"
      sha256 "180a5f8b9c83457bbd7fac312d304800590bce7286f7579162fd518325eeeeb9"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.0.2/gitwho_1.0.2_darwin_arm64.tar.gz"
      sha256 "17aa0243c97c325f1760d26487d1593aed03c8856410e8a1b7eb0edc812e0702"
    end

    def install
      bin.install "gitwho"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.0.2/gitwho_1.0.2_linux_amd64.tar.gz"
      sha256 "8cd62b047f925bf643a4a75c07575f8e87dd539126cc598199258cb98a73f793"
    elsif Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.0.2/gitwho_1.0.2_linux_386.tar.gz"
      sha256 "1f2a6a3719ce097d71760fed4700b32e63387ca0330b1aa8c729cf228d7525c8"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/gitwho/releases/download/v1.0.2/gitwho_1.0.2_linux_arm64.tar.gz"
      sha256 "8deaf5df61bd23d69f9f9f5db477925d4a0b50a67cc0272b7f9c5f301a5257f8"
    end

    def install
      bin.install "gitwho"
    end
  end

  test do
    system "#{bin}/gitwho", "--help"
  end
end
