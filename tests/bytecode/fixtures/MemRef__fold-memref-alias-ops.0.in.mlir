"builtin.module"() ({
  "func.func"() <{function_type = (memref<12x32xf32>, index, index, index, index) -> f32, sym_name = "fold_static_stride_subview_with_load"}> ({
  ^bb0(%arg0: memref<12x32xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:34), %arg2: index loc("<stdin>":3:48), %arg3: index loc("<stdin>":3:62), %arg4: index loc("<stdin>":3:76)):
    %0 = "memref.subview"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 3>}> : (memref<12x32xf32>, index, index) -> memref<4x4xf32, strided<[64, 3], offset: ?>> loc("<stdin>":4:10)
    %1 = "memref.load"(%0, %arg3, %arg4) : (memref<4x4xf32, strided<[64, 3], offset: ?>>, index, index) -> f32 loc("<stdin>":5:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
