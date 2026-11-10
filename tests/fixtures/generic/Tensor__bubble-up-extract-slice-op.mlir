#map = affine_map<()[s0] -> (s0 * 5)>
#map1 = affine_map<()[s0] -> (s0 * 8)>
#map2 = affine_map<()[s0] -> (s0 * 4)>
#map3 = affine_map<()[s0] -> (s0 * 3)>
#map4 = affine_map<()[s0] -> (s0 * 2)>
#map5 = affine_map<()[s0] -> (s0 * 12)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x1x5xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape"}> ({
  ^bb0(%arg58: tensor<60xf32>):
    %77 = "tensor.expand_shape"(%arg58) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %78 = "tensor.extract_slice"(%77) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>) -> tensor<1x1x5xf32>
    "func.return"(%78) : (tensor<1x1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x2x5xf32>, sym_name = "no_bubble_up_extract_slice_on_non_contiguous"}> ({
  ^bb0(%arg57: tensor<60xf32>):
    %75 = "tensor.expand_shape"(%arg57) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %76 = "tensor.extract_slice"(%75) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5>, static_sizes = array<i64: 1, 2, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>) -> tensor<1x2x5xf32>
    "func.return"(%76) : (tensor<1x2x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x1x5xf32>, sym_name = "no_bubble_up_extract_slice_on_stride"}> ({
  ^bb0(%arg56: tensor<60xf32>):
    %73 = "tensor.expand_shape"(%arg56) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %74 = "tensor.extract_slice"(%73) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 2>}> : (tensor<2x3x10xf32>) -> tensor<1x1x5xf32>
    "func.return"(%74) : (tensor<1x1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<1x5xf32>, sym_name = "no_bubble_up_extract_slice_on_rank_reducing"}> ({
  ^bb0(%arg55: tensor<60xf32>):
    %71 = "tensor.expand_shape"(%arg55) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %72 = "tensor.extract_slice"(%71) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>) -> tensor<1x5xf32>
    "func.return"(%72) : (tensor<1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<120x56xf32>) -> tensor<1x2x10x1x4xf32>, sym_name = "bubble_up_extract_slice_through_expand_shape_multiple_expanded_dims"}> ({
  ^bb0(%arg54: tensor<120x56xf32>):
    %69 = "tensor.expand_shape"(%arg54) <{reassociation = [[0, 1, 2], [3, 4]], static_output_shape = array<i64: 3, 4, 10, 7, 8>}> : (tensor<120x56xf32>) -> tensor<3x4x10x7x8xf32>
    %70 = "tensor.extract_slice"(%69) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 2, 10, 1, 4>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (tensor<3x4x10x7x8xf32>) -> tensor<1x2x10x1x4xf32>
    "func.return"(%70) : (tensor<1x2x10x1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>) -> tensor<2x5x2xf32>, sym_name = "bubble_up_extract_slice_with_trailing_full_dims"}> ({
  ^bb0(%arg53: tensor<60xf32>):
    %67 = "tensor.expand_shape"(%arg53) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 6, 5, 2>}> : (tensor<60xf32>) -> tensor<6x5x2xf32>
    %68 = "tensor.extract_slice"(%67) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 2, 5, 2>, static_strides = array<i64: 1, 1, 1>}> : (tensor<6x5x2xf32>) -> tensor<2x5x2xf32>
    "func.return"(%68) : (tensor<2x5x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>, index, index) -> tensor<1x1x5xf32>, sym_name = "bubble_up_extract_slice_dont_fold_linearize_index"}> ({
  ^bb0(%arg50: tensor<60xf32>, %arg51: index, %arg52: index):
    %65 = "tensor.expand_shape"(%arg50) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 2, 3, 10>}> : (tensor<60xf32>) -> tensor<2x3x10xf32>
    %66 = "tensor.extract_slice"(%65, %arg51, %arg52) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 5>, static_sizes = array<i64: 1, 1, 5>, static_strides = array<i64: 1, 1, 1>}> : (tensor<2x3x10xf32>, index, index) -> tensor<1x1x5xf32>
    "func.return"(%66) : (tensor<1x1x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60x12xf32>) -> tensor<1x1x5x12xf32>, sym_name = "bubble_up_extract_slice_not_all_dims_expanded"}> ({
  ^bb0(%arg49: tensor<60x12xf32>):
    %63 = "tensor.expand_shape"(%arg49) <{reassociation = [[0, 1, 2], [3]], static_output_shape = array<i64: 2, 3, 10, 12>}> : (tensor<60x12xf32>) -> tensor<2x3x10x12xf32>
    %64 = "tensor.extract_slice"(%63) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 5, 0>, static_sizes = array<i64: 1, 1, 5, 12>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<2x3x10x12xf32>) -> tensor<1x1x5x12xf32>
    "func.return"(%64) : (tensor<1x1x5x12xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<60xf32>, index) -> tensor<?x5x2xf32>, sym_name = "bubble_up_extract_slice_affine_apply_not_folded"}> ({
  ^bb0(%arg47: tensor<60xf32>, %arg48: index):
    %61 = "tensor.expand_shape"(%arg47) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 6, 5, 2>}> : (tensor<60xf32>) -> tensor<6x5x2xf32>
    %62 = "tensor.extract_slice"(%61, %arg48) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, 5, 2>, static_strides = array<i64: 1, 1, 1>}> : (tensor<6x5x2xf32>, index) -> tensor<?x5x2xf32>
    "func.return"(%62) : (tensor<?x5x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x2xf32>) -> tensor<1xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_single_reassoc_group"}> ({
  ^bb0(%arg46: tensor<6x5x2xf32>):
    %59 = "tensor.collapse_shape"(%arg46) <{reassociation = [[0, 1, 2]]}> : (tensor<6x5x2xf32>) -> tensor<60xf32>
    %60 = "tensor.extract_slice"(%59) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<1xf32>
    "func.return"(%60) : (tensor<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x3x10xf32>) -> tensor<15x10xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_multiple_reassoc_group"}> ({
  ^bb0(%arg45: tensor<6x5x3x10xf32>):
    %57 = "tensor.collapse_shape"(%arg45) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<6x5x3x10xf32>) -> tensor<30x30xf32>
    %58 = "tensor.extract_slice"(%57) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 5, 10>, static_sizes = array<i64: 15, 10>, static_strides = array<i64: 1, 1>}> : (tensor<30x30xf32>) -> tensor<15x10xf32>
    "func.return"(%58) : (tensor<15x10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x2xf32>) -> tensor<4xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_offset_on_leading_dim"}> ({
  ^bb0(%arg44: tensor<6x5x2xf32>):
    %55 = "tensor.collapse_shape"(%arg44) <{reassociation = [[0, 1, 2]]}> : (tensor<6x5x2xf32>) -> tensor<60xf32>
    %56 = "tensor.extract_slice"(%55) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 20>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<4xf32>
    "func.return"(%56) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x1xf32>, index) -> tensor<?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_size"}> ({
  ^bb0(%arg42: tensor<1x5x1xf32>, %arg43: index):
    %53 = "tensor.collapse_shape"(%arg42) <{reassociation = [[0, 1, 2]]}> : (tensor<1x5x1xf32>) -> tensor<5xf32>
    %54 = "tensor.extract_slice"(%53, %arg43) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<5xf32>, index) -> tensor<?xf32>
    "func.return"(%54) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?x1xf32>, index) -> tensor<?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_size_and_src"}> ({
  ^bb0(%arg40: tensor<1x?x1xf32>, %arg41: index):
    %51 = "tensor.collapse_shape"(%arg40) <{reassociation = [[0, 1, 2]]}> : (tensor<1x?x1xf32>) -> tensor<?xf32>
    %52 = "tensor.extract_slice"(%51, %arg41) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index) -> tensor<?xf32>
    "func.return"(%52) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x1xf32>, index) -> tensor<3xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_offset"}> ({
  ^bb0(%arg38: tensor<1x5x1xf32>, %arg39: index):
    %49 = "tensor.collapse_shape"(%arg38) <{reassociation = [[0, 1, 2]]}> : (tensor<1x5x1xf32>) -> tensor<5xf32>
    %50 = "tensor.extract_slice"(%49, %arg39) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 3>, static_strides = array<i64: 1>}> : (tensor<5xf32>, index) -> tensor<3xf32>
    "func.return"(%50) : (tensor<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<14x1xf32>, index, index) -> tensor<?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_offset_and_size"}> ({
  ^bb0(%arg35: tensor<14x1xf32>, %arg36: index, %arg37: index):
    %47 = "tensor.collapse_shape"(%arg35) <{reassociation = [[0, 1]]}> : (tensor<14x1xf32>) -> tensor<14xf32>
    %48 = "tensor.extract_slice"(%47, %arg36, %arg37) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<14xf32>, index, index) -> tensor<?xf32>
    "func.return"(%48) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x10x1x1x40xf32>, index, index) -> tensor<20x?xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_dynamic_and_static_groups"}> ({
  ^bb0(%arg32: tensor<5x10x1x1x40xf32>, %arg33: index, %arg34: index):
    %45 = "tensor.collapse_shape"(%arg32) <{reassociation = [[0, 1], [2, 3, 4]]}> : (tensor<5x10x1x1x40xf32>) -> tensor<50x40xf32>
    %46 = "tensor.extract_slice"(%45, %arg33, %arg34) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 10, -9223372036854775808>, static_sizes = array<i64: 20, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<50x40xf32>, index, index) -> tensor<20x?xf32>
    "func.return"(%46) : (tensor<20x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>, index) -> tensor<1xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_unit_size_dynamic_offset"}> ({
  ^bb0(%arg30: tensor<2x3x10xf32>, %arg31: index):
    %43 = "tensor.collapse_shape"(%arg30) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %44 = "tensor.extract_slice"(%43, %arg31) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<60xf32>, index) -> tensor<1xf32>
    "func.return"(%44) : (tensor<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4x5xf32>, index, index) -> tensor<1x1xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_unit_size_dynamic_offset_multi_group"}> ({
  ^bb0(%arg27: tensor<2x3x4x5xf32>, %arg28: index, %arg29: index):
    %41 = "tensor.collapse_shape"(%arg27) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x4x5xf32>) -> tensor<6x20xf32>
    %42 = "tensor.extract_slice"(%41, %arg28, %arg29) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<6x20xf32>, index, index) -> tensor<1x1xf32>
    "func.return"(%42) : (tensor<1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>, index) -> tensor<5xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_affine_apply_offset"}> ({
  ^bb0(%arg25: tensor<2x3x10xf32>, %arg26: index):
    %38 = "tensor.collapse_shape"(%arg25) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %39 = "affine.apply"(%arg26) <{map = #map}> : (index) -> index
    %40 = "tensor.extract_slice"(%38, %39) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<60xf32>, index) -> tensor<5xf32>
    "func.return"(%40) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x5x8xf32>, index) -> tensor<8xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_affine_apply_offset_full_inner_dim"}> ({
  ^bb0(%arg23: tensor<4x5x8xf32>, %arg24: index):
    %35 = "tensor.collapse_shape"(%arg23) <{reassociation = [[0, 1, 2]]}> : (tensor<4x5x8xf32>) -> tensor<160xf32>
    %36 = "affine.apply"(%arg24) <{map = #map1}> : (index) -> index
    %37 = "tensor.extract_slice"(%35, %36) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 8>, static_strides = array<i64: 1>}> : (tensor<160xf32>, index) -> tensor<8xf32>
    "func.return"(%37) : (tensor<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4x8xf32>, index) -> tensor<4xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_affine_apply_complex_expr"}> ({
  ^bb0(%arg21: tensor<3x4x8xf32>, %arg22: index):
    %32 = "tensor.collapse_shape"(%arg21) <{reassociation = [[0, 1, 2]]}> : (tensor<3x4x8xf32>) -> tensor<96xf32>
    %33 = "affine.apply"(%arg22) <{map = #map2}> : (index) -> index
    %34 = "tensor.extract_slice"(%32, %33) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<96xf32>, index) -> tensor<4xf32>
    "func.return"(%34) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4x6xf32>, index, index) -> tensor<3x2xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_affine_apply_multi_group"}> ({
  ^bb0(%arg18: tensor<2x3x4x6xf32>, %arg19: index, %arg20: index):
    %28 = "tensor.collapse_shape"(%arg18) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<2x3x4x6xf32>) -> tensor<6x24xf32>
    %29 = "affine.apply"(%arg19) <{map = #map3}> : (index) -> index
    %30 = "affine.apply"(%arg20) <{map = #map4}> : (index) -> index
    %31 = "tensor.extract_slice"(%28, %29, %30) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 3, 2>, static_strides = array<i64: 1, 1>}> : (tensor<6x24xf32>, index, index) -> tensor<3x2xf32>
    "func.return"(%31) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4x8xf32>, index) -> tensor<4xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_affine_apply_nested"}> ({
  ^bb0(%arg16: tensor<2x4x8xf32>, %arg17: index):
    %24 = "tensor.collapse_shape"(%arg16) <{reassociation = [[0, 1, 2]]}> : (tensor<2x4x8xf32>) -> tensor<64xf32>
    %25 = "affine.apply"(%arg17) <{map = #map4}> : (index) -> index
    %26 = "affine.apply"(%25) <{map = #map4}> : (index) -> index
    %27 = "tensor.extract_slice"(%24, %26) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<4xf32>
    "func.return"(%27) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>, index) -> tensor<4xf32>, sym_name = "no_bubble_up_extract_slice_affine_apply_offset_not_multiple"}> ({
  ^bb0(%arg14: tensor<2x3x10xf32>, %arg15: index):
    %21 = "tensor.collapse_shape"(%arg14) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %22 = "affine.apply"(%arg15) <{map = #map3}> : (index) -> index
    %23 = "tensor.extract_slice"(%21, %22) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<60xf32>, index) -> tensor<4xf32>
    "func.return"(%23) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>, index) -> tensor<3xf32>, sym_name = "no_bubble_up_extract_slice_affine_apply_size_not_dividing_inner"}> ({
  ^bb0(%arg12: tensor<2x3x10xf32>, %arg13: index):
    %18 = "tensor.collapse_shape"(%arg12) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %19 = "affine.apply"(%arg13) <{map = #map3}> : (index) -> index
    %20 = "tensor.extract_slice"(%18, %19) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 3>, static_strides = array<i64: 1>}> : (tensor<60xf32>, index) -> tensor<3xf32>
    "func.return"(%20) : (tensor<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>, index) -> tensor<5xf32>, sym_name = "no_bubble_up_extract_slice_dynamic_offset_not_affine_apply"}> ({
  ^bb0(%arg10: tensor<2x3x10xf32>, %arg11: index):
    %16 = "tensor.collapse_shape"(%arg10) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %17 = "tensor.extract_slice"(%16, %arg11) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<60xf32>, index) -> tensor<5xf32>
    "func.return"(%17) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>) -> tensor<15xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_non_contiguous_1"}> ({
  ^bb0(%arg9: tensor<2x3x10xf32>):
    %14 = "tensor.collapse_shape"(%arg9) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %15 = "tensor.extract_slice"(%14) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 15>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<15xf32>
    "func.return"(%15) : (tensor<15xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>) -> tensor<20xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_non_contiguous_2"}> ({
  ^bb0(%arg8: tensor<2x3x10xf32>):
    %12 = "tensor.collapse_shape"(%arg8) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %13 = "tensor.extract_slice"(%12) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 20>, static_sizes = array<i64: 20>, static_strides = array<i64: 1>}> : (tensor<60xf32>) -> tensor<20xf32>
    "func.return"(%13) : (tensor<20xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x10xf32>) -> tensor<5xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_stride"}> ({
  ^bb0(%arg7: tensor<2x3x10xf32>):
    %10 = "tensor.collapse_shape"(%arg7) <{reassociation = [[0, 1, 2]]}> : (tensor<2x3x10xf32>) -> tensor<60xf32>
    %11 = "tensor.extract_slice"(%10) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5>, static_strides = array<i64: 2>}> : (tensor<60xf32>) -> tensor<5xf32>
    "func.return"(%11) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<6x5x2x1xf32>) -> tensor<1xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_rank_reducing"}> ({
  ^bb0(%arg6: tensor<6x5x2x1xf32>):
    %8 = "tensor.collapse_shape"(%arg6) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<6x5x2x1xf32>) -> tensor<60x1xf32>
    %9 = "tensor.extract_slice"(%8) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<60x1xf32>) -> tensor<1xf32>
    "func.return"(%9) : (tensor<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x5x2xf32>, index) -> tensor<?xf32>, sym_name = "no_bubble_up_extract_slice_through_collapse_shape_on_unsupported_dynamic"}> ({
  ^bb0(%arg4: tensor<1x5x2xf32>, %arg5: index):
    %6 = "tensor.collapse_shape"(%arg4) <{reassociation = [[0, 1, 2]]}> : (tensor<1x5x2xf32>) -> tensor<10xf32>
    %7 = "tensor.extract_slice"(%6, %arg5) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<10xf32>, index) -> tensor<?xf32>
    "func.return"(%7) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x10xf32>) -> tensor<5xf32>, sym_name = "bubble_up_extract_slice_through_collapse_shape_boundary_offset"}> ({
  ^bb0(%arg3: tensor<3x10xf32>):
    %4 = "tensor.collapse_shape"(%arg3) <{reassociation = [[0, 1]]}> : (tensor<3x10xf32>) -> tensor<30xf32>
    %5 = "tensor.extract_slice"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 5>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<30xf32>) -> tensor<5xf32>
    "func.return"(%5) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x8x6xf32>, index) -> tensor<24xf32>, sym_name = "no_bubble_up_extract_slice_affine_apply_dynamic_offset_multi_trailing"}> ({
  ^bb0(%arg1: tensor<2x8x6xf32>, %arg2: index):
    %1 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1, 2]]}> : (tensor<2x8x6xf32>) -> tensor<96xf32>
    %2 = "affine.apply"(%arg2) <{map = #map5}> : (index) -> index
    %3 = "tensor.extract_slice"(%1, %2) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 24>, static_strides = array<i64: 1>}> : (tensor<96xf32>, index) -> tensor<24xf32>
    "func.return"(%3) : (tensor<24xf32>) -> ()
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

