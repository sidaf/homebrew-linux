require 'formula'

class Dirb < Formula
  homepage 'https://github.com/seifreed/dirb'
  url 'https://github.com/seifreed/dirb', :using => :git, :revision => '1ca12f7'
  version "2.2-20161120"
  revision 2

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "curl" => :build

  def install
    inreplace "src/global.h", "/usr/share/dirb/wordlists/common.txt", "#{pkgshare}/wordlists/common.txt"
    inreplace "src/dirb.c", "/usr/share/dirb/wordlists/vulns/apache.txt", "#{pkgshare}/wordlists/vulns/apache.txt"

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    pkgshare.install Dir["wordlists"]
  end
end
