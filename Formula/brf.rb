class Brf < Formula
    desc "This tool search the regex pattern in the file"
    homepage "https://github.com/mailmebalachandran/homebrew-brf"
    url "https://github.com/mailmebalachandran/homebrew-brf/archive/v0.0.1.tar.gz"
    sha256 "a47be015edfb3229a0af6f4fe8831c3d26ccd57523ca2fbd327644325866542f"
    license "MIT OR Apache-2.0"
  
    depends_on "rust" => :build
  
    def install
      system "cargo", "install", "--root", prefix, "--path", "."
    end
  
    test do
      system "#{bin}/brf", "--version"
    end
  end

  