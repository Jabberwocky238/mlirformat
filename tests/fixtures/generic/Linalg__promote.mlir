#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index, index, index) -> (), sym_name = "matmul_f32"}> ({
  ^bb0(%arg1: memref<?xi8>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "memref.view"(%arg1, %5, %arg2, %arg4) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %8 = "memref.view"(%arg1, %5, %arg4, %arg3) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %9 = "memref.view"(%arg1, %5, %arg2, %arg3) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %10 = "memref.dim"(%7, %5) : (memref<?x?xf32>, index) -> index
    %11 = "memref.dim"(%7, %6) : (memref<?x?xf32>, index) -> index
    %12 = "memref.dim"(%8, %6) : (memref<?x?xf32>, index) -> index
    "scf.for"(%5, %10, %4) ({
    ^bb0(%arg5: index):
      "scf.for"(%5, %12, %3) ({
      ^bb0(%arg6: index):
        "scf.for"(%5, %11, %2) ({
        ^bb0(%arg7: index):
          %13 = "memref.subview"(%7, %arg5, %arg7, %4, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index, index, index) -> memref<?x?xf32, strided<[?, 1], offset: ?>>
          %14 = "memref.subview"(%8, %arg7, %arg6, %2, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index, index, index) -> memref<?x?xf32, strided<[?, 1], offset: ?>>
          %15 = "memref.subview"(%9, %arg5, %arg6, %4, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index, index, index) -> memref<?x?xf32, strided<[?, 1], offset: ?>>
          "linalg.matmul"(%13, %14, %15) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
            %16 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %17 = "arith.addf"(%arg10, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "linalg.yield"(%17) : (f32) -> ()
          }) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [], use_alloca, use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index, index, index) -> (), sym_name = "matmul_f64"}> ({
  ^bb0(%arg1: memref<?xi8>, %arg2: index, %arg3: index, %arg4: index):
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "memref.view"(%arg1, %5, %arg2, %arg4) : (memref<?xi8>, index, index, index) -> memref<?x?xf64>
    %8 = "memref.view"(%arg1, %5, %arg4, %arg3) : (memref<?xi8>, index, index, index) -> memref<?x?xf64>
    %9 = "memref.view"(%arg1, %5, %arg2, %arg3) : (memref<?xi8>, index, index, index) -> memref<?x?xf64>
    %10 = "memref.dim"(%7, %5) : (memref<?x?xf64>, index) -> index
    %11 = "memref.dim"(%7, %6) : (memref<?x?xf64>, index) -> index
    %12 = "memref.dim"(%8, %6) : (memref<?x?xf64>, index) -> index
    "scf.for"(%5, %10, %4) ({
    ^bb0(%arg5: index):
      "scf.for"(%5, %12, %3) ({
      ^bb0(%arg6: index):
        "scf.for"(%5, %11, %2) ({
        ^bb0(%arg7: index):
          %13 = "memref.subview"(%7, %arg5, %arg7, %4, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf64>, index, index, index, index) -> memref<?x?xf64, strided<[?, 1], offset: ?>>
          %14 = "memref.subview"(%8, %arg7, %arg6, %2, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf64>, index, index, index, index) -> memref<?x?xf64, strided<[?, 1], offset: ?>>
          %15 = "memref.subview"(%9, %arg5, %arg6, %4, %3) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf64>, index, index, index, index) -> memref<?x?xf64, strided<[?, 1], offset: ?>>
          "linalg.matmul"(%13, %14, %15) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg8: f64, %arg9: f64, %arg10: f64):
            %16 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
            %17 = "arith.addf"(%arg10, %16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
            "linalg.yield"(%17) : (f64) -> ()
          }) : (memref<?x?xf64, strided<[?, 1], offset: ?>>, memref<?x?xf64, strided<[?, 1], offset: ?>>, memref<?x?xf64, strided<[?, 1], offset: ?>>) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [], use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "gemm_shared"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 16, 16, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.structured.promote"(%1#0) <{mapping = [#gpu.memory_space<workgroup>], operands_to_promote = [0, 1], use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "gemm_private"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 16, 16, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.structured.promote"(%1#0) <{mapping = [#gpu.memory_space<private>], operands_to_promote = [0, 1], use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x64xf32, strided<[?, ?, ?, ?], offset: ?>>, memref<128x3x3x64xf32, strided<[?, ?, ?, ?], offset: ?>>, memref<?x?x?x128xf32>, index, index, index, index, index, index, index, index) -> (), sym_name = "promote_rank_reducing_subviews"}> ({
  ^bb0(%arg1: memref<?x?x?x64xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg2: memref<128x3x3x64xf32, strided<[?, ?, ?, ?], offset: ?>>, %arg3: memref<?x?x?x128xf32>, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %2 = "memref.subview"(%arg1, %arg4, %arg5, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 3, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 1, -9223372036854775808, 32>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<?x?x?x64xf32, strided<[?, ?, ?, ?], offset: ?>>, index, index, index, index) -> memref<?x32xf32, strided<[?, ?], offset: ?>>
    %3 = "memref.subview"(%arg2, %arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 128, 1, 1, 32>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<128x3x3x64xf32, strided<[?, ?, ?, ?], offset: ?>>, index, index, index) -> memref<128x32xf32, strided<[?, ?], offset: ?>>
    %4 = "memref.subview"(%arg3, %arg4, %arg5, %arg6, %arg11) <{operandSegmentSizes = array<i32: 1, 3, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: 1, 1, -9223372036854775808, 128>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<?x?x?x128xf32>, index, index, index, index) -> memref<?x128xf32, strided<[128, 1], offset: ?>>
    "linalg.generic"(%2, %3, %4) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %5 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg14, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<?x32xf32, strided<[?, ?], offset: ?>>, memref<128x32xf32, strided<[?, ?], offset: ?>>, memref<?x128xf32, strided<[128, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [], use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x4xf32, 1>, memref<8x4xf32, 1>) -> memref<8x4xf32, 1>, sym_name = "linalg_generic_update_all_function_inputs_outputs"}> ({
  ^bb0(%arg1: memref<8x4xf32, 1>, %arg2: memref<8x4xf32, 1>):
    %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x4xf32, 1>
    %3 = "memref.subview"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 3>, static_strides = array<i64: 1, 1>}> : (memref<8x4xf32, 1>) -> memref<4x3xf32, strided<[4, 1]>, 1>
    %4 = "memref.subview"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 3>, static_strides = array<i64: 1, 1>}> : (memref<8x4xf32, 1>) -> memref<4x3xf32, strided<[4, 1]>, 1>
    %5 = "memref.subview"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 3>, static_strides = array<i64: 1, 1>}> : (memref<8x4xf32, 1>) -> memref<4x3xf32, strided<[4, 1]>, 1>
    "linalg.generic"(%3, %4, %5) <{doc = "", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %6 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<4x3xf32, strided<[4, 1]>, 1>, memref<4x3xf32, strided<[4, 1]>, 1>, memref<4x3xf32, strided<[4, 1]>, 1>) -> ()
    "func.return"(%2) : (memref<8x4xf32, 1>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{memory_space = #gpu.address_space<workgroup>, operands_to_promote = [], use_full_tile_buffers = []}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

