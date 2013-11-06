require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Globalplatform < Formula
  homepage 'http://globalplatform.sf.net/'
  url 'http://downloads.sourceforge.net/project/globalplatform/GlobalPlatform%20Library/GlobalPlatform%20Library%206.0.0/globalplatform-6.0.0.tar.gz'
  sha1 '5a08bec4cbcc8caffa7c646a35600712f468553c'
  version '6.0.0'

  # depends_on 'cmake' => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components

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
