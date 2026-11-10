"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16, 3>, index, index) -> (), sym_name = "ldmatrix"}> ({
  ^bb0(%arg19: memref<?x?xf16, 3>, %arg20: index, %arg21: index):
    %8 = "nvgpu.ldmatrix"(%arg19, %arg20, %arg21) <{numTiles = 4 : i32, transpose = false}> : (memref<?x?xf16, 3>, index, index) -> vector<4x2xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>, sym_name = "mma_sync"}> ({
  ^bb0(%arg16: vector<4x2xf16>, %arg17: vector<2x2xf16>, %arg18: vector<2x2xf16>):
    %7 = "nvgpu.mma.sync"(%arg16, %arg17, %arg18) <{mmaShape = [16, 8, 16]}> : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    "func.return"(%7) : (vector<2x2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>, sym_name = "mma_sp_sync_f16_16832"}> ({
  ^bb0(%arg12: vector<4x2xf16>, %arg13: vector<4x2xf16>, %arg14: vector<2x2xf16>, %arg15: vector<2xi16>):
    %6 = "nvgpu.mma.sp.sync"(%arg12, %arg13, %arg14, %arg15) <{mmaShape = [16, 8, 32], sparsitySelector = 0 : i32}> : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>
    "func.return"(%6) : (vector<2x2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>, sym_name = "mma_sp_sync_f16_16816"}> ({
  ^bb0(%arg8: vector<2x2xf16>, %arg9: vector<2x2xf16>, %arg10: vector<2x2xf16>, %arg11: vector<2xi16>):
    %5 = "nvgpu.mma.sp.sync"(%arg8, %arg9, %arg10, %arg11) <{mmaShape = [16, 8, 16], sparsitySelector = 0 : i32}> : (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>
    "func.return"(%5) : (vector<2x2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>, vector<2xi16>) -> vector<2x2xi32>, sym_name = "mma_sp_sync_i8_16864"}> ({
  ^bb0(%arg4: vector<4x4xi8>, %arg5: vector<4x4xi8>, %arg6: vector<2x2xi32>, %arg7: vector<2xi16>):
    %4 = "nvgpu.mma.sp.sync"(%arg4, %arg5, %arg6, %arg7) <{mmaShape = [16, 8, 64], sparsitySelector = 0 : i32}> : (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>, vector<2xi16>) -> vector<2x2xi32>
    "func.return"(%4) : (vector<2x2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x7x5xf32, 3>, memref<4x5xf32>) -> (), sym_name = "async_cp"}> ({
  ^bb0(%arg2: memref<2x7x5xf32, 3>, %arg3: memref<4x5xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "nvgpu.device_async_copy"(%arg2, %1, %1, %1, %arg3, %1, %1) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 3, 1, 2, 0>}> : (memref<2x7x5xf32, 3>, index, index, index, memref<4x5xf32>, index, index) -> !nvgpu.device.async.token
    %3 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "warpgroup_mma_init_accumulator"}> ({
    %0 = "nvgpu.warpgroup.mma.init.accumulator"() : () -> !nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>, memref<64x128xf32, 3>) -> (), sym_name = "warpgroup_mma_store"}> ({
  ^bb0(%arg0: !nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>, %arg1: memref<64x128xf32, 3>):
    "nvgpu.warpgroup.mma.store"(%arg0, %arg1) : (!nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>, memref<64x128xf32, 3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

