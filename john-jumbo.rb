class JohnJumbo < Formula
  homepage "http://www.openwall.com/john/"
  url "http://openwall.com/john/j/john-1.8.0-jumbo-1.tar.xz"
  sha256 "bac93d025995a051f055adbd7ce2f1975676cac6c74a6c7a3ee4cfdd9c160923"
  version "1.8.0"
  revision 2

  conflicts_with "john", :because => "both install the same binaries"

  option "without-completion", "bash/zsh completion will not be installed"

  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "gmp"

  # Patch taken from MacPorts, tells john where to find runtime files.
  # https://github.com/magnumripper/JohnTheRipper/issues/982
  patch :DATA

  fails_with :llvm do
    build 2334
    cause "Don't remember, but adding this to whitelist 2336."
  end

  # https://github.com/magnumripper/JohnTheRipper/blob/bleeding-jumbo/doc/INSTALL#L133-L143
  fails_with :gcc do
    cause "Upstream have a hacky workaround for supporting gcc that we can't use."
  end

  def install
    cd "src" do
      args = []
      args << "--disable-native-macro" if build.bottle?
      system "./configure", *args
      system "make", "clean"
      system "make", "-s", "CC=#{ENV.cc}", "C_INCLUDE_PATH=#{HOMEBREW_PREFIX}/include"
    end

    # Remove the symlink and install the real file
    rm "README"
    prefix.install "doc/README"
    doc.install Dir["doc/*"]

    # Only symlink the main binary into bin
    (share/"john").install Dir["run/*"]
    bin.install_symlink share/"john/john"

    if build.with? "completion"
      bash_completion.install share/"john/john.bash_completion" => "john.bash"
      zsh_completion.install share/"john/john.zsh_completion" => "_john"
    end

    # Source code defaults to "john.ini", so rename
    mv share/"john/john.conf", share/"john/john.ini"
  end

  test do
    touch "john2.pot"
    system "echo dave:`printf secret | openssl md5` > test"
    output = shell_output("#{bin}/john --pot=#{testpath}/john2.pot --format=raw-md5 test")
    assert output.include? "secret"
    assert (testpath/"john2.pot").read.include?("secret")
  end
end


__END__
--- a/src/params.h	2012-08-30 13:24:18.000000000 -0500
+++ b/src/params.h	2012-08-30 13:25:13.000000000 -0500
@@ -70,15 +70,15 @@
  * notes above.
  */
 #ifndef JOHN_SYSTEMWIDE
-#define JOHN_SYSTEMWIDE			0
+#define JOHN_SYSTEMWIDE			1
 #endif
 
 #if JOHN_SYSTEMWIDE
 #ifndef JOHN_SYSTEMWIDE_EXEC /* please refer to the notes above */
-#define JOHN_SYSTEMWIDE_EXEC		"/usr/libexec/john"
+#define JOHN_SYSTEMWIDE_EXEC		"HOMEBREW_PREFIX/share/john"
 #endif
 #ifndef JOHN_SYSTEMWIDE_HOME
-#define JOHN_SYSTEMWIDE_HOME		"/usr/share/john"
+#define JOHN_SYSTEMWIDE_HOME		"HOMEBREW_PREFIX/share/john"
 #endif
 #define JOHN_PRIVATE_HOME		"~/.john"
 #endif
diff --git a/src/common.h b/src/common.h
index fce8c63..dcd65a9 100644
--- a/src/common.h
+++ b/src/common.h
@@ -31,7 +31,9 @@ typedef unsigned long long ARCH_WORD_64;
 #define is_aligned(PTR, CNT) ((((ARCH_WORD)(const void *)(PTR))&(CNT-1))==0)
 
 #ifdef __GNUC__
-#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7) || defined(__INTEL_COMPILER)
+#if __GNUC__ >= 5
+#define MAYBE_INLINE __attribute__((gnu_inline)) inline
+#elif __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7) || defined(__INTEL_COMPILER)
 #define MAYBE_INLINE __attribute__((always_inline)) inline
 #elif __GNUC__ > 3 || (__GNUC__ == 3 && __GNUC_MINOR__ >= 1)
 #define MAYBE_INLINE __attribute__((always_inline))
