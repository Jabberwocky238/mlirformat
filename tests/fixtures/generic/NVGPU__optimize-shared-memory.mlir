"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x128xf16>, index, index, index, index, index, index) -> (vector<4x2xf16>, vector<4x2xf16>), sym_name = "optimize_128x32xf16_32x128xf16"}> ({
  ^bb0(%arg0: memref<128x128xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x32xf16, 3>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x128xf16, 3>
    %2 = "nvgpu.device_async_copy"(%0, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<128x32xf16, 3>, index, index, memref<128x128xf16>, index, index) -> !nvgpu.device.async.token
    %3 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %4 = "nvgpu.ldmatrix"(%0, %arg5, %arg6) <{numTiles = 4 : i32, transpose = false}> : (memref<128x32xf16, 3>, index, index) -> vector<4x2xf16>
    %5 = "nvgpu.device_async_copy"(%1, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<32x128xf16, 3>, index, index, memref<128x128xf16>, index, index) -> !nvgpu.device.async.token
    %6 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %7 = "nvgpu.ldmatrix"(%1, %arg5, %arg6) <{numTiles = 4 : i32, transpose = false}> : (memref<32x128xf16, 3>, index, index) -> vector<4x2xf16>
    "func.return"(%4, %7) : (vector<4x2xf16>, vector<4x2xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x128xf32>, index, index, index, index, index, index) -> (vector<4x1xf32>, vector<4x1xf32>, f32, vector<4xf32>, f32), sym_name = "optimize_64x16xf32_16x64xf32"}> ({
  ^bb0(%arg0: memref<128x128xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x16xf32, 3>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x64xf32, 3>
    %2 = "nvgpu.device_async_copy"(%0, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<64x16xf32, 3>, index, index, memref<128x128xf32>, index, index) -> !nvgpu.device.async.token
    %3 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %4 = "nvgpu.ldmatrix"(%0, %arg5, %arg6) <{numTiles = 4 : i32, transpose = false}> : (memref<64x16xf32, 3>, index, index) -> vector<4x1xf32>
    %5 = "memref.load"(%0, %arg5, %arg6) : (memref<64x16xf32, 3>, index, index) -> f32
    %6 = "vector.load"(%0, %arg5, %arg6) : (memref<64x16xf32, 3>, index, index) -> vector<4xf32>
    "vector.store"(%6, %0, %arg5, %arg6) : (vector<4xf32>, memref<64x16xf32, 3>, index, index) -> ()
    "memref.store"(%5, %0, %arg5, %arg6) : (f32, memref<64x16xf32, 3>, index, index) -> ()
    %7 = "nvgpu.device_async_copy"(%1, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<16x64xf32, 3>, index, index, memref<128x128xf32>, index, index) -> !nvgpu.device.async.token
    %8 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %9 = "nvgpu.ldmatrix"(%1, %arg5, %arg6) <{numTiles = 4 : i32, transpose = false}> : (memref<16x64xf32, 3>, index, index) -> vector<4x1xf32>
    %10 = "memref.load"(%1, %arg5, %arg6) : (memref<16x64xf32, 3>, index, index) -> f32
    "func.return"(%4, %9, %5, %6, %10) : (vector<4x1xf32>, vector<4x1xf32>, f32, vector<4xf32>, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32x32xf64>, index, index, index, index, index, index) -> f64, sym_name = "small_column_size_f64"}> ({
  ^bb0(%arg7: memref<32x32xf64>, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x4xf64, 3>
    %5 = "nvgpu.device_async_copy"(%4, %arg10, %arg11, %arg7, %arg8, %arg9) <{dstElements = 2 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<32x4xf64, 3>, index, index, memref<32x32xf64>, index, index) -> !nvgpu.device.async.token
    %6 = "nvgpu.device_async_create_group"(%5) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%6) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %7 = "memref.load"(%4, %arg12, %arg13) : (memref<32x4xf64, 3>, index, index) -> f64
    "func.return"(%7) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128x128xf16>, index, index, index, index, index, index) -> vector<1x2xf16>, sym_name = "too_small_column_size_f16"}> ({
  ^bb0(%arg0: memref<128x128xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x8xf16, 3>
    %1 = "nvgpu.device_async_copy"(%0, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<128x8xf16, 3>, index, index, memref<128x128xf16>, index, index) -> !nvgpu.device.async.token
    %2 = "nvgpu.device_async_create_group"(%1) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%2) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %3 = "nvgpu.ldmatrix"(%0, %arg5, %arg6) <{numTiles = 1 : i32, transpose = false}> : (memref<128x8xf16, 3>, index, index) -> vector<1x2xf16>
    "func.return"(%3) : (vector<1x2xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x128xf16>, index, index, index, index, index, index) -> vector<1x2xf16>, sym_name = "abort_if_subview"}> ({
  ^bb0(%arg0: memref<128x128xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x32xf16, 3>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 64, 32>, static_strides = array<i64: 1, 1>}> : (memref<128x32xf16, 3>) -> memref<64x32xf16, 3>
    %2 = "nvgpu.device_async_copy"(%0, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<128x32xf16, 3>, index, index, memref<128x128xf16>, index, index) -> !nvgpu.device.async.token
    %3 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    %4 = "nvgpu.ldmatrix"(%1, %arg5, %arg6) <{numTiles = 1 : i32, transpose = false}> : (memref<64x32xf16, 3>, index, index) -> vector<1x2xf16>
    "func.return"(%4) : (vector<1x2xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<i32, #gpu.address_space<workgroup>>, sym_name = "test_0_d"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32, #gpu.address_space<workgroup>>
    "func.return"(%0) : (memref<i32, #gpu.address_space<workgroup>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "test_dynamic_and_zero_dim"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<0xf32, 3>
    %1 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32, 3>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_vector_element_type"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x1xvector<16xf16>, 3>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_int_conversion"}> ({
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32, 1 : ui64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

