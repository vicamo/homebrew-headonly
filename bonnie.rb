class Bonnie < Formula
  desc "C-language benchmark measuring Unix filesystems perf"
  homepage "https://code.google.com/p/bonnie-64/"
  head "http://bonnie-64.googlecode.com/svn/trunk/"

  def install
    system "make"
    bin.install "Bonnie" => "bonnie"
  end

  test do
    system "#{bin}/bonnie"
  end
end
