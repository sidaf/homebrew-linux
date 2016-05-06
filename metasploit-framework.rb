require "formula"

class MetasploitFramework < Formula
  homepage "https://github.com/rapid7/metasploit-framework"
  url "https://github.com/rapid7/metasploit-framework", :using => :git, :revision => '73ac6e6'
  version "4.11.23"

  option "with-oracle", "Build with oracle support, requires a working installation of instantclient version 11.2"

  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "sqlite"
  depends_on "postgresql"
  depends_on "gmp"        # for ruby-oci8

  def install
    if build.with? "oracle"
      (buildpath/"Gemfile.local").write <<-EOS.undent
      msf_gemfile = File.join(File.dirname(__FILE__), 'Gemfile')
      if File.readable?(msf_gemfile)
        instance_eval(File.read(msf_gemfile))
      end
      group :local do
        gem 'ruby-oci8', '~> 2.1.8'
      end
      EOS
      system "bundle", "install", "--gemfile", "Gemfile.local", "--no-cache", "--path", "vendor/bundle"
    else
      system "bundle", "install", "--no-cache", "--path", "vendor/bundle"
    end

    (bin/"msfbinscan").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfbinscan "$@"
    EOS
    (bin/"msfconsole").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfconsole "$@"
    EOS
    (bin/"msfd").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfd "$@"
    EOS
    (bin/"msfelfscan").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfelfscan "$@"
    EOS
    (bin/"msfmachscan").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfmachscan "$@"
    EOS
    (bin/"msfpescan").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfpescan "$@"
    EOS
    (bin/"msfrop").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfrop "$@"
    EOS
    (bin/"msfrpc").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfrpc "$@"
    EOS
    (bin/"msfrpcd").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfrpcd "$@"
    EOS
    #(bin/"msfupdate").write <<-EOS.undent
    #  #!/usr/bin/env bash
    #  BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfupdate "$@"
    #EOS
    (bin/"msfvenom").write <<-EOS.undent
      #!/usr/bin/env bash
      BUNDLE_GEMFILE=#{libexec}/Gemfile bundle exec ruby #{libexec}/msfvenom "$@"
    EOS

    libexec.install Dir['*']
    libexec.install ".bundle"
  end
end
