"builtin.module"() <{sym_name = "mymod"}> ({
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<64x8xf32, 3>}> : () -> () loc("<stdin>":2:3)
  "memref.global"() <{sym_name = "bufferRhsGlobal", sym_visibility = "private", type = memref<8x128xf32, 3>}> : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 10000000 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 6144 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = 45 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":9:10)
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:10)
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:10)
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":12:10)
    %8 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":13:10)
    %9 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32 loc("<stdin>":14:10)
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x8xf32> loc("<stdin>":15:11)
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x128xf32> loc("<stdin>":16:11)
    "scf.for"(%6, %7, %5) ({
    ^bb0(%arg14: index loc("<stdin>":18:10)):
      "scf.for"(%6, %8, %5) ({
      ^bb0(%arg15: index loc("<stdin>":20:12)):
        "memref.store"(%9, %11, %arg14, %arg15) : (f32, memref<8x128xf32>, index, index) -> () loc("<stdin>":21:9)
        "scf.yield"() : () -> () loc("<stdin>":22:9)
      }) : (index, index, index) -> () loc("<stdin>":19:7)
      "scf.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index) -> () loc("<stdin>":17:5)
    "scf.for"(%6, %4, %5) ({
    ^bb0(%arg12: index loc("<stdin>":27:10)):
      "scf.for"(%6, %7, %5) ({
      ^bb0(%arg13: index loc("<stdin>":29:12)):
        %32 = "arith.index_cast"(%arg13) : (index) -> i64 loc("<stdin>":30:15)
        %33 = "arith.uitofp"(%32) : (i64) -> f32 loc("<stdin>":31:15)
        "memref.store"(%33, %10, %arg12, %arg13) : (f32, memref<64x8xf32>, index, index) -> () loc("<stdin>":32:9)
        "scf.yield"() : () -> () loc("<stdin>":33:9)
      }) : (index, index, index) -> () loc("<stdin>":28:7)
      "scf.yield"() : () -> () loc("<stdin>":35:7)
    }) : (index, index, index) -> () loc("<stdin>":26:5)
    %12 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":37:11)
    %13:2 = "gpu.alloc"(%12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x8xf32>, !gpu.async.token) loc("<stdin>":38:13)
    %14:2 = "gpu.alloc"(%12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<8x128xf32>, !gpu.async.token) loc("<stdin>":39:13)
    %15 = "gpu.memcpy"(%12, %13#0, %10) : (!gpu.async.token, memref<64x8xf32>, memref<64x8xf32>) -> !gpu.async.token loc("<stdin>":40:11)
    %16 = "gpu.memcpy"(%12, %14#0, %11) : (!gpu.async.token, memref<8x128xf32>, memref<8x128xf32>) -> !gpu.async.token loc("<stdin>":41:11)
    %17 = "memref.cast"(%13#0) : (memref<64x8xf32>) -> memref<*xf32> loc("<stdin>":42:11)
    %18 = "memref.cast"(%14#0) : (memref<8x128xf32>) -> memref<*xf32> loc("<stdin>":43:11)
    %19 = "nvgpu.tma.create.descriptor"(%17, %4, %7) : (memref<*xf32>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<64x8xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none> loc("<stdin>":44:11)
    %20 = "nvgpu.tma.create.descriptor"(%18, %7, %8) : (memref<*xf32>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<8x128xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none> loc("<stdin>":45:11)
    "gpu.launch"(%5, %5, %5, %8, %5, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":47:10), %arg1: index loc("<stdin>":47:24), %arg2: index loc("<stdin>":47:38), %arg3: index loc("<stdin>":47:52), %arg4: index loc("<stdin>":47:66), %arg5: index loc("<stdin>":47:80), %arg6: index loc("<stdin>":47:94), %arg7: index loc("<stdin>":47:108), %arg8: index loc("<stdin>":47:122), %arg9: index loc("<stdin>":47:136), %arg10: index loc("<stdin>":47:150), %arg11: index loc("<stdin>":47:165)):
      %21 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":48:13)
      %22 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":49:13)
      %23 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<64x8xf32, 3> loc("<stdin>":50:13)
      %24 = "memref.get_global"() <{name = @bufferRhsGlobal}> : () -> memref<8x128xf32, 3> loc("<stdin>":51:13)
      %25 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>> loc("<stdin>":52:13)
      "nvgpu.mbarrier.init"(%25, %21, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":53:7)
      "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> () loc("<stdin>":54:7)
      %26 = "arith.cmpi"(%22, %6) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":55:13)
      "scf.if"(%26) ({
        "nvgpu.mbarrier.arrive.expect_tx"(%25, %1, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":57:9)
        %30 = "memref.load"(%23, %6, %6) : (memref<64x8xf32, 3>, index, index) -> f32 loc("<stdin>":58:15)
        %31 = "memref.load"(%24, %6, %6) : (memref<8x128xf32, 3>, index, index) -> f32 loc("<stdin>":59:15)
        "gpu.printf"(%30) <{format = "[GPU] TMA BEFORE lhs[45][7] %f\0A"}> : (f32) -> () loc("<stdin>":60:9)
        "gpu.printf"(%31) <{format = "[GPU] TMA BEFORE rhs[7][0] %f\0A"}> : (f32) -> () loc("<stdin>":61:9)
        "nvgpu.tma.async.load"(%23, %25, %19, %6, %6, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x8xf32, 3>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<64x8xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, index) -> () loc("<stdin>":62:9)
        "nvgpu.tma.async.load"(%24, %25, %20, %6, %6, %6) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<8x128xf32, 3>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<8x128xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, index) -> () loc("<stdin>":63:9)
        "scf.yield"() : () -> () loc("<stdin>":64:9)
      }, {
        "nvgpu.mbarrier.arrive.expect_tx"(%25, %6, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":66:9)
        "scf.yield"() : () -> () loc("<stdin>":67:9)
      }) : (i1) -> () loc("<stdin>":56:7)
      %27 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":69:13)
      "nvgpu.mbarrier.try_wait.parity"(%25, %27, %0, %6) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, i1, index, index) -> () loc("<stdin>":70:7)
      "scf.if"(%26) ({
        %28 = "memref.load"(%23, %2, %3) : (memref<64x8xf32, 3>, index, index) -> f32 loc("<stdin>":72:15)
        %29 = "memref.load"(%24, %3, %6) : (memref<8x128xf32, 3>, index, index) -> f32 loc("<stdin>":73:15)
        "gpu.printf"(%28) <{format = "[GPU] TMA LOADED lhs[45][7] %f\0A"}> : (f32) -> () loc("<stdin>":74:9)
        "gpu.printf"(%29) <{format = "[GPU] TMA LOADED rhs[7][0] %f\0A"}> : (f32) -> () loc("<stdin>":75:9)
        "scf.yield"() : () -> () loc("<stdin>":76:9)
      }, {
      }) : (i1) -> () loc("<stdin>":71:7)
      "gpu.terminator"() : () -> () loc("<stdin>":79:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":46:5)
    "func.return"() : () -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
