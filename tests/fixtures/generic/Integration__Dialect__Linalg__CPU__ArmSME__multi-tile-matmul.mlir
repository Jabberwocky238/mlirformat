#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg5: tensor<?x?xf32>, %arg6: tensor<?x?xf32>, %arg7: tensor<?x?xf32>):
    %14 = "linalg.matmul"(%arg5, %arg6, %arg7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %16 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.addf"(%arg10, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %15 = "tensor.cast"(%14) : (tensor<?x?xf32>) -> tensor<*xf32>
    "func.call"(%15) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %4 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%4) <{callee = @setArmSVLBits}> : (i32) -> ()
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 7 : index}> : () -> index
    %7 = "arith.constant"() <{value = dense<[[1.000000e+00, 8.000000e+00, 1.500000e+01, 2.200000e+01, 2.900000e+01, 3.600000e+01, 4.300000e+01, 5.000000e+01, 5.700000e+01, 6.400000e+01, 7.100000e+01, 7.800000e+01, 8.500000e+01], [2.000000e+00, 9.000000e+00, 1.600000e+01, 2.300000e+01, 3.000000e+01, 3.700000e+01, 4.400000e+01, 5.100000e+01, 5.800000e+01, 6.500000e+01, 7.200000e+01, 7.900000e+01, 8.600000e+01], [3.000000e+00, 1.000000e+01, 1.700000e+01, 2.400000e+01, 3.100000e+01, 3.800000e+01, 4.500000e+01, 5.200000e+01, 5.900000e+01, 6.600000e+01, 7.300000e+01, 8.000000e+01, 8.700000e+01], [4.000000e+00, 1.100000e+01, 1.800000e+01, 2.500000e+01, 3.200000e+01, 3.900000e+01, 4.600000e+01, 5.300000e+01, 6.000000e+01, 6.700000e+01, 7.400000e+01, 8.100000e+01, 8.800000e+01], [5.000000e+00, 1.200000e+01, 1.900000e+01, 2.600000e+01, 3.300000e+01, 4.000000e+01, 4.700000e+01, 5.400000e+01, 6.100000e+01, 6.800000e+01, 7.500000e+01, 8.200000e+01, 8.900000e+01], [6.000000e+00, 1.300000e+01, 2.000000e+01, 2.700000e+01, 3.400000e+01, 4.100000e+01, 4.800000e+01, 5.500000e+01, 6.200000e+01, 6.900000e+01, 7.600000e+01, 8.300000e+01, 9.000000e+01], [7.000000e+00, 1.400000e+01, 2.100000e+01, 2.800000e+01, 3.500000e+01, 4.200000e+01, 4.900000e+01, 5.600000e+01, 6.300000e+01, 7.000000e+01, 7.700000e+01, 8.400000e+01, 9.100000e+01]]> : tensor<7x13xf32>}> : () -> tensor<7x13xf32>
    %8 = "tensor.empty"() : () -> tensor<13x7xf32>
    %9 = "linalg.transpose"(%7, %8) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<7x13xf32>, tensor<13x7xf32>) -> tensor<13x7xf32>
    %10 = "tensor.cast"(%7) : (tensor<7x13xf32>) -> tensor<?x?xf32>
    %11 = "tensor.cast"(%9) : (tensor<13x7xf32>) -> tensor<?x?xf32>
    %12 = "bufferization.alloc_tensor"(%6, %6) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %13 = "linalg.fill"(%5, %12) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.call"(%10, %11, %13) <{callee = @matmul}> : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: true, true, false>, static_sizes = array<i64: 8, 8, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      "transform.structured.vectorize"(%1#0) <{scalable_sizes = array<i1: true, true, false>, static_vector_sizes = array<i64: 8, 8, 4>}> : (!transform.any_op) -> ()
      %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.match"(%2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
        "transform.apply_patterns.vector.lower_masks"() : () -> ()
        "transform.apply_patterns.vector.rank_reducing_subview_patterns"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

