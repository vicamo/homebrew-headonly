require 'formula'

class Turbine < Formula
  homepage 'http://git.gnome.org/cgit/turbine/'
  head 'git://git.gnome.org/turbine'

  depends_on :python
  depends_on 'hicolor-icon-theme'
  depends_on 'pygtk'

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    system 'python', 'setup.py', 'install', "--prefix=#{libexec}"
    bin.install 'turbine'
    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end
end
