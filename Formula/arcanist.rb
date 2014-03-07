require 'formula'

class Arcanist < Formula

  class Libphutil < Formula
    head 'https://github.com/facebook/libphutil.git', :using => :git
  end
 
  head 'https://github.com/facebook/arcanist.git', :using => :git

  homepage 'http://phabricator.org/docs/arcanist/'

  def install
    Libphutil.new.brew do
        (prefix + "libphutil/").install Dir['*']
    end

    (prefix + "archanist/").install %w{bin externals resources scripts src}
    bin.install_symlink prefix + "archanist/bin/arc"
     
  end
  
  def test
     system "arch help"
  end 

end


