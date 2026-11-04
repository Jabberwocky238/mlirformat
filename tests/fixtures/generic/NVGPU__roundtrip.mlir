"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16, 3>, index, index) -> (), sym_name = "ldmatrix"}> ({
  ^bb0(%arg17: memref<?x?xf16, 3>, %arg18: index, %arg19: index):
    %7 = "nvgpu.ldmatrix"(%arg17, %arg18, %arg19) <{numTiles = 4 : i32, transpose = false}> : (memref<?x?xf16, 3>, index, index) -> vector<4x2xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>, sym_name = "mma_sync"}> ({
  ^bb0(%arg14: vector<4x2xf16>, %arg15: vector<2x2xf16>, %arg16: vector<2x2xf16>):
    %6 = "nvgpu.mma.sync"(%arg14, %arg15, %arg16) <{mmaShape = [16, 8, 16]}> : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    "func.return"(%6) : (vector<2x2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>, sym_name = "mma_sp_sync_f16_16832"}> ({
  ^bb0(%arg10: vector<4x2xf16>, %arg11: vector<4x2xf16>, %arg12: vector<2x2xf16>, %arg13: vector<2xi16>):
    %5 = "nvgpu.mma.sp.sync"(%arg10, %arg11, %arg12, %arg13) <{mmaShape = [16, 8, 32], sparsitySelector = 0 : i32}> : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>
    "func.return"(%5) : (vector<2x2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>, sym_name = "mma_sp_sync_f16_16816"}> ({
  ^bb0(%arg6: vector<2x2xf16>, %arg7: vector<2x2xf16>, %arg8: vector<2x2xf16>, %arg9: vector<2xi16>):
    %4 = "nvgpu.mma.sp.sync"(%arg6, %arg7, %arg8, %arg9) <{mmaShape = [16, 8, 16], sparsitySelector = 0 : i32}> : (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>
    "func.return"(%4) : (vector<2x2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>, vector<2xi16>) -> vector<2x2xi32>, sym_name = "mma_sp_sync_i8_16864"}> ({
  ^bb0(%arg2: vector<4x4xi8>, %arg3: vector<4x4xi8>, %arg4: vector<2x2xi32>, %arg5: vector<2xi16>):
    %3 = "nvgpu.mma.sp.sync"(%arg2, %arg3, %arg4, %arg5) <{mmaShape = [16, 8, 64], sparsitySelector = 0 : i32}> : (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>, vector<2xi16>) -> vector<2x2xi32>
    "func.return"(%3) : (vector<2x2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x7x5xf32, 3>, memref<4x5xf32>) -> (), sym_name = "async_cp"}> ({
  ^bb0(%arg0: memref<2x7x5xf32, 3>, %arg1: memref<4x5xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "nvgpu.device_async_copy"(%arg0, %0, %0, %0, %arg1, %0, %0) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 3, 1, 2, 0>}> : (memref<2x7x5xf32, 3>, index, index, index, memref<4x5xf32>, index, index) -> !nvgpu.device.async.token
    %2 = "nvgpu.device_async_create_group"(%1) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token
    "nvgpu.device_async_wait"(%2) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

