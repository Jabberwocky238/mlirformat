"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x128x768xf16>, index, index, index) -> (), sym_name = "fold_nvgpu_device_async_copy_zero_sub_idx"}> ({
  ^bb0(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %2 = "memref.subview"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 8>, static_strides = array<i64: 1, 1, 1>}> : (memref<2x128x768xf16>, index, index, index) -> memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %3 = "nvgpu.device_async_copy"(%1, %0, %0, %0, %0, %2, %0, %0) <{bypassL1, dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 4, 1, 2, 0>}> : (memref<5x1x64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index, memref<1x8xf16, strided<[98304, 1], offset: ?>>, index, index) -> !nvgpu.device.async.token
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x128x768xf16>, index, index, index, index, index) -> (), sym_name = "fold_src_nvgpu_device_async_copy"}> ({
  ^bb0(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %2 = "memref.subview"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 8>, static_strides = array<i64: 1, 1, 1>}> : (memref<2x128x768xf16>, index, index, index) -> memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %3 = "nvgpu.device_async_copy"(%1, %0, %0, %0, %0, %2, %arg4, %arg5) <{bypassL1, dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 4, 1, 2, 0>}> : (memref<5x1x64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index, memref<1x8xf16, strided<[98304, 1], offset: ?>>, index, index) -> !nvgpu.device.async.token
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x128x768xf16>, index, index, index, index, index, index, index, index, index, index, index) -> (), sym_name = "fold_src_fold_dest_nvgpu_device_async_copy"}> ({
  ^bb0(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %2 = "memref.subview"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 8>, static_strides = array<i64: 1, 1, 1>}> : (memref<2x128x768xf16>, index, index, index) -> memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %3 = "memref.subview"(%1, %arg6, %arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 4, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 1, 8>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<5x1x64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> memref<1x8xf16, strided<[4096, 1], offset: ?>, #gpu.address_space<workgroup>>
    %4 = "nvgpu.device_async_copy"(%3, %arg10, %arg11, %2, %arg4, %arg5) <{bypassL1, dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<1x8xf16, strided<[4096, 1], offset: ?>, #gpu.address_space<workgroup>>, index, index, memref<1x8xf16, strided<[98304, 1], offset: ?>>, index, index) -> !nvgpu.device.async.token
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (-s0 + 4)>
#map1 = affine_map<()[s0] -> (-s0 + 32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x32x32xf16, 3>, index, index, index) -> vector<4x2xf16>, sym_name = "test_ldmatrix"}> ({
  ^bb0(%arg0: memref<4x32x32xf16, 3>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    %2 = "affine.apply"(%arg2) <{map = #map1}> : (index) -> index
    %3 = "affine.apply"(%arg3) <{map = #map1}> : (index) -> index
    %4 = "memref.subview"(%arg0, %arg1, %arg2, %arg3, %1, %2, %3) <{operandSegmentSizes = array<i32: 1, 3, 3, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (memref<4x32x32xf16, 3>, index, index, index, index, index, index) -> memref<?x?x?xf16, strided<[1024, 32, 1], offset: ?>, 3>
    %5 = "nvgpu.ldmatrix"(%4, %0, %0, %0) <{numTiles = 4 : i32, transpose = false}> : (memref<?x?x?xf16, strided<[1024, 32, 1], offset: ?>, 3>, index, index, index) -> vector<4x2xf16>
    "func.return"(%5) : (vector<4x2xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4096xf16, 3>, index, index, index) -> vector<4x2xf16>, sym_name = "ldmatrix_expand"}> ({
  ^bb0(%arg0: memref<4096xf16, 3>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 4, 32, 32>}> : (memref<4096xf16, 3>) -> memref<4x32x32xf16, 3>
    %1 = "nvgpu.ldmatrix"(%0, %arg1, %arg2, %arg3) <{numTiles = 4 : i32, transpose = false}> : (memref<4x32x32xf16, 3>, index, index, index) -> vector<4x2xf16>
    "func.return"(%1) : (vector<4x2xf16>) -> ()
  }) : () -> ()
}) : () -> ()

