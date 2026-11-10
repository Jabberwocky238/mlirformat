#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "unary_ops"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg50: f32, %arg51: f32):
      %25 = "math.exp"(%arg50) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<log>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg48: f32, %arg49: f32):
      %24 = "math.log"(%arg48) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<abs>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg46: f32, %arg47: f32):
      %23 = "math.absf"(%arg46) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<ceil>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg44: f32, %arg45: f32):
      %22 = "math.ceil"(%arg44) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%22) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<floor>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg42: f32, %arg43: f32):
      %21 = "math.floor"(%arg42) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<negf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg40: f32, %arg41: f32):
      %20 = "arith.negf"(%arg40) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<reciprocal>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg38: f32, %arg39: f32):
      %18 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %19 = "arith.divf"(%18, %arg38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<round>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg36: f32, %arg37: f32):
      %17 = "math.round"(%arg36) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<sqrt>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg34: f32, %arg35: f32):
      %16 = "math.sqrt"(%arg34) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<rsqrt>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg32: f32, %arg33: f32):
      %15 = "math.rsqrt"(%arg32) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<square>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg30: f32, %arg31: f32):
      %14 = "arith.mulf"(%arg30, %arg30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<tanh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg28: f32, %arg29: f32):
      %13 = "math.tanh"(%arg28) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<erf>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      %12 = "math.erf"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<sin>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32, %arg25: f32):
      %11 = "math.sin"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<cos>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32):
      %10 = "math.cos"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<tan>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32, %arg21: f32):
      %9 = "math.tan"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<acos>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32):
      %8 = "math.acos"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<acosh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32):
      %7 = "math.acosh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<asin>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      %6 = "math.asin"(%arg14) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<asinh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %5 = "math.asinh"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<atan>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %4 = "math.atan"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<atanh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %3 = "math.atanh"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<log10>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %2 = "math.log10"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<log1p>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %1 = "math.log1p"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<log2>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.log2"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "unary_ops_non_identity"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map1], kind = #linalg.elementwise_kind<log>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.log"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> (), sym_name = "binary_ops_int"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: memref<10xi32>, %arg2: memref<10xi32>):
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i32, %arg22: i32, %arg23: i32):
      %6 = "arith.addi"(%arg21, %arg22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<sub>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: i32, %arg19: i32, %arg20: i32):
      %5 = "arith.subi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i32, %arg16: i32, %arg17: i32):
      %4 = "arith.muli"(%arg15, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %3 = "arith.divsi"(%arg12, %arg13) : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div_unsigned>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      %2 = "arith.divui"(%arg9, %arg10) : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<max_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      %1 = "arith.maxsi"(%arg6, %arg7) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<min_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.minsi"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> (), sym_name = "binary_ops_float"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>):
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %6 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<sub>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %5 = "arith.subf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %4 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %3 = "arith.divf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<max_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %2 = "arith.maximumf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<min_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %1 = "arith.minimumf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<powf>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> (), sym_name = "binary_ops_complex"}> ({
  ^bb0(%arg0: memref<10xcomplex<f32>>, %arg1: memref<10xcomplex<f32>>, %arg2: memref<10xcomplex<f32>>):
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: complex<f32>, %arg13: complex<f32>, %arg14: complex<f32>):
      %3 = "complex.add"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%3) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<sub>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: complex<f32>, %arg10: complex<f32>, %arg11: complex<f32>):
      %2 = "complex.sub"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%2) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: complex<f32>, %arg7: complex<f32>, %arg8: complex<f32>):
      %1 = "complex.mul"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%1) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: complex<f32>, %arg4: complex<f32>, %arg5: complex<f32>):
      %0 = "complex.div"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%0) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi1>, memref<10xi1>, memref<10xi1>) -> (), sym_name = "binary_ops_bool"}> ({
  ^bb0(%arg0: memref<10xi1>, %arg1: memref<10xi1>, %arg2: memref<10xi1>):
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i1, %arg7: i1, %arg8: i1):
      %1 = "arith.ori"(%arg6, %arg7) : (i1, i1) -> i1
      "linalg.yield"(%1) : (i1) -> ()
    }) : (memref<10xi1>, memref<10xi1>, memref<10xi1>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i1, %arg4: i1, %arg5: i1):
      %0 = "arith.andi"(%arg3, %arg4) : (i1, i1) -> i1
      "linalg.yield"(%0) : (i1) -> ()
    }) : (memref<10xi1>, memref<10xi1>, memref<10xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> (), sym_name = "binary_ops_uint"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: memref<10xi32>, %arg2: memref<10xi32>):
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<max_unsigned>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      %1 = "arith.maxui"(%arg6, %arg7) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<min_unsigned>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.minui"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "binary_ops_non_identity"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "contract_matmul"}> ({
  ^bb0(%arg24: tensor<?x?xf32>, %arg25: tensor<?x?xf32>, %arg26: tensor<?x?xf32>):
    %15 = "linalg.contract"(%arg24, %arg25, %arg26) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: f32, %arg28: f32, %arg29: f32):
      %16 = "arith.mulf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.addf"(%arg29, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%15) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>, sym_name = "contract_matmul_bool"}> ({
  ^bb0(%arg18: tensor<?x?xi1>, %arg19: tensor<?x?xi1>, %arg20: tensor<?x?xi1>):
    %12 = "linalg.contract"(%arg18, %arg19, %arg20) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i1, %arg22: i1, %arg23: i1):
      %13 = "arith.andi"(%arg21, %arg22) : (i1, i1) -> i1
      %14 = "arith.ori"(%arg23, %13) : (i1, i1) -> i1
      "linalg.yield"(%14) : (i1) -> ()
    }) : (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>
    "func.return"(%12) : (tensor<?x?xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "contract_matmul_memref"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: memref<?x?xf32>, %arg14: memref<?x?xf32>):
    "linalg.contract"(%arg12, %arg13, %arg14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %10 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg17, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x8xi32>, tensor<8x32xi32>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "contract_matmul_bitcast_int_to_float"}> ({
  ^bb0(%arg6: tensor<16x8xi32>, %arg7: tensor<8x32xi32>, %arg8: tensor<16x32xf32>):
    %5 = "linalg.contract"(%arg6, %arg7, %arg8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: f32):
      %6 = "arith.sitofp"(%arg9) : (i32) -> f32
      %7 = "arith.sitofp"(%arg10) : (i32) -> f32
      %8 = "arith.mulf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg11, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<16x8xi32>, tensor<8x32xi32>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%5) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi16>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "contract_matmul_unsigned_cast_float"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi16>, %arg2: tensor<16x32xf32>):
    %0 = "linalg.contract"(%arg0, %arg1, %arg2) <{cast = #linalg.type_fn<cast_unsigned>, indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i16, %arg5: f32):
      %1 = "arith.uitofp"(%arg3) : (i16) -> f32
      %2 = "arith.uitofp"(%arg4) : (i16) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi16>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20x30xf32>, tensor<30x20x40xf32>, tensor<10x40xf32>) -> tensor<10x40xf32>, sym_name = "contract_multi_reduction"}> ({
  ^bb0(%arg0: tensor<10x20x30xf32>, %arg1: tensor<30x20x40xf32>, %arg2: tensor<10x40xf32>):
    %0 = "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<10x20x30xf32>, tensor<30x20x40xf32>, tensor<10x40xf32>) -> tensor<10x40xf32>
    "func.return"(%0) : (tensor<10x40xf32>) -> ()
  }) : () -> ()
}) : () -> ()

