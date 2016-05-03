require "formula"

class Wpscan < Formula
  homepage "https://github.com/wpscanteam/wpscan"
  url "https://github.com/wpscanteam/wpscan", :using => :git, :revision => '361c96d'
  version "2.9"

  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "curl"

  def install
    system "bundle", "install", "--no-cache", "--path", "vendor/bundle"

    (bin/"wpscan").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/wpscan.rb "$@"
    EOS
    libexec.install Dir['*']
    libexec.install ".bundle"
  end
end
