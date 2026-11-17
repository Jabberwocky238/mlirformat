"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "func.func"() <{function_type = () -> !gpu.mma_matrix<16x16xf16, "AOp">, sym_name = "gpu_wmma_load_op"}> ({
      %0 = "memref.alloca"() <{alignment = 32 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x32xf16, 3> loc("<stdin>":4:12)
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":5:12)
      %2 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":6:12)
      %3 = "gpu.subgroup_mma_load_matrix"(%0, %1, %2) <{leadDimension = 32 : index, transpose}> : (memref<32x32xf16, 3>, index, index) -> !gpu.mma_matrix<16x16xf16, "AOp"> loc("<stdin>":7:12)
      "func.return"(%3) : (!gpu.mma_matrix<16x16xf16, "AOp">) -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
