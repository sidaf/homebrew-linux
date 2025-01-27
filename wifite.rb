require "formula"

class Wifite < Formula
  homepage "https://github.com/derv82/wifite"
  url "https://github.com/derv82/wifite", :using => :git, :revision => "edbdedd"
  version "2.0"
  revision 1

  depends_on "sidaf/pentest/aircrack-ng"
  depends_on "reaver"
  depends_on "cowpatty"

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec

    bin.install "wifite.py"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  def caveats; <<~EOS
    Addional dependancies are required, install either via brew or alternate methods such as apt or dnf.
      - standard linux command line tools: iwconfig, ifconfig, which, iw
      - tshark
      - pyrit (optional)
    EOS
  end
end
