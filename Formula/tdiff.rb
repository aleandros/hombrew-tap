class Tdiff < Formula
    desc "CLI application for comparing JSON/YAML files"
    homepage "https://github.com/aleandros/tdiff"
    url "https://github.com/aleandros/tdiff/archive/v0.2.1.tar.gz"
    sha256 "6b5b3ac5f01335632c02cd91802e7fb8e187ca3f76dbf94711761b8cdc154298"
  
    depends_on "crystal" => :build
    depends_on "libyaml"
  
    def install
      mkdir bin
      system "shards", "build", "--production", "--release", "--no-debug"
      system "strip", "./bin/tdiff"
      cp "./bin/tdiff", bin
    end
  
    test do
      assert_equal "0.2.1\n", pipe_output("#{bin}/tidff --version")
    end
  end