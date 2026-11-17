"builtin.module"() ({
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> !shape.shape, sym_name = "func1"}> ({
  ^bb0(%arg2: !shape.value_shape loc("<stdin>":3:8), %arg3: !shape.value_shape loc("<stdin>":3:35)):
    %3 = "shape.shape_of"(%arg2) : (!shape.value_shape) -> !shape.shape loc("<stdin>":4:10)
    %4 = "shape.shape_of"(%arg3) : (!shape.value_shape) -> !shape.shape loc("<stdin>":5:10)
    %5 = "shape.meet"(%3, %4) : (!shape.shape, !shape.shape) -> !shape.shape loc("<stdin>":6:10)
    "func.return"(%5) : (!shape.shape) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> !shape.shape, sym_name = "func"}> ({
  ^bb0(%arg0: !shape.value_shape loc("<stdin>":10:8), %arg1: !shape.value_shape loc("<stdin>":10:35)):
    %0 = "shape.shape_of"(%arg0) : (!shape.value_shape) -> !shape.shape loc("<stdin>":11:10)
    %1 = "shape.with_shape"(%arg1, %0) : (!shape.value_shape, !shape.shape) -> !shape.value_shape loc("<stdin>":12:10)
    %2 = "func.call"(%arg0, %1) <{callee = @func1}> : (!shape.value_shape, !shape.value_shape) -> !shape.shape loc("<stdin>":13:10)
    "func.return"(%2) : (!shape.shape) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
