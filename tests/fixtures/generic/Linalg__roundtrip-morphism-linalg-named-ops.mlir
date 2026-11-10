"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "unary_ops"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      %13 = "math.exp"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.log"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32, %arg25: f32):
      %12 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.abs"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32):
      %11 = "math.absf"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.ceil"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32, %arg21: f32):
      %10 = "math.ceil"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.floor"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32):
      %9 = "math.floor"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.negf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32):
      %8 = "arith.negf"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.reciprocal"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %7 = "arith.divf"(%6, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.round"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %5 = "math.round"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.sqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %4 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.rsqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %3 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.square"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %2 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.tanh"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %1 = "math.tanh"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "linalg.erf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> (), sym_name = "binary_ops_int"}> ({
  ^bb0(%arg0: memref<10xi32>, %arg1: memref<10xi32>, %arg2: memref<10xi32>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i32, %arg22: i32, %arg23: i32):
      %6 = "arith.addi"(%arg21, %arg22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.sub"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: i32, %arg19: i32, %arg20: i32):
      %5 = "arith.subi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i32, %arg16: i32, %arg17: i32):
      %4 = "arith.muli"(%arg15, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.div"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %3 = "arith.divsi"(%arg12, %arg13) : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.div_unsigned"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      %2 = "arith.divui"(%arg9, %arg10) : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.max"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      %1 = "arith.maxsi"(%arg6, %arg7) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "linalg.min"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.minsi"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) : (memref<10xi32>, memref<10xi32>, memref<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> (), sym_name = "binary_ops_float"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %6 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.sub"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %5 = "arith.subf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %4 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.div"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %3 = "arith.divf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.max"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %2 = "arith.maximumf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.min"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %1 = "arith.minimumf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "linalg.powf"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> (), sym_name = "binary_ops_complex"}> ({
  ^bb0(%arg0: memref<10xcomplex<f32>>, %arg1: memref<10xcomplex<f32>>, %arg2: memref<10xcomplex<f32>>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: complex<f32>, %arg13: complex<f32>, %arg14: complex<f32>):
      %3 = "complex.add"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%3) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "linalg.sub"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: complex<f32>, %arg10: complex<f32>, %arg11: complex<f32>):
      %2 = "complex.sub"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%2) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: complex<f32>, %arg7: complex<f32>, %arg8: complex<f32>):
      %1 = "complex.mul"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%1) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "linalg.div"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: complex<f32>, %arg4: complex<f32>, %arg5: complex<f32>):
      %0 = "complex.div"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%0) : (complex<f32>) -> ()
    }) : (memref<10xcomplex<f32>>, memref<10xcomplex<f32>>, memref<10xcomplex<f32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi1>, memref<10xi1>, memref<10xi1>) -> (), sym_name = "binary_ops_bool"}> ({
  ^bb0(%arg0: memref<10xi1>, %arg1: memref<10xi1>, %arg2: memref<10xi1>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i1, %arg7: i1, %arg8: i1):
      %1 = "arith.ori"(%arg6, %arg7) : (i1, i1) -> i1
      "linalg.yield"(%1) : (i1) -> ()
    }) : (memref<10xi1>, memref<10xi1>, memref<10xi1>) -> ()
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i1, %arg4: i1, %arg5: i1):
      %0 = "arith.andi"(%arg3, %arg4) : (i1, i1) -> i1
      "linalg.yield"(%0) : (i1) -> ()
    }) : (memref<10xi1>, memref<10xi1>, memref<10xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>, sym_name = "matmul_bool"}> ({
  ^bb0(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?xi1>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i1, %arg4: i1, %arg5: i1):
      %1 = "arith.andi"(%arg3, %arg4) : (i1, i1) -> i1
      %2 = "arith.ori"(%arg5, %1) : (i1, i1) -> i1
      "linalg.yield"(%2) : (i1) -> ()
    }) : (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>
    "func.return"(%0) : (tensor<?x?xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>, sym_name = "matmul_unsigned_cast"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{cast = #linalg.type_fn<cast_unsigned>, indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i64, %arg5: i32):
      %1 = "arith.extui"(%arg3) : (i16) -> i32
      %2 = "arith.trunci"(%arg4) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>
    "func.return"(%0) : (tensor<16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "mixed_named_ops"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %3 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg9, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "linalg.add"(%0, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

