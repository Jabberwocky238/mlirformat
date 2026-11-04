"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %13 = "tensor.empty"() : () -> tensor<7x3xi32>
    %14 = "arith.constant"() <{value = dense<[[[[1], [2], [3], [4], [5], [6], [7], [123]], [[8], [9], [10], [11], [12], [13], [14], [123]], [[15], [16], [17], [18], [19], [20], [21], [123]]]]> : tensor<1x3x8x1xi32>}> : () -> tensor<1x3x8x1xi32>
    %15 = "tensor.cast"(%14) : (tensor<1x3x8x1xi32>) -> tensor<?x3x?x1xi32>
    "func.call"(%15) <{callee = @unpack}> : (tensor<?x3x?x1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>) -> (), sym_name = "unpack", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32>):
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 123 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 8 : index}> : () -> index
    %10 = "tensor.empty"() : () -> tensor<7x3xi32>
    %11 = "linalg.unpack"(%arg1, %10, %9) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, 1>}> : (tensor<?x3x?x1xi32>, tensor<7x3xi32>, index) -> tensor<7x3xi32>
    %12 = "tensor.cast"(%11) : (tensor<7x3xi32>) -> tensor<*xi32>
    "func.call"(%12) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "transforms"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 8 : i64}> : () -> !transform.param<i64>
      %2:3 = "transform.structured.tile_using_for"(%0, %1) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: -9223372036854775808, 1>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = "transform.get_parent_op"(%2#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%3) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %4 = "transform.structured.match"(%3) <{ops = ["tensor.insert_slice"]}> : (!transform.op<"func.func">) -> !transform.any_op
      "transform.structured.vectorize"(%4) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      %5 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %6 = "transform.structured.match"(%5) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%6) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

