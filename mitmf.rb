require "formula"

class Mitmf < Formula
  homepage "https://github.com/byt3bl33d3r/MITMf"
  url "https://github.com/byt3bl33d3r/MITMf", :using => :git, :revision => "28fc081"
  version "0.9.8"
  revision 3

  #depends_on :python
  depends_on "libdnet" # scapy
  depends_on "openssl" # pyopenssl
  depends_on "libffi"  # cffi -> pyopenssl
  depends_on "libxml2" # lxml
  depends_on "libxslt" # lxml

  resource "netfilterqueue" do
    url "https://github.com/kti/python-netfilterqueue", :using => :git, :revision => "53a55fd"
  end

  resource "pyinotify" do
    url "https://pypi.python.org/packages/e3/c0/fd5b18dde17c1249658521f69598f3252f11d9d7a980c5be8619970646e1/pyinotify-0.9.6.tar.gz"
    sha256 "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
  end

  resource "pycrypto" do
    url "https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "pyasn1" do
    url "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz"
    sha256 "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
  end

  resource "Pillow" do
    url "https://pypi.python.org/packages/fb/10/3d578d949308df84075f298c4cc661e9c9a80a1e6c56c7a112e3311cc8f2/Pillow-2.8.2.tar.gz"
    sha256 "2caf5b992bdbe67e05084658b783d4dcb9cf7becda3794d95c89e0575c453c3a"
  end

  resource "netaddr" do
    url "https://pypi.python.org/packages/7c/ec/104f193e985e0aa813ffb4ba5da78d6ae3200165bf583d522ac2dc40aab2/netaddr-0.7.18.tar.gz"
    sha256 "a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19"
  end

  resource "scapy" do
    url "https://pypi.python.org/packages/6d/72/c055abd32bcd4ee6b36ef8e9ceccc2e242dea9b6c58fdcf2e8fd005f7650/scapy-2.3.2.tar.gz"
    sha256 "a9059ced6e1ded0565527c212f6ae4c735f4245d0f5f2d7313c4a6049b005cd8"
  end

  resource "dnslib" do
    url "https://pypi.python.org/packages/d2/49/d9430826e6678cab9675e343c795e3e0c3ca568b9dfcc145b5d5490c3b17/dnslib-0.9.6.tar.gz"
    sha256 "6ba31ae2014644901a301727cc4e22844eb19295a959c362568f08aee9b3bfa8"
  end

  resource "Twisted" do
    url "https://pypi.python.org/packages/2b/1f/9f1769bfd9d25547dc7f98e5273c638d379f1b2ef368a8b270de675fe714/Twisted-16.1.1.tar.bz2"
    sha256 "fe7d001d9a803ed26cd0fd2f69fa4212ff025f3af6ef1a559d905fe551ab04e9"
  end

  # required by twisted
  resource "zope.interface" do
    url "https://pypi.python.org/packages/a9/8d/cea179e663f9656f07d09b0b181299a2d8949fb6491ce3c5bc923ca9dd9f/zope.interface-3.8.0.tar.gz"
    sha256 "1d5411ff82fd3a73bad6efb38deddb3f98d61d590344deb0cdd308e8aa94d3ff"
  end

  # required by zope.interface -> twisted
  resource "setuptools" do
    url "https://pypi.python.org/packages/ff/d4/209f4939c49e31f5524fa0027bf1c8ec3107abaf7c61fdaad704a648c281/setuptools-21.0.0.tar.gz"
    sha256 "bdf0b7660f6673868d60d929e267e583bddc0e9623c71197b1ad79610c2ebe93"
  end

  resource "lxml" do
    url "https://pypi.python.org/packages/11/1b/fe6904151b37a0d6da6e60c13583945f8ce3eae8ebd0ec763ce546358947/lxml-3.6.0.tar.gz"
    sha256 "9c74ca28a7f0c30dca8872281b3c47705e21217c8bc63912d95c9e2a7cac6bdf"
  end

  resource "pefile" do
    url "https://pypi.python.org/packages/92/c0/8589ce9734ffdba258bd3e5acd4afb2e3586c121fe73402f686288b684b0/pefile-2016.3.28.tar.gz"
    sha256 "f24021085b5c3ef7b0898bb1f1d93eecd3839e03512769e22b0c5a10d9095f7b"
  end

  # required by pefile
  resource "future" do
    url "https://pypi.python.org/packages/5a/f4/99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d/future-0.15.2.tar.gz"
    sha256 "3d3b193f20ca62ba7d8782589922878820d0a023b885882deec830adbf639b97"
  end

  resource "ipy" do
    url "https://pypi.python.org/packages/88/28/79162bfc351a3f1ab44d663ab3f03fb495806fdb592170990a1568ffbf63/IPy-0.83.tar.gz"
    sha256 "61da5a532b159b387176f6eabf11946e7458b6df8fb8b91ff1d345ca7a6edab8"
  end

  resource "user_agents" do
    url "https://pypi.python.org/packages/38/e8/2d8e8b60b354cf8743f65879f4680d9c1f77ae560a303d322d7fe9c5d248/user-agents-1.0.1.tar.gz"
    sha256 "b5976d971e9e55ec8d80f6c6428f6de5de1467844a0d37184b5ee5e40929e939"
  end

  resource "pyopenssl" do
    url "https://pypi.python.org/packages/77/f2/bccec75ca4280a9fa762a90a1b8b152a22eac5d9c726d7da1fcbfe0a20e6/pyOpenSSL-16.0.0.tar.gz"
    sha256 "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
  end

  # required by pyopenssl
  resource "cryptography" do
    url "https://pypi.python.org/packages/92/ea/e7d512719dcc672ce7ed5d70f188e45e329c4bcf7c94528fbc7efa138d8a/cryptography-1.3.1.tar.gz"
    sha256 "b4b36175e0f95ddc88435c26dbe3397edce48e2ff5fe41d504cdb3beddcd53e2"
  end

  # required by cryptography -> pyopenssl
  resource "idna" do
    url "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz"
    sha256 "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676"
  end

  # required by cryptography -> pyopenssl
  resource "enum34" do
    url "https://pypi.python.org/packages/eb/c2/ea4077a72a167fb75f38bac63801910dfa2d5083e23ddaa0c4062848f78c/enum34-1.1.4.tar.gz"
    sha256 "0efc3e3ee0cb7cc12ea9e4813cdf1154f69ab47e518f4924fbd9e238df41d628"
  end

  # required by cryptography -> pyopenssl
  resource "ipaddress" do
    url "https://pypi.python.org/packages/cd/c5/bd44885274379121507870d4abfe7ba908326cf7bfd50a48d9d6ae091c0d/ipaddress-1.0.16.tar.gz"
    sha256 "5a3182b322a706525c46282ca6f064d27a02cffbd449f9f47416f1dc96aa71b0"
  end

  # required by cryptography -> pyopenssl
  resource "cffi" do
    url "https://pypi.python.org/packages/b6/98/11feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a/cffi-1.6.0.tar.gz"
    sha256 "a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db"
  end

  # required by cffi -> cryptography -> pyopenssl
  resource "pycparser" do
    url "https://pypi.python.org/packages/6d/31/666614af3db0acf377876d48688c5d334b6e493b96d21aa7d332169bee50/pycparser-2.14.tar.gz"
    sha256 "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73"
  end

  # required by cryptography -> pyopenssl
  resource "six" do
    url "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
  end

  resource "service_identity" do
    url "https://pypi.python.org/packages/f3/2a/7c04e7ab74f9f2be026745a9ffa81fd9d56139fa6f5f4b4c8a8c07b2bfba/service_identity-16.0.0.tar.gz"
    sha256 "0630e222f59f91f3db498be46b1d879ff220955d7bbad719a5cb9ad14e3c3036"
  end

  resource "configobj" do
    url "https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz"
    sha256 "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
  end

  resource "Flask" do
    url "https://pypi.python.org/packages/db/9c/149ba60c47d107f85fe52564133348458f093dd5e6b57a5b60ab9ac517bb/Flask-0.10.1.tar.gz"
    sha256 "4c83829ff83d408b5e1d4995472265411d2c414112298f2eb4b359d9e4563373"
  end

  resource "dnspython" do
    url "https://pypi.python.org/packages/b3/e3/091c6489f0b573b8a4069ce956d037061ae9321401c89323386fe748dc9f/dnspython-1.12.0.zip"
    sha256 "63bd1fae61809eedb91f84b2185816fac1270ae51494fbdd36ea25f904a8502f"
  end

  resource "beautifulsoup4" do
    url "https://pypi.python.org/packages/26/79/ef9a8bcbec5abc4c618a80737b44b56f1cb393b40238574078c5002b97ce/beautifulsoup4-4.4.1.tar.gz"
    sha256 "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4"
  end

  resource "capstone" do
    url "https://pypi.python.org/packages/e7/29/e9ad2a12c38f19e9ca8aff05122e5b9e271da6ecbfb6c4e20aee381b49ff/capstone-3.0.4.tar.gz"
    sha256 "945d3b8c3646a1c3914824c416439e2cf2df8969dd722c8979cdcc23b40ad225"
  end

  resource "python-magic" do
    url "https://pypi.python.org/packages/bb/03/1246519939004c60fc34c7bed9c0ab0e7d1b972b9278e5394bed942446a3/python-magic-0.4.11.tar.gz"
    sha256 "89021e288d6efd22cde2842349d79939b9664efdbf99f5790c9862a67759ea94"
  end

  resource "msgpack-python" do
    url "https://pypi.python.org/packages/a3/fb/bcf568236ade99903ef3e3e186e2d9252adbf000b378de596058fb9df847/msgpack-python-0.4.7.tar.gz"
    sha256 "5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/49/6f/183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d/requests-2.10.0.tar.gz"
    sha256 "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54"
  end

  resource "pypcap" do
    url "https://pypi.python.org/packages/83/25/dab6b3fda95a5699503c91bf722abf9d9a5c960a4480208e4bad8747dd0c/pypcap-1.1.5.tar.gz"
    sha256 "4b60d331e83c5bff3e25c7d99e902ea0910027fe9ce7986f0eecf5e0af6e8274"
  end

  resource "chardet" do
    url "https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237/chardet-2.3.0.tar.gz"
    sha256 "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib64/python2.7/site-packages"

    resource("capstone").stage do
      # get_python_lib() returns system python library, replace with correct one
      inreplace "setup.py", "get_python_lib()", "\"#{libexec}/vendor/lib/python2.7/site-packages\""
      system "python", *Language::Python.setup_install_args(libexec/"vendor")
    end

    %w[netfilterqueue pyinotify pycrypto pyasn1 Pillow netaddr scapy dnslib Twisted zope.interface setuptools lxml pefile future ipy user_agents pyopenssl cryptography idna enum34 ipaddress cffi six pycparser configobj six Flask dnspython beautifulsoup4 python-magic msgpack-python requests pypcap chardet].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    # fix for zope.interfaces not being found
    system "touch", libexec/"vendor/lib/python2.7/site-packages/zope/__init__.py"

    (bin/"mitmf").write <<~EOS
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python mitmf.py "$@"
    EOS
    libexec.install Dir['*']
  end
end
