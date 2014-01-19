require 'formula'

class Cudainer < Formula
  homepage 'https://github.com/cbuchner1/CudaMiner'
  head 'https://github.com/cbuchner1/CudaMiner', :branch => 'master'
  url 'https://github.com/cbuchner1/CudaMiner/archive/e9dda44764ad3791931903721599493db6614e4d.zip'
  sha1 'e9dda44764ad3791931903721599493db6614e4d'
  
  depends_on 'Gcc49' => :build
  
  def patches
    # allows cudaminer to be compiled on OS X (missing headers and variables)
    [
      "https://github.com/k2b6s9j/CudaMiner/commit/8a391a4d94f1ba2e892f14018d67e5e4a0dc00a4.patch",
      "https://github.com/k2b6s9j/CudaMiner/commit/60c22c4fa15c4e0bc2f60386f80423463912515d.patch"
    ]
  end

  def install
    system "./autogen.sh"
    system "./configure.sh"
  end

  test do
    system "cudaminer"
  end
end
