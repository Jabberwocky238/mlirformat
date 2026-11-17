"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "f"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  ^bb1:  // no predecessors
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.intr.stacksave"() : () -> !llvm.ptr loc("<stdin>":6:12)
      "llvm.br"()[^bb1] : () -> () loc("<stdin>":7:7)
    ^bb1:  // pred: ^bb0
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
