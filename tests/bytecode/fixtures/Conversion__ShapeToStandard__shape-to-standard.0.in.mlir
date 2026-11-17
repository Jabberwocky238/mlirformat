"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "binary_ops"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "shape.add"(%arg0, %arg1) : (index, index) -> index loc("<stdin>":4:10)
    %1 = "shape.mul"(%arg0, %arg1) : (index, index) -> index loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
