require "formula"

class MetasploitFramework < Formula
  homepage "https://github.com/rapid7/metasploit-framework"
  head "https://github.com/rapid7/metasploit-framework", :using => :git
  url "https://github.com/rapid7/metasploit-framework", :using => :git, :revision => 'bcfab11'
  version "4.16.4"
  revision 1

  option "with-oracle", "Build with oracle support, requires a working installation of instantclient version 10.2"

  depends_on "ruby@2.3"
  depends_on "openssl"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "sqlite"
  depends_on "postgresql"
  depends_on "gmp"        # for ruby-oci8

  resource "bundler" do
    url "https://rubygems.org/downloads/bundler-1.15.1.gem"
    sha256 "fa6ec48f94faffe4987f89b4b85409fd6a4ddce8d46f779acdc26d041eb200d7"
  end

  def install
    if build.with? "oracle"
      ENV.append "SQLPATH", ENV["ORACLE_HOME"]
      ENV.append "TNS_ADMIN", ENV["ORACLE_HOME"]
      ENV.append "LD_LIBRARY_PATH", ENV["ORACLE_HOME"]
    end

    (buildpath/"vendor/bundle").mkpath
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/gem", "install", r.cached_download, "--no-document",
             "--install-dir", "vendor/bundle")
    end

    ENV["GEM_HOME"] = "#{buildpath}/vendor/bundle"
    system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby", "#{buildpath}/vendor/bundle/bin/bundle", "install",
           "--no-cache", "--path", "vendor/bundle"

    if build.with? "oracle"
      (buildpath/"Gemfile.local").write <<-EOS.undent
      group :local do
        gem 'ruby-oci8', '~> 2.2.3'
      end
      EOS
      (buildpath/"Gemfile.local.lock").write <<-EOS.undent
      GEM
        remote: https://rubygems.org/
        specs:
          ruby-oci8 (2.2.3)

      PLATFORMS
        ruby

      DEPENDENCIES
        ruby-oci8 (~> 2.2.3)

      BUNDLED WITH
        1.11.2
      EOS
      system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby", "#{buildpath}/vendor/bundle/bin/bundle", "install",
             "--deployment",  "--gemfile", "Gemfile.local", "--no-cache",
             "--path", "vendor/bundle"
    end

    (bin/"msfbinscan").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfbinscan "$@"
    EOS
    (bin/"msfconsole").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfconsole "$@"
    EOS
    (bin/"msfd").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfd "$@"
    EOS
    (bin/"msfelfscan").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfelfscan "$@"
    EOS
    (bin/"msfmachscan").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfmachscan "$@"
    EOS
    (bin/"msfpescan").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfpescan "$@"
    EOS
    (bin/"msfrop").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfrop "$@"
    EOS
    (bin/"msfrpc").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfrpc "$@"
    EOS
    (bin/"msfrpcd").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfrpcd "$@"
    EOS
    #(bin/"msfupdate").write <<-EOS.undent
    #  #!/usr/bin/env bash
    #  export GEM_HOME="#{pkgshare}/vendor/bundle"
    #  export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
    #  #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfupdate "$@"
    #EOS
    (bin/"msfvenom").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{pkgshare}/vendor/bundle"
      export BUNDLE_GEMFILE="#{pkgshare}/Gemfile"
      #{pkgshare}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{pkgshare}/msfvenom "$@"
    EOS

    pkgshare.install Dir['*']
    pkgshare.install ".git"
    pkgshare.install ".bundle"
  end
end
