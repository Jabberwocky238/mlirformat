"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<f32>, sym_name = "zero_d_alloc"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32> loc("<stdin>":3:10)
    "func.return"(%0) : (memref<f32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
