require 'formula'

class Frogger < Formula
  homepage 'https://github.com/nccgroup/vlan-hopping---frogger'
  url 'https://github.com/nccgroup/vlan-hopping---frogger', :using => :git, :revision => 'a37ba4e'
  version '0.20160224'

  depends_on "arp-scan"
  depends_on "yersinia"

  def install
    bin.install "frogger.sh"
  end

  def caveats; <<-EOS.undent
    Addional dependancies are required, install either via brew or alternate methods such as apt or dnf.
      - tshark
      - screen
      - vconfig
    EOS
  end
end