"builtin.module"() ({
  "memref.global"() <{initial_value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01], [2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01]]> : tensor<3x4xf32>, sym_name = "gv", sym_visibility = "private", type = memref<3x4xf32>}> : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg24: memref<?x?xf32> loc("<stdin>":8:8), %arg25: index loc("<stdin>":8:33), %arg26: index loc("<stdin>":8:48)):
    %28 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":9:11)
    %29 = "vector.transfer_read"(%arg24, %arg25, %arg26, %28) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index, f32) -> vector<4x9xf32> loc("<stdin>":10:11)
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask"}> ({
  ^bb0(%arg21: memref<?x?xf32> loc("<stdin>":15:8), %arg22: index loc("<stdin>":15:33), %arg23: index loc("<stdin>":15:48)):
    %25 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":16:11)
    %26 = "arith.constant"() <{value = dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>}> : () -> vector<4x9xi1> loc("<stdin>":17:11)
    %27 = "vector.transfer_read"(%arg21, %arg22, %arg23, %25, %26) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index, f32, vector<4x9xi1>) -> vector<4x9xf32> loc("<stdin>":18:11)
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_transposed"}> ({
  ^bb0(%arg18: memref<?x?xf32> loc("<stdin>":23:8), %arg19: index loc("<stdin>":23:33), %arg20: index loc("<stdin>":23:48)):
    %22 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":24:11)
    %23 = "arith.constant"() <{value = dense<[[true, false, true, false, true, true, true, false, true], [false, false, true, true, true, true, true, false, true], [true, true, true, true, true, true, true, false, true], [false, false, true, false, true, true, true, false, true]]> : vector<4x9xi1>}> : () -> vector<4x9xi1> loc("<stdin>":25:11)
    %24 = "vector.transfer_read"(%arg18, %arg19, %arg20, %22, %23) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf32>, index, index, f32, vector<4x9xi1>) -> vector<9x4xf32> loc("<stdin>":26:11)
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<9x4xf32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_broadcast"}> ({
  ^bb0(%arg15: memref<?x?xf32> loc("<stdin>":31:8), %arg16: index loc("<stdin>":31:33), %arg17: index loc("<stdin>":31:48)):
    %19 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":32:11)
    %20 = "arith.constant"() <{value = dense<[true, false, true, false, true, true, true, false, true]> : vector<9xi1>}> : () -> vector<9xi1> loc("<stdin>":33:11)
    %21 = "vector.transfer_read"(%arg15, %arg16, %arg17, %19, %20) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (0, d1)>}> : (memref<?x?xf32>, index, index, f32, vector<9xi1>) -> vector<4x9xf32> loc("<stdin>":34:11)
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> () loc("<stdin>":35:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_transpose_broadcast_last_dim"}> ({
  ^bb0(%arg12: memref<?x?xf32> loc("<stdin>":39:8), %arg13: index loc("<stdin>":39:33), %arg14: index loc("<stdin>":39:48)):
    %16 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":40:11)
    %17 = "arith.constant"() <{value = dense<[true, false, true, true]> : vector<4xi1>}> : () -> vector<4xi1> loc("<stdin>":41:11)
    %18 = "vector.transfer_read"(%arg12, %arg13, %arg14, %16, %17) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d1, 0)>}> : (memref<?x?xf32>, index, index, f32, vector<4xi1>) -> vector<4x9xf32> loc("<stdin>":42:11)
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> () loc("<stdin>":43:5)
    "func.return"() : () -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_transposed"}> ({
  ^bb0(%arg9: memref<?x?xf32> loc("<stdin>":47:8), %arg10: index loc("<stdin>":47:32), %arg11: index loc("<stdin>":47:47)):
    %14 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":48:11)
    %15 = "vector.transfer_read"(%arg9, %arg10, %arg11, %14) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf32>, index, index, f32) -> vector<4x9xf32> loc("<stdin>":49:11)
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":46:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_broadcast"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":54:8), %arg7: index loc("<stdin>":54:32), %arg8: index loc("<stdin>":54:46)):
    %12 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":55:11)
    %13 = "vector.transfer_read"(%arg6, %arg7, %arg8, %12) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1, 0)>}> : (memref<?x?xf32>, index, index, f32) -> vector<4x9xf32> loc("<stdin>":56:11)
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<4x9xf32>) -> () loc("<stdin>":57:5)
    "func.return"() : () -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d"}> ({
  ^bb0(%arg3: memref<?x?xf32> loc("<stdin>":61:8), %arg4: index loc("<stdin>":61:32), %arg5: index loc("<stdin>":61:46)):
    %10 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32 loc("<stdin>":62:11)
    %11 = "vector.broadcast"(%10) : (f32) -> vector<1x4xf32> loc("<stdin>":63:11)
    "vector.transfer_write"(%11, %arg3, %arg4, %arg5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<1x4xf32>, memref<?x?xf32>, index, index) -> () loc("<stdin>":64:5)
    "func.return"() : () -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":60:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_mask"}> ({
  ^bb0(%arg0: memref<?x?xf32> loc("<stdin>":68:8), %arg1: index loc("<stdin>":68:32), %arg2: index loc("<stdin>":68:46)):
    %7 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32 loc("<stdin>":69:10)
    %8 = "arith.constant"() <{value = dense<[[true, false, true, false]]> : vector<1x4xi1>}> : () -> vector<1x4xi1> loc("<stdin>":70:10)
    %9 = "vector.broadcast"(%7) : (f32) -> vector<1x4xf32> loc("<stdin>":71:10)
    "vector.transfer_write"(%9, %arg0, %arg1, %arg2, %8) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<1x4xf32>, memref<?x?xf32>, index, index, vector<1x4xi1>) -> () loc("<stdin>":72:5)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":76:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":77:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":78:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":79:10)
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":80:10)
    %5 = "memref.get_global"() <{name = @gv}> : () -> memref<3x4xf32> loc("<stdin>":81:10)
    %6 = "memref.cast"(%5) : (memref<3x4xf32>) -> memref<?x?xf32> loc("<stdin>":82:10)
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":83:5)
    "func.call"(%6, %3, %2) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":84:5)
    "func.call"(%6, %1, %4) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":85:5)
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":86:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":87:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":88:5)
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d_broadcast}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":89:5)
    "func.call"(%6, %2, %1) <{callee = @transfer_read_2d_mask_broadcast}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":90:5)
    "func.call"(%6, %0, %1) <{callee = @transfer_read_2d_mask_transpose_broadcast_last_dim}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":91:5)
    "func.call"(%6, %1, %2) <{callee = @transfer_write_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":92:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":93:5)
    "func.call"(%6, %0, %2) <{callee = @transfer_write_2d_mask}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":94:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":95:5)
    "func.return"() : () -> () loc("<stdin>":96:5)
  }) : () -> () loc("<stdin>":75:3)
}) : () -> () loc("<stdin>":5:1)
