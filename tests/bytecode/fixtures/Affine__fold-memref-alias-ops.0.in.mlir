"builtin.module"() ({
  "func.func"() <{function_type = (memref<12x32xf32>, index, index, index, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store"}> ({
  ^bb0(%arg0: memref<12x32xf32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:34), %arg2: index loc("<stdin>":4:48), %arg3: index loc("<stdin>":4:62), %arg4: index loc("<stdin>":4:76)):
    %0 = "memref.subview"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 3>}> : (memref<12x32xf32>, index, index) -> memref<4x4xf32, strided<[64, 3], offset: ?>> loc("<stdin>":5:10)
    %1 = "affine.load"(%0, %arg3, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<4x4xf32, strided<[64, 3], offset: ?>>, index, index) -> f32 loc("<stdin>":6:10)
    "affine.store"(%1, %0, %arg3, %arg4) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<4x4xf32, strided<[64, 3], offset: ?>>, index, index) -> () loc("<stdin>":7:5)
    "func.return"(%1) : (f32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
