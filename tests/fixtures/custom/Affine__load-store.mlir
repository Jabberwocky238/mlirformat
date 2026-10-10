module {
}

// -----
module {
  func.func @test0(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        %0 = affine.load %alloc[%arg2, %arg3] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test1(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        %0 = affine.load %alloc[%arg2 + 3, %arg3 + 7] : memref<100x100xf32>
        affine.store %0, %alloc[%arg2 + 3, %arg3 + 7] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test2(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        %0 = affine.load %alloc[%arg2 + %arg0, %arg3 + %arg1] : memref<100x100xf32>
        affine.store %0, %alloc[%arg2 + %arg0, %arg3 + %arg1] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test3(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        %0 = affine.load %alloc[%arg2 + symbol(%arg0), %arg3 + symbol(%arg1)] : memref<100x100xf32>
        affine.store %0, %alloc[%arg2 + symbol(%arg0), %arg3 + symbol(%arg1)] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test4(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        %0 = affine.load %alloc[(%arg2 + symbol(%arg0)) floordiv 3 + 11, (%arg3 + symbol(%arg1)) mod 4 + 7] : memref<100x100xf32>
        affine.store %0, %alloc[(%arg2 + symbol(%arg0)) floordiv 3 + 11, (%arg3 + symbol(%arg1)) mod 4 + 7] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test5(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<10x10x10xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 0 to 10 {
          %0 = affine.load %alloc[%arg4, %arg2, %arg3] : memref<10x10x10xf32>
          affine.store %0, %alloc[%arg4, %arg2, %arg3] : memref<10x10x10xf32>
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @test6(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<10x10x10xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 0 to 10 {
          %0 = affine.load %alloc[%arg4 + %arg0, %arg2 + %arg3, %arg0 + %arg3 + %arg1] : memref<10x10x10xf32>
          affine.store %0, %alloc[%arg4 + %arg0, %arg2 + %arg3, %arg0 + %arg3 + %arg1] : memref<10x10x10xf32>
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @test6(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<10x10x10xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 0 to 10 {
          %0 = affine.load %alloc[%arg4 + symbol(%arg0), %arg2 + %arg3, %arg3 + symbol(%arg0) + symbol(%arg1)] : memref<10x10x10xf32>
          affine.store %0, %alloc[%arg4 + symbol(%arg0), %arg2 + %arg3, %arg3 + symbol(%arg0) + symbol(%arg1)] : memref<10x10x10xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @test7() {
    %alloc = memref.alloc() : memref<10xf32>
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map(%arg0)
      %1 = affine.load %alloc[%0] : memref<10xf32>
      affine.store %1, %alloc[%0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @zero_dim(%arg0: memref<i32>, %arg1: memref<i32>) {
    %0 = affine.load %arg0[] : memref<i32>
    affine.store %0, %arg1[] : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_prefetch(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        %0 = affine.load %alloc[%arg2 + 3, %arg3 + 7] : memref<100x100xf32>
        affine.prefetch %alloc[%arg2 + 3, %arg3 + 11], write, locality<0>, data : memref<100x100xf32>
        affine.prefetch %alloc[%arg2, %arg3 + 1], read, locality<3>, instr : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vector_load_vector_store_iv() {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 16 step 8 {
        %0 = affine.vector_load %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<8xf32>
        affine.vector_store %0, %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<8xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vector_load_vector_store_iv_constant() {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 16 step 4 {
        %0 = affine.vector_load %alloc[%arg0 + 3, %arg1 + 7] : memref<100x100xf32>, vector<4xf32>
        affine.vector_store %0, %alloc[%arg0 + 3, %arg1 + 7] : memref<100x100xf32>, vector<4xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vector_load_vector_store_2d() {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg0 = 0 to 16 step 2 {
      affine.for %arg1 = 0 to 16 step 8 {
        %0 = affine.vector_load %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<2x8xf32>
        affine.vector_store %0, %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<2x8xf32>
      }
    }
    return
  }
}

