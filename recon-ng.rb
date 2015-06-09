require "formula"

class ReconNg < Formula
  homepage "https://bitbucket.org/LaNMaSteR53/recon-ng"
  url "https://bitbucket.org/LaNMaSteR53/recon-ng.git", :using => :git, :revision => "1f23b7f"
  version "4.6.1"

  depends_on "libxml2"
  depends_on "libxslt"

  resource "dicttoxml" do
    url "https://pypi.python.org/packages/source/d/dicttoxml/dicttoxml-1.6.6.tar.gz"
    sha256 "8229dcbadbe8a417b5e221b0bd56dff8a8ffd250951e6e95d51d5c5e2a77cc68"
  end

  resource "dnspython" do
    url "https://pypi.python.org/packages/source/d/dnspython/dnspython-1.12.0.zip"
    sha256 "63bd1fae61809eedb91f84b2185816fac1270ae51494fbdd36ea25f904a8502f"
  end

  resource "jsonrpclib" do
    url "https://pypi.python.org/packages/source/j/jsonrpclib/jsonrpclib-0.1.3.tar.gz"
    sha256 "a594e702c35408ae5540086ab5bdea284fb27d09520898c381c5bbdbfceffbba"
  end

  resource "lxml" do
    url "https://pypi.python.org/packages/source/l/lxml/lxml-3.4.4.tar.gz"
    sha256 "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
  end

  resource "mechanize" do
    url "https://pypi.python.org/packages/source/m/mechanize/mechanize-0.2.5.tar.gz"
    sha256 "2e67b20d107b30c00ad814891a095048c35d9d8cb9541801cebe85684cc84766"
  end

  resource "slowaes" do
    url "https://pypi.python.org/packages/source/s/slowaes/slowaes-0.1a1.tar.gz"
    sha256 "83658ae54cc116b96f7fdb12fdd0efac3a4e8c7c7064e3fac3f4a881aa54bf09"
  end

  resource "XlsxWriter" do
    url "https://pypi.python.org/packages/source/X/XlsxWriter/XlsxWriter-0.7.3.tar.gz"
    sha256 "2fa0f2d633bfbbc55a48abd4089820c744ed7a40e11c5c1580196a2c129eb8c6"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib64/python2.7/site-packages"

    %w[dicttoxml dnspython jsonrpclib lxml mechanize slowaes XlsxWriter].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    (bin/"recon-ng").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-ng "$@"
    EOS
    (bin/"recon-cli").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-cli "$@"
    EOS
    (bin/"recon-rpc").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-rpc "$@"
    EOS
    libexec.install Dir['*']
  end
end
