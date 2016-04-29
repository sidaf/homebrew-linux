require 'formula'

class Enum4linux < Formula
  homepage 'https://labs.portcullis.co.uk/tools/enum4linux/'
  url 'https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz'
  sha256 '41334df0cb1ba82db9e3212981340372bb355a8160073331d2a1610908a62d85'

  depends_on "polenum"

  def install
    bin.install "enum4linux.pl"
  end
end
