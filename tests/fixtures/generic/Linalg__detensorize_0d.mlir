#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "detensor_simple"}> ({
  ^bb0(%arg21: tensor<f32>, %arg22: tensor<f32>):
    %16 = "tensor.empty"() : () -> tensor<f32>
    %17 = "linalg.generic"(%arg21, %arg22, %16) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32, %arg24: f32, %arg25: f32):
      %18 = "arith.addf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%17) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "detensor_op_sequence"}> ({
  ^bb0(%arg10: tensor<f32>, %arg11: tensor<f32>):
    %7 = "tensor.empty"() : () -> tensor<f32>
    %8 = "linalg.generic"(%arg10, %arg11, %7) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %15 = "arith.addf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    %9 = "tensor.empty"() : () -> tensor<f32>
    %10 = "linalg.generic"(%arg10, %8, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %14 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    %11 = "tensor.empty"() : () -> tensor<f32>
    %12 = "linalg.generic"(%8, %10, %11) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %13 = "arith.divf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%12) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "detensor_multiple_ops"}> ({
  ^bb0(%arg5: tensor<f32>, %arg6: tensor<f32>):
    %3 = "tensor.empty"() : () -> tensor<f32>
    %4 = "linalg.generic"(%arg5, %arg6, %3) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %5 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.mulf"(%5, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%4) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "detensor_foreign_op"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "foreign.do_something"(%arg2, %arg3) : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<f32>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

