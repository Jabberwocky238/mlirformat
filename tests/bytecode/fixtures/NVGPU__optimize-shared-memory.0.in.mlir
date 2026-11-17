"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x128xf16>, index, index, index, index, index, index) -> (vector<4x2xf16>, vector<4x2xf16>), sym_name = "optimize_128x32xf16_32x128xf16"}> ({
  ^bb0(%arg0: memref<128x128xf16> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36), %arg2: index loc("<stdin>":3:50), %arg3: index loc("<stdin>":3:64), %arg4: index loc("<stdin>":3:78), %arg5: index loc("<stdin>":3:92), %arg6: index loc("<stdin>":3:106)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x32xf16, 3> loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x128xf16, 3> loc("<stdin>":5:10)
    %2 = "nvgpu.device_async_copy"(%0, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<128x32xf16, 3>, index, index, memref<128x128xf16>, index, index) -> !nvgpu.device.async.token loc("<stdin>":6:10)
    %3 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token loc("<stdin>":7:10)
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> () loc("<stdin>":8:5)
    %4 = "nvgpu.ldmatrix"(%0, %arg5, %arg6) <{numTiles = 4 : i32, transpose = false}> : (memref<128x32xf16, 3>, index, index) -> vector<4x2xf16> loc("<stdin>":9:10)
    %5 = "nvgpu.device_async_copy"(%1, %arg3, %arg4, %arg0, %arg1, %arg2) <{dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>}> : (memref<32x128xf16, 3>, index, index, memref<128x128xf16>, index, index) -> !nvgpu.device.async.token loc("<stdin>":10:10)
    %6 = "nvgpu.device_async_create_group"(%2) : (!nvgpu.device.async.token) -> !nvgpu.device.async.token loc("<stdin>":11:10)
    "nvgpu.device_async_wait"(%3) <{numGroups = 1 : i32}> : (!nvgpu.device.async.token) -> () loc("<stdin>":12:5)
    %7 = "nvgpu.ldmatrix"(%1, %arg5, %arg6) <{numTiles = 4 : i32, transpose = false}> : (memref<32x128xf16, 3>, index, index) -> vector<4x2xf16> loc("<stdin>":13:10)
    "func.return"(%4, %7) : (vector<4x2xf16>, vector<4x2xf16>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
