#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024xf32>, memref<1xf32>) -> (), sym_name = "gpu_func"}> ({
  ^bb0(%arg1: memref<1024xf32>, %arg2: memref<1xf32>):
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "arith.constant"() <{value = dense<1.000000e+02> : vector<1xf32>}> : () -> vector<1xf32>
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %16 = "arith.constant"() <{value = 32 : index}> : () -> index
    "gpu.launch"(%11, %11, %11, %16, %11, %11) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index):
      "gpu.warp_execute_on_lane_0"(%arg6) <{warp_size = 32 : i64}> ({
        %17 = "vector.transfer_read"(%arg2, %14, %13) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<1xf32>, index, f32) -> vector<1xf32>
        %18 = "scf.for"(%14, %15, %16, %17) ({
        ^bb0(%arg15: index, %arg16: vector<1xf32>):
          %20 = "vector.transfer_read"(%arg1, %arg15, %13) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<1024xf32>, index, f32) -> vector<32xf32>
          %21 = "vector.reduction"(%20) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<32xf32>) -> f32
          %22 = "vector.broadcast"(%21) : (f32) -> vector<1xf32>
          %23 = "arith.addf"(%22, %arg16) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>, vector<1xf32>) -> vector<1xf32>
          "scf.yield"(%23) : (vector<1xf32>) -> ()
        }) : (index, index, index, vector<1xf32>) -> vector<1xf32>
        %19 = "arith.divf"(%18, %12) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>, vector<1xf32>) -> vector<1xf32>
        "vector.transfer_write"(%19, %arg2, %14) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<1xf32>, memref<1xf32>, index) -> ()
        "gpu.yield"() : () -> ()
      }) : (index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1024 : index}> : () -> index
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1024xf32>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %6 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01, 2.900000e+01, 3.000000e+01, 3.100000e+01]> : vector<32xf32>}> : () -> vector<32xf32>
    %7 = "arith.constant"() <{value = dense<2.000000e+00> : vector<1xf32>}> : () -> vector<1xf32>
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg0: index):
      "vector.transfer_write"(%6, %4, %arg0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<1024xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "vector.transfer_write"(%7, %5, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<1xf32>, memref<1xf32>, index) -> ()
    %8 = "memref.cast"(%4) : (memref<1024xf32>) -> memref<*xf32>
    "gpu.host_register"(%8) : (memref<*xf32>) -> ()
    %9 = "memref.cast"(%5) : (memref<1xf32>) -> memref<*xf32>
    "gpu.host_register"(%9) : (memref<*xf32>) -> ()
    "func.call"(%4, %5) <{callee = @gpu_func}> : (memref<1024xf32>, memref<1xf32>) -> ()
    %10 = "vector.transfer_read"(%5, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<1xf32>, index, f32) -> vector<1xf32>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

