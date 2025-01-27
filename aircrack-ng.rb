require "formula"

class AircrackNg < Formula
  homepage "http://aircrack-ng.org/"
  url "http://download.aircrack-ng.org/aircrack-ng-1.2-rc4.tar.gz"
  sha256 "d93ac16aade5b4d37ab8cdf6ce4b855835096ccf83deb65ffdeff6d666eaff36"
  version "1.2-rc4"
  revision 1

  depends_on "pkg-config" => :build
  depends_on "sqlite"
  depends_on "openssl"
  depends_on "libnl"

  # Remove root requirement from OUI update script. See:
  # https://github.com/Homebrew/homebrew/pull/12755
  patch :DATA

  def install
    # Fix path to OUI file for non /usr/local installations
    inreplace "src/airodump-ng.h",
      "/etc/aircrack-ng/airodump-ng-oui.txt",
      "#{HOMEBREW_PREFIX}/etc/aircrack-ng/airodump-ng-oui.txt"

    inreplace "scripts/airodump-ng-oui-update",
      'OUI_PATH0="/etc/aircrack-ng"',
      'OUI_PATH0="' + HOMEBREW_PREFIX + '/etc/aircrack-ng"'

    system "make", "CC=#{ENV.cc}"
    system "make", "prefix=#{prefix}", "mandir=#{man1}", "install"
  end

  def caveats;  <<~EOS
    Run `airodump-ng-oui-update` install or update the Airodump-ng OUI file.
    EOS
  end
end

__END__
--- a/scripts/airodump-ng-oui-update
+++ b/scripts/airodump-ng-oui-update
@@ -7,25 +7,6 @@
 OUI_PATH="/usr/local/etc/aircrack-ng"
 AIRODUMP_NG_OUI="${OUI_PATH}/airodump-ng-oui.txt"
 OUI_IEEE="${OUI_PATH}/oui.txt"
-USERID=""
-
-
-# Make sure the user is root
-if [ x"`which id 2> /dev/null`" != "x" ]
-then
-	USERID="`id -u 2> /dev/null`"
-fi
-
-if [ x$USERID = "x" -a x$UID != "x" ]
-then
-	USERID=$UID
-fi
-
-if [ x$USERID != "x" -a x$USERID != "x0" ]
-then
-	echo Run it as root ; exit ;
-fi
-
 
 if [ ! -d "${OUI_PATH}" ]; then
 	mkdir -p ${OUI_PATH}

