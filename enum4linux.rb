require 'formula'

class Enum4linux < Formula
  homepage 'https://labs.portcullis.co.uk/tools/enum4linux/'
  url 'https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz'
  sha256 '41334df0cb1ba82db9e3212981340372bb355a8160073331d2a1610908a62d85'

  depends_on "polenum"

  def install
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/enum4linux.pl"
  end

  test do
    system "#{bin}/enum4linux.pl -h"
  end
end
