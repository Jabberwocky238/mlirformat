"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "foo"}> ({
    %11 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %12 = "test.op_in_place_fold_anchor"(%11) : (i32) -> i32
    "func.return"(%12) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "test_fold_before_previously_folded_op"}> ({
    %9 = "test.cast"() {test_fold_before_previously_folded_op} : () -> i32
    %10 = "test.cast"() {test_fold_before_previously_folded_op} : () -> i32
    "func.return"(%9, %10) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32, i32), sym_name = "test_dont_reorder_constants"}> ({
    %6 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    "func.return"(%6, %7, %8) : (i32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32, i32, i32, i32, i32), sym_name = "test_fold_nofold_nocse"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %4 = "arith.addi"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %5 = "arith.addi"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%3, %4, %5, %0, %1, %2) : (i32, i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

