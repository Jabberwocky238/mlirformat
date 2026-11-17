"builtin.module"() ({
  "func.func"() <{function_type = (!shape.shape) -> !shape.size, sym_name = "num_elements_to_reduce"}> ({
  ^bb0(%arg0: !shape.shape loc("<stdin>":3:8)):
    %0 = "shape.num_elements"(%arg0) : (!shape.shape) -> !shape.size loc("<stdin>":4:10)
    "func.return"(%0) : (!shape.size) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
