require 'formula'

class Hashcat < Formula
  homepage 'http://hashcat.net/hashcat/'
  url 'http://hashcat.net/files/hashcat-0.49.7z'
  sha256 '02ca88393ecf33aaa0905592ca71e90671338c9540f212b3ad0f4666a93b406d'

  depends_on 'p7zip' => :build

  def install
    cd "hashcat-#{version}" do
      prefix.install Dir['*']
      if OS.linux?
          if Hardware.is_64_bit?
	    bin.install_symlink "#{prefix}/hashcat-cli64.bin" => 'hashcat'
	  else
	    bin.install_symlink "#{prefix}/hashcat-cli32.bin" => 'hashcat'
	  end
      else
        bin.install_symlink "#{prefix}/hashcat-cli64.app" => 'hashcat'
      end
    end
  end

  test do
    system "#{bin}/hashcat --version"
  end
end
