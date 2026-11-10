#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "unary_ops"}> ({
  ^bb0(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      %26 = "math.exp"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %1 = "linalg.elementwise"(%0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<log>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32, %arg25: f32):
      %25 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %2 = "linalg.elementwise"(%1, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<abs>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32):
      %24 = "math.absf"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %3 = "linalg.elementwise"(%2, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<ceil>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32, %arg21: f32):
      %23 = "math.ceil"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %4 = "linalg.elementwise"(%3, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<floor>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32):
      %22 = "math.floor"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%22) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %5 = "linalg.elementwise"(%4, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<negf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32):
      %21 = "arith.negf"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %6 = "linalg.elementwise"(%5, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<reciprocal>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      %19 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %20 = "arith.divf"(%19, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %7 = "linalg.elementwise"(%6, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<round>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %18 = "math.round"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %8 = "linalg.elementwise"(%7, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<sqrt>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %17 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %9 = "linalg.elementwise"(%8, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<rsqrt>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %16 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %10 = "linalg.elementwise"(%9, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<square>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %15 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %11 = "linalg.elementwise"(%10, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<tanh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %14 = "math.tanh"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %12 = "linalg.elementwise"(%11, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<erf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %13 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%12) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>, sym_name = "binary_ops_int"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?xi32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i32, %arg22: i32, %arg23: i32):
      %13 = "arith.addi"(%arg21, %arg22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %1 = "linalg.elementwise"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<sub>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: i32, %arg19: i32, %arg20: i32):
      %12 = "arith.subi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %2 = "linalg.elementwise"(%1, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i32, %arg16: i32, %arg17: i32):
      %11 = "arith.muli"(%arg15, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%11) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %3 = "linalg.elementwise"(%2, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %10 = "arith.divsi"(%arg12, %arg13) : (i32, i32) -> i32
      "linalg.yield"(%10) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %4 = "linalg.elementwise"(%3, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div_unsigned>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      %9 = "arith.divui"(%arg9, %arg10) : (i32, i32) -> i32
      "linalg.yield"(%9) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %5 = "linalg.elementwise"(%4, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<max_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      %8 = "arith.maxsi"(%arg6, %arg7) : (i32, i32) -> i32
      "linalg.yield"(%8) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = "linalg.elementwise"(%5, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<min_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %7 = "arith.minsi"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%7) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "func.return"(%6) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "binary_ops_float"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %13 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "linalg.elementwise"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<sub>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %12 = "arith.subf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = "linalg.elementwise"(%1, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %11 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "linalg.elementwise"(%2, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %10 = "arith.divf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = "linalg.elementwise"(%3, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<max_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %9 = "arith.maximumf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = "linalg.elementwise"(%4, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<min_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.minimumf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.elementwise"(%5, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<powf>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi1>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "ternary_select"}> ({
  ^bb0(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map, #map], kind = #linalg.elementwise_kind<select>, operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i1, %arg5: f32, %arg6: f32, %arg7: f32):
      %1 = "arith.select"(%arg4, %arg5, %arg6) : (i1, f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xi1>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "non_identity_maps"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map1], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "no_named_op"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<sin>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.sin"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

