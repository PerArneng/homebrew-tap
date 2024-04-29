class Srctotext < Formula
  desc "CLI tool to aggregate source files into a single text file"
  homepage "https://github.com/PerArneng/srctotext"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/srctotext/releases/download/v0.1.3/srctotext-0.1.3-darwin-amd64.zip"
      sha256 "43d7707d949059f652669a9aac363a9a46bb58836c84fdfddd9baed783487bc0"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/srctotext/releases/download/v0.1.3/srctotext-0.1.3-darwin-arm64.zip"
      sha256 "a2217cd8764800330812cf14af9d08c547458804d60385188fd93bae2c464dc4"
    end

    def install
      bin.install "srctotext"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/PerArneng/srctotext/releases/download/v0.1.3/srctotext-0.1.3-linux-amd64.zip"
      sha256 "c24c61d0c88626d6b3ae95b300e19ec95d5866e3b08bcec3d7d4768c9ca08754"
    elsif Hardware::CPU.arm?
      url "https://github.com/PerArneng/srctotext/releases/download/v0.1.3/srctotext-0.1.3-linux-arm64.zip"
      sha256 "968757ea8d715ad489b8dd8892c36596da9a955f4a26e147f1c346e83b0f2e48"
    end

    def install
      bin.install "srctotext"
    end
  end

  test do
    system "#{bin}/srctotext", "--help"
  end
end
