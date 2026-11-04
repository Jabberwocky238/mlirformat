module {
  gpu.module @test_module {
    gpu.func @test_const_printf() {
      gpu.printf "Hello, world\0A"
      gpu.return
    }
    gpu.func @test_printf(%arg0: i32) {
      gpu.printf "Hello: %d\0A", %arg0 : i32
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @fake_gpu_module_for_test {
    builtin.module @test_module {
      llvm.func @test_printf(%arg0: i32) {
        gpu.printf "Hello: %d\0A", %arg0 : i32
        llvm.return
      }
    }
  }
}

