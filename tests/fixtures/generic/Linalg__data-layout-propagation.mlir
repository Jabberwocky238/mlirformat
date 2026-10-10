#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32>, sym_name = "dynamic_elem_pack"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x8x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %7 = "arith.addf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.pack"(%5, %arg1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<?x?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32>
    "func.return"(%6) : (tensor<?x?x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32>, sym_name = "dynamic_elem_pack_padding_value"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x8x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.empty"(%3, %4) : (index, index) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%arg0, %5) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %8 = "arith.addf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %7 = "linalg.pack"(%6, %arg1, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<?x?xf32>, tensor<?x?x8x2xf32>, f32) -> tensor<?x?x8x2xf32>
    "func.return"(%7) : (tensor<?x?x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xi32>, tensor<4x16x16x32xi32>) -> tensor<4x16x16x32xi32>, sym_name = "elem_pack_transpose_inner_dims"}> ({
  ^bb0(%arg0: tensor<128x256xi32>, %arg1: tensor<4x16x16x32xi32>):
    %0 = "tensor.empty"() : () -> tensor<128x256xi32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %3 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %2 = "linalg.pack"(%1, %arg1) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<128x256xi32>, tensor<4x16x16x32xi32>) -> tensor<4x16x16x32xi32>
    "func.return"(%2) : (tensor<4x16x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xi32>, tensor<16x4x32x16xi32>) -> tensor<16x4x32x16xi32>, sym_name = "elem_pack_transpose_outer_dims"}> ({
  ^bb0(%arg0: tensor<128x256xi32>, %arg1: tensor<16x4x32x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<128x256xi32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %3 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %2 = "linalg.pack"(%1, %arg1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 16>}> : (tensor<128x256xi32>, tensor<16x4x32x16xi32>) -> tensor<16x4x32x16xi32>
    "func.return"(%2) : (tensor<16x4x32x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xi32>, tensor<16x4x16x32xi32>) -> tensor<16x4x16x32xi32>, sym_name = "elem_pack_transpose_inner_and_outer_dims"}> ({
  ^bb0(%arg0: tensor<128x256xi32>, %arg1: tensor<16x4x16x32xi32>):
    %0 = "tensor.empty"() : () -> tensor<128x256xi32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %3 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %2 = "linalg.pack"(%1, %arg1) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<128x256xi32>, tensor<16x4x16x32xi32>) -> tensor<16x4x16x32xi32>
    "func.return"(%2) : (tensor<16x4x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32>, sym_name = "dynamic_broadcast_pack"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x8x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index
    %2 = "tensor.dim"(%arg1, %0) : (tensor<?xf32>, index) -> index
    %3 = "tensor.empty"(%1, %2) : (index, index) -> tensor<?x?xf32>
    %4 = "linalg.generic"(%arg0, %arg1, %3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %6 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = "linalg.pack"(%4, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<?x?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32>
    "func.return"(%5) : (tensor<?x?x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<1x2x56x57x32xf32>) -> tensor<1x2x56x57x32xf32>, sym_name = "elem_pack_transpose_inner_and_outer_dims2"}> ({
  ^bb0(%arg0: tensor<64xf32>, %arg1: tensor<1x2x56x57x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x56x57x64xf32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<64xf32>, tensor<1x56x57x64xf32>) -> tensor<1x56x57x64xf32>
    %2 = "linalg.pack"(%1, %arg1) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<1x56x57x64xf32>, tensor<1x2x56x57x32xf32>) -> tensor<1x2x56x57x32xf32>
    "func.return"(%2) : (tensor<1x2x56x57x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x128x200x256xi32>, tensor<100xi32>, tensor<128xi32>, tensor<100x200x4x16x16x32xi32>) -> tensor<100x200x4x16x16x32xi32>, sym_name = "transpose_pack"}> ({
  ^bb0(%arg0: tensor<100x128x200x256xi32>, %arg1: tensor<100xi32>, %arg2: tensor<128xi32>, %arg3: tensor<100x200x4x16x16x32xi32>):
    %0 = "tensor.empty"() : () -> tensor<100x200x128x256xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
      %3 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<100x128x200x256xi32>, tensor<100xi32>, tensor<128xi32>, tensor<100x200x128x256xi32>) -> tensor<100x200x128x256xi32>
    %2 = "linalg.pack"(%1, %arg3) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<100x200x128x256xi32>, tensor<100x200x4x16x16x32xi32>) -> tensor<100x200x4x16x16x32xi32>
    "func.return"(%2) : (tensor<100x200x4x16x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, 0, 0, 0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, 0)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x128x200x256xi32>, tensor<100x1x1x1xi32>, tensor<1x128x1x1xi32>, tensor<100x200x4x16x16x32xi32>) -> tensor<100x200x4x16x16x32xi32>, sym_name = "affine_constant_expr_pack"}> ({
  ^bb0(%arg0: tensor<100x128x200x256xi32>, %arg1: tensor<100x1x1x1xi32>, %arg2: tensor<1x128x1x1xi32>, %arg3: tensor<100x200x4x16x16x32xi32>):
    %0 = "tensor.empty"() : () -> tensor<100x200x128x256xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
      %3 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<100x128x200x256xi32>, tensor<100x1x1x1xi32>, tensor<1x128x1x1xi32>, tensor<100x200x128x256xi32>) -> tensor<100x200x128x256xi32>
    %2 = "linalg.pack"(%1, %arg3) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<100x200x128x256xi32>, tensor<100x200x4x16x16x32xi32>) -> tensor<100x200x4x16x16x32xi32>
    "func.return"(%2) : (tensor<100x200x4x16x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x128x200x256xi32>, tensor<100xi32>, tensor<128xi32>, tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32>, sym_name = "transpose_pack_with_outer_dims"}> ({
  ^bb0(%arg0: tensor<100x128x200x256xi32>, %arg1: tensor<100xi32>, %arg2: tensor<128xi32>, %arg3: tensor<200x4x16x100x16x32xi32>):
    %0 = "tensor.empty"() : () -> tensor<100x200x128x256xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
      %3 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<100x128x200x256xi32>, tensor<100xi32>, tensor<128xi32>, tensor<100x200x128x256xi32>) -> tensor<100x200x128x256xi32>
    %2 = "linalg.pack"(%1, %arg3) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 2, 3, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<100x200x128x256xi32>, tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32>
    "func.return"(%2) : (tensor<200x4x16x100x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<16x4x32x16xi32>, sym_name = "elem_pack_transpose_outer_dims"}> ({
  ^bb0(%arg0: tensor<128x256xi32>, %arg1: tensor<128x256xi32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %3 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %1 = "tensor.empty"() : () -> tensor<16x4x32x16xi32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 16>}> : (tensor<128x256xi32>, tensor<16x4x32x16xi32>) -> tensor<16x4x32x16xi32>
    "func.return"(%2) : (tensor<16x4x32x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<16x4x32x16xi32>, sym_name = "elem_pack_transpose_outer_dims_unused_init"}> ({
  ^bb0(%arg0: tensor<128x256xi32>, %arg1: tensor<128x256xi32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %3 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %1 = "tensor.empty"() : () -> tensor<16x4x32x16xi32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 16>}> : (tensor<128x256xi32>, tensor<16x4x32x16xi32>) -> tensor<16x4x32x16xi32>
    "func.return"(%2) : (tensor<16x4x32x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x2x56x56x32xf32>) -> tensor<12x56x56x64xf32>, sym_name = "unpack_on_output"}> ({
  ^bb0(%arg0: tensor<12x2x56x56x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<12x2x56x56x32xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    %2 = "linalg.generic"(%1) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %3 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    "func.return"(%2) : (tensor<12x56x56x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x2x56x56x32xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>, sym_name = "unpack_on_input"}> ({
  ^bb0(%arg0: tensor<12x2x56x56x32xf32>, %arg1: tensor<12x56x56x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<12x2x56x56x32xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    %2 = "linalg.generic"(%1, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %3 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<12x56x56x64xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    "func.return"(%2) : (tensor<12x56x56x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x2x56x56x32xf32>, tensor<12x56x56x64xf16>) -> tensor<12x56x56x64xf16>, sym_name = "unpack_element_type_change_no_use"}> ({
  ^bb0(%arg0: tensor<12x2x56x56x32xf32>, %arg1: tensor<12x56x56x64xf16>):
    %0 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<12x2x56x56x32xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    %2 = "linalg.generic"(%1, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f16):
      %3 = "arith.truncf"(%arg2) : (f32) -> f16
      "linalg.yield"(%3) : (f16) -> ()
    }) : (tensor<12x56x56x64xf32>, tensor<12x56x56x64xf16>) -> tensor<12x56x56x64xf16>
    "func.return"(%2) : (tensor<12x56x56x64xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x2x56x56x32xf32>) -> tensor<12x56x56x64xf32>, sym_name = "forward_tensor_empty"}> ({
  ^bb0(%arg0: tensor<12x2x56x56x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %1 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %2 = "linalg.unpack"(%arg0, %1) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<12x2x56x56x32xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    %3 = "linalg.generic"(%2, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %4 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<12x56x56x64xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    "func.return"(%3) : (tensor<12x56x56x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x56x56x32xf32>) -> tensor<1x58x58x64xf32>, sym_name = "pad_valid_unpack_propagation"}> ({
  ^bb0(%arg0: tensor<1x2x56x56x32xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<1x56x56x64xf32>
    %2 = "linalg.unpack"(%arg0, %1) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<1x2x56x56x32xf32>, tensor<1x56x56x64xf32>) -> tensor<1x56x56x64xf32>
    %3 = "tensor.pad"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 1, 0>, static_low = array<i64: 0, 1, 1, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x56x56x64xf32>) -> tensor<1x58x58x64xf32>
    "func.return"(%3) : (tensor<1x58x58x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x56x56x32xf32>) -> tensor<2x58x58x64xf32>, sym_name = "pad_valid_unpack_propagation"}> ({
  ^bb0(%arg0: tensor<1x2x56x56x32xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<1x56x56x64xf32>
    %2 = "linalg.unpack"(%arg0, %1) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<1x2x56x56x32xf32>, tensor<1x56x56x64xf32>) -> tensor<1x56x56x64xf32>
    %3 = "tensor.pad"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 1, 0>, static_low = array<i64: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x56x56x64xf32>) -> tensor<2x58x58x64xf32>
    "func.return"(%3) : (tensor<2x58x58x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x56x56x32xf32>) -> tensor<1x58x58x66xf32>, sym_name = "pad_along_unpacked_dim"}> ({
  ^bb0(%arg0: tensor<1x2x56x56x32xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<1x56x56x64xf32>
    %2 = "linalg.unpack"(%arg0, %1) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<1x2x56x56x32xf32>, tensor<1x56x56x64xf32>) -> tensor<1x56x56x64xf32>
    %3 = "tensor.pad"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 1, 1>, static_low = array<i64: 0, 1, 1, 1>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x56x56x64xf32>) -> tensor<1x58x58x66xf32>
    "func.return"(%3) : (tensor<1x58x58x66xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x64x56x56xf32>) -> tensor<1x2x58x58x32xf32>, sym_name = "pad_valid_pack_propagation"}> ({
  ^bb0(%arg0: tensor<1x64x56x56xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0, 1, 1>, static_low = array<i64: 0, 0, 1, 1>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x64x56x56xf32>) -> tensor<1x64x58x58xf32>
    %2 = "tensor.empty"() : () -> tensor<1x2x58x58x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<1x64x58x58xf32>, tensor<1x2x58x58x32xf32>) -> tensor<1x2x58x58x32xf32>
    "func.return"(%3) : (tensor<1x2x58x58x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x64x56x56xf32>) -> tensor<1x58x58x2x32xf32>, sym_name = "pad_valid_outer_dims_pack_propagation"}> ({
  ^bb0(%arg0: tensor<1x64x56x56xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0, 1, 1>, static_low = array<i64: 0, 0, 1, 1>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x64x56x56xf32>) -> tensor<1x64x58x58xf32>
    %2 = "tensor.empty"() : () -> tensor<1x58x58x2x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 3, 2, 1>, static_inner_tiles = array<i64: 32>}> : (tensor<1x64x58x58xf32>, tensor<1x58x58x2x32xf32>) -> tensor<1x58x58x2x32xf32>
    "func.return"(%3) : (tensor<1x58x58x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x60x56x56xf32>) -> tensor<1x2x58x58x32xf32>, sym_name = "pad_along_packed_dim"}> ({
  ^bb0(%arg0: tensor<1x60x56x56xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 2, 1, 1>, static_low = array<i64: 0, 2, 1, 1>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x60x56x56xf32>) -> tensor<1x64x58x58xf32>
    %2 = "tensor.empty"() : () -> tensor<1x2x58x58x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<1x64x58x58xf32>, tensor<1x2x58x58x32xf32>) -> tensor<1x2x58x58x32xf32>
    "func.return"(%3) : (tensor<1x2x58x58x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x64x56x56xf32>) -> (tensor<1x64x58x58xf32>, tensor<1x2x58x58x32xf32>), sym_name = "multi_use_pad_pack_propagation"}> ({
  ^bb0(%arg0: tensor<1x64x56x56xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0, 1, 1>, static_low = array<i64: 0, 0, 1, 1>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x64x56x56xf32>) -> tensor<1x64x58x58xf32>
    %2 = "tensor.empty"() : () -> tensor<1x2x58x58x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<1x64x58x58xf32>, tensor<1x2x58x58x32xf32>) -> tensor<1x2x58x58x32xf32>
    "func.return"(%1, %3) : (tensor<1x64x58x58xf32>, tensor<1x2x58x58x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xi32>) -> tensor<4x16x16x32xi32>, sym_name = "would_break_dominance"}> ({
  ^bb0(%arg0: tensor<128x256xi32>):
    %0 = "tensor.empty"() : () -> tensor<128x256xi32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      %4 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<128x256xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %2 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<4x16x16x32xi32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<128x256xi32>, tensor<4x16x16x32xi32>) -> tensor<4x16x16x32xi32>
    "func.return"(%3) : (tensor<4x16x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> ()>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<1x32x7x7x32xf32>, sym_name = "scalar_tensor"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tensor.empty"() : () -> tensor<1x7x7x1024xf32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<f32>, tensor<1x7x7x1024xf32>) -> tensor<1x7x7x1024xf32>
    %2 = "tensor.empty"() : () -> tensor<1x32x7x7x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64: 32>}> : (tensor<1x7x7x1024xf32>, tensor<1x32x7x7x32xf32>) -> tensor<1x32x7x7x32xf32>
    "func.return"(%3) : (tensor<1x32x7x7x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12x64x56x56xf32>) -> tensor<12x56x56x64xf32>, sym_name = "unpack_empty_inner_dims"}> ({
  ^bb0(%arg0: tensor<12x64x56x56xf32>):
    %0 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %1 = "tensor.empty"() : () -> tensor<12x56x56x64xf32>
    %2 = "linalg.unpack"(%arg0, %1) <{inner_dims_pos = array<i64>, outer_dims_perm = array<i64: 0, 3, 1, 2>, static_inner_tiles = array<i64>}> : (tensor<12x64x56x56xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    %3 = "linalg.generic"(%2, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %4 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<12x56x56x64xf32>, tensor<12x56x56x64xf32>) -> tensor<12x56x56x64xf32>
    "func.return"(%3) : (tensor<12x56x56x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256x32xi32>, tensor<128x256xi32>) -> tensor<4x16x16x32xi32>, sym_name = "reduction_pack_transpose_inner_dims"}> ({
  ^bb0(%arg0: tensor<128x256x32xi32>, %arg1: tensor<128x256xi32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %3 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%3) : (i32) -> ()
    }) : (tensor<128x256x32xi32>, tensor<128x256xi32>) -> tensor<128x256xi32>
    %1 = "tensor.empty"() : () -> tensor<4x16x16x32xi32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<128x256xi32>, tensor<4x16x16x32xi32>) -> tensor<4x16x16x32xi32>
    "func.return"(%2) : (tensor<4x16x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x128x200x256xi32>, tensor<100xi32>, tensor<128xi32>, tensor<100x128x256xi32>) -> tensor<4x16x100x16x32xi32>, sym_name = "reduction_pack_with_outer_dims"}> ({
  ^bb0(%arg0: tensor<100x128x200x256xi32>, %arg1: tensor<100xi32>, %arg2: tensor<128xi32>, %arg3: tensor<100x128x256xi32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
      %3 = "arith.addi"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.addi"(%4, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (tensor<100x128x200x256xi32>, tensor<100xi32>, tensor<128xi32>, tensor<100x128x256xi32>) -> tensor<100x128x256xi32>
    %1 = "tensor.empty"() : () -> tensor<4x16x100x16x32xi32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 2, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<100x128x256xi32>, tensor<4x16x100x16x32xi32>) -> tensor<4x16x100x16x32xi32>
    "func.return"(%2) : (tensor<4x16x100x16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 * 2 + d4, d3 * 2 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1080x1920x16xi32>, tensor<2x2xi32>) -> tensor<16x540x960xi32>, sym_name = "unpack_different_destination_shape"}> ({
  ^bb0(%arg0: tensor<1x1x1080x1920x16xi32>, %arg1: tensor<2x2xi32>):
    %0 = "tensor.empty"() : () -> tensor<16x540x960xi32>
    %1 = "tensor.empty"() : () -> tensor<1x16x1080x1920xi32>
    %2 = "linalg.unpack"(%arg0, %1) <{inner_dims_pos = array<i64: 1>, static_inner_tiles = array<i64: 16>}> : (tensor<1x1x1080x1920x16xi32>, tensor<1x16x1080x1920xi32>) -> tensor<1x16x1080x1920xi32>
    %3 = "linalg.generic"(%2, %arg1, %0) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %4 = "arith.maxui"(%arg2, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<1x16x1080x1920xi32>, tensor<2x2xi32>, tensor<16x540x960xi32>) -> tensor<16x540x960xi32>
    "func.return"(%3) : (tensor<16x540x960xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16x4xf32>, index) -> tensor<?x4x8x1xf32>, sym_name = "bubble_up_pack_through_collapse"}> ({
  ^bb0(%arg0: tensor<?x16x4xf32>, %arg1: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<?x16x4xf32>) -> tensor<?x4xf32>
    %1 = "tensor.empty"(%arg1) : (index) -> tensor<?x4x8x1xf32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<?x4xf32>, tensor<?x4x8x1xf32>) -> tensor<?x4x8x1xf32>
    "func.return"(%2) : (tensor<?x4x8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16x4xf32>, index) -> tensor<?x4x8x1xf32>, sym_name = "bubble_up_pack_through_collapse_empty_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<?x16x4xf32>, %arg1: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<?x16x4xf32>) -> tensor<?x4xf32>
    %1 = "tensor.empty"(%arg1) : (index) -> tensor<?x4x8x1xf32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<?x4xf32>, tensor<?x4x8x1xf32>) -> tensor<?x4x8x1xf32>
    "func.return"(%2) : (tensor<?x4x8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x192x16x256xf32>) -> tensor<4x32x3072x8x1xf32>, sym_name = "bubble_up_permuted_pack_through_collapse"}> ({
  ^bb0(%arg0: tensor<4x192x16x256xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<4x192x16x256xf32>) -> tensor<4x3072x256xf32>
    %1 = "tensor.empty"() : () -> tensor<4x32x3072x8x1xf32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<4x3072x256xf32>, tensor<4x32x3072x8x1xf32>) -> tensor<4x32x3072x8x1xf32>
    "func.return"(%2) : (tensor<4x32x3072x8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x64x1x4xf32>) -> tensor<8x4x8x1xf32>, sym_name = "bubble_up_pack_through_unit_collapse"}> ({
  ^bb0(%arg0: tensor<1x64x1x4xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<1x64x1x4xf32>) -> tensor<64x4xf32>
    %1 = "tensor.empty"() : () -> tensor<8x4x8x1xf32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<64x4xf32>, tensor<8x4x8x1xf32>) -> tensor<8x4x8x1xf32>
    "func.return"(%2) : (tensor<8x4x8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16x4xf32>, index) -> tensor<?x1x4xf32>, sym_name = "bubble_up_pack_through_collapse_on_outer_dims"}> ({
  ^bb0(%arg0: tensor<?x16x4xf32>, %arg1: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<?x16x4xf32>) -> tensor<?x4xf32>
    %1 = "tensor.empty"(%arg1) : (index) -> tensor<?x1x4xf32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 4>}> : (tensor<?x4xf32>, tensor<?x1x4xf32>) -> tensor<?x1x4xf32>
    "func.return"(%2) : (tensor<?x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3072x64x4xf32>) -> tensor<384x32x8x8xf32>, sym_name = "no_bubble_up_pack_through_non_divisible_collapse"}> ({
  ^bb0(%arg0: tensor<3072x64x4xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2]]}> : (tensor<3072x64x4xf32>) -> tensor<3072x256xf32>
    %1 = "tensor.empty"() : () -> tensor<384x32x8x8xf32>
    %2 = "linalg.pack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<3072x256xf32>, tensor<384x32x8x8xf32>) -> tensor<384x32x8x8xf32>
    "func.return"(%2) : (tensor<384x32x8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<4x2x64x4xf32>, sym_name = "bubble_up_pack_outer_expanded_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x2x64x4xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x64xf32>) -> tensor<4x8x64xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 4>}> : (tensor<4x8x64xf32>, tensor<4x2x64x4xf32>) -> tensor<4x2x64x4xf32>
    "func.return"(%2) : (tensor<4x2x64x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<32x4x4x4xf32>, sym_name = "bubble_up_pack_inner_expanded_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x4x4x4xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 32, 4, 16>}> : (tensor<32x64xf32>) -> tensor<32x4x16xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 4>}> : (tensor<32x4x16xf32>, tensor<32x4x4x4xf32>) -> tensor<32x4x4x4xf32>
    "func.return"(%2) : (tensor<32x4x4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64x16xf32>) -> tensor<8x2x32x16x4xf32>, sym_name = "bubble_up_pack_non_expanded_dims_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x2x32x16x4xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 32, 2, 32, 16>}> : (tensor<32x64x16xf32>) -> tensor<32x2x32x16xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 4>}> : (tensor<32x2x32x16xf32>, tensor<8x2x32x16x4xf32>) -> tensor<8x2x32x16x4xf32>
    "func.return"(%2) : (tensor<8x2x32x16x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x64xf32>) -> tensor<?x4x2x8xf32>, sym_name = "bubble_up_pack_through_expand_dynamic"}> ({
  ^bb0(%arg0: tensor<?x64xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x64xf32>, index) -> index
    %2 = "tensor.empty"(%1) : (index) -> tensor<?x4x2x8xf32>
    %3 = "tensor.expand_shape"(%arg0, %1) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, 4, 16>}> : (tensor<?x64xf32>, index) -> tensor<?x4x16xf32>
    %4 = "linalg.pack"(%3, %2) <{inner_dims_pos = array<i64: 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8>}> : (tensor<?x4x16xf32>, tensor<?x4x2x8xf32>) -> tensor<?x4x2x8xf32>
    "func.return"(%4) : (tensor<?x4x2x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x60xf32>) -> tensor<4x2x8x4x8xf32>, sym_name = "bubble_up_pack_non_expanded_padding_through_expand"}> ({
  ^bb0(%arg0: tensor<32x60xf32>):
    %0 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<4x2x8x4x8xf32>
    %2 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x60xf32>) -> tensor<4x8x60xf32>
    %3 = "linalg.pack"(%2, %1, %0) <{inner_dims_pos = array<i64: 1, 2>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 4, 8>}> : (tensor<4x8x60xf32>, tensor<4x2x8x4x8xf32>, f32) -> tensor<4x2x8x4x8xf32>
    "func.return"(%3) : (tensor<4x2x8x4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<4x2x32x4x2xf32>, sym_name = "bubble_up_pack_outer_dims_perm_identity_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x2x32x4x2xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x64xf32>) -> tensor<4x8x64xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 1, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1, 2>, static_inner_tiles = array<i64: 4, 2>}> : (tensor<4x8x64xf32>, tensor<4x2x32x4x2xf32>) -> tensor<4x2x32x4x2xf32>
    "func.return"(%2) : (tensor<4x2x32x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64x16xf32>) -> tensor<8x2x4x8x4x8x2xf32>, sym_name = "bubble_up_pack_multiple_dims_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x2x4x8x4x8x2xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 32, 2, 32, 16>}> : (tensor<32x64x16xf32>) -> tensor<32x2x32x16xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 0, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 4, 8, 2>}> : (tensor<32x2x32x16xf32>, tensor<8x2x4x8x4x8x2xf32>) -> tensor<8x2x4x8x4x8x2xf32>
    "func.return"(%2) : (tensor<8x2x4x8x4x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<4x2x4x16x4xf32>, sym_name = "bubble_up_pack_inner_dims_reorder_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x2x4x16x4xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x64xf32>) -> tensor<4x8x64xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<4x8x64xf32>, tensor<4x2x4x16x4xf32>) -> tensor<4x2x4x16x4xf32>
    "func.return"(%2) : (tensor<4x2x4x16x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64x16xf32>) -> tensor<4x2x2x8x16x4x4xf32>, sym_name = "bubble_up_pack_multiple_different_expanded_dims_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x2x2x8x16x4x4xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2, 3], [4]], static_output_shape = array<i64: 4, 8, 2, 32, 16>}> : (tensor<32x64x16xf32>) -> tensor<4x8x2x32x16xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 1, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 4, 4>}> : (tensor<4x8x2x32x16xf32>, tensor<4x2x2x8x16x4x4xf32>) -> tensor<4x2x2x8x16x4x4xf32>
    "func.return"(%2) : (tensor<4x2x2x8x16x4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<32x4x2x4x2xf32>, sym_name = "no_bubble_up_pack_outer_dims_permutation_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x4x2x4x2xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x64xf32>) -> tensor<4x8x64xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 1, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 2, 0, 1>, static_inner_tiles = array<i64: 4, 2>}> : (tensor<4x8x64xf32>, tensor<32x4x2x4x2xf32>) -> tensor<32x4x2x4x2xf32>
    "func.return"(%2) : (tensor<32x4x2x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<2x2x64x2x4xf32>, sym_name = "no_bubble_up_pack_multiple_same_expanded_dim_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<2x2x64x2x4xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x64xf32>) -> tensor<4x8x64xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 2, 4>}> : (tensor<4x8x64xf32>, tensor<2x2x64x2x4xf32>) -> tensor<2x2x64x2x4xf32>
    "func.return"(%2) : (tensor<2x2x64x2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<2x8x64x2xf32>, sym_name = "no_bubble_up_pack_non_innermost_expanded_dim_through_expand"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<2x8x64x2xf32>
    %1 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 4, 8, 64>}> : (tensor<32x64xf32>) -> tensor<4x8x64xf32>
    %2 = "linalg.pack"(%1, %0) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 2>}> : (tensor<4x8x64xf32>, tensor<2x8x64x2xf32>) -> tensor<2x8x64x2xf32>
    "func.return"(%2) : (tensor<2x8x64x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<30x60xf32>) -> tensor<3x2x60x8xf32>, sym_name = "no_bubble_up_pack_expanded_padding_through_expand_cannot_reassociate"}> ({
  ^bb0(%arg0: tensor<30x60xf32>):
    %0 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<3x2x60x8xf32>
    %2 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 3, 10, 60>}> : (tensor<30x60xf32>) -> tensor<3x10x60xf32>
    %3 = "linalg.pack"(%2, %1, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8>}> : (tensor<3x10x60xf32>, tensor<3x2x60x8xf32>, f32) -> tensor<3x2x60x8xf32>
    "func.return"(%3) : (tensor<3x2x60x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x32x8x8xf32>, index, index) -> tensor<?x256x256xf32>, sym_name = "push_down_unpack_through_expand"}> ({
  ^bb0(%arg0: tensor<?x32x8x8xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.empty"(%arg1) : (index) -> tensor<?x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<?x32x8x8xf32>, tensor<?x256xf32>) -> tensor<?x256xf32>
    %2 = "tensor.expand_shape"(%1, %arg2) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 256, 256>}> : (tensor<?x256xf32>, index) -> tensor<?x256x256xf32>
    "func.return"(%2) : (tensor<?x256x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x32x8x8xf32>, index, index) -> tensor<?x256x256xf32>, sym_name = "push_down_unpack_through_expand_empty_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<?x32x8x8xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.empty"(%arg1) : (index) -> tensor<?x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<?x32x8x8xf32>, tensor<?x256xf32>) -> tensor<?x256xf32>
    %2 = "tensor.expand_shape"(%1, %arg2) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 256, 256>}> : (tensor<?x256xf32>, index) -> tensor<?x256x256xf32>
    "func.return"(%2) : (tensor<?x256x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x32x384x8x8xf32>) -> tensor<4x12x256x256xf32>, sym_name = "push_down_permuted_unpack_through_expand"}> ({
  ^bb0(%arg0: tensor<4x32x384x8x8xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x3072x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 2, 1>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<4x32x384x8x8xf32>, tensor<4x3072x256xf32>) -> tensor<4x3072x256xf32>
    %2 = "tensor.expand_shape"(%1) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 4, 12, 256, 256>}> : (tensor<4x3072x256xf32>) -> tensor<4x12x256x256xf32>
    "func.return"(%2) : (tensor<4x12x256x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x32x8x8xf32>) -> tensor<3x16x1x256xf32>, sym_name = "push_down_unpack_through_unit_expand"}> ({
  ^bb0(%arg0: tensor<6x32x8x8xf32>):
    %0 = "tensor.empty"() : () -> tensor<48x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<6x32x8x8xf32>, tensor<48x256xf32>) -> tensor<48x256xf32>
    %2 = "tensor.expand_shape"(%1) <{reassociation = [[0, 1, 2], [3]], static_output_shape = array<i64: 3, 16, 1, 256>}> : (tensor<48x256xf32>) -> tensor<3x16x1x256xf32>
    "func.return"(%2) : (tensor<3x16x1x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x32x8xf32>, index, index) -> tensor<?x256x256xf32>, sym_name = "push_down_unpack_through_expand_on_outer_dims"}> ({
  ^bb0(%arg0: tensor<?x32x8xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.empty"(%arg1) : (index) -> tensor<?x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8>}> : (tensor<?x32x8xf32>, tensor<?x256xf32>) -> tensor<?x256xf32>
    %2 = "tensor.expand_shape"(%1, %arg2) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 256, 256>}> : (tensor<?x256xf32>, index) -> tensor<?x256x256xf32>
    "func.return"(%2) : (tensor<?x256x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<384x32x8x8xf32>) -> tensor<256x12x256xf32>, sym_name = "no_push_down_unpack_through_non_divisible_expand"}> ({
  ^bb0(%arg0: tensor<384x32x8x8xf32>):
    %0 = "tensor.empty"() : () -> tensor<3072x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 8>}> : (tensor<384x32x8x8xf32>, tensor<3072x256xf32>) -> tensor<3072x256xf32>
    %2 = "tensor.expand_shape"(%1) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 256, 12, 256>}> : (tensor<3072x256xf32>) -> tensor<256x12x256xf32>
    "func.return"(%2) : (tensor<256x12x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8x4x8xf32>, tensor<?x64xf32>, tensor<?x64xbf16>) -> tensor<?x64xbf16>, sym_name = "push_unpack_in_padded_domain_foldable"}> ({
  ^bb0(%arg0: tensor<8x8x4x8xf32>, %arg1: tensor<?x64xf32>, %arg2: tensor<?x64xbf16>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 4, 8>}> : (tensor<8x8x4x8xf32>, tensor<?x64xf32>) -> tensor<?x64xf32>
    %1 = "linalg.generic"(%0, %arg2) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: bf16):
      %2 = "arith.truncf"(%arg3) : (f32) -> bf16
      "linalg.yield"(%2) : (bf16) -> ()
    }) : (tensor<?x64xf32>, tensor<?x64xbf16>) -> tensor<?x64xbf16>
    "func.return"(%1) : (tensor<?x64xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8x4x8xf32>, tensor<?x64xf32>) -> tensor<?x64xf32>, sym_name = "push_unpack_in_padded_domain_out_used"}> ({
  ^bb0(%arg0: tensor<8x8x4x8xf32>, %arg1: tensor<?x64xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 4, 8>}> : (tensor<8x8x4x8xf32>, tensor<?x64xf32>) -> tensor<?x64xf32>
    %1 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x64xf32>, tensor<?x64xf32>) -> tensor<?x64xf32>
    "func.return"(%1) : (tensor<?x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x16xf32>, tensor<8x64xf32>, tensor<8x64xf32>) -> tensor<8x64xf32>, sym_name = "push_unpack_in_padded_domain_multiple_inputs"}> ({
  ^bb0(%arg0: tensor<1x4x16x16xf32>, %arg1: tensor<8x64xf32>, %arg2: tensor<8x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<1x4x16x16xf32>, tensor<8x64xf32>) -> tensor<8x64xf32>
    %2 = "linalg.generic"(%arg1, %1, %arg2) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %3 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<8x64xf32>, tensor<8x64xf32>, tensor<8x64xf32>) -> tensor<8x64xf32>
    "func.return"(%2) : (tensor<8x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2 + d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x7x128xf32>, tensor<?x5x3x128xf32>, tensor<?x5x128xbf16>, index) -> tensor<?x5x128xbf16>, sym_name = "push_extract_through_generic"}> ({
  ^bb0(%arg0: tensor<128x7x128xf32>, %arg1: tensor<?x5x3x128xf32>, %arg2: tensor<?x5x128xbf16>, %arg3: index):
    %0 = "tensor.extract_slice"(%arg0, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, 0, -9223372036854775808>, static_sizes = array<i64: 128, 7, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<128x7x128xf32>, index, index) -> tensor<128x7x?xf32>
    %1 = "linalg.generic"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: bf16):
      %2 = "arith.truncf"(%arg4) : (f32) -> bf16
      "linalg.yield"(%2) : (bf16) -> ()
    }) : (tensor<128x7x?xf32>, tensor<?x5x3x128xf32>, tensor<?x5x128xbf16>) -> tensor<?x5x128xbf16>
    "func.return"(%1) : (tensor<?x5x128xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2 + d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x7x128xf32>, tensor<?x5x3x128xf32>, tensor<?x5x128xbf16>, index) -> tensor<?x5x128xbf16>, sym_name = "nopush_extract_through_generic_nodimexpr1"}> ({
  ^bb0(%arg0: tensor<128x7x128xf32>, %arg1: tensor<?x5x3x128xf32>, %arg2: tensor<?x5x128xbf16>, %arg3: index):
    %0 = "tensor.extract_slice"(%arg0, %arg3, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 128, 7, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<128x7x128xf32>, index, index, index) -> tensor<128x7x?xf32>
    %1 = "linalg.generic"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: bf16):
      %2 = "arith.truncf"(%arg4) : (f32) -> bf16
      "linalg.yield"(%2) : (bf16) -> ()
    }) : (tensor<128x7x?xf32>, tensor<?x5x3x128xf32>, tensor<?x5x128xbf16>) -> tensor<?x5x128xbf16>
    "func.return"(%1) : (tensor<?x5x128xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2 + d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x?x128xf32>, tensor<128x5x3x128xf32>, tensor<128x?x128xbf16>, index) -> tensor<128x?x128xbf16>, sym_name = "nopush_extract_through_generic_nodimexpr2"}> ({
  ^bb0(%arg0: tensor<128x?x128xf32>, %arg1: tensor<128x5x3x128xf32>, %arg2: tensor<128x?x128xbf16>, %arg3: index):
    %0 = "tensor.extract_slice"(%arg1, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 128, -9223372036854775808, 3, 128>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x5x3x128xf32>, index, index) -> tensor<128x?x3x128xf32>
    %1 = "linalg.generic"(%arg0, %0, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: bf16):
      %2 = "arith.truncf"(%arg4) : (f32) -> bf16
      "linalg.yield"(%2) : (bf16) -> ()
    }) : (tensor<128x?x128xf32>, tensor<128x?x3x128xf32>, tensor<128x?x128xbf16>) -> tensor<128x?x128xbf16>
    "func.return"(%1) : (tensor<128x?x128xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<?xbf16>, index) -> tensor<?xbf16>, sym_name = "push_redcutionextract_through_generic_withoutsused_2"}> ({
  ^bb0(%arg0: tensor<128x128xf32>, %arg1: tensor<?xbf16>, %arg2: index):
    %0 = "tensor.extract_slice"(%arg0, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<128x128xf32>, index, index, index, index) -> tensor<?x?xf32>
    %1 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: bf16):
      %2 = "arith.truncf"(%arg3) : (f32) -> bf16
      %3 = "arith.addf"(%2, %arg4) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
      "linalg.yield"(%3) : (bf16) -> ()
    }) : (tensor<?x?xf32>, tensor<?xbf16>) -> tensor<?xbf16>
    "func.return"(%1) : (tensor<?xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128x128xf32>, tensor<?xbf16>, index) -> tensor<?xbf16>, sym_name = "nopush_rankreducingextract"}> ({
  ^bb0(%arg0: tensor<128x128x128xf32>, %arg1: tensor<?xbf16>, %arg2: index):
    %0 = "tensor.extract_slice"(%arg0, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<128x128x128xf32>, index, index, index, index) -> tensor<?x?xf32>
    %1 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: bf16):
      %2 = "arith.truncf"(%arg3) : (f32) -> bf16
      %3 = "arith.addf"(%2, %arg4) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
      "linalg.yield"(%3) : (bf16) -> ()
    }) : (tensor<?x?xf32>, tensor<?xbf16>) -> tensor<?xbf16>
    "func.return"(%1) : (tensor<?xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<?x?xbf16>, index, f32) -> tensor<?x?xbf16>, sym_name = "push_extract_through_generic_rank0_operand"}> ({
  ^bb0(%arg0: tensor<128x128xf32>, %arg1: tensor<?x?xbf16>, %arg2: index, %arg3: f32):
    %0 = "tensor.extract_slice"(%arg0, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<128x128xf32>, index, index, index, index) -> tensor<?x?xf32>
    %1 = "linalg.generic"(%0, %arg3, %arg1) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: bf16):
      %2 = "arith.truncf"(%arg4) : (f32) -> bf16
      "linalg.yield"(%2) : (bf16) -> ()
    }) : (tensor<?x?xf32>, f32, tensor<?x?xbf16>) -> tensor<?x?xbf16>
    "func.return"(%1) : (tensor<?x?xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<?x?xbf16>, index) -> tensor<?x?xbf16>, sym_name = "push_extract_through_generic_secondextract"}> ({
  ^bb0(%arg0: tensor<128x128xf32>, %arg1: tensor<?x?xbf16>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 32 : index}> : () -> index
    %2 = "tensor.extract_slice"(%arg0, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<128x128xf32>, index, index, index, index) -> tensor<?x?xf32>
    %3 = "scf.for"(%0, %1, %arg2, %arg1) ({
    ^bb0(%arg3: index, %arg4: tensor<?x?xbf16>):
      %4 = "tensor.extract_slice"(%arg0, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<128x128xf32>, index, index, index, index) -> tensor<?x?xf32>
      %5 = "linalg.generic"(%2, %4, %arg1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32, %arg7: bf16):
        %6 = "arith.truncf"(%arg5) : (f32) -> bf16
        "linalg.yield"(%6) : (bf16) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xbf16>) -> tensor<?x?xbf16>
      "scf.yield"(%5) : (tensor<?x?xbf16>) -> ()
    }) : (index, index, index, tensor<?x?xbf16>) -> tensor<?x?xbf16>
    "func.return"(%3) : (tensor<?x?xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

