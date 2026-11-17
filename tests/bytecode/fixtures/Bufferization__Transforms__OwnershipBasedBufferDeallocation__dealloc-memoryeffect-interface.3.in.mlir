"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloca_ownership_indicator_is_false"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":4:10)
    "cf.br"(%0)[^bb1] : (memref<2xf32>) -> () loc("<stdin>":5:5)
  ^bb1(%1: memref<2xf32> loc("<stdin>":6:8)):  // pred: ^bb0
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
