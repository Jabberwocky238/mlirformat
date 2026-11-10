#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x3x3xf32>, tensor<1x1x3xf32>) -> tensor<1x1x3xf32>, sym_name = "vectorize_nd_tensor_extract_transfer_read_basic"}> ({
  ^bb0(%arg0: tensor<3x3x3xf32>, %arg1: tensor<1x1x3xf32>):
    %0 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %1 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %2 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %3 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %4 = "tensor.extract"(%arg0, %1, %2, %3) : (tensor<3x3x3xf32>, index, index, index) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1x1x3xf32>) -> tensor<1x1x3xf32>
    "func.return"(%0) : (tensor<1x1x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<45x80x16xf32>, index, index, index, index, tensor<1x4xf32>) -> tensor<1x4xf32>, sym_name = "vectorize_nd_tensor_extract_transfer_read_complex"}> ({
  ^bb0(%arg0: tensor<45x80x16xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: tensor<1x4xf32>):
    %0 = "arith.constant"() <{value = 79 : index}> : () -> index
    %1 = "linalg.generic"(%arg5) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg6: f32):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %4 = "arith.addi"(%3, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %6 = "arith.addi"(%arg3, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "arith.addi"(%6, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "tensor.extract"(%arg0, %4, %0, %7) : (tensor<45x80x16xf32>, index, index, index) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<1x4xf32>) -> tensor<1x4xf32>
    "func.return"(%1) : (tensor<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<80x16xf32>, index, tensor<1x4xf32>) -> tensor<1x4xf32>, sym_name = "vectorize_nd_tensor_extract_with_affine_apply_contiguous"}> ({
  ^bb0(%arg0: tensor<80x16xf32>, %arg1: index, %arg2: tensor<1x4xf32>):
    %0 = "arith.constant"() <{value = 79 : index}> : () -> index
    %1 = "linalg.generic"(%arg2) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg3: f32):
      %2 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %3 = "affine.apply"(%2, %arg1) <{map = #map}> : (index, index) -> index
      %4 = "tensor.extract"(%arg0, %0, %3) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1x4xf32>) -> tensor<1x4xf32>
    "func.return"(%1) : (tensor<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0 + d1 * 24 + d2 + d3)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x20xi32>, tensor<257x24xf32>, index, index, index, index) -> tensor<1x1x4xf32>, sym_name = "vectorize_nd_tensor_extract_with_tensor_extract"}> ({
  ^bb0(%arg3: tensor<1x20xi32>, %arg4: tensor<257x24xf32>, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 256 : index}> : () -> index
    %8 = "tensor.empty"() : () -> tensor<1x1x4xf32>
    %9 = "linalg.generic"(%8) <{indexing_maps = [#map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg9: f32):
      %10 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %11 = "affine.apply"(%arg5, %10, %arg7) <{map = #map}> : (index, index, index) -> index
      %12 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %13 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %14 = "affine.apply"(%arg6, %13, %12, %arg8) <{map = #map1}> : (index, index, index, index) -> index
      %15 = "tensor.extract"(%arg3, %6, %11) : (tensor<1x20xi32>, index, index) -> i32
      %16 = "arith.index_cast"(%15) : (i32) -> index
      %17 = "arith.maxsi"(%16, %6) : (index, index) -> index
      %18 = "arith.minsi"(%17, %7) : (index, index) -> index
      %19 = "tensor.extract"(%arg4, %18, %14) : (tensor<257x24xf32>, index, index) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<1x1x4xf32>) -> tensor<1x1x4xf32>
    "func.return"(%9) : (tensor<1x1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<80x16xf32>, tensor<1x4xf32>) -> tensor<1x4xf32>, sym_name = "vectorize_nd_tensor_extract_with_maxsi_contiguous"}> ({
  ^bb0(%arg0: tensor<80x16xf32>, %arg1: tensor<1x4xf32>):
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index
    %1 = "linalg.generic"(%arg1) <{indexing_maps = [#map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "arith.maxsi"(%2, %0) : (index, index) -> index
      %5 = "tensor.extract"(%arg0, %4, %3) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<1x4xf32>) -> tensor<1x4xf32>
    "func.return"(%1) : (tensor<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3xf32>, tensor<4x3xi32>, tensor<4x7x3x2xf32>) -> tensor<4x7x3x2xf32>, sym_name = "vectorize_1d_tensor_extract"}> ({
  ^bb0(%arg0: tensor<3xf32>, %arg1: tensor<4x3xi32>, %arg2: tensor<4x7x3x2xf32>):
    %0 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: f32):
      %1 = "arith.index_cast"(%arg3) : (i32) -> index
      %2 = "tensor.extract"(%arg0, %1) : (tensor<3xf32>, index) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x3xi32>, tensor<4x7x3x2xf32>) -> tensor<4x7x3x2xf32>
    "func.return"(%0) : (tensor<4x7x3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x3xf32>, tensor<4x3xi32>, tensor<4x3xi32>, tensor<4x7x2xf32>, tensor<4x7x3x2xf32>) -> tensor<4x7x3x2xf32>, sym_name = "vectorize_nd_tensor_extract_index_from_tensor"}> ({
  ^bb0(%arg0: tensor<3x3xf32>, %arg1: tensor<4x3xi32>, %arg2: tensor<4x3xi32>, %arg3: tensor<4x7x2xf32>, %arg4: tensor<4x7x3x2xf32>):
    %0 = "linalg.generic"(%arg1, %arg2, %arg3, %arg4) <{indexing_maps = [#map, #map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32, %arg7: f32, %arg8: f32):
      %1 = "arith.index_cast"(%arg5) : (i32) -> index
      %2 = "arith.index_cast"(%arg6) : (i32) -> index
      %3 = "tensor.extract"(%arg0, %1, %2) : (tensor<3x3xf32>, index, index) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<4x3xi32>, tensor<4x3xi32>, tensor<4x7x2xf32>, tensor<4x7x3x2xf32>) -> tensor<4x7x3x2xf32>
    "func.return"(%0) : (tensor<4x7x3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x128x768xf32>, index) -> tensor<8x1xf32>, sym_name = "vectorize_nd_tensor_extract_load_1d_column_vector_using_gather_load"}> ({
  ^bb0(%arg0: tensor<8x128x768xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.empty"() : () -> tensor<8x1xf32>
    %2 = "linalg.generic"(%1) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %5 = "affine.apply"(%arg1, %4, %arg1) <{map = #map}> : (index, index, index) -> index
      %6 = "tensor.extract"(%arg0, %3, %0, %5) : (tensor<8x128x768xf32>, index, index, index) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<8x1xf32>) -> tensor<8x1xf32>
    "func.return"(%2) : (tensor<8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x128xf32>) -> tensor<8x1xf32>, sym_name = "index_from_output_column_vector_gather_load"}> ({
  ^bb0(%arg0: tensor<8x128xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.empty"() : () -> tensor<8x1xf32>
    %2 = "linalg.generic"(%1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "tensor.extract"(%arg0, %3, %0) : (tensor<8x128xf32>, index, index) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<8x1xf32>) -> tensor<8x1xf32>
    "func.return"(%2) : (tensor<8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x128xf32>) -> tensor<8x1xf32>, sym_name = "index_from_output_column_vector_contiguous_load"}> ({
  ^bb0(%arg0: tensor<8x128xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.empty"() : () -> tensor<8x1xf32>
    %2 = "linalg.generic"(%1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "tensor.extract"(%arg0, %0, %3) : (tensor<8x128xf32>, index, index) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<8x1xf32>) -> tensor<8x1xf32>
    "func.return"(%2) : (tensor<8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6xf32>, tensor<5xi32>) -> tensor<5xf32>, sym_name = "vectorize_nd_tensor_extract_contiguous_and_gather"}> ({
  ^bb0(%arg7: tensor<6xf32>, %arg8: tensor<5xi32>):
    %10 = "arith.constant"() <{value = 5 : index}> : () -> index
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "tensor.empty"() : () -> tensor<5xf32>
    %13 = "linalg.generic"(%12) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg9: f32):
      %14 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %15 = "tensor.extract"(%arg8, %14) : (tensor<5xi32>, index) -> i32
      %16 = "arith.index_cast"(%15) : (i32) -> index
      %17 = "arith.maxsi"(%16, %11) : (index, index) -> index
      %18 = "arith.minsi"(%17, %10) : (index, index) -> index
      %19 = "tensor.extract"(%arg7, %18) : (tensor<6xf32>, index) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%13) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<80x16xf32>, index, tensor<1x4xf32>) -> tensor<1x4xf32>, sym_name = "vectorize_nd_tensor_extract_with_affine_apply_gather"}> ({
  ^bb0(%arg3: tensor<80x16xf32>, %arg4: index, %arg5: tensor<1x4xf32>):
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index
    %6 = "linalg.generic"(%arg5) <{indexing_maps = [#map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg6: f32):
      %7 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %8 = "affine.apply"(%7, %arg4) <{map = #map1}> : (index, index) -> index
      %9 = "tensor.extract"(%arg3, %8, %5) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<1x4xf32>) -> tensor<1x4xf32>
    "func.return"(%6) : (tensor<1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<80x16xf32>, tensor<1x4xf32>) -> tensor<1x4xf32>, sym_name = "vectorize_nd_tensor_extract_with_maxsi_gather"}> ({
  ^bb0(%arg0: tensor<80x16xf32>, %arg1: tensor<1x4xf32>):
    %0 = "arith.constant"() <{value = 79 : index}> : () -> index
    %1 = "linalg.generic"(%arg1) <{indexing_maps = [#map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %2 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %3 = "arith.maxsi"(%2, %0) : (index, index) -> index
      %4 = "tensor.extract"(%arg0, %3, %2) : (tensor<80x16xf32>, index, index) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<1x4xf32>) -> tensor<1x4xf32>
    "func.return"(%1) : (tensor<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x6xf32>, tensor<5xindex>) -> tensor<5xf32>, sym_name = "vectorize_nd_tensor_extract_block_arg"}> ({
  ^bb0(%arg0: tensor<5x6xf32>, %arg1: tensor<5xindex>):
    %0 = "tensor.empty"() : () -> tensor<5xf32>
    %1 = "linalg.generic"(%arg1, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: index, %arg3: f32):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "tensor.extract"(%arg0, %arg2, %2) : (tensor<5x6xf32>, index, index) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<5xindex>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%1) : (tensor<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0 + d1 + d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3xf32>, tensor<1x1x3xf32>, index) -> tensor<1x1x3xf32>, sym_name = "vectorize_reverse_like_tensor_extract"}> ({
  ^bb0(%arg0: tensor<1x2x3xf32>, %arg1: tensor<1x1x3xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "linalg.generic"(%arg1) <{indexing_maps = [#map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg3: f32):
      %4 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %5 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %6 = "affine.apply"(%4, %5, %arg2) <{map = #map}> : (index, index, index) -> index
      %7 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %8 = "arith.subi"(%2, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %9 = "tensor.extract"(%arg0, %1, %6, %8) : (tensor<1x2x3xf32>, index, index, index) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<1x1x3xf32>) -> tensor<1x1x3xf32>
    "func.return"(%3) : (tensor<1x1x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x3xf32>, tensor<1x1x3xf32>) -> tensor<1x1x3xf32>, sym_name = "vectorize_nd_tensor_extract_scalar_broadcast"}> ({
  ^bb0(%arg0: tensor<3x3xf32>, %arg1: tensor<1x1x3xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %3 = "tensor.extract"(%arg0, %0, %1) : (tensor<3x3xf32>, index, index) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<1x1x3xf32>) -> tensor<1x1x3xf32>
    "func.return"(%2) : (tensor<1x1x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "extract_scalar_from_0d_into_0d"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
    %0 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %1 = "tensor.extract"(%arg0) : (tensor<f32>) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<1xf32>) -> tensor<1xf32>, sym_name = "extract_scalar_from_0d_into_1d"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<1xf32>):
    %0 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %1 = "tensor.extract"(%arg0) : (tensor<f32>) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<1xf32>) -> tensor<1xf32>
    "func.return"(%0) : (tensor<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<1x1x3xf32>) -> tensor<1x1x3xf32>, sym_name = "vectorize_0d_tensor_extract"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<1x1x3xf32>):
    %0 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %1 = "tensor.extract"(%arg0) : (tensor<f32>) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<1x1x3xf32>) -> tensor<1x1x3xf32>
    "func.return"(%0) : (tensor<1x1x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4xi32>) -> tensor<1x1x4xi32>, sym_name = "scalar_read_with_broadcast_from_column_tensor"}> ({
  ^bb0(%arg0: tensor<1x1x4xi32>):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = dense<[[0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14]]> : tensor<15x1xi32>}> : () -> tensor<15x1xi32>
    %3 = "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: i32):
      %4 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %5 = "tensor.extract"(%2, %4, %1) : (tensor<15x1xi32>, index, index) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (tensor<1x1x4xi32>) -> tensor<1x1x4xi32>
    "func.return"(%3) : (tensor<1x1x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x3x3xf32>, tensor<3x1x1xf32>) -> tensor<3x1x1xf32>, sym_name = "vectorize_nd_tensor_extract_transfer_read_basic_column"}> ({
  ^bb0(%arg0: tensor<3x3x3xf32>, %arg1: tensor<3x1x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "linalg.generic"(%arg1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      %2 = "tensor.extract"(%arg0, %0, %0, %0) : (tensor<3x3x3xf32>, index, index, index) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<3x1x1xf32>) -> tensor<3x1x1xf32>
    "func.return"(%1) : (tensor<3x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi64>, tensor<i64>) -> tensor<i64>, sym_name = "rank0_tensor_extract_data_dependent_index"}> ({
  ^bb0(%arg0: tensor<2xi64>, %arg1: tensor<i64>):
    %0 = "tensor.empty"() : () -> tensor<i64>
    %1 = "linalg.generic"(%arg1, %0) <{indexing_maps = [#map, #map], iterator_types = [], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i64, %arg3: i64):
      %2 = "arith.index_cast"(%arg2) : (i64) -> index
      %3 = "tensor.extract"(%arg0, %2) : (tensor<2xi64>, index) -> i64
      "linalg.yield"(%3) : (i64) -> ()
    }) : (tensor<i64>, tensor<i64>) -> tensor<i64>
    "func.return"(%1) : (tensor<i64>) -> ()
  }) : () -> ()
}) : () -> ()

