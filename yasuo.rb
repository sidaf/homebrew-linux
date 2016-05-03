require "formula"

class Yasuo < Formula
  homepage "https://github.com/0xsauby/yasuo"
  url "https://github.com/0xsauby/yasuo", :using => :git, :revision => 'a917a6e'
  version "2.1.20160421"

  depends_on "nmap"
  depends_on "libxml2"
  depends_on "libxslt"

  def install

    (buildpath/"Gemfile").write <<-EOS.undent
      source 'https://rubygems.org'

      gem 'ruby-nmap'
      gem 'net-http-persistent'
      gem 'mechanize'
      gem 'text-table'
    EOS

    system "bundle", "install", "--no-cache", "--path", "vendor/bundle"

    (bin/"yasuo").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/yasuo.rb "$@"
    EOS
    libexec.install Dir['*']
    libexec.install ".bundle"
  end
end
