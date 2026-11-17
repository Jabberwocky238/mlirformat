"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>, memref<1xf32>) -> (), sym_name = "gpu_func"}> ({
  ^bb0(%arg1: memref<1024xf32> loc("<stdin>":4:8), %arg2: memref<1xf32> loc("<stdin>":4:33)):
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:11)
    %12 = "arith.constant"() <{value = dense<1.000000e+02> : vector<1xf32>}> : () -> vector<1xf32> loc("<stdin>":6:11)
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:11)
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:11)
    %15 = "arith.constant"() <{value = 1024 : index}> : () -> index loc("<stdin>":9:11)
    %16 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":10:11)
    "gpu.launch"(%11, %11, %11, %16, %11, %11) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index loc("<stdin>":12:10), %arg4: index loc("<stdin>":12:24), %arg5: index loc("<stdin>":12:38), %arg6: index loc("<stdin>":12:52), %arg7: index loc("<stdin>":12:66), %arg8: index loc("<stdin>":12:80), %arg9: index loc("<stdin>":12:94), %arg10: index loc("<stdin>":12:108), %arg11: index loc("<stdin>":12:123), %arg12: index loc("<stdin>":12:138), %arg13: index loc("<stdin>":12:153), %arg14: index loc("<stdin>":12:168)):
      "gpu.warp_execute_on_lane_0"(%arg6) <{warp_size = 32 : i64}> ({
        %17 = "vector.transfer_read"(%arg2, %14, %13) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<1xf32>, index, f32) -> vector<1xf32> loc("<stdin>":14:15)
        %18 = "scf.for"(%14, %15, %16, %17) ({
        ^bb0(%arg15: index loc("<stdin>":16:14), %arg16: vector<1xf32> loc("<stdin>":16:29)):
          %20 = "vector.transfer_read"(%arg1, %arg15, %13) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<1024xf32>, index, f32) -> vector<32xf32> loc("<stdin>":17:17)
          %21 = "vector.reduction"(%20) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<32xf32>) -> f32 loc("<stdin>":18:17)
          %22 = "vector.broadcast"(%21) : (f32) -> vector<1xf32> loc("<stdin>":19:17)
          %23 = "arith.addf"(%22, %arg16) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>, vector<1xf32>) -> vector<1xf32> loc("<stdin>":20:17)
          "scf.yield"(%23) : (vector<1xf32>) -> () loc("<stdin>":21:11)
        }) : (index, index, index, vector<1xf32>) -> vector<1xf32> loc("<stdin>":15:15)
        %19 = "arith.divf"(%18, %12) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>, vector<1xf32>) -> vector<1xf32> loc("<stdin>":23:15)
        "vector.transfer_write"(%19, %arg2, %14) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<1xf32>, memref<1xf32>, index) -> () loc("<stdin>":24:9)
        "gpu.yield"() : () -> () loc("<stdin>":25:9)
      }) : (index) -> () loc("<stdin>":13:7)
      "gpu.terminator"() : () -> () loc("<stdin>":27:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":32:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":33:10)
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":34:10)
    %3 = "arith.constant"() <{value = 1024 : index}> : () -> index loc("<stdin>":35:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32> loc("<stdin>":36:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32> loc("<stdin>":37:10)
    %6 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01, 2.900000e+01, 3.000000e+01, 3.100000e+01]> : vector<32xf32>}> : () -> vector<32xf32> loc("<stdin>":38:10)
    %7 = "arith.constant"() <{value = dense<2.000000e+00> : vector<1xf32>}> : () -> vector<1xf32> loc("<stdin>":39:10)
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index loc("<stdin>":41:10)):
      "vector.transfer_write"(%6, %4, %arg0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<1024xf32>, index) -> () loc("<stdin>":42:7)
      "scf.yield"() : () -> () loc("<stdin>":43:7)
    }) : (index, index, index) -> () loc("<stdin>":40:5)
    "vector.transfer_write"(%7, %5, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<1xf32>, memref<1xf32>, index) -> () loc("<stdin>":45:5)
    %8 = "memref.cast"(%4) : (memref<1024xf32>) -> memref<*xf32> loc("<stdin>":46:10)
    "gpu.host_register"(%8) : (memref<*xf32>) -> () loc("<stdin>":47:5)
    %9 = "memref.cast"(%5) : (memref<1xf32>) -> memref<*xf32> loc("<stdin>":48:10)
    "gpu.host_register"(%9) : (memref<*xf32>) -> () loc("<stdin>":49:5)
    "func.call"(%4, %5) <{callee = @gpu_func}> : (memref<1024xf32>, memref<1xf32>) -> () loc("<stdin>":50:5)
    %10 = "vector.transfer_read"(%5, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<1xf32>, index, f32) -> vector<1xf32> loc("<stdin>":51:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":2:1)
