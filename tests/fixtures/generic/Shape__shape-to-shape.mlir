"builtin.module"() ({
  "func.func"() <{function_type = (!shape.shape) -> !shape.size, sym_name = "num_elements_to_reduce"}> ({
  ^bb0(%arg0: !shape.shape):
    %0 = "shape.num_elements"(%arg0) : (!shape.shape) -> !shape.size
    "func.return"(%0) : (!shape.size) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xindex>) -> index, sym_name = "num_elements_to_reduce_on_index"}> ({
  ^bb0(%arg0: tensor<?xindex>):
    %0 = "shape.num_elements"(%arg0) : (tensor<?xindex>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

