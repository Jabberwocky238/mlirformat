"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "map1d"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36)):
    %0:2 = "new_processor_id_and_range"() : () -> (index, index) loc("<stdin>":4:12)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
