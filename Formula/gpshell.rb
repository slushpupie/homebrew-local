require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Gpshell < Formula
  homepage 'http://globalplatform.sf.net/'
  url 'http://downloads.sourceforge.net/project/globalplatform/GPShell/GPShell-1.4.4/gpshell-1.4.4.tar.gz'
  sha1 '3efeb92263e881ff0886e73a7b790051a317df61'
  version '1.4.4'

  depends_on 'globalplatform'

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "PCSCLITE_CFLAGS=-I/System/Library/Frameworks/PCSC.framework/Versions/A/Headers/"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test globalplatform`
    system "false"
  end
end
