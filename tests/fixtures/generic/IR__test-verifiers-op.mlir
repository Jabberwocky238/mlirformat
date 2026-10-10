"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_overflow_on_test_verifiers_op"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "test.verifiers"(%0) ({
      %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
      "test.verifiers"(%1) ({
        %2 = "arith.constant"() <{value = 3 : index}> : () -> index
      }) : (i32) -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

