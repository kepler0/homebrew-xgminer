require 'formula'

class CudaMiner < Formula
  homepage 'https://github.com/cbuchner1/CudaMiner'
  head 'https://github.com/cbuchner1/CudaMiner', :branch => 'master'

  def install
  end

  test do
    system "cudaminer"
  end
end
