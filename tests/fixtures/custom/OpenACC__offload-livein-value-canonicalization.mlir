module {
}

// -----
module {
  func.func private @use_i64(i64)
  func.func @test_constant_sink() {
    %c1_i64 = arith.constant 1 : i64
    acc.serial {
      func.call @use_i64(%c1_i64) : (i64) -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func private @use_i64(i64)
  func.func @test_constant_rematerialize() {
    %c1_i64 = arith.constant 1 : i64
    call @use_i64(%c1_i64) : (i64) -> ()
    acc.serial {
      func.call @use_i64(%c1_i64) : (i64) -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_accbounds_sink(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %0 = acc.bounds lowerbound(%c0 : index) upperbound(%c10 : index)
    acc.serial {
      %1 = acc.copyin varPtr(%arg0 : memref<10xf32>) bounds(%0) -> memref<10xf32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_accbounds_rematerialize(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %0 = acc.bounds lowerbound(%c0 : index) upperbound(%c10 : index)
    %1 = acc.copyin varPtr(%arg0 : memref<10xf32>) bounds(%0) -> memref<10xf32>
    acc.serial {
      %2 = acc.copyin varPtr(%arg0 : memref<10xf32>) bounds(%0) -> memref<10xf32>
      acc.yield
    }
    return
  }
}

// -----
module {
  memref.global @memref_global_with_declare : memref<10xf32> = dense<0.000000e+00> {acc.declare = #acc.declare<dataClause = acc_copyin>}
  func.func private @use_memref(memref<10xf32>)
  func.func @test_memref_get_global_sink() {
    %0 = memref.get_global @memref_global_with_declare : memref<10xf32>
    acc.serial {
      func.call @use_memref(%0) : (memref<10xf32>) -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  memref.global @memref_global_reinterpret : memref<2x5xf32> = dense<0.000000e+00> {acc.declare = #acc.declare<dataClause = acc_copyin>}
  func.func private @use_memref_1d(memref<10xf32>)
  func.func @test_memref_reinterpret_cast_sink() {
    %0 = memref.get_global @memref_global_reinterpret : memref<2x5xf32>
    %reinterpret_cast = memref.reinterpret_cast %0 to offset: [0], sizes: [10], strides: [1] : memref<2x5xf32> to memref<10xf32>
    acc.serial {
      func.call @use_memref_1d(%reinterpret_cast) : (memref<10xf32>) -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func private @use_i32(i32)
  func.func @test_parallel_region() {
    %c42_i32 = arith.constant 42 : i32
    acc.parallel {
      func.call @use_i32(%c42_i32) : (i32) -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func private @use_f32(f32)
  func.func @test_kernels_region() {
    %cst = arith.constant 3.140000e+00 : f32
    acc.kernels {
      func.call @use_f32(%cst) : (f32) -> ()
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func private @use_index(index)
  func.func @test_multiple_constants() {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    call @use_index(%c1) : (index) -> ()
    acc.serial {
      func.call @use_index(%c1) : (index) -> ()
      func.call @use_index(%c2) : (index) -> ()
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func private @use_index(index)
  func.func @test_gpu_launch_region() {
    %c1 = arith.constant 1 : index
    %c42 = arith.constant 42 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) {
      func.call @use_index(%c42) : (index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func private @use_index(index)
  func.func @test_gpu_launch_rematerialize() {
    %c1 = arith.constant 1 : index
    %c42 = arith.constant 42 : index
    call @use_index(%c42) : (index) -> ()
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) {
      func.call @use_index(%c42) : (index) -> ()
      gpu.terminator
    }
    return
  }
}

