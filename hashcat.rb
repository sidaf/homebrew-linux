require 'formula'

class Hashcat < Formula
  homepage 'http://hashcat.net/hashcat/'
  url "https://hashcat.net/files/hashcat-3.00.7z"
  sha256 "54fe501ecc7b5246aaf92eef3f6afc23f985f721ef8d53e5ce5fda7d680f46a2"

  depends_on 'p7zip' => :build

  def install
    cd "hashcat-#{version}" do
      pkgshare.install Dir['*']
      if OS.linux?
        if Hardware.is_64_bit?
	        bin.install_symlink "#{pkgshare}/hashcat64.bin" => 'hashcat'
	      else
	        bin.install_symlink "#{pkgshare}/hashcat32.bin" => 'hashcat'
	      end
      else
        bin.install_symlink "#{pkgshare}/hashcat64.bin" => 'hashcat'
      end
    end
  end
end
