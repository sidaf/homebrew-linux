require "formula"

class Mitmf < Formula
  homepage "https://github.com/byt3bl33d3r/MITMf"
  url "https://github.com/byt3bl33d3r/MITMf/archive/v0.9.7.tar.gz"
  sha256 "45840c13159d99dd5ebe65297f957a96b65903eb177cb0d387f80df5dfd052ae"

  version "0.9.7"

  depends_on :python
  depends_on "libdnet" # scapy
  depends_on "libffi"  # cffi -> pyopenssl
  depends_on "openssl" # pyopenssl

  resource "twisted" do
    url "https://pypi.python.org/packages/source/T/Twisted/Twisted-15.2.1.tar.bz2"
    sha256 "cfc328411ed52632ab8e7ae02cbc1422c51f5bd3abf919405ccf64d612cbb13d"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.7.0.tar.gz"
    sha256 "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d"
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

  resource "Pillow" do
    url "https://pypi.python.org/packages/source/P/Pillow/Pillow-2.8.2.tar.gz"
    sha256 "2caf5b992bdbe67e05084658b783d4dcb9cf7becda3794d95c89e0575c453c3a"
  end

  # required by twisted
  resource "zope.interface" do
    url "https://pypi.python.org/packages/source/z/zope.interface/zope.interface-3.8.0.tar.gz"
    sha256 "1d5411ff82fd3a73bad6efb38deddb3f98d61d590344deb0cdd308e8aa94d3ff"
  end

  #resource "zope.interface" do
  #  url "https://pypi.python.org/packages/source/z/zope.interface/zope.interface-3.6.7.zip"
  #  sha256 "85ac373828528ea18a3388cb9b5227b85fd3c3cc99f9875cf89cfea86134ffdc"
  #end

  # required by configobj
  resource "six" do
    url "https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz"
    sha256 "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
  end

  # required by pyopenssl
  resource "cryptography" do
    url "https://pypi.python.org/packages/source/c/cryptography/cryptography-0.9.1.tar.gz"
    sha256 "c3bab8f43ac20ca6f5ee4d40ab40fca97e8909c5a9869643cb775a5ed2929595"
  end

  # required by service-identity
  resource "characteristic" do
    url "https://pypi.python.org/packages/source/c/characteristic/characteristic-14.3.0.tar.gz"
    sha256 "ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380"
  end

  # required by service-identity
  resource "pyasn1-modules" do
    url "https://pypi.python.org/packages/source/p/pyasn1-modules/pyasn1-modules-0.0.5.tar.gz"
    sha256 "be65f00ed28e30756f1ef39377cb382480a2368699179d646a84d79fe9349941"
  end

  # required by service-identity
  resource "pyasn1" do
    url "https://pypi.python.org/packages/source/p/pyasn1/pyasn1-0.1.7.tar.gz"
    sha256 "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7ad8f98b25c101eab"
  end

  # required by watchdog
  resource "PyYAML" do
    url "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz"
    sha256 "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
  end

  # required by watchdog
  resource "argh" do
    url "https://pypi.python.org/packages/source/a/argh/argh-0.26.1.tar.gz"
    sha256 "06a7442cb9130fb8806fe336000fcf20edf1f2f8ad205e7b62cec118505510db"
  end

  # required by watchdog
  resource "pathtools" do
    url "https://pypi.python.org/packages/source/p/pathtools/pathtools-0.1.2.tar.gz"
    sha256 "7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0"
  end

  # required by zope.interface -> twisted
  resource "setuptools" do
    url "https://pypi.python.org/packages/source/s/setuptools/setuptools-17.1.1.tar.gz"
    sha256 "5bf42dbf406fd58a41029f53cffff1c90db5de1c5e0e560b5545cf2ec949c431"
  end

  # required by cryptography -> pyopenssl
  resource "idna" do
    url "https://pypi.python.org/packages/source/i/idna/idna-2.0.tar.gz"
    sha256 "16199aad938b290f5be1057c0e1efc6546229391c23cea61ca940c115f7d3d3b"
  end

  # required by cryptography -> pyopenssl
  resource "enum34" do
    url "https://pypi.python.org/packages/source/e/enum34/enum34-1.0.4.tar.gz"
    sha256 "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
  end

  # required by cryptography -> pyopenssl
  resource "ipaddress" do
    url "https://pypi.python.org/packages/source/i/ipaddress/ipaddress-1.0.7.tar.gz"
    sha256 "2c99e9eaea2dacbe4038b3be772ec650f5b4f4c8cc479c3704b81673d96849d7"
  end

  # required by cryptography -> pyopenssl
  resource "cffi" do
    url "https://pypi.python.org/packages/source/c/cffi/cffi-1.1.1.tar.gz"
    sha256 "81fbaf121a67a0c4d390cc0ce7a69661f987f5cf34997575131e8a1bbe1ee1c6"
  end

  # required by cffi -> cryptography -> pyopenssl
  resource "pycparser" do
    url "https://pypi.python.org/packages/source/p/pycparser/pycparser-2.13.tar.gz"
    sha256 "b399599a8a0e386bfcbc5e01a38d79dd6e926781f9e358cd5512f41ab7d20eb7"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib64/python2.7/site-packages"

    resource("capstone").stage do
      # get_python_lib() returns system python library, replace with correct one
      inreplace "setup.py", "get_python_lib()", "\"#{libexec}/vendor/lib/python2.7/site-packages\""
      system "python", *Language::Python.setup_install_args(libexec/"vendor")
    end

    res =  %w[twisted requests scapy msgpack-python dnspython dnslib configobj]
    res += %w[pefile ipy pyopenssl service_identity watchdog impacket pypcap]
    res += %w[Pillow zope.interface six cryptography characteristic pyasn1 pyasn1-modules]
    res += %w[PyYAML argh pathtools setuptools idna enum34 ipaddress cffi pycparser]
    res.each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    # fix for zope.interfaces not being found
    system "touch", libexec/"vendor/lib64/python2.7/site-packages/zope/__init__.py"

    system "git", "clone", "https://github.com/secretsquirrel/the-backdoor-factory.git", "libs/bdfactory"

    #ENV.prepend_create_path "PYTHONPATH", libexec
    #bin.install "mitmf.py"
    #libexec.install Dir["*"]
    #bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    
    (bin/"mitmf").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python mitmf.py "$@"
    EOS
    libexec.install Dir['*']
  end
end