#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce_2d_f32"}> ({
    %25 = "arith.constant"() <{value = 16 : index}> : () -> index
    %26 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %28 = "bufferization.alloc_tensor"(%25, %26) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %29 = "bufferization.alloc_tensor"(%25) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    %30 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32
    %31 = "linalg.fill"(%30, %28) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32, %arg20: f32):
      "linalg.yield"(%arg19) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %32 = "linalg.fill"(%27, %29) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32, %arg18: f32):
      "linalg.yield"(%arg17) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %33 = "linalg.reduce"(%31, %32) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32):
      %35 = "arith.addf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %34 = "tensor.cast"(%33) : (tensor<?xf32>) -> tensor<*xf32>
    "func.call"(%34) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "generic_reduce_2d_f32"}> ({
    %14 = "arith.constant"() <{value = 16 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %16 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %17 = "bufferization.alloc_tensor"(%14, %15) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %18 = "bufferization.alloc_tensor"(%14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    %19 = "arith.constant"() <{value = 3.141600e+00 : f32}> : () -> f32
    %20 = "linalg.fill"(%19, %17) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      "linalg.yield"(%arg13) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %21 = "linalg.fill"(%16, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      "linalg.yield"(%arg11) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %22 = "linalg.generic"(%20, %21) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      %24 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %23 = "tensor.cast"(%22) : (tensor<?xf32>) -> tensor<*xf32>
    "func.call"(%23) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "generic_reduce_2d_i32"}> ({
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %6 = "bufferization.alloc_tensor"(%3, %4) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi32>
    %7 = "bufferization.alloc_tensor"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xi32>
    %8 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %9 = "linalg.fill"(%8, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      "linalg.yield"(%arg7) : (i32) -> ()
    }) : (i32, tensor<?x?xi32>) -> tensor<?x?xi32>
    %10 = "linalg.fill"(%5, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32):
      "linalg.yield"(%arg5) : (i32) -> ()
    }) : (i32, tensor<?xi32>) -> tensor<?xi32>
    %11 = "linalg.generic"(%9, %10) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %13 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?xi32>) -> tensor<?xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %12 = "tensor.cast"(%11) : (tensor<?xi32>) -> tensor<*xi32>
    "func.call"(%12) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.op<"func.func">) -> (), sym_name = "tile_and_vectorize_reduce"}> ({
    ^bb0(%arg2: !transform.op<"func.func">):
      %1 = "transform.structured.match"(%arg2) <{ops = ["linalg.reduce", "linalg.generic"]}> : (!transform.op<"func.func">) -> !transform.any_op
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, true>, static_sizes = array<i64: 1, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: false, true>, static_vector_sizes = array<i64: 1, 4>}> : (!transform.any_op) -> ()
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

