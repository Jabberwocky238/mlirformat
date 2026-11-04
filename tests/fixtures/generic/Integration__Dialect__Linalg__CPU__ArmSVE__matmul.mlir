#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "matmul_f32"}> ({
    %21 = "arith.constant"() <{value = 3 : index}> : () -> index
    %22 = "arith.constant"() <{value = 5 : index}> : () -> index
    %23 = "arith.constant"() <{value = 15 : index}> : () -> index
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %25 = "bufferization.alloc_tensor"(%22, %21) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %26 = "bufferization.alloc_tensor"(%21, %23) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %27 = "bufferization.alloc_tensor"(%22, %23) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %28 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
    %29 = "linalg.fill"(%28, %25) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32, %arg20: f32):
      "linalg.yield"(%arg19) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %30 = "linalg.fill"(%28, %26) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32, %arg18: f32):
      "linalg.yield"(%arg17) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %31 = "linalg.fill"(%24, %27) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32):
      "linalg.yield"(%arg15) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %32 = "linalg.matmul"(%29, %30, %31) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %34 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %35 = "arith.addf"(%arg14, %34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%35) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %33 = "tensor.cast"(%32) : (tensor<?x?xf32>) -> tensor<*xf32>
    "func.call"(%33) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "matmul_mixed_ty"}> ({
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    %5 = "arith.constant"() <{value = 15 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %8 = "bufferization.alloc_tensor"(%4, %3) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi8>
    %9 = "bufferization.alloc_tensor"(%3, %5) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi8>
    %10 = "bufferization.alloc_tensor"(%4, %5) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xi32>
    %11 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %12 = "linalg.fill"(%11, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i8, %arg11: i8):
      "linalg.yield"(%arg10) : (i8) -> ()
    }) : (i8, tensor<?x?xi8>) -> tensor<?x?xi8>
    %13 = "linalg.fill"(%11, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: i8, %arg9: i8):
      "linalg.yield"(%arg8) : (i8) -> ()
    }) : (i8, tensor<?x?xi8>) -> tensor<?x?xi8>
    %14 = "linalg.fill"(%7, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32):
      "linalg.yield"(%arg6) : (i32) -> ()
    }) : (i32, tensor<?x?xi32>) -> tensor<?x?xi32>
    %15 = "linalg.matmul"(%12, %13, %14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i32):
      %17 = "arith.extsi"(%arg3) : (i8) -> i32
      %18 = "arith.extsi"(%arg4) : (i8) -> i32
      %19 = "arith.muli"(%17, %18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %20 = "arith.addi"(%arg5, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%20) : (i32) -> ()
    }) : (tensor<?x?xi8>, tensor<?x?xi8>, tensor<?x?xi32>) -> tensor<?x?xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: START OF TEST OUTPUT\0A"}> : () -> ()
    %16 = "tensor.cast"(%15) : (tensor<?x?xi32>) -> tensor<*xi32>
    "func.call"(%16) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.op<"func.func">) -> (), sym_name = "tile_and_vectorize_matmul"}> ({
    ^bb0(%arg2: !transform.op<"func.func">):
      %1 = "transform.structured.match"(%arg2) <{ops = ["linalg.matmul"]}> : (!transform.op<"func.func">) -> !transform.any_op
      %2:4 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, true, false>, static_sizes = array<i64: 2, 4, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.structured.vectorize"(%2#0) <{scalable_sizes = array<i1: false, true, false>, static_vector_sizes = array<i64: 2, 4, 1>}> : (!transform.any_op) -> ()
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
        "transform.apply_patterns.vector.sink_ops"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.apply_patterns"(%arg2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.foreach"(%0) ({
      ^bb0(%arg1: !transform.op<"func.func">):
        "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @tile_and_vectorize_matmul}> : (!transform.op<"func.func">) -> ()
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

