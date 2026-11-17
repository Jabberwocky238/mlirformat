"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xvector<4xf32>>, index, index) -> !gpu.mma_matrix<16x16xf16, "COp">, sym_name = "fold_gpu_subgroup_mma_load_matrix_1d"}> ({
  ^bb0(%arg0: memref<?xvector<4xf32>> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:40), %arg2: index loc("<stdin>":3:54)):
    %0 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 81920>, static_strides = array<i64: 1>}> : (memref<?xvector<4xf32>>, index) -> memref<81920xvector<4xf32>, strided<[1], offset: ?>> loc("<stdin>":4:10)
    %1 = "gpu.subgroup_mma_load_matrix"(%0, %arg2) <{leadDimension = 160 : index}> : (memref<81920xvector<4xf32>, strided<[1], offset: ?>>, index) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":5:10)
    "func.return"(%1) : (!gpu.mma_matrix<16x16xf16, "COp">) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
