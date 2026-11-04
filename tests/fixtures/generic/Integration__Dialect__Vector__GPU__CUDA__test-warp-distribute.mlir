#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>) -> (), sym_name = "gpu_func"}> ({
  ^bb0(%arg0: memref<32xf32>, %arg1: memref<32xf32>):
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 32 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "gpu.launch"(%9, %9, %9, %11, %9, %9) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      "gpu.warp_execute_on_lane_0"(%arg5) <{warp_size = 32 : i64}> ({
        %13 = "vector.transfer_read"(%arg0, %10, %12) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
        %14 = "vector.transfer_read"(%arg1, %10, %12) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> {in_bound = [true]} : (memref<32xf32>, index, f32) -> vector<32xf32>
        %15 = "arith.addf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
        "vector.transfer_write"(%15, %arg0, %10) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<32xf32>, index) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    %4 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01, 2.900000e+01, 3.000000e+01, 3.100000e+01]> : vector<32xf32>}> : () -> vector<32xf32>
    %5 = "arith.constant"() <{value = dense<2.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
    "vector.transfer_write"(%4, %2, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<32xf32>, index) -> ()
    "vector.transfer_write"(%5, %3, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<32xf32>, index) -> ()
    %6 = "memref.cast"(%2) : (memref<32xf32>) -> memref<*xf32>
    "gpu.host_register"(%6) : (memref<*xf32>) -> ()
    %7 = "memref.cast"(%3) : (memref<32xf32>) -> memref<*xf32>
    "gpu.host_register"(%7) : (memref<*xf32>) -> ()
    "func.call"(%2, %3) <{callee = @gpu_func}> : (memref<32xf32>, memref<32xf32>) -> ()
    %8 = "vector.transfer_read"(%2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

