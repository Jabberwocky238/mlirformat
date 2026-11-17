"builtin.module"() <{sym_name = "mymod"}> ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<128x64xf16, 3>}> : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ...)>, linkage = #llvm.linkage<external>, sym_name = "printf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 8192 : index}> : () -> index loc("<stdin>":8:10)
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":9:10)
    %2 = "arith.constant"() <{value = 10000000 : index}> : () -> index loc("<stdin>":10:10)
    %3 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":11:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":12:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:10)
    %6 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":14:10)
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":15:10)
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf16> loc("<stdin>":16:10)
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf32> loc("<stdin>":17:10)
    "scf.for"(%5, %6, %4) ({
    ^bb0(%arg14: index loc("<stdin>":19:10)):
      "scf.for"(%5, %3, %4) ({
      ^bb0(%arg15: index loc("<stdin>":21:12)):
        %24 = "arith.muli"(%arg14, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":22:15)
        %25 = "arith.addi"(%24, %arg15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":23:15)
        %26 = "arith.divui"(%25, %7) : (index, index) -> index loc("<stdin>":24:15)
        %27 = "arith.index_cast"(%26) : (index) -> i32 loc("<stdin>":25:15)
        %28 = "arith.sitofp"(%27) : (i32) -> f16 loc("<stdin>":26:15)
        "memref.store"(%28, %8, %arg14, %arg15) : (f16, memref<128x64xf16>, index, index) -> () loc("<stdin>":27:9)
        %29 = "arith.extf"(%28) : (f16) -> f32 loc("<stdin>":28:15)
        "memref.store"(%29, %9, %arg14, %arg15) : (f32, memref<128x64xf32>, index, index) -> () loc("<stdin>":29:9)
        "scf.yield"() : () -> () loc("<stdin>":30:9)
      }) : (index, index, index) -> () loc("<stdin>":20:7)
      "scf.yield"() : () -> () loc("<stdin>":32:7)
    }) : (index, index, index) -> () loc("<stdin>":18:5)
    %10 = "memref.cast"(%9) : (memref<128x64xf32>) -> memref<*xf32> loc("<stdin>":34:11)
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":35:5)
    %11 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":36:11)
    %12:2 = "gpu.alloc"(%11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x64xf16>, !gpu.async.token) loc("<stdin>":37:13)
    %13 = "gpu.memcpy"(%11, %12#0, %8) : (!gpu.async.token, memref<128x64xf16>, memref<128x64xf16>) -> !gpu.async.token loc("<stdin>":38:11)
    %14 = "memref.cast"(%12#0) : (memref<128x64xf16>) -> memref<*xf16> loc("<stdin>":39:11)
    %15 = "nvgpu.tma.create.descriptor"(%14, %6, %3) : (memref<*xf16>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none> loc("<stdin>":40:11)
    "gpu.launch"(%4, %4, %4, %6, %4, %4) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":42:10), %arg1: index loc("<stdin>":42:24), %arg2: index loc("<stdin>":42:38), %arg3: index loc("<stdin>":42:52), %arg4: index loc("<stdin>":42:66), %arg5: index loc("<stdin>":42:80), %arg6: index loc("<stdin>":42:94), %arg7: index loc("<stdin>":42:108), %arg8: index loc("<stdin>":42:122), %arg9: index loc("<stdin>":42:136), %arg10: index loc("<stdin>":42:150), %arg11: index loc("<stdin>":42:165)):
      %16 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":43:13)
      %17 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":44:13)
      %18 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<128x64xf16, 3> loc("<stdin>":45:13)
      %19 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>> loc("<stdin>":46:13)
      "nvgpu.mbarrier.init"(%19, %16, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":47:7)
      %20 = "arith.cmpi"(%17, %5) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":48:13)
      "scf.if"(%20) ({
        "gpu.printf"(%0) <{format = "[GPU] TMA SIZE %d\0A"}> : (index) -> () loc("<stdin>":50:9)
        "nvgpu.tma.async.load"(%18, %19, %15, %5, %5, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<128x64xf16, 3>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> () loc("<stdin>":51:9)
        "nvgpu.mbarrier.arrive.expect_tx"(%19, %0, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":52:9)
        "scf.yield"() : () -> () loc("<stdin>":53:9)
      }, {
        "nvgpu.mbarrier.arrive.expect_tx"(%19, %5, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":55:9)
        "scf.yield"() : () -> () loc("<stdin>":56:9)
      }) : (i1) -> () loc("<stdin>":49:7)
      %21 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":58:13)
      "nvgpu.mbarrier.try_wait.parity"(%19, %21, %2, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, i1, index, index) -> () loc("<stdin>":59:7)
      "scf.if"(%20) ({
        "gpu.printf"(%1) <{format = "===--- Matrix A ---=== %d \0A"}> : (i32) -> () loc("<stdin>":61:9)
        "scf.for"(%5, %6, %4) ({
        ^bb0(%arg12: index loc("<stdin>":63:14)):
          "scf.for"(%5, %3, %4) ({
          ^bb0(%arg13: index loc("<stdin>":65:16)):
            %22 = "memref.load"(%18, %arg12, %arg13) : (memref<128x64xf16, 3>, index, index) -> f16 loc("<stdin>":66:19)
            %23 = "arith.extf"(%22) : (f16) -> f32 loc("<stdin>":67:19)
            "gpu.printf"(%23) <{format = "%.0f,   "}> : (f32) -> () loc("<stdin>":68:13)
            "scf.yield"() : () -> () loc("<stdin>":69:13)
          }) : (index, index, index) -> () loc("<stdin>":64:11)
          "gpu.printf"(%1) <{format = "%d\0A"}> : (i32) -> () loc("<stdin>":71:11)
          "scf.yield"() : () -> () loc("<stdin>":72:11)
        }) : (index, index, index) -> () loc("<stdin>":62:9)
        "gpu.printf"(%1) <{format = "===----------------=== %d \0A"}> : (i32) -> () loc("<stdin>":74:9)
        "scf.yield"() : () -> () loc("<stdin>":75:9)
      }, {
      }) : (i1) -> () loc("<stdin>":60:7)
      "gpu.terminator"() : () -> () loc("<stdin>":78:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
