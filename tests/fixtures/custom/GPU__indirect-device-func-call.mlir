module {
  gpu.module @kernels {
    func.func @hello(%arg0: f32) {
      %thread_id_x = gpu.thread_id  x
      %c2_i8 = arith.constant 2 : i8
      gpu.printf "Hello from %lld, %d, %f\0A", %thread_id_x, %c2_i8, %arg0 : index, i8, f32
      return
    }
    gpu.func @hello_indirect() kernel {
      %cst = arith.constant 3.000000e+00 : f32
      %f = func.constant @hello : (f32) -> ()
      func.call_indirect %f(%cst) : (f32) -> ()
      gpu.return
    }
  }
}

