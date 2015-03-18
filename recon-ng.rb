require "formula"

class ReconNg < Formula
  homepage "https://bitbucket.org/LaNMaSteR53/recon-ng"
  url "https://bitbucket.org/LaNMaSteR53/recon-ng.git", :using => :git, :revision => "e3a09d1"
  version "4.4.2"

  depends_on "libxml2"
  depends_on "libxslt"

  resource "lxml" do
    url "https://pypi.python.org/packages/source/l/lxml/lxml-3.4.2.tar.gz"
    sha256 'c7d5990298af6ffb00312973a25f0cc917a6368126dd40eaab41d78d3e1ea25d'
  end

  resource "xlsxwriter" do
    url "https://pypi.python.org/packages/source/X/XlsxWriter/XlsxWriter-0.6.8.tar.gz"
    sha256 'f48a8685df3b77482bf517c2139b75953401ca41e6ccfad07180487ca7745628'
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[lxml xlsxwriter].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    (bin/"recon-ng").write <<-EOS.undent
      #!/usr/bin/env bash
      PYTHONPATH=#{ENV["PYTHONPATH"]} cd #{libexec} && ./recon-ng "$@"
    EOS
    (bin/"recon-cli").write <<-EOS.undent
      #!/usr/bin/env bash
      PYTHONPATH=#{ENV["PYTHONPATH"]} cd #{libexec} && ./recon-cli "$@"
    EOS
    (bin/"recon-rpc").write <<-EOS.undent
      #!/usr/bin/env bash
      PYTHONPATH=#{ENV["PYTHONPATH"]} cd #{libexec} && ./recon-rpc "$@"
    EOS
    libexec.install Dir['*']
  end

  test do
    system "(#{bin}/recon-ng; true)"
  end
end
