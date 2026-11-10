"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xf32>, memref<2xf32>) -> (), sym_name = "simple1"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"(%arg1)[^bb3] : (memref<2xf32>) -> ()
  ^bb2:  // pred: ^bb0
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "cf.br"(%0)[^bb3] : (memref<2xf32>) -> ()
  ^bb3(%1: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

