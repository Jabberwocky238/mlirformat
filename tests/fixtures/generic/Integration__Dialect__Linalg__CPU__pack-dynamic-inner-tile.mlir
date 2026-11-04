"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %13 = "tensor.empty"() : () -> tensor<7x16xi32>
    %14 = "arith.constant"() <{value = dense<"0x01000000080000000F000000160000001D000000240000002B000000320000003900000040000000470000004E000000550000005C000000630000006A000000020000000900000010000000170000001E000000250000002C000000330000003A00000041000000480000004F000000560000005D000000640000006B000000030000000A00000011000000180000001F000000260000002D000000340000003B000000420000004900000050000000570000005E000000650000006C000000040000000B000000120000001900000020000000270000002E000000350000003C000000430000004A00000051000000580000005F000000660000006D000000050000000C000000130000001A00000021000000280000002F000000360000003D000000440000004B000000520000005900000060000000670000006E000000060000000D000000140000001B000000220000002900000030000000370000003E000000450000004C000000530000005A00000061000000680000006F000000070000000E000000150000001C000000230000002A00000031000000380000003F000000460000004D000000540000005B000000620000006900000070000000"> : tensor<7x16xi32>}> : () -> tensor<7x16xi32>
    "func.call"(%14) <{callee = @pack}> : (tensor<7x16xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x16xi32>) -> (), sym_name = "pack", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<7x16xi32>):
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 123 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 8 : index}> : () -> index
    %10 = "tensor.empty"(%7, %9) : (index, index) -> tensor<?x16x?x1xi32>
    %11 = "linalg.pack"(%arg1, %10, %8, %9) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: -9223372036854775808, 1>}> : (tensor<7x16xi32>, tensor<?x16x?x1xi32>, i32, index) -> tensor<?x16x?x1xi32>
    %12 = "tensor.cast"(%11) : (tensor<?x16x?x1xi32>) -> tensor<*xi32>
    "func.call"(%12) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "transforms"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.get_parent_op"(%1#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
        "transform.apply_patterns.linalg.decompose_pad"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %3 = "transform.structured.match"(%2) <{ops = ["linalg.fill"]}> : (!transform.op<"func.func">) -> !transform.any_op
      "transform.structured.vectorize"(%3) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> ()
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      %4 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      %6 = "transform.apply_registered_pass"(%5) <{options = {}, pass_name = "buffer-deallocation-pipeline"}> : (!transform.op<"func.func">) -> !transform.op<"func.func">
      "transform.apply_patterns"(%6) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

