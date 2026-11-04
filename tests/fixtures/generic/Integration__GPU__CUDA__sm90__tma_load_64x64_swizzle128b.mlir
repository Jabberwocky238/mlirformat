"builtin.module"() <{sym_name = "mymod"}> ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ...)>, linkage = #llvm.linkage<external>, sym_name = "printf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 32768 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10000000 : index}> : () -> index
    %3 = "arith.constant"() <{value = 64 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 32 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 128 : index}> : () -> index
    %8 = "arith.constant"() <{value = 8 : index}> : () -> index
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf16>
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf32>
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf32>
    "scf.for"(%6, %3, %4) ({
    ^bb0(%arg14: index):
      "scf.for"(%6, %7, %4) ({
      ^bb0(%arg15: index):
        %39 = "arith.muli"(%arg14, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %40 = "arith.addi"(%39, %arg15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %41 = "arith.divui"(%40, %8) : (index, index) -> index
        %42 = "arith.index_cast"(%41) : (index) -> i32
        %43 = "arith.sitofp"(%42) : (i32) -> f16
        "memref.store"(%43, %10, %arg14, %arg15) : (f16, memref<64x128xf16>, index, index) -> ()
        %44 = "arith.extf"(%43) : (f16) -> f32
        "memref.store"(%44, %12, %arg14, %arg15) : (f32, memref<64x128xf32>, index, index) -> ()
        %45 = "arith.muli"(%arg15, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %46 = "arith.addi"(%45, %arg14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %47 = "arith.divui"(%46, %8) : (index, index) -> index
        %48 = "arith.index_cast"(%47) : (index) -> i32
        %49 = "arith.sitofp"(%48) : (i32) -> f16
        "memref.store"(%49, %9, %arg15, %arg14) : (f16, memref<128x64xf16>, index, index) -> ()
        %50 = "arith.extf"(%49) : (f16) -> f32
        "memref.store"(%50, %11, %arg15, %arg14) : (f32, memref<128x64xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "gpu.wait"() : () -> !gpu.async.token
    %14:2 = "gpu.alloc"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x64xf16>, !gpu.async.token)
    %15:2 = "gpu.alloc"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<64x128xf16>, !gpu.async.token)
    %16 = "gpu.memcpy"(%13, %14#0, %9) : (!gpu.async.token, memref<128x64xf16>, memref<128x64xf16>) -> !gpu.async.token
    %17 = "gpu.memcpy"(%13, %15#0, %10) : (!gpu.async.token, memref<64x128xf16>, memref<64x128xf16>) -> !gpu.async.token
    %18 = "memref.cast"(%14#0) : (memref<128x64xf16>) -> memref<*xf16>
    %19 = "memref.cast"(%15#0) : (memref<64x128xf16>) -> memref<*xf16>
    %20 = "nvgpu.tma.create.descriptor"(%18, %7, %3) : (memref<*xf16>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    %21 = "nvgpu.tma.create.descriptor"(%19, %3, %3) : (memref<*xf16>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    %22 = "arith.constant"() <{value = 32768 : i32}> : () -> i32
    "gpu.launch"(%4, %4, %4, %7, %4, %4, %22) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %23 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index
      %24 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %25 = "arith.constant"() <{value = 0 : index}> : () -> index
      %26 = "arith.constant"() <{value = 32768 : index}> : () -> index
      %27 = "arith.constant"() <{value = 24576 : index}> : () -> index
      %28 = "arith.constant"() <{value = 16384 : index}> : () -> index
      %29 = "gpu.dynamic_shared_memory"() : () -> memref<?xi8, #gpu.address_space<workgroup>>
      %30 = "memref.view"(%29, %6) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<128x64xf16, #gpu.address_space<workgroup>>
      %31 = "memref.view"(%29, %28) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x128xf16, #gpu.address_space<workgroup>>
      %32 = "memref.view"(%29, %28) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x64xf16, #gpu.address_space<workgroup>>
      %33 = "memref.view"(%29, %27) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x64xf16, #gpu.address_space<workgroup>>
      %34 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>
      "nvgpu.mbarrier.init"(%34, %23, %25) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
      %35 = "arith.cmpi"(%24, %25) <{predicate = 0 : i64}> : (index, index) -> i1
      "scf.if"(%35) ({
        "gpu.printf"(%0) <{format = "[GPU] TMA SIZE %d\0A"}> : (index) -> ()
        "nvgpu.tma.async.load"(%30, %34, %20, %25, %25, %25) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<128x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%32, %34, %21, %25, %25, %25) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%33, %34, %21, %3, %25, %25) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.mbarrier.arrive.expect_tx"(%34, %0, %25) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
        "nvgpu.mbarrier.arrive.expect_tx"(%34, %25, %25) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (i1) -> ()
      %36 = "arith.constant"() <{value = false}> : () -> i1
      "nvgpu.mbarrier.try_wait.parity"(%34, %36, %2, %25) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, i1, index, index) -> ()
      "scf.if"(%35) ({
        "gpu.printf"(%1) <{format = "===--- Matrix B ---=== %d \0A"}> : (i32) -> ()
        "scf.for"(%25, %3, %4) ({
        ^bb0(%arg12: index):
          "scf.for"(%25, %7, %4) ({
          ^bb0(%arg13: index):
            %37 = "memref.load"(%31, %arg12, %arg13) : (memref<64x128xf16, #gpu.address_space<workgroup>>, index, index) -> f16
            %38 = "arith.extf"(%37) : (f16) -> f32
            "gpu.printf"(%38) <{format = "%.0f,   "}> : (f32) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "gpu.printf"(%1) <{format = "%d\0A"}> : (i32) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "gpu.printf"(%1) <{format = "===----------------=== %d \0A"}> : (i32) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.barrier"() : () -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

