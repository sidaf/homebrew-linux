require 'formula'

class Vfeed < Formula
  homepage 'https://github.com/toolswatch/vFeed'
  head 'https://github.com/toolswatch/vFeed.git'

  def install
    (bin/"vfeedcli").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && python vfeedcli.py "$@"
    EOS
    libexec.install Dir['*']
  end
end