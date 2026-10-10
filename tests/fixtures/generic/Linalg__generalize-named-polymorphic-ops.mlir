#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_matmul_tensor_f16f64f32"}> ({
  ^bb0(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f64, %arg5: f32):
      %1 = "arith.extf"(%arg3) : (f16) -> f32
      %2 = "arith.truncf"(%arg4) : (f64) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>, sym_name = "generalize_matmul_tensor_i16i64i32"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i64, %arg5: i32):
      %1 = "arith.extsi"(%arg3) : (i16) -> i32
      %2 = "arith.trunci"(%arg4) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>
    "func.return"(%0) : (tensor<16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>, sym_name = "generalize_matmul_tensor_i16i64i32_unsigned"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{cast = #linalg.type_fn<cast_unsigned>, indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i64, %arg5: i32):
      %1 = "arith.extui"(%arg3) : (i16) -> i32
      %2 = "arith.trunci"(%arg4) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>
    "func.return"(%0) : (tensor<16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_matmul_tensor_i16i64f32"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i64, %arg5: f32):
      %1 = "arith.sitofp"(%arg3) : (i16) -> f32
      %2 = "arith.sitofp"(%arg4) : (i64) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xi32>) -> tensor<16x32xi32>, sym_name = "generalize_matmul_tensor_f16f64i32"}> ({
  ^bb0(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f64, %arg5: i32):
      %1 = "arith.fptosi"(%arg3) : (f16) -> i32
      %2 = "arith.fptosi"(%arg4) : (f64) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xi32>) -> tensor<16x32xi32>
    "func.return"(%0) : (tensor<16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>, sym_name = "generalize_matmul_unsigned_tensor_i16i64i32"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{cast = #linalg.type_fn<cast_unsigned>, indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i64, %arg5: i32):
      %1 = "arith.extui"(%arg3) : (i16) -> i32
      %2 = "arith.trunci"(%arg4) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xi32>) -> tensor<16x32xi32>
    "func.return"(%0) : (tensor<16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_matmul_unsigned_tensor_i16i64f32"}> ({
  ^bb0(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{cast = #linalg.type_fn<cast_unsigned>, indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i16, %arg4: i64, %arg5: f32):
      %1 = "arith.uitofp"(%arg3) : (i16) -> f32
      %2 = "arith.uitofp"(%arg4) : (i64) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<16x8xi16>, tensor<8x32xi64>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xi32>) -> tensor<16x32xi32>, sym_name = "generalize_matmul_unsigned_tensor_f16f64i32"}> ({
  ^bb0(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xi32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{cast = #linalg.type_fn<cast_unsigned>, indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f64, %arg5: i32):
      %1 = "arith.fptoui"(%arg3) : (f16) -> i32
      %2 = "arith.fptoui"(%arg4) : (f64) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xi32>) -> tensor<16x32xi32>
    "func.return"(%0) : (tensor<16x32xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_matmul_as_contraction_tensor_f16f64f32"}> ({
  ^bb0(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xf32>):
    %0 = "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f64, %arg5: f32):
      %1 = "arith.extf"(%arg3) : (f16) -> f32
      %2 = "arith.truncf"(%arg4) : (f64) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf16>, tensor<12x25xf16>, tensor<24x25xf32>) -> tensor<24x25xf16>, sym_name = "generalize_matmul_as_contract_with_ext_and_trunc"}> ({
  ^bb0(%arg0: tensor<24x12xf16>, %arg1: tensor<12x25xf16>, %arg2: tensor<24x25xf32>):
    %0 = "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16, %arg5: f32):
      %2 = "arith.extf"(%arg3) : (f16) -> f32
      %3 = "arith.extf"(%arg4) : (f16) -> f32
      %4 = "arith.mulf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<24x12xf16>, tensor<12x25xf16>, tensor<24x25xf32>) -> tensor<24x25xf32>
    %1 = "arith.truncf"(%0) : (tensor<24x25xf32>) -> tensor<24x25xf16>
    "func.return"(%1) : (tensor<24x25xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xf32>, tensor<2x2xf32>, tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>, sym_name = "generalize_pooling_nhwc_max_f32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xf32>, %arg1: tensor<2x2xf32>, %arg2: tensor<1x2x4x1xf32>):
    %0 = "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xf32>, tensor<2x2xf32>, tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>
    "func.return"(%0) : (tensor<1x2x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xf32>, tensor<2xf32>, tensor<1x4x1xf32>) -> tensor<1x4x1xf32>, sym_name = "generalize_pooling_nwc_max_f32"}> ({
  ^bb0(%arg0: tensor<1x16x1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<1x4x1xf32>):
    %0 = "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xf32>, tensor<2xf32>, tensor<1x4x1xf32>) -> tensor<1x4x1xf32>
    "func.return"(%0) : (tensor<1x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>, sym_name = "generalize_pooling_nhwc_max_i32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>):
    %0 = "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.maxsi"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    "func.return"(%0) : (tensor<1x2x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>, sym_name = "generalize_pooling_nwc_max_i32"}> ({
  ^bb0(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>):
    %0 = "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.maxsi"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    "func.return"(%0) : (tensor<1x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>, sym_name = "generalize_pooling_nhwc_max_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>):
    %0 = "linalg.pooling_nhwc_max_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.maxui"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    "func.return"(%0) : (tensor<1x2x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>, sym_name = "generalize_pooling_nwc_max_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>):
    %0 = "linalg.pooling_nwc_max_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.maxui"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    "func.return"(%0) : (tensor<1x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xf32>, tensor<2x2xf32>, tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>, sym_name = "generalize_pooling_nhwc_min_f32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xf32>, %arg1: tensor<2x2xf32>, %arg2: tensor<1x2x4x1xf32>):
    %0 = "linalg.pooling_nhwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xf32>, tensor<2x2xf32>, tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>
    "func.return"(%0) : (tensor<1x2x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xf32>, tensor<2xf32>, tensor<1x4x1xf32>) -> tensor<1x4x1xf32>, sym_name = "generalize_pooling_nwc_min_f32"}> ({
  ^bb0(%arg0: tensor<1x16x1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<1x4x1xf32>):
    %0 = "linalg.pooling_nwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xf32>, tensor<2xf32>, tensor<1x4x1xf32>) -> tensor<1x4x1xf32>
    "func.return"(%0) : (tensor<1x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>, sym_name = "generalize_pooling_nhwc_min_i32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>):
    %0 = "linalg.pooling_nhwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.minsi"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    "func.return"(%0) : (tensor<1x2x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>, sym_name = "generalize_pooling_nwc_min_i32"}> ({
  ^bb0(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>):
    %0 = "linalg.pooling_nwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.minsi"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    "func.return"(%0) : (tensor<1x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>, sym_name = "generalize_pooling_nhwc_min_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>):
    %0 = "linalg.pooling_nhwc_min_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.minui"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    "func.return"(%0) : (tensor<1x2x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>, sym_name = "generalize_pooling_nwc_min_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>):
    %0 = "linalg.pooling_nwc_min_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.minui"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    "func.return"(%0) : (tensor<1x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xf32>, tensor<2x2xf32>, tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>, sym_name = "generalize_pooling_nhwc_sum_f32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xf32>, %arg1: tensor<2x2xf32>, %arg2: tensor<1x2x4x1xf32>):
    %0 = "linalg.pooling_nhwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xf32>, tensor<2x2xf32>, tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>
    "func.return"(%0) : (tensor<1x2x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xf32>, tensor<2xf32>, tensor<1x4x1xf32>) -> tensor<1x4x1xf32>, sym_name = "generalize_pooling_nwc_sum_f32"}> ({
  ^bb0(%arg0: tensor<1x16x1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<1x4x1xf32>):
    %0 = "linalg.pooling_nwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xf32>, tensor<2xf32>, tensor<1x4x1xf32>) -> tensor<1x4x1xf32>
    "func.return"(%0) : (tensor<1x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 4 + d5 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>, sym_name = "generalize_pooling_nhwc_sum_i32"}> ({
  ^bb0(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>):
    %0 = "linalg.pooling_nhwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.addi"(%arg5, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x16x1xi32>, tensor<2x2xi32>, tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    "func.return"(%0) : (tensor<1x2x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 4 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>, sym_name = "generalize_pooling_nwc_sum_i32"}> ({
  ^bb0(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>):
    %0 = "linalg.pooling_nwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<4> : tensor<1xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.addi"(%arg5, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x1xi32>, tensor<2xi32>, tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    "func.return"(%0) : (tensor<1x4x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, tensor<f32>) -> tensor<f32>, sym_name = "generalize_fill_0d"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<f32>):
    %0 = "linalg.fill"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<16x32xf32>) -> (), sym_name = "generalize_fill_2d"}> ({
  ^bb0(%arg0: f32, %arg1: memref<16x32xf32>):
    "linalg.fill"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<16x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (f64, f64, i32, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_index"}> ({
  ^bb0(%arg0: f64, %arg1: f64, %arg2: i32, %arg3: tensor<16x32xf32>):
    %0 = "linalg.fill_rng_2d"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: f64, %arg5: f64, %arg6: i32, %arg7: f32):
      %1 = "arith.constant"() <{value = 2147483647 : i64}> : () -> i64
      %2 = "arith.sitofp"(%1) : (i64) -> f64
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "arith.index_cast"(%3) : (index) -> i32
      %5 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%6, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %8 = "arith.constant"() <{value = 1103515245 : i64}> : () -> i64
      %9 = "arith.trunci"(%8) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %10 = "arith.muli"(%7, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %11 = "arith.constant"() <{value = 12345 : i64}> : () -> i64
      %12 = "arith.trunci"(%11) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %13 = "arith.addi"(%10, %12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %14 = "arith.addi"(%4, %13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.constant"() <{value = 1103515245 : i64}> : () -> i64
      %16 = "arith.trunci"(%15) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %17 = "arith.muli"(%14, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %18 = "arith.constant"() <{value = 12345 : i64}> : () -> i64
      %19 = "arith.trunci"(%18) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %20 = "arith.addi"(%17, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %21 = "arith.sitofp"(%20) : (i32) -> f64
      %22 = "arith.addf"(%2, %21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %23 = "arith.subf"(%arg5, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %24 = "arith.constant"() <{value = 2.3283063999999999E-10 : f64}> : () -> f64
      %25 = "arith.mulf"(%23, %24) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %26 = "arith.mulf"(%22, %25) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %27 = "arith.addf"(%26, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %28 = "arith.truncf"(%27) : (f64) -> f32
      "linalg.yield"(%28) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map, #map, #map1]} : (f64, f64, i32, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (f64, f64, i32, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_const"}> ({
  ^bb0(%arg0: f64, %arg1: f64, %arg2: i32, %arg3: tensor<16x32xf32>):
    %0 = "linalg.fill_rng_2d"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: f64, %arg5: f64, %arg6: i32, %arg7: f32):
      %1 = "arith.constant"() <{value = 2147483647 : i64}> : () -> i64
      %2 = "arith.sitofp"(%1) : (i64) -> f64
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "arith.index_cast"(%3) : (index) -> i32
      %5 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%6, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %8 = "arith.constant"() <{value = 1103515245 : i64}> : () -> i64
      %9 = "arith.trunci"(%8) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %10 = "arith.muli"(%7, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %11 = "arith.constant"() <{value = 12345 : i64}> : () -> i64
      %12 = "arith.trunci"(%11) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %13 = "arith.addi"(%10, %12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %14 = "arith.addi"(%4, %13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.constant"() <{value = 1103515245 : i64}> : () -> i64
      %16 = "arith.trunci"(%15) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %17 = "arith.muli"(%14, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %18 = "arith.constant"() <{value = 12345 : i64}> : () -> i64
      %19 = "arith.trunci"(%18) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
      %20 = "arith.addi"(%17, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %21 = "arith.sitofp"(%20) : (i32) -> f64
      %22 = "arith.addf"(%2, %21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %23 = "arith.subf"(%arg5, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %24 = "arith.constant"() <{value = 2.3283063999999999E-10 : f64}> : () -> f64
      %25 = "arith.mulf"(%23, %24) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %26 = "arith.mulf"(%22, %25) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %27 = "arith.addf"(%26, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %28 = "arith.truncf"(%27) : (f64) -> f32
      "linalg.yield"(%28) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map, #map, #map1]} : (f64, f64, i32, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32>, tensor<4x8xf32>) -> tensor<4x8xf32>, sym_name = "generalize_copy"}> ({
  ^bb0(%arg0: tensor<4x8xf32>, %arg1: tensor<4x8xf32>):
    %0 = "linalg.copy"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<4x8xf32>, tensor<4x8xf32>) -> tensor<4x8xf32>
    "func.return"(%0) : (tensor<4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

