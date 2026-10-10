#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "cf.br"(%1)[^bb1] : (tensor<f32>) -> ()
  ^bb1(%2: tensor<f32>):  // pred: ^bb0
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

