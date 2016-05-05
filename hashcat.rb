require 'formula'

class Hashcat < Formula
  homepage 'http://hashcat.net/hashcat/'
  url 'http://hashcat.net/files/hashcat-2.00.7z'
  sha256 '142c2b419bedbec36c19ee14d09a3fe49e876f1a1d6064fab6595eca83e920cd'

  depends_on 'p7zip' => :build

  def install
    cd "hashcat-#{version}" do
      pkgshare.install Dir['*']
      if OS.linux?
        if Hardware.is_64_bit?
	        bin.install_symlink "#{pkgshare}/hashcat-cli64.bin" => 'hashcat'
	      else
	        bin.install_symlink "#{pkgshare}/hashcat-cli32.bin" => 'hashcat'
	      end
      else
        bin.install_symlink "#{pkgshare}/hashcat-cli64.app" => 'hashcat'
      end
    end
  end
end
