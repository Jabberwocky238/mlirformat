module {
  gpu.module @test_module_1 {
    gpu.func @test_const_printf_with_loc() {
      gpu.printf "Hello, world with location\0A"
      gpu.return
    }
  }
  gpu.module @test_module_2 {
    func.func @gpu_abs_with_loc(%arg0: i32) -> i32 {
      %0 = math.absi %arg0 : i32
      return %0 : i32
    }
  }
}

