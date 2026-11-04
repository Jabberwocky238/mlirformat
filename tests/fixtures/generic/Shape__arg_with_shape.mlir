"builtin.module"() ({
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> !shape.shape, sym_name = "func1"}> ({
  ^bb0(%arg2: !shape.value_shape, %arg3: !shape.value_shape):
    %3 = "shape.shape_of"(%arg2) : (!shape.value_shape) -> !shape.shape
    %4 = "shape.shape_of"(%arg3) : (!shape.value_shape) -> !shape.shape
    %5 = "shape.meet"(%3, %4) : (!shape.shape, !shape.shape) -> !shape.shape
    "func.return"(%5) : (!shape.shape) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> !shape.shape, sym_name = "func"}> ({
  ^bb0(%arg0: !shape.value_shape, %arg1: !shape.value_shape):
    %0 = "shape.shape_of"(%arg0) : (!shape.value_shape) -> !shape.shape
    %1 = "shape.with_shape"(%arg1, %0) : (!shape.value_shape, !shape.shape) -> !shape.value_shape
    %2 = "func.call"(%arg0, %1) <{callee = @func1}> : (!shape.value_shape, !shape.value_shape) -> !shape.shape
    "func.return"(%2) : (!shape.shape) -> ()
  }) : () -> ()
}) : () -> ()

