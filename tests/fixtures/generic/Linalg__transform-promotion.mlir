#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) -> (), sym_name = "promote_subview_matmul"}> ({
  ^bb0(%arg1: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg2: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg3: memref<?x?xf32, strided<[?, 1], offset: ?>>):
    %2 = "arith.constant"() <{value = 2000 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3000 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4000 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "memref.dim"(%arg1, %5) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index
    %8 = "memref.dim"(%arg1, %6) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index
    %9 = "memref.dim"(%arg2, %6) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index
    "scf.for"(%5, %7, %2) ({
    ^bb0(%arg4: index):
      "scf.for"(%5, %9, %3) ({
      ^bb0(%arg5: index):
        "scf.for"(%5, %8, %4) ({
        ^bb0(%arg6: index):
          %10 = "memref.subview"(%arg1, %arg4, %arg6, %2, %4, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
          %11 = "memref.subview"(%arg2, %arg6, %arg5, %4, %3, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
          %12 = "memref.subview"(%arg3, %arg4, %arg5, %2, %3, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
          "linalg.matmul"(%10, %11, %12) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
            %13 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %14 = "arith.addf"(%arg9, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "linalg.yield"(%14) : (f32) -> ()
          }) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>) -> ()
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
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [0, 1, 2], use_full_tile_buffers = [], use_full_tiles_by_default}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?xf32, strided<[?, 1], offset: ?>>) -> (), sym_name = "promote_first_subview_matmul"}> ({
  ^bb0(%arg1: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg2: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg3: memref<?x?xf32, strided<[?, 1], offset: ?>>):
    %2 = "arith.constant"() <{value = 2000 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3000 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4000 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "memref.dim"(%arg1, %5) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index
    %8 = "memref.dim"(%arg1, %6) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index
    %9 = "memref.dim"(%arg2, %6) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index) -> index
    "scf.for"(%5, %7, %2) ({
    ^bb0(%arg4: index):
      "scf.for"(%5, %9, %3) ({
      ^bb0(%arg5: index):
        "scf.for"(%5, %8, %4) ({
        ^bb0(%arg6: index):
          %10 = "memref.subview"(%arg1, %arg4, %arg6, %2, %4, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
          %11 = "memref.subview"(%arg2, %arg6, %arg5, %4, %3, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
          %12 = "memref.subview"(%arg3, %arg4, %arg5, %2, %3, %6, %6) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
          "linalg.matmul"(%10, %11, %12) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
            %13 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %14 = "arith.addf"(%arg9, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "linalg.yield"(%14) : (f32) -> ()
          }) {__internal_linalg_transform__ = "_promote_first_view_"} : (memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{operands_to_promote = [0], use_full_tile_buffers = [], use_full_tiles_by_default}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>) -> (), sym_name = "aligned_promote_fill"}> ({
  ^bb0(%arg1: memref<?x?xf32, strided<[?, 1], offset: ?>>):
    %2 = "arith.constant"() <{value = 2000 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4000 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "memref.subview"(%arg1, %4, %4, %2, %3, %5, %5) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xf32, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    "linalg.fill"(%6, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<?x?xf32, strided<[?, ?], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{alignment = 32 : i64, operands_to_promote = [1], use_full_tile_buffers = [false, true]}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xcomplex<f32>, strided<[?, 1], offset: ?>>) -> (), sym_name = "aligned_promote_fill_complex"}> ({
  ^bb0(%arg1: memref<?x?xcomplex<f32>, strided<[?, 1], offset: ?>>):
    %2 = "arith.constant"() <{value = 2000 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4000 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "complex.create"(%6, %6) : (f32, f32) -> complex<f32>
    %8 = "memref.subview"(%arg1, %4, %4, %2, %3, %5, %5) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xcomplex<f32>, strided<[?, 1], offset: ?>>, index, index, index, index, index, index) -> memref<?x?xcomplex<f32>, strided<[?, ?], offset: ?>>
    "linalg.fill"(%7, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: complex<f32>, %arg3: complex<f32>):
      "linalg.yield"(%arg2) : (complex<f32>) -> ()
    }) : (complex<f32>, memref<?x?xcomplex<f32>, strided<[?, ?], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.promote"(%0) <{alignment = 32 : i64, operands_to_promote = [1], use_full_tile_buffers = [false, true]}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

