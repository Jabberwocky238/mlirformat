"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_inline_multiple_blocks"}> ({
  ^bb0(%arg0: i32):
    %0 = "test.functional_region_op"() ({
    ^bb0(%arg1: i32):
      %2 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "cf.br"(%2)[^bb1] : (i32) -> ()
    ^bb1(%3: i32):  // pred: ^bb0
      %4 = "arith.addi"(%3, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "test.return"(%4) : (i32) -> ()
    }) : () -> ((i32) -> i32)
    %1 = "func.call_indirect"(%0, %arg0) : ((i32) -> i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

