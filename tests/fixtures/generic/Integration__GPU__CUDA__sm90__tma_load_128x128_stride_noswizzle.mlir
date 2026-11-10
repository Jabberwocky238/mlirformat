#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 10000000 : index}> : () -> index
    %1 = "arith.constant"() <{value = false}> : () -> i1
    %2 = "arith.constant"() <{value = 32768 : index}> : () -> index
    %3 = "arith.constant"() <{value = 31 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 8 : index}> : () -> index
    %9 = "arith.constant"() <{value = 64 : index}> : () -> index
    %10 = "arith.constant"() <{value = 2 : index}> : () -> index
    %11 = "arith.constant"() <{value = 32768 : i32}> : () -> i32
    %12 = "arith.constant"() <{value = 128 : index}> : () -> index
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %15 = "llvm.mlir.constant"() <{value = 128 : i64}> : () -> i64
    %16 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %17 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %18 = "arith.constant"() <{value = 1.123050e+00 : f16}> : () -> f16
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x128xf16>
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x128xf16>
    "scf.for"(%7, %12, %13) ({
    ^bb0(%arg22: index):
      "scf.for"(%7, %9, %13) ({
      ^bb0(%arg23: index):
        %68 = "arith.index_cast"(%arg22) : (index) -> i32
        %69 = "arith.index_cast"(%arg23) : (index) -> i32
        %70 = "arith.sitofp"(%68) : (i32) -> f16
        %71 = "arith.sitofp"(%69) : (i32) -> f16
        %72 = "arith.addf"(%70, %18) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
        %73 = "arith.constant"() <{value = 3.119140e+00 : f16}> : () -> f16
        %74 = "arith.mulf"(%72, %73) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
        %75 = "arith.addf"(%74, %72) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
        %76 = "arith.constant"() <{value = 1.779790e-01 : f16}> : () -> f16
        %77 = "arith.divf"(%76, %75) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
        "memref.store"(%77, %19, %arg22, %arg23) : (f16, memref<128x128xf16>, index, index) -> ()
        "memref.store"(%17, %20, %arg22, %arg23) : (f16, memref<128x128xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %21 = "gpu.wait"() : () -> !gpu.async.token
    %22:2 = "gpu.alloc"(%21) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x128xf16>, !gpu.async.token)
    %23:2 = "gpu.alloc"(%22#1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x128xf16>, !gpu.async.token)
    %24 = "gpu.memcpy"(%23#1, %22#0, %19) : (!gpu.async.token, memref<128x128xf16>, memref<128x128xf16>) -> !gpu.async.token
    %25 = "gpu.memcpy"(%24, %23#0, %20) : (!gpu.async.token, memref<128x128xf16>, memref<128x128xf16>) -> !gpu.async.token
    %26 = "memref.expand_shape"(%22#0) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 2, 64, 2, 64>}> : (memref<128x128xf16>) -> memref<2x64x2x64xf16>
    %27 = "memref.transpose"(%26) <{permutation = #map}> : (memref<2x64x2x64xf16>) -> memref<2x2x64x64xf16, strided<[8192, 64, 128, 1]>>
    %28 = "memref.cast"(%27) : (memref<2x2x64x64xf16, strided<[8192, 64, 128, 1]>>) -> memref<*xf16>
    %29 = "nvgpu.tma.create.descriptor"(%28, %10, %10, %9, %9) : (memref<*xf16>, index, index, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<2x2x64x64xf16, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
    "gpu.launch"(%13, %13, %13, %12, %13, %13, %11) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1>}> ({
    ^bb0(%arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index, %arg17: index):
      %39 = "gpu.dynamic_shared_memory"() : () -> memref<?xi8, #gpu.address_space<workgroup>>
      %40 = "memref.view"(%39, %7) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<2x2x64x64xf16, #gpu.address_space<workgroup>>
      %41 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>
      %42 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %43 = "arith.index_cast"(%42) : (index) -> i32
      %44 = "arith.shrui"(%43, %5) : (i32, i32) -> i32
      %45 = "nvvm.shfl.sync"(%4, %44, %6, %3) <{kind = #nvvm<shfl_kind idx>}> : (i32, i32, i32, i32) -> i32
      %46 = "arith.cmpi"(%45, %6) <{predicate = 0 : i64}> : (i32, i32) -> i1
      %47 = "nvvm.elect.sync"() : () -> i1
      %48 = "arith.andi"(%46, %47) : (i1, i1) -> i1
      "scf.if"(%48) ({
        "nvgpu.mbarrier.init"(%41, %13, %7) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %49 = "nvvm.shfl.sync"(%4, %44, %6, %3) <{kind = #nvvm<shfl_kind idx>}> : (i32, i32, i32, i32) -> i32
      %50 = "arith.cmpi"(%49, %6) <{predicate = 0 : i64}> : (i32, i32) -> i1
      %51 = "nvvm.elect.sync"() : () -> i1
      %52 = "arith.andi"(%50, %51) : (i1, i1) -> i1
      "scf.if"(%52) ({
        "nvgpu.mbarrier.arrive.expect_tx"(%41, %2, %7) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, index, index) -> ()
        "nvgpu.tma.async.load"(%40, %41, %29, %7, %7, %7, %7, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 4, 1, 0, 0>}> : (memref<2x2x64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<2x2x64x64xf16, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, index, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "nvgpu.mbarrier.try_wait.parity"(%41, %1, %0, %7) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, i1, index, index) -> ()
      "scf.for"(%7, %10, %13) ({
      ^bb0(%arg18: index):
        "scf.for"(%7, %10, %13) ({
        ^bb0(%arg19: index):
          %53 = "arith.muli"(%arg18, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %54 = "arith.muli"(%arg19, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %55 = "memref.subview"(%40, %arg18, %arg19) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 64, 64>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<2x2x64x64xf16, #gpu.address_space<workgroup>>, index, index) -> memref<64x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>
          %56 = "memref.subview"(%23#0, %53, %54) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 64, 64>, static_strides = array<i64: 1, 1>}> : (memref<128x128xf16>, index, index) -> memref<64x64xf16, strided<[128, 1], offset: ?>>
          %57 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index
          %58 = "gpu.thread_id"() <{dimension = #gpu<dim y>}> : () -> index
          %59 = "arith.muli"(%58, %57) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %60 = "arith.addi"(%42, %59) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %61 = "gpu.block_dim"() <{dimension = #gpu<dim y>}> : () -> index
          %62 = "arith.muli"(%57, %61) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %63 = "gpu.thread_id"() <{dimension = #gpu<dim z>}> : () -> index
          %64 = "arith.muli"(%63, %62) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %65 = "arith.addi"(%60, %64) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          %66 = "arith.cmpi"(%65, %7) <{predicate = 0 : i64}> : (index, index) -> i1
          "scf.if"(%66) ({
            "scf.for"(%7, %9, %13) ({
            ^bb0(%arg20: index):
              "scf.for"(%7, %9, %13) ({
              ^bb0(%arg21: index):
                %67 = "memref.load"(%55, %arg20, %arg21) : (memref<64x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>, index, index) -> f16
                "memref.store"(%67, %56, %arg20, %arg21) : (f16, memref<64x64xf16, strided<[128, 1], offset: ?>>, index, index) -> ()
                "scf.yield"() : () -> ()
              }) : (index, index, index) -> ()
              "scf.yield"() : () -> ()
            }) : (index, index, index) -> ()
            "scf.yield"() : () -> ()
          }, {
          }) : (i1) -> ()
          "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index, i32) -> ()
    %30 = "gpu.memcpy"(%25, %20, %23#0) : (!gpu.async.token, memref<128x128xf16>, memref<128x128xf16>) -> !gpu.async.token
    "gpu.wait"(%30) : (!gpu.async.token) -> ()
    %31:2 = "scf.for"(%7, %12, %13, %7, %7) ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index):
      %32:2 = "scf.for"(%7, %9, %13, %arg1, %arg2) ({
      ^bb0(%arg3: index, %arg4: index, %arg5: index):
        %33 = "memref.load"(%20, %arg0, %arg3) : (memref<128x128xf16>, index, index) -> f16
        %34 = "memref.load"(%19, %arg0, %arg3) : (memref<128x128xf16>, index, index) -> f16
        %35 = "arith.cmpf"(%33, %34) <{fastmath = #arith.fastmath<none>, predicate = 6 : i64}> : (f16, f16) -> i1
        %36:2 = "scf.if"(%35) ({
          %38 = "arith.addi"(%arg4, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "scf.yield"(%38, %arg5) : (index, index) -> ()
        }, {
          %37 = "arith.addi"(%arg5, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "scf.yield"(%arg4, %37) : (index, index) -> ()
        }) : (i1) -> (index, index)
        "scf.yield"(%36#0, %36#1) : (index, index) -> ()
      }) : (index, index, index, index, index) -> (index, index)
      "scf.yield"(%32#0, %32#1) : (index, index) -> ()
    }) : (index, index, index, index, index) -> (index, index)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Correct Results :"}> : () -> ()
    "vector.print"(%31#1) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Incorrect Results :"}> : () -> ()
    "vector.print"(%31#0) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

