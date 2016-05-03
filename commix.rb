require "formula"

class Commix < Formula
  homepage "https://github.com/stasinopoulos/commix"
  url "https://github.com/stasinopoulos/commix", :using => :git, :revision => "08492f5"
  version "0.7b-20160418"

  def install
    (bin/"commix").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python commix.py "$@"
    EOS
    libexec.install Dir['*']
  end
end
