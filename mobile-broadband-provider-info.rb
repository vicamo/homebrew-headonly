require 'formula'

class MobileBroadbandProviderInfo < Formula
  homepage 'https://wiki.gnome.org/Projects/NetworkManager/MobileBroadband/ServiceProviders'
  head 'git://git.gnome.org/mobile-broadband-provider-info'

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    inreplace 'Makefile.am' do |s|
      # Need to fix the static location of pkgconfigpath
      s.gsub! '$(datadir)/pkgconfig', '$(libdir)/pkgconfig'
    end
    system "./autogen.sh", "--prefix=#{prefix}"
    system "make", "install"
  end
end
