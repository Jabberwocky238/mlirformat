"builtin.module"() ({
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x1x5xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape"}> ({
  ^bb0(%arg33: tensor<60xf32>):
    %43 = "tensor.expand_shape"(%arg33) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %44 = "tensor.extract_slice"(%43) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>) -> tensor<1x1x5xf32>
    "func.return"(%44) : (tensor<1x1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x2x5xf32>, sym_name = "no_bubble_up_extract_slice_on_non_contiguous"}> ({
  ^bb0(%arg32: tensor<60xf32>):
    %41 = "tensor.expand_shape"(%arg32) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %42 = "tensor.extract_slice"(%41) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5>, static_sizes = array<i64: 1, 2, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>) -> tensor<1x2x5xf32>
    "func.return"(%42) : (tensor<1x2x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x1x5xf32>, sym_name = "no_bubble_up_extract_slice_on_stride"}> ({
  ^bb0(%arg31: tensor<60xf32>):
    %39 = "tensor.expand_shape"(%arg31) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %40 = "tensor.extract_slice"(%39) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 2>}> : (tensor<2x3x10xf32>) -> tensor<1x1x5xf32>
    "func.return"(%40) : (tensor<1x1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x5xf32>, sym_name = "no_bubble_up_extract_slice_on_rank_reducing"}> ({
  ^bb0(%arg30: tensor<60xf32>):
    %37 = "tensor.expand_shape"(%arg30) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %38 = "tensor.extract_slice"(%37) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>) -> tensor<1x5xf32>
    "func.return"(%38) : (tensor<1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<120x56xf32>) -> tensor<1x2x10x1x4xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape_multiple_expanded_dims"}> ({
  ^bb0(%arg29: tensor<120x56xf32>):
    %35 = "tensor.expand_shape"(%arg29) <{reassociation = [[0, 1, 2], [3, 4]], static_output_shape = array<i64: 3, 4, 10, 7, 8>}> : (tensor<120x56xf32>) -> tensor<3x4x10x7x8xf32>
    %36 = "tensor.extract_slice"(%35) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 2, 10, 1, 4>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (tensor<3x4x10x7x8xf32>) -> tensor<1x2x10x1x4xf32>
    "func.return"(%36) : (tensor<1x2x10x1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<2x5x2xf32>, sym_name = "bubble_up_extract_slice_with_trailing_full_dims"}> ({
  ^bb0(%arg28: tensor<60xf32>):
    %33 = "tensor.expand_shape"(%arg28) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 6, 5, 2>}> : (tensor<60xf32>) -> tensor<6x5x2xf32>
    %34 = "tensor.extract_slice"(%33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 2, 5, 2>, static_strides = array<i64: 1, 1, 1>}> : (tensor<6x5x2xf32>) -> tensor<2x5x2xf32>
    "func.return"(%34) : (tensor<2x5x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>, index, index) -> tensor<1x1x5xf32>, sym_name = "bubble_up_extract_slice_dont_fold_linearize_index"}> ({
  ^bb0(%arg25: tensor<60xf32>, %arg26: index, %arg27: index):
    %31 = "tensor.expand_shape"(%arg25) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %32 = "tensor.extract_slice"(%31, %arg26, %arg27) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 5>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>, index, index) -> tensor<1x1x5xf32>
    "func.return"(%32) : (tensor<1x1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60x12xf32>) -> tensor<1x1x5x12xf32>, sym_name = "bubble_up_extract_slice_not_all_dims_expanded"}> ({
  ^bb0(%arg24: tensor<60x12xf32>):
    %29 = "tensor.expand_shape"(%arg24) <{reassociation = [[0, 1, 2], [3]], static_output_shape = array<i64: 2, 3, 10, 12>}> : (tensor<60x12xf32>) -> tensor<2x3x10x12xf32>
    %30 = "tensor.extract_slice"(%29) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5, 0>, static_sizes = array<i64: 1, 1, 5, 12>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<2x3x10x12xf32>) -> tensor<1x1x5x12xf32>
    "func.return"(%30) : (tensor<1x1x5x12xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>, index) -> tensor<?x5x2xf32>, sym_name = "bubble_up_extract_slice_affine_apply_not_folded"}> ({
  ^bb0(%arg22: tensor<60xf32>, %arg23: index):
    %27 = "tensor.expand_shape"(%arg22) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 6, 5, 2>}> : (tensor<60xf32>) -> tensor<6x5x2xf32>
    %28 = "tensor.extract_slice"(%27, %arg23) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, 5, 2>, static_strides = array<i64: 1, 1, 1>}> : (tensor<6x5x2xf32>, index) -> tensor<?x5x2xf32>
    "func.return"(%28) : (tensor<?x5x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x2xf32>) -> tensor<1xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_single_reassoc_group"}> ({
  ^bb0(%arg21: tensor<6x5x2xf32>):
    %25 = "tensor.collapse_shape"(%arg21) <{reassociation = [[0, 1, 2]]}> : (tensor<6x5x2xf32>) -> tensor<60xf32>
    %26 = "tensor.extract_slice"(%25) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<1xf32>
    "func.return"(%26) : (tensor<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x3x10xf32>) -> tensor<15x10xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_multiple_reassoc_group"}> ({
  ^bb0(%arg20: tensor<6x5x3x10xf32>):
    %23 = "tensor.collapse_shape"(%arg20) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<6x5x3x10xf32>) -> tensor<30x30xf32>
    %24 = "tensor.extract_slice"(%23) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 5, 10>, static_sizes = array<i64: 15, 10>, static_strides = array<i64: 1, 1>}> : (tensor<30x30xf32>) -> tensor<15x10xf32>
    "func.return"(%24) : (tensor<15x10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x2xf32>) -> tensor<4xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_offset_on_leading_dim"}> ({
  ^bb0(%arg19: tensor<6x5x2xf32>):
    %21 = "tensor.collapse_shape"(%arg19) <{reassociation = [[0, 1, 2]]}> : (tensor<6x5x2xf32>) -> tensor<60xf32>
    %22 = "tensor.extract_slice"(%21) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 20>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<4xf32>
    "func.return"(%22) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x1xf32>, index) -> tensor<?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_size"}> ({
  ^bb0(%arg17: tensor<1x5x1xf32>, %arg18: index):
    %19 = "tensor.collapse_shape"(%arg17) <{reassociation = [[0, 1, 2]]}> : (tensor<1x5x1xf32>) -> tensor<5xf32>
    %20 = "tensor.extract_slice"(%19, %arg18) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<5xf32>, index) -> tensor<?xf32>
    "func.return"(%20) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x1xf32>, index) -> tensor<?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_size_and_src"}> ({
  ^bb0(%arg15: tensor<1x?x1xf32>, %arg16: index):
    %17 = "tensor.collapse_shape"(%arg15) <{reassociation = [[0, 1, 2]]}> : (tensor<1x?x1xf32>) -> tensor<?xf32>
    %18 = "tensor.extract_slice"(%17, %arg16) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index) -> tensor<?xf32>
    "func.return"(%18) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x1xf32>, index) -> tensor<3xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_offset"}> ({
  ^bb0(%arg13: tensor<1x5x1xf32>, %arg14: index):
    %15 = "tensor.collapse_shape"(%arg13) <{reassociation = [[0, 1, 2]]}> : (tensor<1x5x1xf32>) -> tensor<5xf32>
    %16 = "tensor.extract_slice"(%15, %arg14) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 3>, static_strides = array<i64: 1>}> : (tensor<5xf32>, index) -> tensor<3xf32>
    "func.return"(%16) : (tensor<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<14x1xf32>, index, index) -> tensor<?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_offset_and_size"}> ({
  ^bb0(%arg10: tensor<14x1xf32>, %arg11: index, %arg12: index):
    %13 = "tensor.collapse_shape"(%arg10) <{reassociation = [[0, 1]]}> : (tensor<14x1xf32>) -> tensor<14xf32>
    %14 = "tensor.extract_slice"(%13, %arg11, %arg12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<14xf32>, index, index) -> tensor<?xf32>
    "func.return"(%14) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x10x1x1x40xf32>, index, index) -> tensor<20x?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_and_static_groups"}> ({
  ^bb0(%arg7: tensor<5x10x1x1x40xf32>, %arg8: index, %arg9: index):
    %11 = "tensor.collapse_shape"(%arg7) <{reassociation = [[0, 1], [2, 3, 4]]}> : (tensor<5x10x1x1x40xf32>) -> tensor<50x40xf32>
    %12 = "tensor.extract_slice"(%11, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 10, -9223372036854775808>, static_sizes = array<i64: 20, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<50x40xf32>, index, index) -> tensor<20x?xf32>
    "func.return"(%12) : (tensor<20x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>) -> tensor<15xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_non_contiguous_1"}> ({
  ^bb0(%arg6: tensor<2x3x10xf32>):
    %9 = "tensor.collapse_shape"(%arg6) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %10 = "tensor.extract_slice"(%9) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 15>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<15xf32>
    "func.return"(%10) : (tensor<15xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>) -> tensor<20xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_non_contiguous_2"}> ({
  ^bb0(%arg5: tensor<2x3x10xf32>):
    %7 = "tensor.collapse_shape"(%arg5) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %8 = "tensor.extract_slice"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 20>, static_sizes = array<i64: 20>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<20xf32>
    "func.return"(%8) : (tensor<20xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>) -> tensor<5xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_stride"}> ({
  ^bb0(%arg4: tensor<2x3x10xf32>):
    %5 = "tensor.collapse_shape"(%arg4) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %6 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5>, static_strides = array<i64: 2>}> : (tensor<60xf32>) -> tensor<5xf32>
    "func.return"(%6) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x2x1xf32>) -> tensor<1xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_rank_reducing"}> ({
  ^bb0(%arg3: tensor<6x5x2x1xf32>):
    %3 = "tensor.collapse_shape"(%arg3) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<6x5x2x1xf32>) -> tensor<60x1xf32>
    %4 = "tensor.extract_slice"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<60x1xf32>) -> tensor<1xf32>
    "func.return"(%4) : (tensor<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x2xf32>, index) -> tensor<?xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_unsupported_dynamic"}> ({
  ^bb0(%arg1: tensor<1x5x2xf32>, %arg2: index):
    %1 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1, 2]]}> : (tensor<1x5x2xf32>) -> tensor<10xf32>
    %2 = "tensor.extract_slice"(%1, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<10xf32>, index) -> tensor<?xf32>
    "func.return"(%2) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.bubble_up_extract_slice"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

