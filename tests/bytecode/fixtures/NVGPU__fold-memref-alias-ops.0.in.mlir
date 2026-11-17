"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x128x768xf16>, index, index, index) -> (), sym_name = "fold_nvgpu_device_async_copy_zero_sub_idx"}> ({
  ^bb0(%arg0: memref<2x128x768xf16> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:38), %arg2: index loc("<stdin>":3:52), %arg3: index loc("<stdin>":3:66)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x1x64x64xf16, #gpu.address_space<workgroup>> loc("<stdin>":5:10)
    %2 = "memref.subview"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, 8>, static_strides = array<i64: 1, 1, 1>}> : (memref<2x128x768xf16>, index, index, index) -> memref<1x8xf16, strided<[98304, 1], offset: ?>> loc("<stdin>":6:10)
    %3 = "nvgpu.device_async_copy"(%1, %0, %0, %0, %0, %2, %0, %0) <{bypassL1, dstElements = 8 : index, operandSegmentSizes = array<i32: 1, 4, 1, 2, 0>}> : (memref<5x1x64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index, memref<1x8xf16, strided<[98304, 1], offset: ?>>, index, index) -> !nvgpu.device.async.token loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
