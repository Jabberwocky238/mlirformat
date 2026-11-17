"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloca"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":3:10)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
