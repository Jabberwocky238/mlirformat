"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>) -> (), sym_name = "gpu_func"}> ({
  ^bb0(%arg0: memref<32xf32> loc("<stdin>":4:8), %arg1: memref<32xf32> loc("<stdin>":4:31)):
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:11)
    %11 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":7:11)
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:11)
    "gpu.launch"(%9, %9, %9, %11, %9, %9) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":10:10), %arg3: index loc("<stdin>":10:24), %arg4: index loc("<stdin>":10:38), %arg5: index loc("<stdin>":10:52), %arg6: index loc("<stdin>":10:66), %arg7: index loc("<stdin>":10:80), %arg8: index loc("<stdin>":10:94), %arg9: index loc("<stdin>":10:108), %arg10: index loc("<stdin>":10:122), %arg11: index loc("<stdin>":10:137), %arg12: index loc("<stdin>":10:152), %arg13: index loc("<stdin>":10:167)):
      "gpu.warp_execute_on_lane_0"(%arg5) <{warp_size = 32 : i64}> ({
        %13 = "vector.transfer_read"(%arg0, %10, %12) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":12:15)
        %14 = "vector.transfer_read"(%arg1, %10, %12) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> {in_bound = [true]} : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":13:15)
        %15 = "arith.addf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32> loc("<stdin>":14:15)
        "vector.transfer_write"(%15, %arg0, %10) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<32xf32>, index) -> () loc("<stdin>":15:9)
        "gpu.yield"() : () -> () loc("<stdin>":16:9)
      }) : (index) -> () loc("<stdin>":11:7)
      "gpu.terminator"() : () -> () loc("<stdin>":18:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":23:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":24:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":25:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":26:10)
    %4 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01, 2.900000e+01, 3.000000e+01, 3.100000e+01]> : vector<32xf32>}> : () -> vector<32xf32> loc("<stdin>":27:10)
    %5 = "arith.constant"() <{value = dense<2.000000e+00> : vector<32xf32>}> : () -> vector<32xf32> loc("<stdin>":28:10)
    "vector.transfer_write"(%4, %2, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<32xf32>, index) -> () loc("<stdin>":29:5)
    "vector.transfer_write"(%5, %3, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<32xf32>, index) -> () loc("<stdin>":30:5)
    %6 = "memref.cast"(%2) : (memref<32xf32>) -> memref<*xf32> loc("<stdin>":31:10)
    "gpu.host_register"(%6) : (memref<*xf32>) -> () loc("<stdin>":32:5)
    %7 = "memref.cast"(%3) : (memref<32xf32>) -> memref<*xf32> loc("<stdin>":33:10)
    "gpu.host_register"(%7) : (memref<*xf32>) -> () loc("<stdin>":34:5)
    "func.call"(%2, %3) <{callee = @gpu_func}> : (memref<32xf32>, memref<32xf32>) -> () loc("<stdin>":35:5)
    %8 = "vector.transfer_read"(%2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":36:10)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":2:1)
