#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "sum_reduction_i32"}> ({
  ^bb0(%arg14: tensor<32xi32, #sparse>, %arg15: tensor<i32>):
    %18 = "linalg.generic"(%arg14, %arg15) <{doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: i32, %arg17: i32):
      %19 = "arith.addi"(%arg17, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%19) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%18) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction_f32"}> ({
  ^bb0(%arg10: tensor<32xf32, #sparse>, %arg11: tensor<f32>):
    %16 = "linalg.generic"(%arg10, %arg11) <{doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      %17 = "arith.addf"(%arg13, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    "func.return"(%16) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "or_reduction_i32"}> ({
  ^bb0(%arg6: tensor<32xi32, #sparse>, %arg7: tensor<i32>):
    %14 = "linalg.generic"(%arg6, %arg7) <{doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: i32, %arg9: i32):
      %15 = "arith.ori"(%arg9, %arg8) : (i32, i32) -> i32
      "linalg.yield"(%15) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%14) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "xor_reduction_i32"}> ({
  ^bb0(%arg2: tensor<32xi32, #sparse>, %arg3: tensor<i32>):
    %12 = "linalg.generic"(%arg2, %arg3) <{doc = "x += OPER_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      %13 = "arith.xori"(%arg5, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%12) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg1: tensor<i32>):
    %11 = "tensor.extract"(%arg1) : (tensor<i32>) -> i32
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> (), sym_name = "dump_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %10 = "tensor.extract"(%arg0) : (tensor<f32>) -> f32
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<7> : tensor<i32>}> : () -> tensor<i32>
    %1 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %2 = "arith.constant"() <{value = dense<[0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %3 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.500000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 9.000000e+00]> : tensor<32xf32>}> : () -> tensor<32xf32>
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xi32>) -> tensor<32xi32, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<32xf32>) -> tensor<32xf32, #sparse>
    %6 = "func.call"(%4, %0) <{callee = @sum_reduction_i32}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %7 = "func.call"(%5, %1) <{callee = @sum_reduction_f32}> : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %8 = "func.call"(%4, %0) <{callee = @or_reduction_i32}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %9 = "func.call"(%4, %0) <{callee = @xor_reduction_i32}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.call"(%6) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%7) <{callee = @dump_f32}> : (tensor<f32>) -> ()
    "func.call"(%8) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%9) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<32xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<32xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<f32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

