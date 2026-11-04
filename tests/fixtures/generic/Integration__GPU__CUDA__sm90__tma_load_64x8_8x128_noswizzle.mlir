"builtin.module"() <{sym_name = "mymod"}> ({
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<64x8xf32, 3>}> : () -> ()
  "memref.global"() <{sym_name = "bufferRhsGlobal", sym_visibility = "private", type = memref<8x128xf32, 3>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 10000000 : index}> : () -> index
    %1 = "arith.constant"() <{value = 6144 : index}> : () -> index
    %2 = "arith.constant"() <{value = 45 : index}> : () -> index
    %3 = "arith.constant"() <{value = 7 : index}> : () -> index
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index
    %8 = "arith.constant"() <{value = 128 : index}> : () -> index
    %9 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x8xf32>
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x128xf32>
    "scf.for"(%6, %7, %5) ({
    ^bb0(%arg14: index):
      "scf.for"(%6, %8, %5) ({
      ^bb0(%arg15: index):
        "memref.store"(%9, %11, %arg14, %arg15) : (f32, memref<8x128xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%6, %4, %5) ({
    ^bb0(%arg12: index):
      "scf.for"(%6, %7, %5) ({
      ^bb0(%arg13: index):
        %32 = "arith.index_cast"(%arg13) : (index) -> i64
        %33 = "arith.uitofp"(%32) : (i64) -> f32
        "memref.store"(%33, %10, %arg12, %arg13) : (f32, memref<64x8xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "gpu.wait"() : () -> !gpu.async.token
    %13:2 = "gpu.alloc"(%12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x8xf32>, !gpu.async.token)
    %14:2 = "gpu.alloc"(%12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<8x128xf32>, !gpu.async.token)
    %15 = "gpu.memcpy"(%12, %13#0, %10) : (!gpu.async.token, memref<64x8xf32>, memref<64x8xf32>) -> !gpu.async.token
    %16 = "gpu.memcpy"(%12, %14#0, %11) : (!gpu.async.token, memref<8x128xf32>, memref<8x128xf32>) -> !gpu.async.token
    %17 = "memref.cast"(%13#0) : (memref<64x8xf32>) -> memref<*xf32>
    %18 = "memref.cast"(%14#0) : (memref<8x128xf32>) -> memref<*xf32>
    %19 = "nvgpu.tma.create.descriptor"(%17, %4, %7) : (memref<*xf32>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<64x8xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
    %20 = "nvgpu.tma.create.descriptor"(%18, %7, %8) : (memref<*xf32>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<8x128xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
    "gpu.launch"(%5, %5, %5, %8, %5, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %21 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index
      %22 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %23 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<64x8xf32, 3>
      %24 = "memref.get_global"() <{name = @bufferRhsGlobal}> : () -> memref<8x128xf32, 3>
      %25 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>
      "nvgpu.mbarrier.init"(%25, %21, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
      "gpu.barrier"() : () -> ()
      %26 = "arith.cmpi"(%22, %6) <{predicate = 0 : i64}> : (index, index) -> i1
      "scf.if"(%26) ({
        "nvgpu.mbarrier.arrive.expect_tx"(%25, %1, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        %30 = "memref.load"(%23, %6, %6) : (memref<64x8xf32, 3>, index, index) -> f32
        %31 = "memref.load"(%24, %6, %6) : (memref<8x128xf32, 3>, index, index) -> f32
        "gpu.printf"(%30) <{format = "[GPU] TMA BEFORE lhs[45][7] %f\0A"}> : (f32) -> ()
        "gpu.printf"(%31) <{format = "[GPU] TMA BEFORE rhs[7][0] %f\0A"}> : (f32) -> ()
        "nvgpu.tma.async.load"(%23, %25, %19, %6, %6, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x8xf32, 3>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<64x8xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%24, %25, %20, %6, %6, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<8x128xf32, 3>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<8x128xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
        "nvgpu.mbarrier.arrive.expect_tx"(%25, %6, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (i1) -> ()
      %27 = "arith.constant"() <{value = false}> : () -> i1
      "nvgpu.mbarrier.try_wait.parity"(%25, %27, %0, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, i1, index, index) -> ()
      "scf.if"(%26) ({
        %28 = "memref.load"(%23, %2, %3) : (memref<64x8xf32, 3>, index, index) -> f32
        %29 = "memref.load"(%24, %3, %6) : (memref<8x128xf32, 3>, index, index) -> f32
        "gpu.printf"(%28) <{format = "[GPU] TMA LOADED lhs[45][7] %f\0A"}> : (f32) -> ()
        "gpu.printf"(%29) <{format = "[GPU] TMA LOADED rhs[7][0] %f\0A"}> : (f32) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

