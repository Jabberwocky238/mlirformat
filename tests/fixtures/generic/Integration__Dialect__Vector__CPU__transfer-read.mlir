#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_1d"}> ({
  ^bb0(%arg9: memref<?xf32>, %arg10: index):
    %19 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %20 = "vector.transfer_read"(%arg9, %arg10, %19) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<13xf32>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<13xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_mask_1d"}> ({
  ^bb0(%arg7: memref<?xf32>, %arg8: index):
    %16 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = dense<[false, false, true, true, true, true, true, true, true, true, false, false, false]> : vector<13xi1>}> : () -> vector<13xi1>
    %18 = "vector.transfer_read"(%arg7, %arg8, %16, %17) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = #map}> : (memref<?xf32>, index, f32, vector<13xi1>) -> vector<13xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<13xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_inbounds_4"}> ({
  ^bb0(%arg5: memref<?xf32>, %arg6: index):
    %14 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %15 = "vector.transfer_read"(%arg5, %arg6, %14) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<4xf32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_read_mask_inbounds_4"}> ({
  ^bb0(%arg3: memref<?xf32>, %arg4: index):
    %11 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %12 = "arith.constant"() <{value = dense<[false, true, false, true]> : vector<4xi1>}> : () -> vector<4xi1>
    %13 = "vector.transfer_read"(%arg3, %arg4, %11, %12) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = #map}> : (memref<?xf32>, index, f32, vector<4xi1>) -> vector<4xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_write_1d"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: index):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "vector.broadcast"(%9) : (f32) -> vector<4xf32>
    "vector.transfer_write"(%10, %arg1, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    %6 = "memref.alloc"(%5) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%0, %5, %1) ({
    ^bb0(%arg0: index):
      %7 = "arith.index_cast"(%arg0) : (index) -> i32
      %8 = "arith.sitofp"(%7) : (i32) -> f32
      "memref.store"(%8, %6, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%6, %2) <{callee = @transfer_read_1d}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %2) <{callee = @transfer_read_mask_1d}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %3) <{callee = @transfer_write_1d}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %0) <{callee = @transfer_read_1d}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %1) <{callee = @transfer_read_inbounds_4}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %1) <{callee = @transfer_read_mask_inbounds_4}> : (memref<?xf32>, index) -> ()
    "memref.dealloc"(%6) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

