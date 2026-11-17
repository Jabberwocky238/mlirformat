"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> (), sym_name = "private_func", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<?x?xf32>) -> (), sym_name = "private_func_2d", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "empty_func"}> ({
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
