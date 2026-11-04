#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce_1d_f32"}> ({
    %23 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %25 = "bufferization.alloc_tensor"(%23) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    %26 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<f32>
    %27 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32
    %28 = "linalg.fill"(%27, %25) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      "linalg.yield"(%arg13) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %29 = "tensor.insert"(%24, %26) : (f32, tensor<f32>) -> tensor<f32>
    %30 = "linalg.reduce"(%28, %29) <{dimensions = array<i64: 0>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      %32 = "arith.addf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<f32>) -> tensor<f32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %31 = "tensor.cast"(%30) : (tensor<f32>) -> tensor<*xf32>
    "func.call"(%31) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "reduce_1d_i32"}> ({
    %13 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %15 = "bufferization.alloc_tensor"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xi32>
    %16 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<i32>
    %17 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %18 = "linalg.fill"(%17, %15) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32):
      "linalg.yield"(%arg9) : (i32) -> ()
    }) : (i32, tensor<?xi32>) -> tensor<?xi32>
    %19 = "tensor.insert"(%14, %16) : (i32, tensor<i32>) -> tensor<i32>
    %20 = "linalg.reduce"(%18, %19) <{dimensions = array<i64: 0>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      %22 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%22) : (i32) -> ()
    }) : (tensor<?xi32>, tensor<i32>) -> tensor<i32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %21 = "tensor.cast"(%20) : (tensor<i32>) -> tensor<*xi32>
    "func.call"(%21) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "generic_reduce_1d_f32"}> ({
    %3 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "bufferization.alloc_tensor"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    %6 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<f32>
    %7 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32
    %8 = "linalg.fill"(%7, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %9 = "tensor.insert"(%4, %6) : (f32, tensor<f32>) -> tensor<f32>
    %10 = "linalg.generic"(%8, %9) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %12 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<f32>) -> tensor<f32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %11 = "tensor.cast"(%10) : (tensor<f32>) -> tensor<*xf32>
    "func.call"(%11) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.op<"func.func">) -> (), sym_name = "tile_and_vectorize_reduce"}> ({
    ^bb0(%arg2: !transform.op<"func.func">):
      %1 = "transform.structured.match"(%arg2) <{ops = ["linalg.reduce", "linalg.generic"]}> : (!transform.op<"func.func">) -> !transform.any_op
      %2:2 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: true>, static_sizes = array<i64: 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: true>, static_vector_sizes = array<i64: 4>}> : (!transform.any_op) -> ()
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
        "transform.apply_patterns.vector.lower_multi_reduction"() <{lowering_strategy = 1 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.foreach"(%0) ({
      ^bb0(%arg1: !transform.op<"func.func">):
        "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @tile_and_vectorize_reduce}> : (!transform.op<"func.func">) -> ()
        "transform.yield"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

