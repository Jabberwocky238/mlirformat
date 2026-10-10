#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x32x10x4096xf32>, tensor<2x32xf32>) -> tensor<2x32xf32>, sym_name = "collapse_reduction"}> ({
  ^bb0(%arg0: tensor<2x32x10x4096xf32>, %arg1: tensor<2x32xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<2x32x10x4096xf32>, tensor<2x32xf32>) -> tensor<2x32xf32>
    "func.return"(%0) : (tensor<2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x2x10x4096xf32>, tensor<2x32x10x4096xf32>) -> tensor<2x32x10x4096xf32>, sym_name = "collapse_parallel"}> ({
  ^bb0(%arg0: tensor<32x2x10x4096xf32>, %arg1: tensor<2x32x10x4096xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<32x2x10x4096xf32>, tensor<2x32x10x4096xf32>) -> tensor<2x32x10x4096xf32>
    "func.return"(%0) : (tensor<2x32x10x4096xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<41x3x1x57xf32>, tensor<3x1x57x41xf32>) -> tensor<3x1x57x41xf32>, sym_name = "uncollapsable"}> ({
  ^bb0(%arg0: tensor<41x3x1x57xf32>, %arg1: tensor<3x1x57x41xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<41x3x1x57xf32>, tensor<3x1x57x41xf32>) -> tensor<3x1x57x41xf32>
    "func.return"(%0) : (tensor<3x1x57x41xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x24x32x8xf32>, memref<1x24x32x8xf32>) -> memref<1x24x32x8xf32>, sym_name = "collapsable_memref", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<1x24x32x8xf32>, %arg1: memref<1x24x32x8xf32>):
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x24x32x8xf32>
    "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %1 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<1x24x32x8xf32>, memref<1x24x32x8xf32>, memref<1x24x32x8xf32>) -> ()
    "func.return"(%0) : (memref<1x24x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 * 7680 + d1 * 320 + d2 * 10 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x24x32x8xf32>, memref<1x24x32x8xf32>, memref<1x24x32x8xf32, #map>) -> (), sym_name = "collapsable_memref_projected_ops"}> ({
  ^bb0(%arg0: memref<1x24x32x8xf32>, %arg1: memref<1x24x32x8xf32>, %arg2: memref<1x24x32x8xf32, #map>):
    "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<1x24x32x8xf32>, memref<1x24x32x8xf32>, memref<1x24x32x8xf32, #map>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x6x24x48xi32>, memref<2x6x24x48xi32>) -> memref<2x6x24x48xi32>, sym_name = "uncollapsable_strided_memref"}> ({
  ^bb0(%arg0: memref<2x6x24x48xi32>, %arg1: memref<2x6x24x48xi32>):
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x6x24x48xi32>
    %1 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 3, 12, 24>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<2x6x24x48xi32>) -> memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>
    %2 = "memref.subview"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 3, 12, 24>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<2x6x24x48xi32>) -> memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>
    %3 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 3, 12, 24>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<2x6x24x48xi32>) -> memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>
    "linalg.generic"(%1, %2, %3) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %4 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>, memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>, memref<1x3x12x24xi32, strided<[6912, 1152, 48, 1]>>) -> ()
    "func.return"(%0) : (memref<2x6x24x48xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 * 7680 + d1 * 320 + d2 * 8 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x24x32x8xf32>, memref<1x24x32x8xf32>, memref<1x24x32x8xf32, #map>) -> (), sym_name = "uncollapsable_memref_projected_ops"}> ({
  ^bb0(%arg0: memref<1x24x32x8xf32>, %arg1: memref<1x24x32x8xf32>, %arg2: memref<1x24x32x8xf32, #map>):
    "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<1x24x32x8xf32>, memref<1x24x32x8xf32>, memref<1x24x32x8xf32, #map>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4x5xf32, 1 : i64>, tensor<1x2x3x4x5xf32, 3 : i64>) -> tensor<1x2x3x4x5xf32, 3 : i64>, sym_name = "linalg_copy"}> ({
  ^bb0(%arg0: tensor<1x2x3x4x5xf32, 1 : i64>, %arg1: tensor<1x2x3x4x5xf32, 3 : i64>):
    %0 = "linalg.copy"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<1x2x3x4x5xf32, 1 : i64>, tensor<1x2x3x4x5xf32, 3 : i64>) -> tensor<1x2x3x4x5xf32, 3 : i64>
    "func.return"(%0) : (tensor<1x2x3x4x5xf32, 3 : i64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x24x32x8xf32, 1>, memref<1x24x32x8xf32, 1>) -> (), sym_name = "memref_linalg_copy", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<1x24x32x8xf32, 1>, %arg1: memref<1x24x32x8xf32, 1>):
    "linalg.copy"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (memref<1x24x32x8xf32, 1>, memref<1x24x32x8xf32, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

