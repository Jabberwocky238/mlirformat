#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x8xf32>, memref<8x32xf32>, memref<16x32xf32>) -> (), sym_name = "generalize_matmul_buffer"}> ({
  ^bb0(%arg0: memref<16x8xf32>, %arg1: memref<8x32xf32>, %arg2: memref<16x32xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<16x8xf32>, memref<8x32xf32>, memref<16x32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_a"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<8x32xf32>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_matmul_tensor"}> ({
  ^bb0(%arg0: tensor<16x8xf32>, %arg1: tensor<8x32xf32>, %arg2: tensor<16x32xf32>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<8x32xf32>, tensor<16x32xf32>) -> tensor<16x32xf32>
    "func.return"(%0) : (tensor<16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xcomplex<f32>>, tensor<8x32xcomplex<f32>>, tensor<16x32xcomplex<f32>>) -> tensor<16x32xcomplex<f32>>, sym_name = "generalize_matmul_tensor_complex"}> ({
  ^bb0(%arg0: tensor<16x8xcomplex<f32>>, %arg1: tensor<8x32xcomplex<f32>>, %arg2: tensor<16x32xcomplex<f32>>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: complex<f32>, %arg4: complex<f32>, %arg5: complex<f32>):
      %1 = "complex.mul"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      %2 = "complex.add"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%2) : (complex<f32>) -> ()
    }) : (tensor<16x8xcomplex<f32>>, tensor<8x32xcomplex<f32>>, tensor<16x32xcomplex<f32>>) -> tensor<16x32xcomplex<f32>>
    "func.return"(%0) : (tensor<16x32xcomplex<f32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d5, d2 + d6, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x4x5x2xf32>, memref<2x2x2x3xf32>, memref<2x3x4x2x3xf32>) -> (), sym_name = "depthwise_conv_2d_nhwc_hwcm"}> ({
  ^bb0(%arg0: memref<2x4x5x2xf32>, %arg1: memref<2x2x2x3xf32>, %arg2: memref<2x3x4x2x3xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<2x4x5x2xf32>, memref<2x2x2x3xf32>, memref<2x3x4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d5 * 2, d2 + d6 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x4x5x2xf32>, memref<2x2x2x3xf32>, memref<2x2x3x2x3xf32>) -> (), sym_name = "depthwise_conv_2d_nhwc_hwcm"}> ({
  ^bb0(%arg0: memref<2x4x5x2xf32>, %arg1: memref<2x2x2x3xf32>, %arg2: memref<2x2x3x2x3xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<2x4x5x2xf32>, memref<2x2x2x3xf32>, memref<2x2x3x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x113x113x96xf32>, memref<3x3x96xf32>, memref<1x56x56x96xf32>) -> (), sym_name = "depthwise_conv_2d_nhwc_hwc"}> ({
  ^bb0(%arg0: memref<1x113x113x96xf32>, %arg1: memref<3x3x96xf32>, %arg2: memref<1x56x56x96xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x113x113x96xf32>, memref<3x3x96xf32>, memref<1x56x56x96xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "conv_1d_nwc_wcf"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 + d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "conv_1d_ncw_fcw"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.conv_1d_ncw_fcw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?x?xi8>, memref<?x?x?x?x?xi8>, i32, i32, memref<?x?x?x?x?xi32>) -> (), sym_name = "conv_2d_ngchw_gfchw_q"}> ({
  ^bb0(%arg0: memref<?x?x?x?x?xi8>, %arg1: memref<?x?x?x?x?xi8>, %arg2: i32, %arg3: i32, %arg4: memref<?x?x?x?x?xi32>):
    "linalg.conv_2d_ngchw_gfchw_q"(%arg0, %arg1, %arg2, %arg3, %arg4) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %0 = "arith.extsi"(%arg5) : (i8) -> i32
      %1 = "arith.subi"(%0, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %2 = "arith.extsi"(%arg6) : (i8) -> i32
      %3 = "arith.subi"(%2, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.muli"(%1, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.addi"(%arg9, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (memref<?x?x?x?x?xi8>, memref<?x?x?x?x?xi8>, i32, i32, memref<?x?x?x?x?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, f32) -> (), sym_name = "generalize_fill"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: f32):
    "linalg.fill"(%arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xi8>, memref<?x?xi8>, memref<?x?xf32>) -> (), sym_name = "generalize_batch_matm_vec"}> ({
  ^bb0(%arg0: memref<?x?x?xi8>, %arg1: memref<?x?xi8>, %arg2: memref<?x?xf32>):
    "linalg.batch_matvec"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: f32):
      %0 = "arith.sitofp"(%arg3) : (i8) -> f32
      %1 = "arith.sitofp"(%arg4) : (i8) -> f32
      %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?xi8>, memref<?x?xi8>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?x?xi8>, memref<?x?xf32>) -> (), sym_name = "generalize_batch_vecmat"}> ({
  ^bb0(%arg0: memref<?x?xi8>, %arg1: memref<?x?x?xi8>, %arg2: memref<?x?xf32>):
    "linalg.batch_vecmat"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: f32):
      %0 = "arith.sitofp"(%arg3) : (i8) -> f32
      %1 = "arith.sitofp"(%arg4) : (i8) -> f32
      %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?xi8>, memref<?x?x?xi8>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x8x9xf32>, memref<7x9x8xf32>, memref<8x8xf32>) -> (), sym_name = "batch_reduce_gemm"}> ({
  ^bb0(%arg0: memref<7x8x9xf32>, %arg1: memref<7x9x8xf32>, %arg2: memref<8x8xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<7x8x9xf32>, memref<7x9x8xf32>, memref<8x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x8x9xbf16>, memref<7x9x8xbf16>, memref<8x8xf32>) -> (), sym_name = "generalize_batch_reduce_gemm_bf16"}> ({
  ^bb0(%arg0: memref<7x8x9xbf16>, %arg1: memref<7x9x8xbf16>, %arg2: memref<8x8xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: bf16, %arg4: bf16, %arg5: f32):
      %0 = "arith.extf"(%arg3) : (bf16) -> f32
      %1 = "arith.extf"(%arg4) : (bf16) -> f32
      %2 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (memref<7x8x9xbf16>, memref<7x9x8xbf16>, memref<8x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x8x8x8xf32>, memref<1x8x8x8xf32>, memref<1x8x8x8xf32>) -> (), sym_name = "generalize_linalg_map"}> ({
  ^bb0(%arg0: memref<1x8x8x8xf32>, %arg1: memref<1x8x8x8xf32>, %arg2: memref<1x8x8x8xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "linalg.map"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<1x8x8x8xf32>, memref<1x8x8x8xf32>, memref<1x8x8x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_add"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_sub"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.sub"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_mul"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_div"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.div"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xi32>, memref<7x14x21xi32>, memref<7x14x21xi32>) -> (), sym_name = "generalize_divu"}> ({
  ^bb0(%arg0: memref<7x14x21xi32>, %arg1: memref<7x14x21xi32>, %arg2: memref<7x14x21xi32>):
    "linalg.div_unsigned"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.divui"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) : (memref<7x14x21xi32>, memref<7x14x21xi32>, memref<7x14x21xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_exp"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_log"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.log"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.log"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_abs"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.abs"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.absf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_ceil"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.ceil"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.ceil"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_floor"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.floor"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.floor"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_negf"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.negf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.negf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_reciprocal"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.reciprocal"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %1 = "arith.divf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_round"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.round"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.round"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_sqrt"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.sqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.sqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_rsqrt"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.rsqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.rsqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_square"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.square"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.mulf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_tanh"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.tanh"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.tanh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_erf"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>):
    "linalg.erf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_max"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.max"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.maximumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_min"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.min"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.minimumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_powf"}> ({
  ^bb0(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>):
    "linalg.powf"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x14x21xi1>, memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> (), sym_name = "generalize_select"}> ({
  ^bb0(%arg0: memref<7x14x21xi1>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>, %arg3: memref<7x14x21xf32>):
    "linalg.select"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i1, %arg5: f32, %arg6: f32, %arg7: f32):
      %0 = "arith.select"(%arg4, %arg5, %arg6) : (i1, f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<7x14x21xi1>, memref<7x14x21xf32>, memref<7x14x21xf32>, memref<7x14x21xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<2x4xf32>) -> (tensor<f32>, tensor<vector<2x4xf32>>), sym_name = "fill_tensor"}> ({
  ^bb0(%arg0: f32, %arg1: vector<2x4xf32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "linalg.fill"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %2 = "tensor.empty"() : () -> tensor<vector<2x4xf32>>
    %3 = "linalg.fill"(%arg1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: vector<2x4xf32>, %arg3: vector<2x4xf32>):
      "linalg.yield"(%arg2) : (vector<2x4xf32>) -> ()
    }) : (vector<2x4xf32>, tensor<vector<2x4xf32>>) -> tensor<vector<2x4xf32>>
    "func.return"(%1, %3) : (tensor<f32>, tensor<vector<2x4xf32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_transpose_a_explicit"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_transpose_b_explicit"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_transpose_a_b_explicit"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x5xf32>, tensor<2x5x7xf32>, tensor<2x3x7xf32>) -> tensor<2x3x7xf32>, sym_name = "batch_matmul"}> ({
  ^bb0(%arg0: tensor<2x3x5xf32>, %arg1: tensor<2x5x7xf32>, %arg2: tensor<2x3x7xf32>):
    %0 = "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<2x3x5xf32>, tensor<2x5x7xf32>, tensor<2x3x7xf32>) -> tensor<2x3x7xf32>
    "func.return"(%0) : (tensor<2x3x7xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x5xf32>, tensor<2x5x7xf32>, tensor<3x7xf32>) -> tensor<3x7xf32>, sym_name = "batch_reduce_matmul"}> ({
  ^bb0(%arg0: tensor<2x3x5xf32>, %arg1: tensor<2x5x7xf32>, %arg2: tensor<3x7xf32>):
    %0 = "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<2x3x5xf32>, tensor<2x5x7xf32>, tensor<3x7xf32>) -> tensor<3x7xf32>
    "func.return"(%0) : (tensor<3x7xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_transpose_a_b"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<9x3x5xf32>, memref<9x5x7xf32>, memref<9x3x7xf32>) -> (), sym_name = "contract_batch_matmul"}> ({
  ^bb0(%arg0: memref<9x3x5xf32>, %arg1: memref<9x5x7xf32>, %arg2: memref<9x3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<9x3x5xf32>, memref<9x5x7xf32>, memref<9x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<9x3x5xf32>, memref<9x5x7xf32>, memref<3x7xf32>) -> (), sym_name = "contract_batch_reduce_matmul"}> ({
  ^bb0(%arg0: memref<9x3x5xf32>, %arg1: memref<9x5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<9x3x5xf32>, memref<9x5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<9x5x3xf32>, memref<9x7x5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_batch_reduce_matmul_permute_m_with_k_and_k_with_n"}> ({
  ^bb0(%arg0: memref<9x5x3xf32>, %arg1: memref<9x7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<9x5x3xf32>, memref<9x7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<9xf32>, memref<9xf32>, memref<f32>) -> (), sym_name = "contract_dot"}> ({
  ^bb0(%arg0: memref<9xf32>, %arg1: memref<9xf32>, %arg2: memref<f32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map1], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<9xf32>, memref<9xf32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_bcast_a_b"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map1], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

