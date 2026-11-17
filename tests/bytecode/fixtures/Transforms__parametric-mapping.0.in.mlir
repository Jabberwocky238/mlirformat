"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "map1d"}> ({
  ^bb0(%arg4: index loc("<stdin>":3:8), %arg5: index loc("<stdin>":3:22), %arg6: index loc("<stdin>":3:36)):
    %2:2 = "new_processor_id_and_range"() : () -> (index, index) loc("<stdin>":4:12)
    "scf.for"(%arg4, %arg5, %arg6) ({
    ^bb0(%arg7: index loc("<stdin>":6:10)):
      "scf.yield"() : () -> () loc("<stdin>":7:7)
    }) : (index, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "map2d"}> ({
  ^bb0(%arg0: index loc("<stdin>":12:8), %arg1: index loc("<stdin>":12:22), %arg2: index loc("<stdin>":12:36)):
    %0:2 = "new_processor_id_and_range"() : () -> (index, index) loc("<stdin>":13:12)
    %1:2 = "new_processor_id_and_range"() : () -> (index, index) loc("<stdin>":14:12)
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: index loc("<stdin>":16:10)):
      "scf.yield"() : () -> () loc("<stdin>":17:7)
    }) : (index, index, index) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
