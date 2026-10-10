module {
  func.func @fold_wait_op_test1() {
    %0 = gpu.wait async
    gpu.wait 
    %1 = gpu.wait async
    gpu.wait [%1]
    return
  }
}

// -----
module {
  func.func @erase_barriers() {
    gpu.barrier
    gpu.barrier
    return
  }
}

// -----
module {
  func.func @fold_wait_op_test2(%arg0: i1) -> (memref<5xf16>, memref<5xf16>) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<5xf16>
    gpu.wait [%0]
    %1 = gpu.wait async [%0]
    %memref_0, %asyncToken_1 = gpu.alloc async [%1] () : memref<5xf16>
    gpu.wait [%1]
    return %memref, %memref_0 : memref<5xf16>, memref<5xf16>
  }
}

// -----
module {
  func.func @fold_memcpy_op(%arg0: i1) {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<2xf16>
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<2xf16>
    gpu.wait [%0]
    affine.store %cst, %memref[0] : memref<2xf16>
    %1 = gpu.wait async
    %2 = gpu.memcpy async [%1] %alloc, %memref : memref<2xf16>, memref<2xf16>
    gpu.wait [%1]
    %3 = scf.if %arg0 -> (i1) {
      memref.dealloc %alloc : memref<2xf16>
      scf.yield %arg0 : i1
    } else {
      memref.dealloc %alloc : memref<2xf16>
      scf.yield %arg0 : i1
    }
    return
  }
}

// -----
module {
  func.func @do_not_fold_memcpy_op1(%arg0: i1, %arg1: memref<2xf16>) {
    %cst = arith.constant 0.000000e+00 : f16
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<2xf16>
    gpu.wait [%0]
    affine.store %cst, %memref[0] : memref<2xf16>
    %1 = gpu.wait async
    %2 = gpu.memcpy async [%1] %arg1, %memref : memref<2xf16>, memref<2xf16>
    gpu.wait [%1]
    return
  }
}

// -----
module {
  func.func @do_not_fold_memcpy_op2(%arg0: i1, %arg1: index) -> f16 {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<2xf16>
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<2xf16>
    gpu.wait [%0]
    affine.store %cst, %memref[0] : memref<2xf16>
    %1 = gpu.wait async
    %2 = gpu.memcpy async [%1] %alloc, %memref : memref<2xf16>, memref<2xf16>
    gpu.wait [%1]
    %3 = memref.load %alloc[%arg1] : memref<2xf16>
    return %3 : f16
  }
}

// -----
module {
  func.func @do_not_fold_memcpy_op3(%arg0: memref<1xi8>, %arg1: memref<i1>) {
    %c0 = arith.constant 0 : index
    %view = memref.view %arg0[%c0][] : memref<1xi8> to memref<i1>
    gpu.memcpy  %view, %arg1 : memref<i1>, memref<i1>
    return
  }
}

// -----
module {
  func.func @memcpy_after_cast(%arg0: memref<10xf32>, %arg1: memref<10xf32>) {
    %cast = memref.cast %arg0 : memref<10xf32> to memref<?xf32>
    %cast_0 = memref.cast %arg1 : memref<10xf32> to memref<?xf32>
    gpu.memcpy  %cast, %cast_0 : memref<?xf32>, memref<?xf32>
    return
  }
}

// -----
module {
  func.func @memset_after_cast(%arg0: memref<10xf32>, %arg1: f32) {
    %cast = memref.cast %arg0 : memref<10xf32> to memref<?xf32>
    gpu.memset  %cast, %arg1 : memref<?xf32>, f32
    return
  }
}

// -----
module {
  func.func @gpu_dim_of_alloc(%arg0: index) -> index {
    %memref = gpu.alloc  (%arg0) : memref<?xindex>
    %c0 = arith.constant 0 : index
    %dim = memref.dim %memref, %c0 : memref<?xindex>
    return %dim : index
  }
}

// -----
module {
  func.func @out_of_bound_memref.dim(%arg0: memref<?xi8>, %arg1: index) -> index {
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c2 : memref<?xi8>
    return %dim : index
  }
}

// -----
module {
  func.func @simplify_gpu_launch() attributes {llvm.emit_c_interface} {
    %cst = arith.constant 0.000000e+00 : f32
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c16 = arith.constant 16 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<2x16x16xf32>
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        scf.for %arg2 = %c0 to %c16 step %c1 {
          memref.store %cst, %alloc[%arg0, %arg1, %arg2] : memref<2x16x16xf32>
        }
      }
    }
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<2x16x16xf32>
    %1 = gpu.memcpy async [%0] %memref, %alloc : memref<2x16x16xf32>, memref<2x16x16xf32>
    gpu.wait [%0]
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c1, %arg11 = %c1) {
      %2 = arith.muli %arg5, %c32 : index
      %3 = arith.muli %arg4, %c32 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.addi %4, %arg3 : index
      %6 = arith.divui %5, %c32 : index
      %7 = arith.muli %arg0, %c16 : index
      %8 = arith.muli %arg1, %c2 : index
      %9 = arith.muli %6, %c2 : index
      %10 = arith.addi %8, %9 : index
      %11 = memref.load %memref[%10, %c0, %7] : memref<2x16x16xf32>
      %12 = arith.addi %10, %c1 : index
      %13 = memref.load %memref[%12, %c0, %7] : memref<2x16x16xf32>
      memref.store %11, %memref[%10, %c0, %7] : memref<2x16x16xf32>
      memref.store %13, %memref[%12, %c0, %7] : memref<2x16x16xf32>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @make_reduce_uniform() {
    %0:6 = "test.test1"() : () -> (index, index, index, index, index, index)
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %0#0, %arg7 = %0#1, %arg8 = %0#2) threads(%arg3, %arg4, %arg5) in (%arg9 = %0#3, %arg10 = %0#4, %arg11 = %0#5) {
      %1 = "test.test2"() : () -> i32
      %2 = gpu.all_reduce  add %1 {
      } : (i32) -> i32
      "test.test3"(%2) : (i32) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @make_subgroup_reduce_uniform() {
    %0:6 = "test.test1"() : () -> (index, index, index, index, index, index)
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %0#0, %arg7 = %0#1, %arg8 = %0#2) threads(%arg3, %arg4, %arg5) in (%arg9 = %0#3, %arg10 = %0#4, %arg11 = %0#5) {
      %1 = "test.test2"() : () -> i32
      %2 = gpu.subgroup_reduce  add %1 : (i32) -> i32
      "test.test3"(%2) : (i32) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @subgroup_reduce_cluster_size_1() {
    %0:6 = "test.test1"() : () -> (index, index, index, index, index, index)
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %0#0, %arg7 = %0#1, %arg8 = %0#2) threads(%arg3, %arg4, %arg5) in (%arg9 = %0#3, %arg10 = %0#4, %arg11 = %0#5) {
      %1 = "test.test2"() : () -> i32
      %2 = gpu.subgroup_reduce  add %1 cluster(size = 1) : (i32) -> i32
      "test.test3"(%2) : (i32) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @gpu_launch_without_side_effects() {
    %0:6 = "test.test1"() : () -> (index, index, index, index, index, index)
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %0#0, %arg7 = %0#1, %arg8 = %0#2) threads(%arg3, %arg4, %arg5) in (%arg9 = %0#3, %arg10 = %0#4, %arg11 = %0#5) {
      %1 = arith.addi %arg0, %arg1 : index
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @broadcast_of_broadcast1(%arg0: f32, %arg1: i32) -> f32 {
    %0 = gpu.subgroup_broadcast %arg0,  first_active_lane : f32
    %1 = gpu.subgroup_broadcast %0,  specific_lane %arg1 : f32
    return %1 : f32
  }
  func.func @broadcast_of_broadcast2(%arg0: f32, %arg1: i32) -> f32 {
    %0 = gpu.subgroup_broadcast %arg0,  specific_lane %arg1 : f32
    %1 = gpu.subgroup_broadcast %0,  first_active_lane : f32
    return %1 : f32
  }
}

