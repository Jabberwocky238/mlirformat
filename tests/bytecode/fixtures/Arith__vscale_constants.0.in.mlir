"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_vscale_constant_names"}> ({
    %0 = "vector.vscale"() : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.muli"(%3, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
