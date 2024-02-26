class Brf < Formula
    desc "This tool search the regex pattern in the file"
    homepage "https://github.com/mailmebalachandran/homebrew-brf"
    url "https://github.com/mailmebalachandran/homebrew-brf/archive/v0.0.1.tar.gz"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    license "MIT OR Apache-2.0"
  
    depends_on "rust" => :build
  
    def install
      system "cargo", "install", "--root", prefix, "--path", "."
    end
  
    test do
      system "#{bin}/bsf", "--version"
    end
  end

  