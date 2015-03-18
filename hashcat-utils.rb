require 'formula'

class HashcatUtils < Formula
  homepage 'http://hashcat.net/hashcat/'
  url 'https://hashcat.net/tools/hashcat-utils/hashcat-utils-1.1.7z'
  #sha256 ''

  depends_on 'p7zip' => :build

  def install
    cd "hashcat-utils-#{version}" do
      inreplace "Makefile", /\/opt\/hashcat-toolchain\/linux32\/bin\/i686-hashcat-linux-gnu-gcc/, ENV.cc
      inreplace "Makefile", /\$\(CFLAGS\) -m32/, '$(CFLAGS)'
      system "make", "clean"
      system "make", "posix"
      bin.install Dir["*.bin"]
      bin.install Dir["*.pl"]
    end
  end

  test do
    system "#{bin}/len.bin"
  end
end
