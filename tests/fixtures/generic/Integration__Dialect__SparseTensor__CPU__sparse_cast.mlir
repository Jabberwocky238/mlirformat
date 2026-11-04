#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "sparse_cast_s32_to_f32"}> ({
  ^bb0(%arg36: tensor<10xi32, #sparse>, %arg37: tensor<10xf32>):
    %58 = "linalg.generic"(%arg36, %arg37) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg38: i32, %arg39: f32):
      %59 = "arith.sitofp"(%arg38) : (i32) -> f32
      "linalg.yield"(%59) : (f32) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%58) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "sparse_cast_u32_to_f32"}> ({
  ^bb0(%arg32: tensor<10xi32, #sparse>, %arg33: tensor<10xf32>):
    %56 = "linalg.generic"(%arg32, %arg33) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg34: i32, %arg35: f32):
      %57 = "arith.uitofp"(%arg34) : (i32) -> f32
      "linalg.yield"(%57) : (f32) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%56) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>, sym_name = "sparse_cast_f32_to_s32"}> ({
  ^bb0(%arg28: tensor<10xf32, #sparse>, %arg29: tensor<10xi32>):
    %54 = "linalg.generic"(%arg28, %arg29) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg30: f32, %arg31: i32):
      %55 = "arith.fptosi"(%arg30) : (f32) -> i32
      "linalg.yield"(%55) : (i32) -> ()
    }) : (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%54) : (tensor<10xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf64, #sparse>, tensor<10xi32>) -> tensor<10xi32>, sym_name = "sparse_cast_f64_to_u32"}> ({
  ^bb0(%arg24: tensor<10xf64, #sparse>, %arg25: tensor<10xi32>):
    %52 = "linalg.generic"(%arg24, %arg25) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f64, %arg27: i32):
      %53 = "arith.fptoui"(%arg26) : (f64) -> i32
      "linalg.yield"(%53) : (i32) -> ()
    }) : (tensor<10xf64, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%52) : (tensor<10xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32, #sparse>, tensor<10xf64>) -> tensor<10xf64>, sym_name = "sparse_cast_f32_to_f64"}> ({
  ^bb0(%arg20: tensor<10xf32, #sparse>, %arg21: tensor<10xf64>):
    %50 = "linalg.generic"(%arg20, %arg21) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f64):
      %51 = "arith.extf"(%arg22) : (f32) -> f64
      "linalg.yield"(%51) : (f64) -> ()
    }) : (tensor<10xf32, #sparse>, tensor<10xf64>) -> tensor<10xf64>
    "func.return"(%50) : (tensor<10xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf64, #sparse>, tensor<10xf32>) -> tensor<10xf32>, sym_name = "sparse_cast_f64_to_f32"}> ({
  ^bb0(%arg16: tensor<10xf64, #sparse>, %arg17: tensor<10xf32>):
    %48 = "linalg.generic"(%arg16, %arg17) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f64, %arg19: f32):
      %49 = "arith.truncf"(%arg18) : (f64) -> f32
      "linalg.yield"(%49) : (f32) -> ()
    }) : (tensor<10xf64, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    "func.return"(%48) : (tensor<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>, sym_name = "sparse_cast_s32_to_u64"}> ({
  ^bb0(%arg12: tensor<10xi32, #sparse>, %arg13: tensor<10xi64>):
    %46 = "linalg.generic"(%arg12, %arg13) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: i32, %arg15: i64):
      %47 = "arith.extsi"(%arg14) : (i32) -> i64
      "linalg.yield"(%47) : (i64) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>
    "func.return"(%46) : (tensor<10xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>, sym_name = "sparse_cast_u32_to_s64"}> ({
  ^bb0(%arg8: tensor<10xi32, #sparse>, %arg9: tensor<10xi64>):
    %44 = "linalg.generic"(%arg8, %arg9) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i32, %arg11: i64):
      %45 = "arith.extui"(%arg10) : (i32) -> i64
      "linalg.yield"(%45) : (i64) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>
    "func.return"(%44) : (tensor<10xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xi32, #sparse>, tensor<10xi8>) -> tensor<10xi8>, sym_name = "sparse_cast_i32_to_i8"}> ({
  ^bb0(%arg4: tensor<10xi32, #sparse>, %arg5: tensor<10xi8>):
    %42 = "linalg.generic"(%arg4, %arg5) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i8):
      %43 = "arith.trunci"(%arg6) <{overflowFlags = #arith.overflow<none>}> : (i32) -> i8
      "linalg.yield"(%43) : (i8) -> ()
    }) : (tensor<10xi32, #sparse>, tensor<10xi8>) -> tensor<10xi8>
    "func.return"(%42) : (tensor<10xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>, sym_name = "sparse_cast_f32_as_s32"}> ({
  ^bb0(%arg0: tensor<10xf32, #sparse>, %arg1: tensor<10xi32>):
    %40 = "linalg.generic"(%arg0, %arg1) <{doc = "X(i) = cast A(i)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: i32):
      %41 = "arith.bitcast"(%arg2) : (f32) -> i32
      "linalg.yield"(%41) : (i32) -> ()
    }) : (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    "func.return"(%40) : (tensor<10xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = dense<0> : tensor<10xi8>}> : () -> tensor<10xi8>
    %7 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<10xf64>}> : () -> tensor<10xf64>
    %8 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<10xf32>}> : () -> tensor<10xf32>
    %9 = "arith.constant"() <{value = dense<0> : tensor<10xi32>}> : () -> tensor<10xi32>
    %10 = "arith.constant"() <{value = dense<0> : tensor<10xi64>}> : () -> tensor<10xi64>
    %11 = "arith.constant"() <{value = dense<[-4, -3, -2, -1, 0, 1, 2, 3, 4, 305]> : tensor<10xi32>}> : () -> tensor<10xi32>
    %12 = "sparse_tensor.convert"(%11) : (tensor<10xi32>) -> tensor<10xi32, #sparse>
    %13 = "arith.constant"() <{value = dense<[-4.400000e+00, -3.300000e+00, -2.200000e+00, -1.100000e+00, 0.000000e+00, 1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 3.055000e+02]> : tensor<10xf32>}> : () -> tensor<10xf32>
    %14 = "sparse_tensor.convert"(%13) : (tensor<10xf32>) -> tensor<10xf32, #sparse>
    %15 = "arith.constant"() <{value = dense<[-4.400000e+00, -3.300000e+00, -2.200000e+00, -1.100000e+00, 0.000000e+00, 1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 3.055000e+02]> : tensor<10xf64>}> : () -> tensor<10xf64>
    %16 = "sparse_tensor.convert"(%15) : (tensor<10xf64>) -> tensor<10xf64, #sparse>
    %17 = "arith.constant"() <{value = dense<[0x41EFFFFFFFE00000, 0x41EFFFFFFFC00000, 0x41EFFFFFFFA00000, 0x41EFFFFFFF800000, 0.000000e+00, 1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 3.055000e+02]> : tensor<10xf64>}> : () -> tensor<10xf64>
    %18 = "sparse_tensor.convert"(%17) : (tensor<10xf64>) -> tensor<10xf64, #sparse>
    %19 = "func.call"(%12, %8) <{callee = @sparse_cast_s32_to_f32}> : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    %20 = "vector.transfer_read"(%19, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xf32>, index, f32) -> vector<10xf32>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf32>) -> ()
    %21 = "func.call"(%12, %8) <{callee = @sparse_cast_u32_to_f32}> : (tensor<10xi32, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    %22 = "vector.transfer_read"(%21, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xf32>, index, f32) -> vector<10xf32>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf32>) -> ()
    %23 = "func.call"(%14, %9) <{callee = @sparse_cast_f32_to_s32}> : (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    %24 = "vector.transfer_read"(%23, %0, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xi32>, index, i32) -> vector<10xi32>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi32>) -> ()
    %25 = "func.call"(%18, %9) <{callee = @sparse_cast_f64_to_u32}> : (tensor<10xf64, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    %26 = "vector.transfer_read"(%25, %0, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xi32>, index, i32) -> vector<10xi32>
    %27 = "vector.bitcast"(%26) : (vector<10xi32>) -> vector<10xui32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<10xui32>) -> ()
    %28 = "func.call"(%14, %7) <{callee = @sparse_cast_f32_to_f64}> : (tensor<10xf32, #sparse>, tensor<10xf64>) -> tensor<10xf64>
    %29 = "vector.transfer_read"(%28, %0, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xf64>, index, f64) -> vector<10xf64>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf64>) -> ()
    %30 = "func.call"(%16, %8) <{callee = @sparse_cast_f64_to_f32}> : (tensor<10xf64, #sparse>, tensor<10xf32>) -> tensor<10xf32>
    %31 = "vector.transfer_read"(%30, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xf32>, index, f32) -> vector<10xf32>
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf32>) -> ()
    %32 = "func.call"(%12, %10) <{callee = @sparse_cast_s32_to_u64}> : (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>
    %33 = "vector.transfer_read"(%32, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xi64>, index, i64) -> vector<10xi64>
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi64>) -> ()
    %34 = "func.call"(%12, %10) <{callee = @sparse_cast_u32_to_s64}> : (tensor<10xi32, #sparse>, tensor<10xi64>) -> tensor<10xi64>
    %35 = "vector.transfer_read"(%34, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xi64>, index, i64) -> vector<10xi64>
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi64>) -> ()
    %36 = "func.call"(%12, %6) <{callee = @sparse_cast_i32_to_i8}> : (tensor<10xi32, #sparse>, tensor<10xi8>) -> tensor<10xi8>
    %37 = "vector.transfer_read"(%36, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xi8>, index, i8) -> vector<10xi8>
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi8>) -> ()
    %38 = "func.call"(%14, %9) <{callee = @sparse_cast_f32_as_s32}> : (tensor<10xf32, #sparse>, tensor<10xi32>) -> tensor<10xi32>
    %39 = "vector.transfer_read"(%38, %0, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<10xi32>, index, i32) -> vector<10xi32>
    "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi32>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<10xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<10xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<10xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<10xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<10xf32>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<10xf32>) -> ()
    "bufferization.dealloc_tensor"(%23) : (tensor<10xi32>) -> ()
    "bufferization.dealloc_tensor"(%25) : (tensor<10xi32>) -> ()
    "bufferization.dealloc_tensor"(%28) : (tensor<10xf64>) -> ()
    "bufferization.dealloc_tensor"(%30) : (tensor<10xf32>) -> ()
    "bufferization.dealloc_tensor"(%32) : (tensor<10xi64>) -> ()
    "bufferization.dealloc_tensor"(%34) : (tensor<10xi64>) -> ()
    "bufferization.dealloc_tensor"(%36) : (tensor<10xi8>) -> ()
    "bufferization.dealloc_tensor"(%38) : (tensor<10xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

