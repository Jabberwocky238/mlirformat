module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @kernel(%arg0: memref<i32>) kernel {
      %c0_i32 = arith.constant 0 : i32
      %c1_i32 = arith.constant 1 : i32
      %c2_i32 = arith.constant 2 : i32
      %0 = memref.atomic_rmw addi %c1_i32, %arg0[] : (i32, memref<i32>) -> i32
      scf.while : () -> () {
        %1 = memref.atomic_rmw addi %c0_i32, %arg0[] : (i32, memref<i32>) -> i32
        %2 = arith.cmpi slt, %1, %c2_i32 : i32
        scf.condition(%2)
      } do {
        scf.yield
      }
      gpu.return
    }
  }
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %memref = gpu.alloc  host_shared () : memref<i32>
    memref.store %c0_i32, %memref[] : memref<i32>
    %0 = gpu.wait async
    %1 = gpu.wait async
    %2 = gpu.launch_func async [%0] @kernels::@kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%memref : memref<i32>)
    %3 = gpu.launch_func async [%1] @kernels::@kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%memref : memref<i32>)
    gpu.wait [%2, %3]
    return
  }
}

