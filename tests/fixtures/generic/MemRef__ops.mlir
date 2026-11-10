#map = affine_map<(d0, d1)[s0] -> (d0 + s0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloc"}> ({
    %93 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x64xf32, 1>
    %94 = "arith.constant"() <{value = 0 : index}> : () -> index
    %95 = "arith.constant"() <{value = 1 : index}> : () -> index
    %96 = "memref.alloc"(%94, %95) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32, 1>
    %97 = "memref.alloc"(%94) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<2x4xf32, #map, 1>
    %98 = "memref.alloc"(%95, %94) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, index) -> memref<2x?xf32, #map, 1>
    %99 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "alloca"}> ({
    %86 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x64xf32, 1>
    %87 = "arith.constant"() <{value = 0 : index}> : () -> index
    %88 = "arith.constant"() <{value = 1 : index}> : () -> index
    %89 = "memref.alloca"(%87, %88) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32, 1>
    %90 = "memref.alloca"(%87) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<2x4xf32, #map, 1>
    %91 = "memref.alloca"(%88, %87) <{operandSegmentSizes = array<i32: 1, 1>}> : (index, index) -> memref<2x?xf32, #map, 1>
    %92 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dealloc"}> ({
    %85 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x64xf32>
    "memref.dealloc"(%85) : (memref<1024x64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "load_store"}> ({
    %81 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024x64xf32, 1>
    %82 = "arith.constant"() <{value = 0 : index}> : () -> index
    %83 = "arith.constant"() <{value = 1 : index}> : () -> index
    %84 = "memref.load"(%81, %82, %83) : (memref<1024x64xf32, 1>, index, index) -> f32
    "memref.store"(%84, %81, %82, %83) : (f32, memref<1024x64xf32, 1>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dma_ops"}> ({
    %74 = "arith.constant"() <{value = 0 : index}> : () -> index
    %75 = "arith.constant"() <{value = 32 : index}> : () -> index
    %76 = "arith.constant"() <{value = 16 : index}> : () -> index
    %77 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %78 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32, 1>
    %79 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %80 = "arith.constant"() <{value = 256 : index}> : () -> index
    "memref.dma_start"(%77, %74, %78, %74, %80, %79, %74) : (memref<256xf32>, index, memref<256xf32, 1>, index, index, memref<1xf32>, index) -> ()
    "memref.dma_wait"(%79, %74, %80) : (memref<1xf32>, index, index) -> ()
    "memref.dma_start"(%77, %74, %78, %74, %80, %79, %74, %75, %76) : (memref<256xf32>, index, memref<256xf32, 1>, index, index, memref<1xf32>, index, index, index) -> ()
    "memref.dma_wait"(%79, %74, %80) : (memref<1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<10x?xf32, strided<[?, 1], offset: ?>>, sym_name = "memref_reinterpret_cast"}> ({
  ^bb0(%arg49: memref<?xf32>):
    %71 = "arith.constant"() <{value = 0 : index}> : () -> index
    %72 = "arith.constant"() <{value = 10 : index}> : () -> index
    %73 = "memref.reinterpret_cast"(%arg49, %71, %72, %72) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 10, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, 1>}> : (memref<?xf32>, index, index, index) -> memref<10x?xf32, strided<[?, 1], offset: ?>>
    "func.return"(%73) : (memref<10x?xf32, strided<[?, 1], offset: ?>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<10x?xf32, strided<[?, 1], offset: ?>>, sym_name = "memref_reinterpret_cast_static_to_dynamic_sizes"}> ({
  ^bb0(%arg48: memref<?xf32>):
    %70 = "memref.reinterpret_cast"(%arg48) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: 1, 1>}> : (memref<?xf32>) -> memref<10x?xf32, strided<[?, 1], offset: ?>>
    "func.return"(%70) : (memref<10x?xf32, strided<[?, 1], offset: ?>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> memref<10x?xf32, strided<[?, 1], offset: ?>>, sym_name = "memref_reinterpret_cast_dynamic_offset"}> ({
  ^bb0(%arg46: memref<?xf32>, %arg47: index):
    %69 = "memref.reinterpret_cast"(%arg46, %arg47) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 10, 10>, static_strides = array<i64: 1, 1>}> : (memref<?xf32>, index) -> memref<10x?xf32, strided<[?, 1], offset: ?>>
    "func.return"(%69) : (memref<10x?xf32, strided<[?, 1], offset: ?>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>, memref<1xi32>, memref<2xi32>, memref<?xi32>) -> memref<*xf32>, sym_name = "memref_reshape"}> ({
  ^bb0(%arg42: memref<*xf32>, %arg43: memref<1xi32>, %arg44: memref<2xi32>, %arg45: memref<?xi32>):
    %66 = "memref.reshape"(%arg42, %arg43) : (memref<*xf32>, memref<1xi32>) -> memref<?xf32>
    %67 = "memref.reshape"(%66, %arg44) : (memref<?xf32>, memref<2xi32>) -> memref<?x?xf32>
    %68 = "memref.reshape"(%67, %arg45) : (memref<?x?xf32>, memref<?xi32>) -> memref<*xf32>
    "func.return"(%68) : (memref<*xf32>) -> ()
  }) : () -> ()
  "memref.global"() <{sym_name = "memref0", type = memref<2xf32>}> : () -> ()
  "memref.global"() <{constant, initial_value = dense<[0.000000e+00, 1.000000e+00]> : tensor<2xf32>, sym_name = "memref1", type = memref<2xf32>}> : () -> ()
  "memref.global"() <{initial_value, sym_name = "memref2", type = memref<2xf32>}> : () -> ()
  "memref.global"() <{initial_value, sym_name = "memref3", sym_visibility = "private", type = memref<2xf32>}> : () -> ()
  "memref.global"() <{constant, initial_value, sym_name = "memref4", sym_visibility = "private", type = memref<2xf32>}> : () -> ()
  "memref.global"() <{constant, initial_value = dense<1.000000e+00> : tensor<1xf16>, sym_name = "memref5", sym_visibility = "private", type = memref<1xf16, 42 : i32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "read_global_memref"}> ({
    %65 = "memref.get_global"() <{name = @memref0}> : () -> memref<2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "memref_copy"}> ({
    %61 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %62 = "memref.cast"(%61) : (memref<2xf32>) -> memref<*xf32>
    %63 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %64 = "memref.cast"(%61) : (memref<2xf32>) -> memref<*xf32>
    "memref.copy"(%62, %64) : (memref<*xf32>, memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "memref_dealloc"}> ({
    %59 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %60 = "memref.cast"(%59) : (memref<2xf32>) -> memref<*xf32>
    "memref.dealloc"(%60) : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "memref_alloca_scope"}> ({
    "memref.alloca_scope"() ({
      "memref.alloca_scope.return"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32>, memref<?xf32>, memref<64x16x4xf32, strided<[64, 4, 1]>>, memref<4x1x8xf32, strided<[32, 16, 1]>>, memref<4x?x8xf32, strided<[32, 8, 1]>>) -> (), sym_name = "memref_cast"}> ({
  ^bb0(%arg37: memref<4xf32>, %arg38: memref<?xf32>, %arg39: memref<64x16x4xf32, strided<[64, 4, 1]>>, %arg40: memref<4x1x8xf32, strided<[32, 16, 1]>>, %arg41: memref<4x?x8xf32, strided<[32, 8, 1]>>):
    %50 = "memref.cast"(%arg37) : (memref<4xf32>) -> memref<?xf32>
    %51 = "memref.cast"(%arg38) : (memref<?xf32>) -> memref<4xf32>
    %52 = "memref.cast"(%arg39) : (memref<64x16x4xf32, strided<[64, 4, 1]>>) -> memref<64x16x4xf32, strided<[?, ?, ?], offset: ?>>
    %53 = "memref.cast"(%52) : (memref<64x16x4xf32, strided<[?, ?, ?], offset: ?>>) -> memref<64x16x4xf32, strided<[64, 4, 1]>>
    %54 = "memref.cast"(%51) : (memref<4xf32>) -> memref<*xf32>
    %55 = "memref.cast"(%54) : (memref<*xf32>) -> memref<4xf32>
    %56 = "memref.cast"(%arg40) : (memref<4x1x8xf32, strided<[32, 16, 1]>>) -> memref<4x?x8xf32, strided<[32, 8, 1]>>
    %57 = "memref.cast"(%arg41) : (memref<4x?x8xf32, strided<[32, 8, 1]>>) -> memref<4x1x8xf32, strided<[32, 16, 1]>>
    %58 = "memref.cast"(%54) : (memref<*xf32>) -> memref<*xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32, 4>) -> (), sym_name = "unranked_memref_roundtrip", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xi32>, index) -> (), sym_name = "load_store_prefetch"}> ({
  ^bb0(%arg35: memref<4x4xi32>, %arg36: index):
    %48 = "memref.load"(%arg35, %arg36, %arg36) : (memref<4x4xi32>, index, index) -> i32
    %49 = "memref.load"(%arg35, %arg36, %arg36) : (memref<4x4xi32>, index, index) -> i32
    "memref.prefetch"(%arg35, %arg36, %arg36) <{isDataCache = true, isWrite = true, localityHint = 1 : i32}> : (memref<4x4xi32>, index, index) -> ()
    "memref.prefetch"(%arg35, %arg36, %arg36) <{isDataCache = false, isWrite = false, localityHint = 3 : i32}> : (memref<4x4xi32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>, memref<i32>) -> (), sym_name = "zero_dim_no_idx"}> ({
  ^bb0(%arg32: memref<i32>, %arg33: memref<i32>, %arg34: memref<i32>):
    %47 = "memref.load"(%arg32) : (memref<i32>) -> i32
    "memref.store"(%47, %arg33) : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "load_store_alignment"}> ({
  ^bb0(%arg31: memref<4xi32>):
    %45 = "arith.constant"() <{value = 0 : index}> : () -> index
    %46 = "memref.load"(%arg31, %45) <{alignment = 16 : i64}> : (memref<4xi32>, index) -> i32
    "memref.store"(%46, %arg31, %45) <{alignment = 16 : i64}> : (i32, memref<4xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "load_invariant"}> ({
  ^bb0(%arg30: memref<4xi32>):
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "memref.load"(%arg30, %43) <{invariant = true}> : (memref<4xi32>, index) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "memref_view"}> ({
  ^bb0(%arg27: index, %arg28: index, %arg29: index):
    %38 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8>
    %39 = "memref.view"(%38, %arg29, %arg27, %arg28) : (memref<2048xi8>, index, index, index) -> memref<?x?xf32>
    %40 = "memref.view"(%38, %arg29, %arg28) : (memref<2048xi8>, index, index) -> memref<4x?xf32>
    %41 = "arith.constant"() <{value = 0 : index}> : () -> index
    %42 = "memref.view"(%38, %41) : (memref<2048xi8>, index) -> memref<64x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xf16>) -> (), sym_name = "assume_alignment"}> ({
  ^bb0(%arg26: memref<4x4xf16>):
    %37 = "memref.assume_alignment"(%arg26) <{alignment = 16 : i32}> : (memref<4x4xf16>) -> memref<4x4xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf16>, memref<?xf32>, memref<?xf64>) -> (memref<?xf16>, memref<?xf32>, memref<?xf64>), sym_name = "distinct_objects"}> ({
  ^bb0(%arg23: memref<?xf16>, %arg24: memref<?xf32>, %arg25: memref<?xf64>):
    %36:3 = "memref.distinct_objects"(%arg23, %arg24, %arg25) : (memref<?xf16>, memref<?xf32>, memref<?xf64>) -> (memref<?xf16>, memref<?xf32>, memref<?xf64>)
    "func.return"(%36#0, %36#1, %36#2) : (memref<?xf16>, memref<?xf32>, memref<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4x5xf32>, tensor<3x4x5xf32>, tensor<3x?x5xf32>, memref<30x20xf32, strided<[4000, 2], offset: 100>>, memref<1x5xf32, strided<[5, 1], offset: ?>>, memref<f32>, memref<3x4x5xf32, strided<[240, 60, 10]>>, memref<1x2049xi64, strided<[?, ?], offset: ?>>, memref<1x1x1024xi8, strided<[40960, 4096, 1]>>, memref<24x1x1x1024xi8, strided<[40960, 40960, 4096, 1]>>) -> (), sym_name = "expand_collapse_shape_static"}> ({
  ^bb0(%arg13: memref<3x4x5xf32>, %arg14: tensor<3x4x5xf32>, %arg15: tensor<3x?x5xf32>, %arg16: memref<30x20xf32, strided<[4000, 2], offset: 100>>, %arg17: memref<1x5xf32, strided<[5, 1], offset: ?>>, %arg18: memref<f32>, %arg19: memref<3x4x5xf32, strided<[240, 60, 10]>>, %arg20: memref<1x2049xi64, strided<[?, ?], offset: ?>>, %arg21: memref<1x1x1024xi8, strided<[40960, 4096, 1]>>, %arg22: memref<24x1x1x1024xi8, strided<[40960, 40960, 4096, 1]>>):
    %14 = "memref.collapse_shape"(%arg13) <{reassociation = [[0, 1], [2]]}> : (memref<3x4x5xf32>) -> memref<12x5xf32>
    %15 = "memref.expand_shape"(%14) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 3, 4, 5>}> : (memref<12x5xf32>) -> memref<3x4x5xf32>
    %16 = "memref.collapse_shape"(%arg13) <{reassociation = [[0], [1, 2]]}> : (memref<3x4x5xf32>) -> memref<3x20xf32>
    %17 = "memref.expand_shape"(%16) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 3, 4, 5>}> : (memref<3x20xf32>) -> memref<3x4x5xf32>
    %18 = "memref.collapse_shape"(%arg13) <{reassociation = [[0, 1, 2]]}> : (memref<3x4x5xf32>) -> memref<60xf32>
    %19 = "memref.expand_shape"(%18) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 3, 4, 5>}> : (memref<60xf32>) -> memref<3x4x5xf32>
    %20 = "memref.expand_shape"(%arg18) <{reassociation = [], static_output_shape = array<i64: 1, 1>}> : (memref<f32>) -> memref<1x1xf32>
    %21 = "memref.expand_shape"(%arg16) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 30, 4, 5>}> : (memref<30x20xf32, strided<[4000, 2], offset: 100>>) -> memref<30x4x5xf32, strided<[4000, 10, 2], offset: 100>>
    %22 = "memref.expand_shape"(%arg16) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 2, 15, 20>}> : (memref<30x20xf32, strided<[4000, 2], offset: 100>>) -> memref<2x15x20xf32, strided<[60000, 4000, 2], offset: 100>>
    %23 = "memref.expand_shape"(%arg17) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 1, 1, 5>}> : (memref<1x5xf32, strided<[5, 1], offset: ?>>) -> memref<1x1x5xf32, strided<[5, 5, 1], offset: ?>>
    %24 = "memref.collapse_shape"(%arg19) <{reassociation = [[0, 1], [2]]}> : (memref<3x4x5xf32, strided<[240, 60, 10]>>) -> memref<12x5xf32, strided<[60, 10]>>
    %25 = "memref.collapse_shape"(%arg20) <{reassociation = [[0, 1]]}> : (memref<1x2049xi64, strided<[?, ?], offset: ?>>) -> memref<2049xi64, strided<[?], offset: ?>>
    %26 = "memref.collapse_shape"(%arg21) <{reassociation = [[0, 1, 2]]}> : (memref<1x1x1024xi8, strided<[40960, 4096, 1]>>) -> memref<1024xi8, strided<[1]>>
    %27 = "memref.collapse_shape"(%arg22) <{reassociation = [[0], [1, 2, 3]]}> : (memref<24x1x1x1024xi8, strided<[40960, 40960, 4096, 1]>>) -> memref<24x1024xi8, strided<[40960, 1]>>
    %28 = "memref.expand_shape"(%arg13) <{reassociation = [[0, 1], [2], [3, 4]], static_output_shape = array<i64: 1, 3, 4, 1, 5>}> : (memref<3x4x5xf32>) -> memref<1x3x4x1x5xf32>
    %29 = "memref.collapse_shape"(%28) <{reassociation = [[0, 1], [2], [3, 4]]}> : (memref<1x3x4x1x5xf32>) -> memref<3x4x5xf32>
    %30 = "tensor.expand_shape"(%arg14) <{reassociation = [[0, 1], [2], [3, 4]], static_output_shape = array<i64: 1, 3, 4, 1, 5>}> : (tensor<3x4x5xf32>) -> tensor<1x3x4x1x5xf32>
    %31 = "tensor.collapse_shape"(%30) <{reassociation = [[0, 1], [2], [3, 4]]}> : (tensor<1x3x4x1x5xf32>) -> tensor<3x4x5xf32>
    %32 = "arith.constant"() <{value = 1 : index}> : () -> index
    %33 = "tensor.dim"(%arg15, %32) : (tensor<3x?x5xf32>, index) -> index
    %34 = "tensor.expand_shape"(%arg15, %33) <{reassociation = [[0, 1], [2], [3, 4]], static_output_shape = array<i64: 1, 3, -9223372036854775808, 1, 5>}> : (tensor<3x?x5xf32>, index) -> tensor<1x3x?x1x5xf32>
    %35 = "tensor.collapse_shape"(%34) <{reassociation = [[0], [1, 2], [3, 4]]}> : (tensor<1x3x?x1x5xf32>) -> tensor<1x?x5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32, strided<[?, ?, 1]>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, memref<?x42xf32, strided<[42, 1]>>, index, index, index, memref<4x?x4xf32>, memref<1x1x18x?xf32, strided<[?, ?, ?, 1], offset: ?>>, memref<3x3x1x96xf32, strided<[288, 96, 96, 1], offset: 864>>) -> (), sym_name = "expand_collapse_shape_dynamic"}> ({
  ^bb0(%arg3: memref<?x?x?xf32>, %arg4: memref<?x?x?xf32, strided<[?, ?, 1]>>, %arg5: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg6: memref<?x42xf32, strided<[42, 1]>>, %arg7: index, %arg8: index, %arg9: index, %arg10: memref<4x?x4xf32>, %arg11: memref<1x1x18x?xf32, strided<[?, ?, ?, 1], offset: ?>>, %arg12: memref<3x3x1x96xf32, strided<[288, 96, 96, 1], offset: 864>>):
    %3 = "memref.collapse_shape"(%arg3) <{reassociation = [[0, 1], [2]]}> : (memref<?x?x?xf32>) -> memref<?x?xf32>
    %4 = "memref.expand_shape"(%3, %arg7, %arg8) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808>}> : (memref<?x?xf32>, index, index) -> memref<?x4x?xf32>
    %5 = "memref.collapse_shape"(%arg4) <{reassociation = [[0, 1], [2]]}> : (memref<?x?x?xf32, strided<[?, ?, 1]>>) -> memref<?x?xf32, strided<[?, 1]>>
    %6 = "memref.expand_shape"(%5, %arg7, %arg8) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1]>>, index, index) -> memref<?x4x?xf32, strided<[?, ?, 1]>>
    %7 = "memref.collapse_shape"(%arg5) <{reassociation = [[0, 1], [2]]}> : (memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> memref<?x?xf32, strided<[?, 1], offset: ?>>
    %8 = "memref.expand_shape"(%7, %arg7, %arg8) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index) -> memref<?x4x?xf32, strided<[?, ?, 1], offset: ?>>
    %9 = "memref.collapse_shape"(%arg6) <{reassociation = [[0, 1]]}> : (memref<?x42xf32, strided<[42, 1]>>) -> memref<?xf32, strided<[1]>>
    %10 = "memref.expand_shape"(%9, %arg9) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 42>}> : (memref<?xf32, strided<[1]>>, index) -> memref<?x42xf32>
    %11 = "memref.expand_shape"(%arg10, %arg7) <{reassociation = [[0, 1], [2], [3, 4]], static_output_shape = array<i64: 2, 2, -9223372036854775808, 2, 2>}> : (memref<4x?x4xf32>, index) -> memref<2x2x?x2x2xf32>
    %12 = "memref.collapse_shape"(%arg11) <{reassociation = [[0, 1], [2], [3]]}> : (memref<1x1x18x?xf32, strided<[?, ?, ?, 1], offset: ?>>) -> memref<1x18x?xf32, strided<[?, ?, 1], offset: ?>>
    %13 = "memref.collapse_shape"(%arg12) <{reassociation = [[0], [1, 2, 3]]}> : (memref<3x3x1x96xf32, strided<[288, 96, 96, 1], offset: 864>>) -> memref<3x288xf32, strided<[288, 1], offset: 864>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1xf32>, memref<f32>) -> (memref<f32>, memref<1x1xf32>), sym_name = "expand_collapse_shape_zero_dim"}> ({
  ^bb0(%arg1: memref<1x1xf32>, %arg2: memref<f32>):
    %1 = "memref.collapse_shape"(%arg1) <{reassociation = []}> : (memref<1x1xf32>) -> memref<f32>
    %2 = "memref.expand_shape"(%1) <{reassociation = [], static_output_shape = array<i64: 1, 1>}> : (memref<f32>) -> memref<1x1xf32>
    "func.return"(%1, %2) : (memref<f32>, memref<1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x4x?xf32>) -> memref<?x?x?xf32>, sym_name = "collapse_shape_to_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?x4x?xf32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0], [1], [2, 3, 4]]}> : (memref<?x?x?x4x?xf32>) -> memref<?x?x?xf32>
    "func.return"(%0) : (memref<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[1, 10]>>, memref<4x5x6xf32, strided<[1, ?, 1000]>>, index, index) -> (), sym_name = "expand_collapse_shape_transposed_layout"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[1, 10]>>, %arg1: memref<4x5x6xf32, strided<[1, ?, 1000]>>, %arg2: index, %arg3: index):
    %0 = "memref.expand_shape"(%arg0, %arg2, %arg3) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 5>}> : (memref<?x?xf32, strided<[1, 10]>>, index, index) -> memref<?x?x5xf32, strided<[1, 50, 10]>>
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0], [1, 2]]}> : (memref<?x?x5xf32, strided<[1, 50, 10]>>) -> memref<?x?xf32, strided<[1, 10]>>
    %2 = "memref.expand_shape"(%arg1) <{reassociation = [[0, 1], [2], [3, 4]], static_output_shape = array<i64: 2, 2, 5, 2, 3>}> : (memref<4x5x6xf32, strided<[1, ?, 1000]>>) -> memref<2x2x5x2x3xf32, strided<[2, 1, ?, 3000, 1000]>>
    %3 = "memref.collapse_shape"(%2) <{reassociation = [[0, 1], [2], [3, 4]]}> : (memref<2x2x5x2x3xf32, strided<[2, 1, ?, 3000, 1000]>>) -> memref<4x5x6xf32, strided<[1, ?, 1000]>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x?xf32>) -> (), sym_name = "rank"}> ({
  ^bb0(%arg0: memref<4x4x?xf32>):
    %0 = "memref.rank"(%arg0) : (memref<4x4x?xf32>) -> index
    %1 = "memref.rank"(%arg0) : (memref<4x4x?xf32>) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, f32, index) -> (), sym_name = "atomic_rmw"}> ({
  ^bb0(%arg4: memref<10xf32>, %arg5: f32, %arg6: index):
    %3 = "memref.atomic_rmw"(%arg5, %arg4, %arg6) <{kind = 0 : i64}> : (f32, memref<10xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x2xf32>, index, index) -> (), sym_name = "generic_atomic_rmw"}> ({
  ^bb0(%arg0: memref<1x2xf32>, %arg1: index, %arg2: index):
    %0 = "memref.generic_atomic_rmw"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: f32):
      %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %2 = "arith.addf"(%1, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.atomic_yield"(%2) : (f32) -> ()
    }) {index_attr = 8 : index} : (memref<1x2xf32>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x?xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>>, sym_name = "extract_strided_metadata"}> ({
  ^bb0(%arg0: memref<10x?xf32>):
    %0:6 = "memref.extract_strided_metadata"(%arg0) : (memref<10x?xf32>) -> (memref<f32>, index, index, index, index, index)
    %1 = "memref.reinterpret_cast"(%0#0, %0#1, %0#2, %0#3, %0#4, %0#5) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<f32>, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    "func.return"(%1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d1 * s0 + d0)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> memref<4xf32>, sym_name = "memref_realloc_ss"}> ({
  ^bb0(%arg8: memref<2xf32>):
    %6 = "memref.realloc"(%arg8) : (memref<2xf32>) -> memref<4xf32>
    "func.return"(%6) : (memref<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2xf32>, index) -> memref<?xf32>, sym_name = "memref_realloc_sd"}> ({
  ^bb0(%arg6: memref<2xf32>, %arg7: index):
    %5 = "memref.realloc"(%arg6, %arg7) : (memref<2xf32>, index) -> memref<?xf32>
    "func.return"(%5) : (memref<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<4xf32>, sym_name = "memref_realloc_ds"}> ({
  ^bb0(%arg5: memref<?xf32>):
    %4 = "memref.realloc"(%arg5) : (memref<?xf32>) -> memref<4xf32>
    "func.return"(%4) : (memref<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> memref<?xf32>, sym_name = "memref_realloc_dd"}> ({
  ^bb0(%arg3: memref<?xf32>, %arg4: index):
    %3 = "memref.realloc"(%arg3, %arg4) : (memref<?xf32>, index) -> memref<?xf32>
    "func.return"(%3) : (memref<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> index, sym_name = "memref_extract_aligned_pointer"}> ({
  ^bb0(%arg2: memref<?xf32>):
    %2 = "memref.extract_aligned_pointer_as_index"(%arg2) : (memref<?xf32>) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32, 1>, sym_name = "memref_memory_space_cast"}> ({
  ^bb0(%arg1: memref<?xf32>):
    %1 = "memref.memory_space_cast"(%arg1) : (memref<?xf32>) -> memref<?xf32, 1>
    "func.return"(%1) : (memref<?xf32, 1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>) -> memref<?x?xf32, #map>, sym_name = "memref_transpose_map"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "memref.transpose"(%arg0) <{permutation = #map1}> : (memref<?x?xf32>) -> memref<?x?xf32, #map>
    "func.return"(%0) : (memref<?x?xf32, #map>) -> ()
  }) : () -> ()
}) : () -> ()

