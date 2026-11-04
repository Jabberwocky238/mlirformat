#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (0)>
"builtin.module"() ({
  "memref.global"() <{initial_value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01], [2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01], [3.000000e+01, 3.100000e+01, 3.200000e+01, 3.300000e+01, 3.400000e+01, 3.500000e+01], [4.000000e+01, 4.100000e+01, 4.200000e+01, 4.300000e+01, 4.400000e+01, 4.500000e+01]]> : tensor<5x6xf32>, sym_name = "gv", sym_visibility = "private", type = memref<5x6xf32>}> : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_1d"}> ({
  ^bb0(%arg26: memref<?x?xf32>, %arg27: index, %arg28: index):
    %46 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %47 = "vector.transfer_read"(%arg26, %arg27, %arg28, %46) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<9xf32>
    "vector.print"(%47) <{punctuation = #vector.punctuation<newline>}> : (vector<9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "transfer_read_1d_unit_stride"}> ({
  ^bb0(%arg23: memref<?x?xf32>):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index
    %37 = "arith.constant"() <{value = 1 : index}> : () -> index
    %38 = "arith.constant"() <{value = 2 : index}> : () -> index
    %39 = "arith.constant"() <{value = 3 : index}> : () -> index
    %40 = "arith.constant"() <{value = 4 : index}> : () -> index
    %41 = "arith.constant"() <{value = 5 : index}> : () -> index
    %42 = "arith.constant"() <{value = 6 : index}> : () -> index
    %43 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    "scf.for"(%37, %41, %38) ({
    ^bb0(%arg24: index):
      "scf.for"(%36, %42, %39) ({
      ^bb0(%arg25: index):
        %44 = "memref.subview"(%arg23, %arg24, %arg25) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<1x2xf32, strided<[?, 1], offset: ?>>
        %45 = "vector.transfer_read"(%44, %36, %36, %43) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<1x2xf32, strided<[?, 1], offset: ?>>, index, index, f32) -> vector<2xf32>
        "vector.print"(%45) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "transfer_read_1d_non_static_unit_stride"}> ({
  ^bb0(%arg22: memref<?x?xf32>):
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "arith.constant"() <{value = 2 : index}> : () -> index
    %31 = "arith.constant"() <{value = 4 : index}> : () -> index
    %32 = "arith.constant"() <{value = 6 : index}> : () -> index
    %33 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %34 = "memref.reinterpret_cast"(%arg22, %32, %31, %32, %32, %29) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32>, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    %35 = "vector.transfer_read"(%34, %30, %29, %33) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index, f32) -> vector<4xf32>
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "transfer_read_1d_non_unit_stride"}> ({
  ^bb0(%arg21: memref<?x?xf32>):
    %24 = "memref.reinterpret_cast"(%arg21) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4, 3>, static_strides = array<i64: 6, 2>}> : (memref<?x?xf32>) -> memref<4x3xf32, strided<[6, 2]>>
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "arith.constant"() <{value = 2 : index}> : () -> index
    %27 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %28 = "vector.transfer_read"(%24, %26, %25, %27) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<4x3xf32, strided<[6, 2]>>, index, index, f32) -> vector<3xf32>
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_1d_broadcast"}> ({
  ^bb0(%arg18: memref<?x?xf32>, %arg19: index, %arg20: index):
    %22 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %23 = "vector.transfer_read"(%arg18, %arg19, %arg20, %22) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<9xf32>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_1d_in_bounds"}> ({
  ^bb0(%arg15: memref<?x?xf32>, %arg16: index, %arg17: index):
    %20 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %21 = "vector.transfer_read"(%arg15, %arg16, %arg17, %20) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<3xf32>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_1d_mask"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: index, %arg14: index):
    %17 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %18 = "arith.constant"() <{value = dense<[true, false, true, false, true, true, true, false, true]> : vector<9xi1>}> : () -> vector<9xi1>
    %19 = "vector.transfer_read"(%arg12, %arg13, %arg14, %17, %18) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<9xi1>) -> vector<9xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<9xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_1d_out_of_bounds"}> ({
  ^bb0(%arg9: memref<?x?xf32>, %arg10: index, %arg11: index):
    %15 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %16 = "vector.transfer_read"(%arg9, %arg10, %arg11, %15) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<3xf32>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_1d_mask_in_bounds"}> ({
  ^bb0(%arg6: memref<?x?xf32>, %arg7: index, %arg8: index):
    %12 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = dense<[true, false, true]> : vector<3xi1>}> : () -> vector<3xi1>
    %14 = "vector.transfer_read"(%arg6, %arg7, %arg8, %12, %13) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<3xi1>) -> vector<3xf32>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_1d"}> ({
  ^bb0(%arg3: memref<?x?xf32>, %arg4: index, %arg5: index):
    %10 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %11 = "vector.broadcast"(%10) : (f32) -> vector<7xf32>
    "vector.transfer_write"(%11, %arg3, %arg4, %arg5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<7xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_1d_mask"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index):
    %7 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %8 = "vector.broadcast"(%7) : (f32) -> vector<7xf32>
    %9 = "arith.constant"() <{value = dense<[true, false, true, false, true, true, true]> : vector<7xi1>}> : () -> vector<7xi1>
    "vector.transfer_write"(%8, %arg0, %arg1, %arg2, %9) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<7xf32>, memref<?x?xf32>, index, index, vector<7xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    %5 = "memref.get_global"() <{name = @gv}> : () -> memref<5x6xf32>
    %6 = "memref.cast"(%5) : (memref<5x6xf32>) -> memref<?x?xf32>
    "func.call"(%6, %1, %2) <{callee = @transfer_read_1d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6) <{callee = @transfer_read_1d_unit_stride}> : (memref<?x?xf32>) -> ()
    "func.call"(%6) <{callee = @transfer_read_1d_non_static_unit_stride}> : (memref<?x?xf32>) -> ()
    "func.call"(%6, %4, %1) <{callee = @transfer_read_1d_out_of_bounds}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6) <{callee = @transfer_read_1d_non_unit_stride}> : (memref<?x?xf32>) -> ()
    "func.call"(%6, %3, %2) <{callee = @transfer_write_1d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %2) <{callee = @transfer_read_1d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_1d_broadcast}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_1d_in_bounds}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_1d_mask}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_1d_mask_in_bounds}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %0) <{callee = @transfer_write_1d_mask}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_1d}> : (memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

