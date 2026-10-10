"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x8xi8>) -> (i8, i8), sym_name = "extract_from_collapse_shape"}> ({
  ^bb0(%arg0: tensor<1x1x8xi8>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2]]}> : (tensor<1x1x8xi8>) -> tensor<8xi8>
    %3 = "tensor.extract"(%2, %1) : (tensor<8xi8>, index) -> i8
    %4 = "tensor.extract"(%2, %0) : (tensor<8xi8>, index) -> i8
    "func.return"(%3, %4) : (i8, i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x32xf32>, index, index) -> f32, sym_name = "extract_from_static_shape"}> ({
  ^bb0(%arg0: tensor<2x6x32xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<2x6x32xf32>) -> tensor<12x32xf32>
    %1 = "tensor.extract"(%0, %arg1, %arg2) : (tensor<12x32xf32>, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

