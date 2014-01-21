require 'formula'

class Cudaminer < Formula
  homepage 'https://github.com/cbuchner1/CudaMiner'
  head 'https://github.com/cbuchner1/CudaMiner', :branch => 'master'
  url 'https://github.com/cbuchner1/CudaMiner/archive/e9dda44764ad3791931903721599493db6614e4d.zip'
  sha1 '58614ddcb69becb2d137ef2fa4172b620876cb17'
  version '12.18.13'
  
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'gcc49' => :build
  depends_on 'pkg-config' => :build
  depends_on 'curl'
  
  def patches
    # allows cudaminer to be compiled on OS X (missing headers and variables)
    [
      "https://github.com/k2b6s9j/CudaMiner/commit/8a391a4d94f1ba2e892f14018d67e5e4a0dc00a4.patch",
      "https://github.com/k2b6s9j/CudaMiner/commit/60c22c4fa15c4e0bc2f60386f80423463912515d.patch"
    ]
  end

  def install
    system "sh", "autogen.sh"
    system "sh", "configure.sh"
    system "make"
  end

  test do
    system "cudaminer"
  end
end
