module {
  gpu.module @kernel {
    gpu.func @test_func_readonly(%arg0: memref<f32> {llvm.readonly}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @test_func_writeonly(%arg0: memref<f32> {llvm.writeonly}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @test_func_readonly_ptr(%arg0: !llvm.ptr {llvm.readonly}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @test_func_nonnull(%arg0: memref<f32> {llvm.nonnull}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @test_func_dereferenceable(%arg0: memref<f32> {llvm.dereferenceable = 4 : i64}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @test_func_dereferenceable_or_null(%arg0: memref<f32> {llvm.dereferenceable_or_null = 4 : i64}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @test_func_noundef(%arg0: memref<f32> {llvm.noundef}) {
      gpu.return
    }
  }
}

