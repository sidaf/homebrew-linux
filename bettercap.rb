require "formula"

class Bettercap < Formula
  homepage "https://github.com/evilsocket/bettercap"
  url "https://github.com/evilsocket/bettercap", :using => :git, :revision => '218b44c'
  version "1.6.0"
  revision 3

  depends_on "sidaf/pentest/ruby23"
  depends_on "openssl"

  def install
    # packetfu 1.1.12 breaks things, so lets stick with 1.1.11 which seems to work
    inreplace "bettercap.gemspec", "'packetfu', '~> 1.1', '>= 1.1.10'", "'packetfu', '= 1.1.11'"

    ENV["GEM_HOME"] = libexec
    system "gem23", "build", "bettercap.gemspec"
    system "gem23", "install", "bettercap-#{version}.gem"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end
end
