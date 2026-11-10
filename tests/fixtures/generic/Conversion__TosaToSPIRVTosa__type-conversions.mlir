"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4xi48>) -> tensor<1x2x3x4xi48>, sym_name = "i48_to_i64"}> ({
  ^bb0(%arg0: tensor<1x2x3x4xi48>):
    "func.return"(%arg0) : (tensor<1x2x3x4xi48>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi4>) -> tensor<1xi4>, sym_name = "i4_to_i8"}> ({
  ^bb0(%arg0: tensor<1xi4>):
    "func.return"(%arg0) : (tensor<1xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i8>) -> tensor<i8>, sym_name = "scalar_tensor_to_rank1_tensor"}> ({
  ^bb0(%arg0: tensor<i8>):
    "func.return"(%arg0) : (tensor<i8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x?xi8>) -> tensor<1x?xi8>, sym_name = "partially_shaped_tensor_to_unshaped_tensor"}> ({
  ^bb0(%arg0: tensor<1x?xi8>):
    "func.return"(%arg0) : (tensor<1x?xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xi8>) -> tensor<*xi8>, sym_name = "unranked_tensor"}> ({
  ^bb0(%arg0: tensor<*xi8>):
    "func.return"(%arg0) : (tensor<*xi8>) -> ()
  }) : () -> ()
}) : () -> ()

