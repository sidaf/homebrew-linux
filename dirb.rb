require 'formula'

class Dirb < Formula
  homepage 'http://dirb.sourceforge.net/'
  url "https://raw.githubusercontent.com/SwordFaith/homebrew-pentest/master/dirb222.tar.gz"
  sha256 "e8a9fbddb3839238fa1f462c0d706a4e6ade6340a3d7017645a478c924533089"
  version "2.2-20161120"
  revision 3

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    inreplace "src/dirb.c", "/usr/share/dirb/wordlists/common.txt", "/usr/local/share/dirb/wordlists/common.txt"
    inreplace "src/dirb.c", "/usr/share/dirb/wordlists/vulns/apache.txt", "/usr/local/share/dirb/wordlists/vulns/apache.txt"

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    pkgshare.install "wordlists"
  end

  test do
    system bin/"dirb", "--help"
  end
end
