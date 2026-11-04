"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "inline_with_arg"}> ({
  ^bb0(%arg0: i32):
    %4 = "test.functional_region_op"() ({
    ^bb0(%arg1: i32):
      %6 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "test.return"(%6) : (i32) -> ()
    }) : () -> ((i32) -> i32)
    %5 = "func.call_indirect"(%4, %arg0) : ((i32) -> i32, i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_inline_invalid_nested_operation"}> ({
    %3 = "test.functional_region_op"() ({
      "test.region"() ({
        "foo.noinline_operation"() : () -> ()
      }) : () -> ()
      "test.return"() : () -> ()
    }) : () -> (() -> ())
    "func.call_indirect"(%3) : (() -> ()) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "inline_ignore_invalid_nested_operation"}> ({
    %1 = "test.functional_region_op"() ({
      %2 = "test.functional_region_op"() ({
        "foo.noinline_operation"() : () -> ()
      }) : () -> (() -> ())
      "test.return"() : () -> ()
    }) : () -> (() -> ())
    "func.call_indirect"(%1) : (() -> ()) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_inline_invalid_dest_region"}> ({
    "foo.unknown_region"() ({
      %0 = "test.functional_region_op"() ({
        "test.return"() : () -> ()
      }) : () -> (() -> ())
      "func.call_indirect"(%0) : (() -> ()) -> ()
      "test.return"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

