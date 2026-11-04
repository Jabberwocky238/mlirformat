#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (0, d1)>
#map3 = affine_map<(d0, d1) -> (d1, 0)>
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01], [2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01]]> : tensor<3x4xf32>, sym_name = "gv", sym_visibility = "private", type = memref<3x4xf32>}> : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg24: memref<?x?xf32>, %arg25: index, %arg26: index):
    %28 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %29 = "vector.transfer_read"(%arg24, %arg25, %arg26, %28) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<4x9xf32>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask"}> ({
  ^bb0(%arg21: memref<?x?xf32>, %arg22: index, %arg23: index):
    %25 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %26 = "arith.constant"() <{value = dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>}> : () -> vector<4x9xi1>
    %27 = "vector.transfer_read"(%arg21, %arg22, %arg23, %25, %26) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<4x9xi1>) -> vector<4x9xf32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_transposed"}> ({
  ^bb0(%arg18: memref<?x?xf32>, %arg19: index, %arg20: index):
    %22 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %23 = "arith.constant"() <{value = dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>}> : () -> vector<4x9xi1>
    %24 = "vector.transfer_read"(%arg18, %arg19, %arg20, %22, %23) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32, vector<4x9xi1>) -> vector<9x4xf32>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<9x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_broadcast"}> ({
  ^bb0(%arg15: memref<?x?xf32>, %arg16: index, %arg17: index):
    %19 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %20 = "arith.constant"() <{value = dense<[true, false, true, false, true, true, true, false, true]> : vector<9xi1>}> : () -> vector<9xi1>
    %21 = "vector.transfer_read"(%arg15, %arg16, %arg17, %19, %20) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32, vector<9xi1>) -> vector<4x9xf32>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_transpose_broadcast_last_dim"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: index, %arg14: index):
    %16 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = dense<[true, false, true, true]> : vector<4xi1>}> : () -> vector<4xi1>
    %18 = "vector.transfer_read"(%arg12, %arg13, %arg14, %16, %17) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32, vector<4xi1>) -> vector<4x9xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_transposed"}> ({
  ^bb0(%arg9: memref<?x?xf32>, %arg10: index, %arg11: index):
    %14 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %15 = "vector.transfer_read"(%arg9, %arg10, %arg11, %14) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<4x9xf32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_broadcast"}> ({
  ^bb0(%arg6: memref<?x?xf32>, %arg7: index, %arg8: index):
    %12 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %13 = "vector.transfer_read"(%arg6, %arg7, %arg8, %12) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<4x9xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d"}> ({
  ^bb0(%arg3: memref<?x?xf32>, %arg4: index, %arg5: index):
    %10 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %11 = "vector.broadcast"(%10) : (f32) -> vector<1x4xf32>
    "vector.transfer_write"(%11, %arg3, %arg4, %arg5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_mask"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index):
    %7 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = dense<[[true, false, true, false]]> : vector<1x4xi1>}> : () -> vector<1x4xi1>
    %9 = "vector.broadcast"(%7) : (f32) -> vector<1x4xf32>
    "vector.transfer_write"(%9, %arg0, %arg1, %arg2, %8) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<1x4xf32>, memref<?x?xf32>, index, index, vector<1x4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    %5 = "memref.get_global"() <{name = @gv}> : () -> memref<3x4xf32>
    %6 = "memref.cast"(%5) : (memref<3x4xf32>) -> memref<?x?xf32>
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %3, %2) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %4) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d_broadcast}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %2, %1) <{callee = @transfer_read_2d_mask_broadcast}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %1) <{callee = @transfer_read_2d_mask_transpose_broadcast_last_dim}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_write_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %2) <{callee = @transfer_write_2d_mask}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

