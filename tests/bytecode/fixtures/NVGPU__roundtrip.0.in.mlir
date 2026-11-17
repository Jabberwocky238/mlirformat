"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16, 3>, index, index) -> (), sym_name = "ldmatrix"}> ({
  ^bb0(%arg19: memref<?x?xf16, 3> loc("<stdin>":3:8), %arg20: index loc("<stdin>":3:36), %arg21: index loc("<stdin>":3:51)):
    %8 = "nvgpu.ldmatrix"(%arg19, %arg20, %arg21) <{numTiles = 4 : i32, transpose = false}> : (memref<?x?xf16, 3>, index, index) -> vector<4x2xf16> loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>, sym_name = "mma_sync"}> ({
  ^bb0(%arg16: vector<4x2xf16> loc("<stdin>":8:8), %arg17: vector<2x2xf16> loc("<stdin>":8:33), %arg18: vector<2x2xf16> loc("<stdin>":8:58)):
    %7 = "nvgpu.mma.sync"(%arg16, %arg17, %arg18) <{mmaShape = [16, 8, 16]}> : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16> loc("<stdin>":9:10)
    "func.return"(%7) : (vector<2x2xf16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>, sym_name = "mma_sp_sync_f16_16832"}> ({
  ^bb0(%arg12: vector<4x2xf16> loc("<stdin>":13:8), %arg13: vector<4x2xf16> loc("<stdin>":13:33), %arg14: vector<2x2xf16> loc("<stdin>":13:58), %arg15: vector<2xi16> loc("<stdin>":13:83)):
    %6 = "nvgpu.mma.sp.sync"(%arg12, %arg13, %arg14, %arg15) <{mmaShape = [16, 8, 32], sparsitySelector = 0 : i32}> : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16> loc("<stdin>":14:10)
    "func.return"(%6) : (vector<2x2xf16>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>, sym_name = "mma_sp_sync_f16_16816"}> ({
  ^bb0(%arg8: vector<2x2xf16> loc("<stdin>":18:8), %arg9: vector<2x2xf16> loc("<stdin>":18:32), %arg10: vector<2x2xf16> loc("<stdin>":18:56), %arg11: vector<2xi16> loc("<stdin>":18:81)):
    %5 = "nvgpu.mma.sp.sync"(%arg8, %arg9, %arg10, %arg11) <{mmaShape = [16, 8, 16], sparsitySelector = 0 : i32}> : (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16> loc("<stdin>":19:10)
    "func.return"(%5) : (vector<2x2xf16>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>, vector<2xi16>) -> vector<2x2xi32>, sym_name = "mma_sp_sync_i8_16864"}> ({
  ^bb0(%arg4: vector<4x4xi8> loc("<stdin>":23:8), %arg5: vector<4x4xi8> loc("<stdin>":23:31), %arg6: vector<2x2xi32> loc("<stdin>":23:54), %arg7: vector<2xi16> loc("<stdin>":23:78)):
    %4 = "nvgpu.mma.sp.sync"(%arg4, %arg5, %arg6, %arg7) <{mmaShape = [16, 8, 64], sparsitySelector = 0 : i32}> : (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>, vector<2xi16>) -> vector<2x2xi32> loc("<stdin>":24:10)
    "func.return"(%4) : (vector<2x2xi32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (memref<2x7x5xf32, 3>, memref<4x5xf32>) -> (), sym_name = "async_cp"}> ({
  ^bb0(%arg2: memref<2x7x5xf32, 3> loc("<stdin>":28:8), %arg3: memref<4x5xf32> loc("<stdin>":28:37)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:10)
    %2 = "nvgpu.device_async_copy"(%arg2, %1, %1, %1, %arg3, %1, %1) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 3, 1, 2, 0>}> : (memref<2x7x5xf32, 3>, index, index, index, memref<4x5xf32>, index, index) -> !nvgpu.device.async.token loc("<stdin>":30:10)
    %3 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token loc("<stdin>":31:10)
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = () -> (), sym_name = "warpgroup_mma_init_accumulator"}> ({
    %0 = "nvgpu.warpgroup.mma.init.accumulator"() : () -> !nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>> loc("<stdin>":36:10)
    "func.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (!nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>, memref<64x128xf32, 3>) -> (), sym_name = "warpgroup_mma_store"}> ({
  ^bb0(%arg0: !nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>> loc("<stdin>":40:8), %arg1: memref<64x128xf32, 3> loc("<stdin>":40:78)):
    "nvgpu.warpgroup.mma.store"(%arg0, %arg1) : (!nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>, memref<64x128xf32, 3>) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":39:3)
}) : () -> () loc("<stdin>":1:1)
