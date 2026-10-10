"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "inplace_update"}> ({
    "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
    "test.any_attr_of_i32_str"() <{attr = 1 : i32}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "add_no_fold"}> ({
    %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%10) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "move_before"}> ({
  ^bb0(%arg3: i1):
    "scf.if"(%arg3) ({
      "test.move_before_parent_op"() ({
        "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
      }) : () -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "move_after"}> ({
  ^bb0(%arg2: i1):
    "scf.if"(%arg2) ({
      "test.move_after_parent_op"() ({
        "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
      }) : () -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "move_forward_and_revisit"}> ({
  ^bb0(%arg1: i1):
    "scf.if"(%arg1) ({
      "test.move_after_parent_op"() ({
        "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
      }) {advance = 1 : i32} : () -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    %6 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i1, i1) -> i1
    %7 = "arith.addi"(%6, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "insert_just_after"}> ({
  ^bb0(%arg0: i1):
    "test.clone_me"() ({
      "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "replace_with_new_op"}> ({
    %4 = "test.replace_with_new_op"() : () -> i32
    %5 = "arith.addi"(%4, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "erase_nested_block"}> ({
    %3 = "test.erase_first_block"() ({
      "foo.foo"() : () -> ()
    ^bb1:  // no predecessors
      "foo.bar"() : () -> ()
    }) : () -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unreachable_replace_with_new_op"}> ({
    "test.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %0 = "test.replace_with_new_op"() : () -> i32
    "test.br"()[^bb3] : () -> ()
  ^bb2:  // no predecessors
    %1 = "test.replace_with_new_op"() {test.unreachable} : () -> i32
    "func.return"() : () -> ()
  ^bb3:  // pred: ^bb1
    %2 = "test.replace_with_new_op"() : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

