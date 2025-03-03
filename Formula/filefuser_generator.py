#!/usr/bin/env python3
"""
This script downloads release files for filefuser based on a provided version,
computes the sha256 checksum for each file, and generates a Homebrew formula file.
"""

import argparse
import hashlib
import os
import tempfile
from typing import Dict

import requests
import shutil

# Mapping of architecture keys to URL identifier strings.
ARCHS = {
    "darwin_arm": "aarch64-apple-darwin",
    "darwin_intel": "x86_64-apple-darwin",
    "linux_arm": "aarch64-unknown-linux-gnu",
    "linux_intel": "x86_64-unknown-linux-gnu",
}

BASE_URL = "https://github.com/PerArneng/filefuser/releases/download"


def download_file(url: str, dest_path: str) -> None:
    """
    Downloads the file from the given URL and writes it to dest_path.
    """
    print(f"Downloading {url} ...")
    response = requests.get(url, stream=True)
    response.raise_for_status()
    with open(dest_path, "wb") as f:
        for chunk in response.iter_content(chunk_size=8192):
            if chunk:
                f.write(chunk)
    print(f"Saved to {dest_path}")


def compute_sha256(file_path: str) -> str:
    """
    Computes the sha256 checksum of the file at file_path.
    """
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            sha256_hash.update(chunk)
    checksum = sha256_hash.hexdigest()
    print(f"Computed sha256 for {file_path}: {checksum}")
    return checksum


def generate_formula(version: str, sha256s: Dict[str, str]) -> str:
    """
    Generates a Homebrew formula file content using the version and checksums.
    """
    formula = f"""class Filefuser < Formula
  desc "CLI tool to fuse files together"
  homepage "https://github.com/PerArneng/filefuser"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "{BASE_URL}/v{version}/filefuser-v{version}-{ARCHS['darwin_intel']}.tar.gz"
      sha256 "{sha256s['darwin_intel']}"
    elsif Hardware::CPU.arm?
      url "{BASE_URL}/v{version}/filefuser-v{version}-{ARCHS['darwin_arm']}.tar.gz"
      sha256 "{sha256s['darwin_arm']}"
    end

    def install
      bin.install "filefuser"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "{BASE_URL}/v{version}/filefuser-v{version}-{ARCHS['linux_intel']}.tar.gz"
      sha256 "{sha256s['linux_intel']}"
    elsif Hardware::CPU.arm?
      url "{BASE_URL}/v{version}/filefuser-v{version}-{ARCHS['linux_arm']}.tar.gz"
      sha256 "{sha256s['linux_arm']}"
    end

    def install
      bin.install "filefuser"
    end
  end

  test do
    system "\#{bin}/filefuser", "--help"
  end
end
"""
    return formula


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Download filefuser release files, compute sha256, and generate a Homebrew formula."
    )
    parser.add_argument(
        "version", type=str, help="The version of filefuser to process (e.g., 0.3.0)"
    )
    args = parser.parse_args()

    version: str = args.version
    sha256s: Dict[str, str] = {}

    # Create a temporary directory for downloads.
    with tempfile.TemporaryDirectory(delete=True) as tmpdir:
        for key, arch in ARCHS.items():
            filename = f"filefuser-v{version}-{arch}.tar.gz"
            url = f"{BASE_URL}/v{version}/{filename}"
            dest_path = os.path.join(tmpdir, filename)
            try:
                download_file(url, dest_path)
            except requests.HTTPError as e:
                print(f"Failed to download {url}: {e}")
                return

            sha256s[key] = compute_sha256(dest_path)

    # Generate the Homebrew formula file content.
    formula_content: str = generate_formula(version, sha256s)

    # Write the formula content to filefuser.rb.
    output_file = "filefuser.rb"
    with open(output_file, "w") as f:
        f.write(formula_content)
    
    print(f"Homebrew formula generated in {output_file}")



if __name__ == "__main__":
    main()
