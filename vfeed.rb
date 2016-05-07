require 'formula'

class Vfeed < Formula
  homepage 'https://github.com/toolswatch/vFeed'
  url "https://github.com/toolswatch/vFeed", :using => :git, :revision => '3005f8c'
  version "0.6.7"

  def install
    inreplace "config/constants.py", /^license_file = .*$/, 'license_file = "'+pkgshare+'/LICENSE.md"'
    inreplace "config/constants.py", /^export_dir = .*$/, 'export_dir = "."'
    inreplace "config/constants.py", /^csv_dir = .*$/, 'csv_dir = "."'

    (bin/"vfeedcli").write <<-EOS.undent
       #!/usr/bin/env bash
       cd #{pkgshare} && python vfeedcli.py "$@"
    EOS

    pkgshare.install Dir["*"]
  end
end
