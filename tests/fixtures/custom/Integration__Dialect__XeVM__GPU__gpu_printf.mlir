module @test attributes {gpu.container_module} {
  gpu.module @test_module {
    gpu.func @test_printf(%arg0: i32, %arg1: f32) kernel {
      gpu.printf "Hello: %d\0A", %arg0 : i32
      gpu.printf "Hello: %f\0A", %arg1 : f32
      gpu.return
    }
  }
  func.func @main() attributes {llvm.emit_c_interface} {
    %c1 = arith.constant 1 : index
    %c11_i32 = arith.constant 11 : i32
    %cst = arith.constant 4.000000e+00 : f32
    gpu.launch_func  @test_module::@test_printf blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%c11_i32 : i32, %cst : f32)
    return
  }
}

