"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (i32, i32), sym_name = "merge_blocks"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0:2 = "test.merge_blocks"() ({
      "test.br"(%arg0, %arg1)[^bb1] : (i32, i32) -> ()
    ^bb1(%1: i32, %2: i32):  // pred: ^bb0
      "test.return"(%1, %2) : (i32, i32) -> ()
    }) : () -> (i32, i32)
    "test.return"(%0#0, %0#1) : (i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "inline_regions"}> ({
    "test.SingleBlockImplicitTerminator"() ({
      %0 = "test.type_producer"() : () -> i32
      "test.SingleBlockImplicitTerminator"() ({
        "test.type_consumer"(%0) : (i32) -> ()
        "test.finish"() : () -> ()
      }) : () -> ()
      "test.finish"() : () -> ()
    }) : () -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

