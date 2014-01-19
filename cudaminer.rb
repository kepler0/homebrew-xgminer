require 'formula'

class CudaMiner < Formula
  homepage 'https://github.com/cbuchner1/CudaMiner'
  head 'https://github.com/cbuchner1/CudaMiner', :branch => 'master'
  
  depends_on 'Gcc49' => :build

  def install
    sed -i '46 s|#include <malloc.h>|#include <malloc/malloc.h>|' scrypt.cpp
    sed -i '146 s|CUDA_LDFLAGS="-L$with_cuda/lib$SUFFIX"|CUDA_LDFLAGS="-L$with_cuda/lib"|' scrypt.cpp
    sed -i '151 s|CUDA_LDFLAGS="-L/usr/local/cuda/lib$SUFFIX"|CUDA_LDFLAGS="-L/usr/local/cuda/lib|' scrypt.cpp
    system "./autogen.sh"
    system "./configure.sh"
  end

  test do
    system "cudaminer"
  end
end
