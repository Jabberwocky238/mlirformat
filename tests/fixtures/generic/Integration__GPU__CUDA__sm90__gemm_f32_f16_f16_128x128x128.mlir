#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "memref.global"() <{alignment = 16 : i64, sym_name = "accShmem", sym_visibility = "private", type = memref<0xf32, 3>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 65536 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4096 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index
    %6 = "arith.constant"() <{value = 8 : index}> : () -> index
    %7 = "arith.constant"() <{value = 128 : index}> : () -> index
    %8 = "arith.constant"() <{value = 32 : index}> : () -> index
    %9 = "arith.constant"() <{value = 256 : index}> : () -> index
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x128xf16>
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x128xf16>
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x128xf32>
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x128xf32>
    "scf.for"(%3, %7, %1) ({
    ^bb0(%arg24: index):
      "scf.for"(%3, %7, %1) ({
      ^bb0(%arg25: index):
        %105 = "arith.muli"(%arg24, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %106 = "arith.addi"(%105, %arg25) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %107 = "arith.divui"(%106, %6) : (index, index) -> index
        %108 = "arith.remui"(%107, %5) : (index, index) -> index
        %109 = "arith.index_cast"(%108) : (index) -> i32
        %110 = "arith.sitofp"(%109) : (i32) -> f16
        "memref.store"(%110, %12, %arg24, %arg25) : (f16, memref<128x128xf16>, index, index) -> ()
        %111 = "arith.muli"(%arg25, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %112 = "arith.addi"(%111, %arg24) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %113 = "arith.divui"(%112, %6) : (index, index) -> index
        %114 = "arith.remui"(%113, %5) : (index, index) -> index
        %115 = "arith.index_cast"(%114) : (index) -> i32
        %116 = "arith.sitofp"(%115) : (i32) -> f16
        "memref.store"(%116, %11, %arg25, %arg24) : (f16, memref<128x128xf16>, index, index) -> ()
        "memref.store"(%10, %13, %arg24, %arg25) : (f32, memref<128x128xf32>, index, index) -> ()
        "memref.store"(%10, %14, %arg24, %arg25) : (f32, memref<128x128xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %15 = "gpu.wait"() : () -> !gpu.async.token
    %16:2 = "gpu.alloc"(%15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x128xf16>, !gpu.async.token)
    %17:2 = "gpu.alloc"(%15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x128xf16>, !gpu.async.token)
    %18:2 = "gpu.alloc"(%15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<128x128xf32>, !gpu.async.token)
    %19 = "gpu.memcpy"(%15, %16#0, %11) : (!gpu.async.token, memref<128x128xf16>, memref<128x128xf16>) -> !gpu.async.token
    %20 = "gpu.memcpy"(%15, %17#0, %12) : (!gpu.async.token, memref<128x128xf16>, memref<128x128xf16>) -> !gpu.async.token
    %21 = "memref.cast"(%16#0) : (memref<128x128xf16>) -> memref<*xf16>
    %22 = "memref.cast"(%17#0) : (memref<128x128xf16>) -> memref<*xf16>
    %23 = "nvgpu.tma.create.descriptor"(%21, %7, %4) : (memref<*xf16>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    %24 = "nvgpu.tma.create.descriptor"(%22, %4, %4) : (memref<*xf16>, index, index) -> !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>
    "gpu.launch"(%1, %1, %1, %7, %1, %1, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1>}> ({
    ^bb0(%arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index, %arg17: index, %arg18: index, %arg19: index, %arg20: index):
      %48 = "memref.assume_alignment"(%18#0) <{alignment = 16 : i32}> : (memref<128x128xf32>) -> memref<128x128xf32>
      %49 = "arith.constant"() <{value = 256 : index}> : () -> index
      %50 = "arith.constant"() <{value = 10000000 : index}> : () -> index
      %51 = "arith.constant"() <{value = 32768 : index}> : () -> index
      %52 = "arith.constant"() <{value = 320 : index}> : () -> index
      %53 = "arith.constant"() <{value = 192 : index}> : () -> index
      %54 = "arith.constant"() <{value = 6 : index}> : () -> index
      %55 = "arith.constant"() <{value = 5 : index}> : () -> index
      %56 = "arith.constant"() <{value = 4 : index}> : () -> index
      %57 = "arith.constant"() <{value = 3 : index}> : () -> index
      %58 = "arith.constant"() <{value = 7 : index}> : () -> index
      %59 = "arith.constant"() <{value = 64 : index}> : () -> index
      %60 = "arith.constant"() <{value = 1 : index}> : () -> index
      %61 = "arith.constant"() <{value = 2 : index}> : () -> index
      %62 = "arith.constant"() <{value = 0 : index}> : () -> index
      %63 = "arith.constant"() <{value = 128 : index}> : () -> index
      %64 = "arith.constant"() <{value = 32 : index}> : () -> index
      %65 = "arith.constant"() <{value = 16 : index}> : () -> index
      %66 = "arith.constant"() <{value = 4096 : index}> : () -> index
      %67 = "arith.constant"() <{value = 8 : index}> : () -> index
      %68 = "arith.constant"() <{value = 32768 : index}> : () -> index
      %69 = "arith.constant"() <{value = 24576 : index}> : () -> index
      %70 = "arith.constant"() <{value = 16384 : index}> : () -> index
      %71 = "arith.constant"() <{value = 49152 : index}> : () -> index
      %72 = "arith.constant"() <{value = 57344 : index}> : () -> index
      %73 = "arith.constant"() <{value = 40960 : index}> : () -> index
      %74 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %75 = "gpu.dynamic_shared_memory"() : () -> memref<?xi8, #gpu.address_space<workgroup>>
      %76 = "memref.view"(%75, %62) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<2x128x64xf16, #gpu.address_space<workgroup>>
      %77 = "memref.view"(%75, %51) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<2x64x128xf16, #gpu.address_space<workgroup>>
      %78 = "nvgpu.mbarrier.create"() : () -> !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>
      %79 = "arith.cmpi"(%74, %62) <{predicate = 0 : i64}> : (index, index) -> i1
      "nvgpu.mbarrier.init"(%78, %60, %62) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, index, index) -> ()
      "nvgpu.mbarrier.init"(%78, %60, %60) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, index, index) -> ()
      "nvgpu.tma.prefetch.descriptor"(%23) : (!nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>) -> ()
      "nvgpu.tma.prefetch.descriptor"(%24) : (!nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>) -> ()
      "scf.if"(%79) ({
        %100 = "arith.constant"() <{value = 0 : index}> : () -> index
        %101 = "memref.view"(%75, %62) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<128x64xf16, #gpu.address_space<workgroup>>
        %102 = "memref.view"(%75, %51) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x64xf16, #gpu.address_space<workgroup>>
        %103 = "memref.view"(%75, %73) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x64xf16, #gpu.address_space<workgroup>>
        "nvgpu.mbarrier.arrive.expect_tx"(%78, %68, %100) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, index, index) -> ()
        %104 = "arith.muli"(%100, %59) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "nvgpu.tma.async.load"(%101, %78, %23, %104, %62, %100) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<128x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%102, %78, %24, %62, %104, %100) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%103, %78, %24, %59, %104, %100) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.if"(%79) ({
        %95 = "arith.constant"() <{value = 1 : index}> : () -> index
        %96 = "memref.view"(%75, %70) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<128x64xf16, #gpu.address_space<workgroup>>
        %97 = "memref.view"(%75, %71) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x64xf16, #gpu.address_space<workgroup>>
        %98 = "memref.view"(%75, %72) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<64x64xf16, #gpu.address_space<workgroup>>
        "nvgpu.mbarrier.arrive.expect_tx"(%78, %68, %95) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, index, index) -> ()
        %99 = "arith.muli"(%95, %59) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "nvgpu.tma.async.load"(%96, %78, %23, %99, %62, %95) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<128x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%97, %78, %24, %62, %99, %95) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "nvgpu.tma.async.load"(%98, %78, %24, %59, %99, %95) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 1, 0, 0>}> : (memref<64x64xf16, #gpu.address_space<workgroup>>, !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, index, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %80 = "nvgpu.warpgroup.mma.init.accumulator"() : () -> !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>
      %81 = "scf.for"(%62, %61, %60, %80) ({
      ^bb0(%arg22: index, %arg23: !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>):
        %88 = "arith.constant"() <{value = 10000000 : index}> : () -> index
        %89 = "arith.constant"() <{value = false}> : () -> i1
        "nvgpu.mbarrier.try_wait.parity"(%78, %89, %88, %arg22) : (!nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 2>, i1, index, index) -> ()
        %90 = "memref.subview"(%76, %arg22) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 128, 64>, static_strides = array<i64: 1, 1, 1>}> : (memref<2x128x64xf16, #gpu.address_space<workgroup>>, index) -> memref<128x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>
        %91 = "memref.subview"(%77, %arg22) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 64, 128>, static_strides = array<i64: 1, 1, 1>}> : (memref<2x64x128xf16, #gpu.address_space<workgroup>>, index) -> memref<64x128xf16, strided<[128, 1], offset: ?>, #gpu.address_space<workgroup>>
        %92 = "nvgpu.warpgroup.generate.descriptor"(%90, %23) : (memref<128x64xf16, strided<[64, 1], offset: ?>, #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>) -> !nvgpu.warpgroup.descriptor<tensor = memref<128x64xf16, 3>>
        %93 = "nvgpu.warpgroup.generate.descriptor"(%91, %24) : (memref<64x128xf16, strided<[128, 1], offset: ?>, #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>) -> !nvgpu.warpgroup.descriptor<tensor = memref<64x128xf16, 3>>
        %94 = "nvgpu.warpgroup.mma"(%92, %93, %arg23) <{transposeB}> : (!nvgpu.warpgroup.descriptor<tensor = memref<128x64xf16, 3>>, !nvgpu.warpgroup.descriptor<tensor = memref<64x128xf16, 3>>, !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>) -> !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>
        "scf.yield"(%94) : (!nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>) -> ()
      }) : (index, index, index, !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>) -> !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>
      "nvvm.wgmma.wait.group.sync.aligned"() <{group = 0 : i64}> : () -> ()
      %82 = "memref.get_global"() <{name = @accShmem}> : () -> memref<0xf32, 3>
      %83 = "memref.reinterpret_cast"(%82) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 128, 128>, static_strides = array<i64: 128, 1>}> : (memref<0xf32, 3>) -> memref<128x128xf32, 3>
      "nvgpu.warpgroup.mma.store"(%81, %83) : (!nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>, memref<128x128xf32, 3>) -> ()
      %84 = "arith.divui"(%74, %64) : (index, index) -> index
      %85 = "arith.remui"(%74, %64) : (index, index) -> index
      "scf.for"(%84, %63, %56) ({
      ^bb0(%arg21: index):
        %86 = "arith.muli"(%85, %56) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %87 = "vector.load"(%83, %arg21, %86) : (memref<128x128xf32, 3>, index, index) -> vector<4xf32>
        "vector.store"(%87, %48, %arg21, %86) : (vector<4xf32>, memref<128x128xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index, i32) -> ()
    %25 = "gpu.memcpy"(%15, %13, %18#0) : (!gpu.async.token, memref<128x128xf32>, memref<128x128xf32>) -> !gpu.async.token
    "gpu.wait"(%15) : (!gpu.async.token) -> ()
    "linalg.matmul"(%11, %12, %14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f16, %arg7: f16, %arg8: f32):
      %44 = "arith.extf"(%arg6) : (f16) -> f32
      %45 = "arith.extf"(%arg7) : (f16) -> f32
      %46 = "arith.mulf"(%44, %45) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %47 = "arith.addf"(%arg8, %46) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%47) : (f32) -> ()
    }) : (memref<128x128xf16>, memref<128x128xf16>, memref<128x128xf32>) -> ()
    %26 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %27 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %28 = "arith.constant"() <{value = 9.99999993E-9 : f32}> : () -> f32
    %29:2 = "scf.for"(%3, %7, %1, %27, %27) ({
    ^bb0(%arg0: index, %arg1: i32, %arg2: i32):
      %30:2 = "scf.for"(%3, %7, %1, %arg1, %arg2) ({
      ^bb0(%arg3: index, %arg4: i32, %arg5: i32):
        %31 = "memref.load"(%14, %arg0, %arg3) : (memref<128x128xf32>, index, index) -> f32
        %32 = "memref.load"(%13, %arg0, %arg3) : (memref<128x128xf32>, index, index) -> f32
        %33 = "arith.subf"(%31, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %34 = "math.absf"(%33) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        %35 = "arith.cmpf"(%28, %34) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (f32, f32) -> i1
        %36:2 = "scf.if"(%35) ({
          %38 = "arith.constant"() <{value = dense<-1> : vector<2xi32>}> : () -> vector<2xi32>
          %39 = "arith.index_cast"(%arg0) : (index) -> i32
          %40 = "arith.index_cast"(%arg3) : (index) -> i32
          %41 = "vector.insert"(%39, %38) <{static_position = array<i64: 0>}> : (i32, vector<2xi32>) -> vector<2xi32>
          %42 = "vector.insert"(%40, %41) <{static_position = array<i64: 1>}> : (i32, vector<2xi32>) -> vector<2xi32>
          %43 = "arith.addi"(%arg4, %26) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          "scf.yield"(%43, %arg5) : (i32, i32) -> ()
        }, {
          %37 = "arith.addi"(%arg5, %26) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
          "scf.yield"(%arg4, %37) : (i32, i32) -> ()
        }) : (i1) -> (i32, i32)
        "scf.yield"(%36#0, %36#1) : (i32, i32) -> ()
      }) : (index, index, index, i32, i32) -> (i32, i32)
      "scf.yield"(%30#0, %30#1) : (i32, i32) -> ()
    }) : (index, index, index, i32, i32) -> (i32, i32)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Correct Results :"}> : () -> ()
    "vector.print"(%29#1) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Incorrect Results :"}> : () -> ()
    "vector.print"(%29#0) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

