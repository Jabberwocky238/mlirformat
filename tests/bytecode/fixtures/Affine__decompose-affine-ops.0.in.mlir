"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "simple_test_1"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:22), %arg2: index loc("<stdin>":4:36), %arg3: index loc("<stdin>":4:50), %arg4: index loc("<stdin>":4:64), %arg5: index loc("<stdin>":4:78)):
    %0 = "affine.apply"(%arg1) <{map = affine_map<(d0) -> ((d0 floordiv 32) mod 4 + 42)>}> : (index) -> index loc("<stdin>":5:10)
    "some_side_effecting_consumer"(%0) : (index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
