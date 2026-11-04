module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @test_assert(%arg0: i1, %arg1: i1) kernel {
      %thread_id_x = gpu.thread_id  x
      cf.assert %arg1, "passing assertion"
      gpu.printf "thread %lld: print after passing assertion\0A", %thread_id_x : index
      cf.assert %arg0, "failing assertion"
      gpu.printf "thread %lld: print after failing assertion\0A", %thread_id_x : index
      gpu.return
    }
  }
  func.func @main() {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %false = arith.constant false
    %true = arith.constant true
    gpu.launch_func  @kernels::@test_assert blocks in (%c1, %c1, %c1) threads in (%c2, %c1, %c1)  args(%false : i1, %true : i1)
    return
  }
}

