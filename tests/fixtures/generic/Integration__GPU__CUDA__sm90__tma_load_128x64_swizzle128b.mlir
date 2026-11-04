"builtin.module"() <{sym_name = "mymod"}> ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "memref.global"() <{sym_name = "bufferLhsGlobal", sym_visibility = "private", type = memref<128x64xf16, 3>}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ...)>, linkage = #llvm.linkage<external>, sym_name = "printf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 8192 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10000000 : index}> : () -> index
    %3 = "arith.constant"() <{value = 64 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 128 : index}> : () -> index
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf16>
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf32>
    "scf.for"(%5, %6, %4) ({
    ^bb0(%arg14: index):
      "scf.for"(%5, %3, %4) ({
      ^bb0(%arg15: index):
        %24 = "arith.muli"(%arg14, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %25 = "arith.addi"(%24, %arg15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %26 = "arith.divui"(%25, %7) : (index, index) -> index
        %27 = "arith.index_cast"(%26) : (index) -> i32
        %28 = "arith.sitofp"(%27) : (i32) -> f16
        "memref.store"(%28, %8, %arg14, %arg15) : (f16, memref<128x64xf16>, index, index) -> ()
        %29 = "arith.extf"(%28) : (f16) -> f32
        "memref.store"(%29, %9, %arg14, %arg15) : (f32, memref<128x64xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %10 = "memref.cast"(%9) : (memref<128x64xf32>) -> memref<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %11 = "gpu.wait"() : () -> !gpu.async.token
    %12:2 = "gpu.alloc"(%11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x64xf16>, !gpu.async.token)
    %13 = "gpu.memcpy"(%11, %12#0, %8) : (!gpu.async.token, memref<128x64xf16>, memref<128x64xf16>) -> !gpu.async.token
    %14 = "memref.cast"(%12#0) : (memref<128x64xf16>) -> memref<*xf16>
    %15 = "nvgpu.tma.create.descriptor"(%14, %6, %3) : (memref<*xf16>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    "gpu.launch"(%4, %4, %4, %6, %4, %4) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %16 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index
      %17 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %18 = "memref.get_global"() <{name = @bufferLhsGlobal}> : () -> memref<128x64xf16, 3>
      %19 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>
      "nvgpu.mbarrier.init"(%19, %16, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
      %20 = "arith.cmpi"(%17, %5) <{predicate = 0 : i64}> : (index, index) -> i1
      "scf.if"(%20) ({
        "gpu.printf"(%0) <{format = "[GPU] TMA SIZE %d\0A"}> : (index) -> ()
        "nvgpu.tma.async.load"(%18, %19, %15, %5, %5, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<128x64xf16, 3>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.mbarrier.arrive.expect_tx"(%19, %0, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
        "nvgpu.mbarrier.arrive.expect_tx"(%19, %5, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (i1) -> ()
      %21 = "arith.constant"() <{value = false}> : () -> i1
      "nvgpu.mbarrier.try_wait.parity"(%19, %21, %2, %5) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, i1, index, index) -> ()
      "scf.if"(%20) ({
        "gpu.printf"(%1) <{format = "===--- Matrix A ---=== %d \0A"}> : (i32) -> ()
        "scf.for"(%5, %6, %4) ({
        ^bb0(%arg12: index):
          "scf.for"(%5, %3, %4) ({
          ^bb0(%arg13: index):
            %22 = "memref.load"(%18, %arg12, %arg13) : (memref<128x64xf16, 3>, index, index) -> f16
            %23 = "arith.extf"(%22) : (f16) -> f32
            "gpu.printf"(%23) <{format = "%.0f,   "}> : (f32) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "gpu.printf"(%1) <{format = "%d\0A"}> : (i32) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "gpu.printf"(%1) <{format = "===----------------=== %d \0A"}> : (i32) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

