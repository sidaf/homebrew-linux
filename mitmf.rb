require "formula"

class Mitmf < Formula
  homepage "https://github.com/byt3bl33d3r/MITMf"
  url "https://github.com/byt3bl33d3r/MITMf/archive/v0.9.7.tar.gz"
  sha256 "45840c13159d99dd5ebe65297f957a96b65903eb177cb0d387f80df5dfd052ae"

  version "0.9.7"

  depends_on :python
  depends_on "libdnet" # scapy

  resource "twisted" do
    url "https://pypi.python.org/packages/source/T/Twisted/Twisted-15.2.1.tar.bz2"
    sha256 "cfc328411ed52632ab8e7ae02cbc1422c51f5bd3abf919405ccf64d612cbb13d"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.7.0.tar.gz"
    sha256 "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d"
  end

  resource "pylibpcap" do
    url "https://downloads.sourceforge.net/project/pylibpcap/pylibpcap/0.6.4/pylibpcap-0.6.4.tar.gz"
    sha256 "cfc365f2707a7986496acacf71789fef932a5ddbeaa36274cc8f9834831ca3b1"
  end

  resource "scapy" do
    url "https://pypi.python.org/packages/source/s/scapy/scapy-2.3.1.zip"
    sha256 "c3089764ad4cdd96d56816ac8bed4cea3738ce49d18a1a7ef2906a11927ba28b"
  end

  resource "msgpack-python" do
    url "https://pypi.python.org/packages/source/m/msgpack-python/msgpack-python-0.4.6.tar.gz"
    sha256 "bfcc581c9dbbf07cc2f951baf30c3249a57e20dcbd60f7e6ffc43ab3cc614794"
  end

  resource "dnspython" do
    url "https://pypi.python.org/packages/source/d/dnspython/dnspython-1.12.0.zip"
    sha256 "63bd1fae61809eedb91f84b2185816fac1270ae51494fbdd36ea25f904a8502f"
  end

  resource "dnslib" do
    url "https://pypi.python.org/packages/source/d/dnslib/dnslib-0.9.4.tar.gz"
    sha256 "41b3698a88fe0d0f52a007032f4983fdbbf79578e251685d4aa87896cb29b545"
  end

  resource "configobj" do
    url "https://pypi.python.org/packages/source/c/configobj/configobj-5.0.6.tar.gz"
    sha256 "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
  end

  resource "pefile" do
    url "http://pefile.googlecode.com/files/pefile-1.2.10-139.tar.gz"
    sha256 "8b7c5d853c97a923d0f6e128d0ae76b962aa75fd608d552f5a32e46276908a16"
  end

  resource "ipy" do
    url "https://pypi.python.org/packages/source/I/IPy/IPy-0.83.tar.gz"
    sha256 "61da5a532b159b387176f6eabf11946e7458b6df8fb8b91ff1d345ca7a6edab8"
  end

  resource "pyopenssl" do
    url "https://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.15.1.tar.gz"
    sha256 "f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672"
  end

  resource "service_identity" do
    url "https://pypi.python.org/packages/source/s/service_identity/service_identity-14.0.0.tar.gz"
    sha256 "3105a319a7c558490666694f599be0c377ad54824eefb404cde4ce49e74a4f5a"
  end

  resource "watchdog" do
    url "https://pypi.python.org/packages/source/w/watchdog/watchdog-0.8.3.tar.gz"
    sha256 "7e65882adb7746039b6f3876ee174952f8eaaa34491ba34333ddf1fe35de4162"
  end

  resource "impacket" do
    url "https://pypi.python.org/packages/source/i/impacket/impacket-0.9.13.tar.gz"
    sha256 "56bb18010f13a33947c24d31f51e16d8c688cf9c753c1d52f79a9ba64e5c0dca"
  end

  resource "capstone" do
    url "https://pypi.python.org/packages/source/c/capstone/capstone-3.0.3.tar.gz"
    sha256 "0cb5206a5358a55f516b7a958da278466fc378f837187cb4f9df77f367e5e80a"
  end

  resource "pypcap" do
    url "https://pypi.python.org/packages/source/p/pypcap/pypcap-1.1.3.tar.gz"
    sha256 "cc0786efd527f16c5f0d08accf3cbd9ff8971ddc284a445cdabf2e47b458a377"
  end

  # Pillow

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"

    res =  %w[twisted requests pylibpcap scapy msgpack-python dnspython dnslib configobj]
    res += %w[pefile ipy pyopenssl service_identity watchdog impacket capstone pypcap]
    res.each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    (bin/"mitmf").write <<-EOS.undent
      #!/usr/bin/env bash
      PYTHONPATH=#{ENV["PYTHONPATH"]} cd #{libexec} && ./mitmf.py "$@"
    EOS
    system "git", "clone", "https://github.com/secretsquirrel/the-backdoor-factory.git", "libs/bdfactory"
    libexec.install Dir['*']
  end
end
