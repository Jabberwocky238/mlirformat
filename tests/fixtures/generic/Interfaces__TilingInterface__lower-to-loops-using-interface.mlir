#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "gemm"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "gemm"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: memref<?xf32>, %arg5: memref<?xf32>):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %5 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg11, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "linalg.matvec"(%arg1, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %3 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg8, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (memref<?x?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      %2:5 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<200x300xi32>, memref<300xi16>, memref<200xi8>, memref<300x200xi64>) -> (), sym_name = "indexed_generic"}> ({
  ^bb0(%arg1: memref<200x300xi32>, %arg2: memref<300xi16>, %arg3: memref<200xi8>, %arg4: memref<300x200xi64>):
    "linalg.generic"(%arg1, %arg2, %arg3, %arg4) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i16, %arg7: i8, %arg8: i64):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "arith.index_cast"(%2) : (index) -> i16
      %4 = "arith.muli"(%arg6, %3) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      %5 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %6 = "arith.index_cast"(%5) : (index) -> i8
      %7 = "arith.muli"(%arg7, %6) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %8 = "arith.extsi"(%4) : (i16) -> i32
      %9 = "arith.extsi"(%7) : (i8) -> i32
      %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %11 = "arith.addi"(%10, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %12 = "arith.extsi"(%11) : (i32) -> i64
      "linalg.yield"(%12) : (i64) -> ()
    }) : (memref<200x300xi32>, memref<300xi16>, memref<200xi8>, memref<300x200xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4 * 3, d2 * 2 + d5 * 4, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) -> (), sym_name = "conv_strides_and_dilation"}> ({
  ^bb0(%arg1: memref<?x?x?x?xf32>, %arg2: memref<?x?x?x?xf32>, %arg3: memref<?x?x?x?xf32>):
    "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<[3, 4]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[1, 2]> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?xf32>, memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4 * 3, d2 * 2 + d5 * 4, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, memref<?x?xf32>, memref<?x?x?x?xf32>) -> (), sym_name = "pool_strides_and_dilation"}> ({
  ^bb0(%arg1: memref<?x?x?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?x?x?xf32>):
    "linalg.pooling_nhwc_max"(%arg1, %arg2, %arg3) <{dilations = dense<[3, 4]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[1, 2]> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.maximumf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?xf32>, memref<?x?xf32>, memref<?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nhwc_max"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64xf32>, memref<64xf32>, memref<64xf32>) -> (), sym_name = "map"}> ({
  ^bb0(%arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>):
    "linalg.map"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<64xf32>, memref<64xf32>, memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.map"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<32x64x16xf32>) -> (), sym_name = "transpose"}> ({
  ^bb0(%arg1: memref<16x32x64xf32>, %arg2: memref<32x64x16xf32>):
    "linalg.transpose"(%arg1, %arg2) <{permutation = array<i64: 1, 2, 0>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (memref<16x32x64xf32>, memref<32x64x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.transpose"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x32x64xf32>, memref<16x64xf32>) -> (), sym_name = "reduce"}> ({
  ^bb0(%arg1: memref<16x32x64xf32>, %arg2: memref<16x64xf32>):
    "linalg.reduce"(%arg1, %arg2) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (memref<16x32x64xf32>, memref<16x64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.reduce"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x32xf32>, memref<8x16x32xf32>) -> (), sym_name = "broadcast"}> ({
  ^bb0(%arg1: memref<8x32xf32>, %arg2: memref<8x16x32xf32>):
    "linalg.broadcast"(%arg1, %arg2) <{dimensions = array<i64: 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (memref<8x32xf32>, memref<8x16x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.broadcast"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.convert_to_loops"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

