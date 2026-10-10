#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "gemm"}> ({
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
      %2 = "transform.structured.promote"(%1#0) <{operands_to_promote = [0, 2], use_full_tile_buffers = [], use_full_tiles_by_default}> {force_full_tiles = [false, false]} : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 512, s0)>
#map1 = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x256xf32>, memref<256x512xf32>, memref<256x256xf32>, index, index, index) -> (), sym_name = "matmul_f32"}> ({
  ^bb0(%arg1: memref<512x256xf32>, %arg2: memref<256x512xf32>, %arg3: memref<256x256xf32>, %arg4: index, %arg5: index, %arg6: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 256 : index}> : () -> index
    %4 = "arith.constant"() <{value = 512 : index}> : () -> index
    "scf.for"(%2, %4, %arg4) ({
    ^bb0(%arg7: index):
      "scf.for"(%2, %4, %arg5) ({
      ^bb0(%arg8: index):
        "scf.for"(%2, %3, %arg6) ({
        ^bb0(%arg9: index):
          %5 = "affine.min"(%arg7, %arg4) <{map = #map}> : (index, index) -> index
          %6 = "affine.min"(%arg8, %arg5) <{map = #map}> : (index, index) -> index
          %7 = "affine.min"(%arg9, %arg6) <{map = #map1}> : (index, index) -> index
          %8 = "memref.subview"(%arg1, %arg7, %arg9, %5, %7) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<512x256xf32>, index, index, index, index) -> memref<?x?xf32, strided<[256, 1], offset: ?>>
          %9 = "memref.subview"(%arg2, %arg9, %arg8, %7, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<256x512xf32>, index, index, index, index) -> memref<?x?xf32, strided<[512, 1], offset: ?>>
          %10 = "memref.subview"(%arg3, %arg7, %arg8, %5, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<256x256xf32>, index, index, index, index) -> memref<?x?xf32, strided<[256, 1], offset: ?>>
          "linalg.matmul"(%8, %9, %10) <{indexing_maps = [#map2, #map3, #map4], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
            %11 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %12 = "arith.addf"(%arg12, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "linalg.yield"(%12) : (f32) -> ()
          }) : (memref<?x?xf32, strided<[256, 1], offset: ?>>, memref<?x?xf32, strided<[512, 1], offset: ?>>, memref<?x?xf32, strided<[256, 1], offset: ?>>) -> ()
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
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [], use_full_tile_buffers = [], use_original_subview_size}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

