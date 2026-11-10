"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "unary_ops"}> ({
  ^bb0(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>):
    %0 = "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      %26 = "math.exp"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %1 = "linalg.log"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f32, %arg25: f32):
      %25 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %2 = "linalg.abs"(%1, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32):
      %24 = "math.absf"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %3 = "linalg.ceil"(%2, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32, %arg21: f32):
      %23 = "math.ceil"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %4 = "linalg.floor"(%3, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32):
      %22 = "math.floor"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%22) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %5 = "linalg.negf"(%4, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32):
      %21 = "arith.negf"(%arg16) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %6 = "linalg.reciprocal"(%5, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      %19 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %20 = "arith.divf"(%19, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %7 = "linalg.round"(%6, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %18 = "math.round"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %8 = "linalg.sqrt"(%7, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %17 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %9 = "linalg.rsqrt"(%8, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %16 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %10 = "linalg.square"(%9, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %15 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %11 = "linalg.tanh"(%10, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %14 = "math.tanh"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    %12 = "linalg.erf"(%11, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %13 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%12) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>, sym_name = "binary_ops_int"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?xi32>):
    %0 = "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i32, %arg22: i32, %arg23: i32):
      %13 = "arith.addi"(%arg21, %arg22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %1 = "linalg.sub"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: i32, %arg19: i32, %arg20: i32):
      %12 = "arith.subi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %2 = "linalg.mul"(%1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i32, %arg16: i32, %arg17: i32):
      %11 = "arith.muli"(%arg15, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%11) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %3 = "linalg.div"(%2, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %10 = "arith.divsi"(%arg12, %arg13) : (i32, i32) -> i32
      "linalg.yield"(%10) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %4 = "linalg.div_unsigned"(%3, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      %9 = "arith.divui"(%arg9, %arg10) : (i32, i32) -> i32
      "linalg.yield"(%9) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %5 = "linalg.max"(%4, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
      %8 = "arith.maxsi"(%arg6, %arg7) : (i32, i32) -> i32
      "linalg.yield"(%8) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = "linalg.min"(%5, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %7 = "arith.minsi"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%7) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "func.return"(%6) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "binary_ops_float"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %13 = "arith.addf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "linalg.sub"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %12 = "arith.subf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = "linalg.mul"(%1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %11 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "linalg.div"(%2, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %10 = "arith.divf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = "linalg.max"(%3, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %9 = "arith.maximumf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = "linalg.min"(%4, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %8 = "arith.minimumf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.powf"(%5, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %7 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>, sym_name = "binary_ops_complex"}> ({
  ^bb0(%arg0: tensor<?x?xcomplex<f32>>, %arg1: tensor<?x?xcomplex<f32>>, %arg2: tensor<?x?xcomplex<f32>>):
    %0 = "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: complex<f32>, %arg13: complex<f32>, %arg14: complex<f32>):
      %7 = "complex.add"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%7) : (complex<f32>) -> ()
    }) : (tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    %1 = "linalg.sub"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: complex<f32>, %arg10: complex<f32>, %arg11: complex<f32>):
      %6 = "complex.sub"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%6) : (complex<f32>) -> ()
    }) : (tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    %2 = "linalg.mul"(%1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: complex<f32>, %arg7: complex<f32>, %arg8: complex<f32>):
      %5 = "complex.mul"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%5) : (complex<f32>) -> ()
    }) : (tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    %3 = "linalg.div"(%2, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: complex<f32>, %arg4: complex<f32>, %arg5: complex<f32>):
      %4 = "complex.div"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%4) : (complex<f32>) -> ()
    }) : (tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    "func.return"(%3) : (tensor<?x?xcomplex<f32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>, sym_name = "binary_ops_bool"}> ({
  ^bb0(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?xi1>):
    %0 = "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: i1, %arg7: i1, %arg8: i1):
      %3 = "arith.ori"(%arg6, %arg7) : (i1, i1) -> i1
      "linalg.yield"(%3) : (i1) -> ()
    }) : (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>
    %1 = "linalg.mul"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i1, %arg4: i1, %arg5: i1):
      %2 = "arith.andi"(%arg3, %arg4) : (i1, i1) -> i1
      "linalg.yield"(%2) : (i1) -> ()
    }) : (tensor<?x?xi1>, tensor<?x?xi1>, tensor<?x?xi1>) -> tensor<?x?xi1>
    "func.return"(%1) : (tensor<?x?xi1>) -> ()
  }) : () -> ()
}) : () -> ()

