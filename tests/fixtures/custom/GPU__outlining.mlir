module {
  func.func @launch() {
    %0 = "op"() : () -> f32
    %1 = "op"() : () -> memref<?xf32, 1>
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c20 = arith.constant 20 : index
    %c24 = arith.constant 24 : index
    %c28 = arith.constant 28 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c20, %arg10 = %c24, %arg11 = %c28) {
      "use"(%0) : (f32) -> ()
      "some_op"(%arg0, %arg9) : (index, index) -> ()
      %2 = memref.load %1[%arg3] : memref<?xf32, 1>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @launchCFG() {
    %0 = "op"() : () -> f32
    %1 = "op"() : () -> memref<?xf32, 1>
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c20 = arith.constant 20 : index
    %c24 = arith.constant 24 : index
    %c28 = arith.constant 28 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c20, %arg10 = %c24, %arg11 = %c28) {
      "use"(%0) : (f32) -> ()
      cf.br ^bb1
    ^bb1:  // pred: ^bb0
      "some_op"(%arg0, %arg9) : (index, index) -> ()
      %2 = memref.load %1[%arg3] : memref<?xf32, 1>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  llvm.func @launch_from_llvm_func() {
    %0 = "op"() : () -> f32
    %1 = "op"() : () -> memref<?xf32, 1>
    %c1 = arith.constant 1 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c1, %arg10 = %c1, %arg11 = %c1) {
      "use"(%0) : (f32) -> ()
      "some_op"(%arg0, %arg9) : (index, index) -> ()
      %2 = memref.load %1[%arg3] : memref<?xf32, 1>
      gpu.terminator
    }
    llvm.return
  }
}

// -----
module {
  func.func @multiple_launches() {
    %c8 = arith.constant 8 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c8, %arg8 = %c8) threads(%arg3, %arg4, %arg5) in (%arg9 = %c8, %arg10 = %c8, %arg11 = %c8) {
      gpu.terminator
    }
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c8, %arg8 = %c8) threads(%arg3, %arg4, %arg5) in (%arg9 = %c8, %arg10 = %c8, %arg11 = %c8) {
      gpu.terminator
    }
    %0 = gpu.wait async
    %1 = gpu.launch async [%0] blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c8, %arg8 = %c8) threads(%arg3, %arg4, %arg5) in (%arg9 = %c8, %arg10 = %c8, %arg11 = %c8) {
      gpu.terminator
    }
    %2 = gpu.launch async blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c8, %arg8 = %c8) threads(%arg3, %arg4, %arg5) in (%arg9 = %c8, %arg10 = %c8, %arg11 = %c8) {
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @extra_constants_not_inlined(%arg0: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %0 = "secret_constant"() : () -> index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c8, %arg8 = %c8, %arg9 = %c8) threads(%arg4, %arg5, %arg6) in (%arg10 = %c8, %arg11 = %c8, %arg12 = %c8) {
      "use"(%c2, %arg0, %0) : (index, memref<?xf32>, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @extra_constants(%arg0: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32>
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c8, %arg8 = %c8, %arg9 = %c8) threads(%arg4, %arg5, %arg6) in (%arg10 = %c8, %arg11 = %c8, %arg12 = %c8) {
      "use"(%c2, %arg0, %dim) : (index, memref<?xf32>, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @extra_constants_noarg(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg1, %c0 : memref<?xf32>
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c8, %arg9 = %c8, %arg10 = %c8) threads(%arg5, %arg6, %arg7) in (%arg11 = %c8, %arg12 = %c8, %arg13 = %c8) {
      "use"(%c2, %arg0, %dim) : (index, memref<?xf32>, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @multiple_uses(%arg0: memref<?xf32>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1, %arg11 = %c1, %arg12 = %c1) {
      "use1"(%c2, %c2) : (index, index) -> ()
      "use2"(%c2) : (index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @multiple_uses2(%arg0: memref<*xf32>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c2 : memref<*xf32>
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1, %arg11 = %c1, %arg12 = %c1) {
      "use1"(%dim) : (index) -> ()
      "use2"(%c2, %c2) : (index, index) -> ()
      "use3"(%arg0) : (memref<*xf32>) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  llvm.mlir.global internal @global(42 : i64) {addr_space = 0 : i32} : i64
  func.func @function_call(%arg0: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c8, %arg8 = %c8, %arg9 = %c8) threads(%arg4, %arg5, %arg6) in (%arg10 = %c8, %arg11 = %c8, %arg12 = %c8) {
      func.call @device_function() : () -> ()
      func.call @device_function() : () -> ()
      %0 = llvm.mlir.addressof @global : !llvm.ptr
      gpu.terminator
    }
    return
  }
  func.func @device_function() {
    call @recursive_device_function() : () -> ()
    return
  }
  func.func @recursive_device_function() {
    call @recursive_device_function() : () -> ()
    return
  }
}

// -----
module {
  func.func @non_constant_launches(%arg0: index) {
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %arg0, %arg8 = %arg0, %arg9 = %arg0) threads(%arg4, %arg5, %arg6) in (%arg10 = %arg0, %arg11 = %arg0, %arg12 = %arg0) {
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @launch_memory_attributions_0() {
    %0 = "op"() : () -> memref<?xf32, 1>
    %c128 = arith.constant 128 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c128, %arg7 = %c128, %arg8 = %c128) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c128, %arg11 = %c128) workgroup(%arg12 : memref<42xf32, 3>) private(%arg13 : memref<2xf32, 5>, %arg14 : memref<1xf32, 5>) {
      "some_op"(%arg0, %arg9) : (index, index) -> ()
      %1 = memref.load %0[%arg3] : memref<?xf32, 1>
      %2 = memref.load %arg12[%arg3] : memref<42xf32, 3>
      %3 = memref.load %arg14[%arg3] : memref<1xf32, 5>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @launch_memory_attributions_1(%arg0: memref<*xf32>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c2 : memref<*xf32>
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1, %arg11 = %c1, %arg12 = %c1) private(%arg13 : memref<3xf32, 5>) {
      %0 = memref.load %arg13[%c2] : memref<3xf32, 5>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @launch_cluster() {
    %0 = "op"() : () -> f32
    %1 = "op"() : () -> memref<?xf32, 1>
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c1_0 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c20 = arith.constant 20 : index
    %c24 = arith.constant 24 : index
    %c28 = arith.constant 28 : index
    gpu.launch clusters(%arg12, %arg13, %arg14) in (%arg15 = %c1, %arg16 = %c2, %arg17 = %c1_0) blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c20, %arg10 = %c24, %arg11 = %c28) {
      "use"(%0) : (f32) -> ()
      "some_op"(%arg12, %arg0, %arg9) : (index, index, index) -> ()
      %2 = memref.load %1[%arg3] : memref<?xf32, 1>
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @testKernelAttributes() {
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c16_0 = arith.constant 16 : index
    %c8_1 = arith.constant 8 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c16_0, %arg11 = %c8_1) module(@test_module) function(@test_kernel_func) {
      "some_op"(%arg0, %arg3) : (index, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  gpu.module @existing_module {
    gpu.func @test_kernel_func() {
      gpu.return
    }
  }
  func.func @testExistingModule() {
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c16_0 = arith.constant 16 : index
    %c8_1 = arith.constant 8 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c16_0, %arg11 = %c8_1) module(@existing_module) function(@test_kernel_func) {
      "some_op"(%arg0, %arg3) : (index, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @testKernelModuleOnly() {
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c16_0 = arith.constant 16 : index
    %c8_1 = arith.constant 8 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c16_0, %arg11 = %c8_1) module(@test_module) {
      "some_op"(%arg0, %arg3) : (index, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @testKernelFuncOnly() {
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c16_0 = arith.constant 16 : index
    %c8_1 = arith.constant 8 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c16_0, %arg11 = %c8_1) function(@test_kernel_func) {
      "some_op"(%arg0, %arg3) : (index, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @testNoAttributes() {
    %c8 = arith.constant 8 : index
    %c12 = arith.constant 12 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c16_0 = arith.constant 16 : index
    %c8_1 = arith.constant 8 : index
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c8, %arg7 = %c12, %arg8 = %c16) threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c16_0, %arg11 = %c8_1) {
      "some_op"(%arg0, %arg3) : (index, index) -> ()
      gpu.terminator
    }
    return
  }
}

// -----
module {
  func.func @nested_launch(%arg0: index) {
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %arg0, %arg8 = %arg0, %arg9 = %arg0) threads(%arg4, %arg5, %arg6) in (%arg10 = %arg0, %arg11 = %arg0, %arg12 = %arg0) {
      gpu.launch blocks(%arg13, %arg14, %arg15) in (%arg19 = %arg0, %arg20 = %arg0, %arg21 = %arg0) threads(%arg16, %arg17, %arg18) in (%arg22 = %arg0, %arg23 = %arg0, %arg24 = %arg0) {
        "some_op"(%arg13, %arg16) : (index, index) -> ()
        gpu.terminator
      }
      gpu.terminator
    }
    return
  }
}

