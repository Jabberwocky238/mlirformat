"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_1d"}> ({
  ^bb0(%arg9: memref<?xf32> loc("<stdin>":4:8), %arg10: index loc("<stdin>":4:30)):
    %19 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":5:11)
    %20 = "vector.transfer_read"(%arg9, %arg10, %19) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32) -> vector<13xf32> loc("<stdin>":6:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<13xf32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_mask_1d"}> ({
  ^bb0(%arg7: memref<?xf32> loc("<stdin>":11:8), %arg8: index loc("<stdin>":11:30)):
    %16 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":12:11)
    %17 = "arith.constant"() <{value = dense<[false, false, true, true, true, true, true, true, true, true, false, false, false]> : vector<13xi1>}> : () -> vector<13xi1> loc("<stdin>":13:11)
    %18 = "vector.transfer_read"(%arg7, %arg8, %16, %17) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32, vector<13xi1>) -> vector<13xf32> loc("<stdin>":14:11)
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<13xf32>) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_inbounds_4"}> ({
  ^bb0(%arg5: memref<?xf32> loc("<stdin>":19:8), %arg6: index loc("<stdin>":19:30)):
    %14 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":20:11)
    %15 = "vector.transfer_read"(%arg5, %arg6, %14) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32) -> vector<4xf32> loc("<stdin>":21:11)
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_mask_inbounds_4"}> ({
  ^bb0(%arg3: memref<?xf32> loc("<stdin>":26:8), %arg4: index loc("<stdin>":26:30)):
    %11 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":27:11)
    %12 = "arith.constant"() <{value = dense<[false, true, false, true]> : vector<4xi1>}> : () -> vector<4xi1> loc("<stdin>":28:11)
    %13 = "vector.transfer_read"(%arg3, %arg4, %11, %12) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32, vector<4xi1>) -> vector<4xf32> loc("<stdin>":29:11)
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_write_1d"}> ({
  ^bb0(%arg1: memref<?xf32> loc("<stdin>":34:8), %arg2: index loc("<stdin>":34:30)):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":35:10)
    %10 = "vector.broadcast"(%9) : (f32) -> vector<4xf32> loc("<stdin>":36:11)
    "vector.transfer_write"(%10, %arg1, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<4xf32>, memref<?xf32>, index) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":41:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":42:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":43:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":44:10)
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":45:10)
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":46:10)
    %6 = "memref.alloc"(%5) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":47:10)
    "scf.for"(%0, %5, %1) ({
    ^bb0(%arg0: index loc("<stdin>":49:10)):
      %7 = "arith.index_cast"(%arg0) : (index) -> i32 loc("<stdin>":50:12)
      %8 = "arith.sitofp"(%7) : (i32) -> f32 loc("<stdin>":51:12)
      "memref.store"(%8, %6, %arg0) : (f32, memref<?xf32>, index) -> () loc("<stdin>":52:7)
      "scf.yield"() : () -> () loc("<stdin>":53:7)
    }) : (index, index, index) -> () loc("<stdin>":48:5)
    "func.call"(%6, %2) <{callee = @transfer_read_1d}> : (memref<?xf32>, index) -> () loc("<stdin>":55:5)
    "func.call"(%6, %2) <{callee = @transfer_read_mask_1d}> : (memref<?xf32>, index) -> () loc("<stdin>":56:5)
    "func.call"(%6, %3) <{callee = @transfer_write_1d}> : (memref<?xf32>, index) -> () loc("<stdin>":57:5)
    "func.call"(%6, %0) <{callee = @transfer_read_1d}> : (memref<?xf32>, index) -> () loc("<stdin>":58:5)
    "func.call"(%6, %1) <{callee = @transfer_read_inbounds_4}> : (memref<?xf32>, index) -> () loc("<stdin>":59:5)
    "func.call"(%6, %1) <{callee = @transfer_read_mask_inbounds_4}> : (memref<?xf32>, index) -> () loc("<stdin>":60:5)
    "memref.dealloc"(%6) : (memref<?xf32>) -> () loc("<stdin>":61:5)
    "func.return"() : () -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":40:3)
}) : () -> () loc("<stdin>":2:1)
