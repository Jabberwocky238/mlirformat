"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_vscale_constant_names"}> ({
    %0 = "vector.vscale"() : () -> index
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index
    %4 = "arith.muli"(%3, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

