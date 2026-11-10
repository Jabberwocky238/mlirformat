"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "conv_1d"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>):
    %0 = "linalg.conv_1d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 * 2 + d3 * 3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_1d_nwc_wcf"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.conv_1d_nwc_wcf"(%arg0, %arg1, %arg2) <{dilations = dense<3> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 * 2 + d4 * 3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_1d_ncw_fcw"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.conv_1d_ncw_fcw"(%arg0, %arg1, %arg2) <{dilations = dense<3> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "conv_2d"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.conv_2d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 3 + d4 * 2, d2 * 3 + d5 * 2, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi1>, tensor<?x?x?x?xi1>, tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1>, sym_name = "conv_2d_nhwc_hwcf_i1"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi1>, %arg1: tensor<?x?x?x?xi1>, %arg2: tensor<?x?x?x?xi1>):
    %0 = "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i1, %arg4: i1, %arg5: i1):
      %1 = "arith.andi"(%arg3, %arg4) : (i1, i1) -> i1
      %2 = "arith.ori"(%arg5, %1) : (i1, i1) -> i1
      "linalg.yield"(%2) : (i1) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xi1>, tensor<?x?x?x?xi1>, tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1>
    "func.return"(%0) : (tensor<?x?x?x?xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, tensor<?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?xi32>, sym_name = "conv_2d_nhwc_hwcf_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.conv_2d_nhwc_hwcf_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nhwc_fhwc"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, tensor<?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?xi32>, sym_name = "conv_2d_nhwc_fhwc_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.conv_2d_nhwc_fhwc_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 * 3 + d5, d3 * 4 + d6 * 2)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nchw_fchw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nchw_fchw"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[3, 4]> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, tensor<?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?xi32>, sym_name = "conv_2d_nchw_fchw_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.conv_2d_nchw_fchw_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d2, d1, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_2d_ngchw_fgchw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_2d_ngchw_fgchw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6 * 2, d4 + d7 * 2)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_2d_ngchw_gfchw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_2d_ngchw_gfchw"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?x?xi32>, sym_name = "conv_2d_ngchw_gfchw_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xi8>, %arg1: tensor<?x?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.conv_2d_ngchw_gfchw_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, i32, i32, tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 * 2 + d5, d2 * 2 + d6, d3, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_2d_nhwgc_gfhwc"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nhwgc_gfhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?x?xi32>, sym_name = "conv_2d_nhwgc_gfhwc_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xi8>, %arg1: tensor<?x?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.conv_2d_nhwgc_gfhwc_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, i32, i32, tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0 + d3, d1 + d4, d2 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_3d"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.conv_3d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 * 3 + d5 * 2, d2 * 3 + d6 * 2, d3 * 3 + d7 * 2, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_3d_ndhwc_dhwcf"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_3d_ndhwc_dhwcf"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?x?xi32>, sym_name = "conv_3d_ndhwc_dhwcf_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xi8>, %arg1: tensor<?x?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.conv_3d_ndhwc_dhwcf_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, i32, i32, tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d5, d2 * 4 + d6, d3 * 5 + d7 * 2, d4 * 6 + d8 * 3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d1, d5, d6, d7, d8)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_3d_ncdhw_fcdhw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_3d_ncdhw_fcdhw"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2, 3]> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[4, 5, 6]> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1 * 2 + d3 * 3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "depthwise_conv_1d_ncw_cw"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.depthwise_conv_1d_ncw_cw"(%arg0, %arg1, %arg2) <{dilations = dense<3> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3 * 3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x25x8xi8>, tensor<3x8xi8>, tensor<1x10x8xi32>) -> tensor<1x10x8xi32>, sym_name = "depthwise_conv_1d_nwc_wc_static"}> ({
  ^bb0(%arg0: tensor<1x25x8xi8>, %arg1: tensor<3x8xi8>, %arg2: tensor<1x10x8xi32>):
    %0 = "linalg.depthwise_conv_1d_nwc_wc"(%arg0, %arg1, %arg2) <{dilations = dense<3> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i32):
      %1 = "arith.extsi"(%arg3) : (i8) -> i32
      %2 = "arith.extsi"(%arg4) : (i8) -> i32
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x25x8xi8>, tensor<3x8xi8>, tensor<1x10x8xi32>) -> tensor<1x10x8xi32>
    "func.return"(%0) : (tensor<1x10x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d4, d2)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d4, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "depthwise_conv_1d_nwc_wcm"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_1d_nwc_wcm"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d3, d1 * 4 + d4 * 2, d2 * 5 + d5 * 3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d3, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf16>, tensor<?x?x?xf16>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "depthwise_conv_2d_nchw_chw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf16>, %arg1: tensor<?x?x?xf16>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_2d_nchw_chw"(%arg0, %arg1, %arg2) <{dilations = dense<[2, 3]> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[4, 5]> : vector<2xi64>}> ({
    ^bb0(%arg3: f16, %arg4: f16, %arg5: f32):
      %1 = "arith.extf"(%arg3) : (f16) -> f32
      %2 = "arith.extf"(%arg4) : (f16) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf16>, tensor<?x?x?xf16>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "depthwise_conv_2d_nhwc_hwc"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?x?xi8>, tensor<?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?xi32>, sym_name = "depthwise_conv_2d_nhwc_hwc_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwc_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?xi8>, tensor<?x?x?xi8>, i32, i32, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 3 + d5, d2 + d6 * 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "depthwise_conv_2d_nhwc_hwcm"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2]> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[3, 1]> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d5, d2 + d6, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, tensor<?x?x?x?x?xi32>, i32, i32) -> tensor<?x?x?x?x?xi32>, sym_name = "depthwise_conv_2d_nhwc_hwcm_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwcm_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32, tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 * 3 + d4 * 2, d2 * 3 + d5 * 2, d3 * 3 + d6 * 2, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d7)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "depthwise_conv_3d_ndhwc_dhwc"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_3d_ndhwc_dhwc"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d7, d1 * 4 + d4, d2 * 5 + d5 * 2, d3 * 6 + d6 * 3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d7, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "depthwise_conv_3d_ncdhw_cdhw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_3d_ncdhw_cdhw"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2, 3]> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[4, 5, 6]> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d8, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?x?xf32>) -> tensor<?x?x?x?x?x?xf32>, sym_name = "depthwise_conv_3d_ndhwc_dhwcm"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?x?xf32>):
    %0 = "linalg.depthwise_conv_3d_ndhwc_dhwcm"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?x?xf32>) -> tensor<?x?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pooling_nhwc_max"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi1>, tensor<?x?xi1>, tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1>, sym_name = "pooling_nhwc_max_i1"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?x?x?xi1>):
    %0 = "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i1, %arg4: i1, %arg5: i1):
      %1 = "arith.maxsi"(%arg5, %arg3) : (i1, i1) -> i1
      "linalg.yield"(%1) : (i1) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xi1>, tensor<?x?xi1>, tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1>
    "func.return"(%0) : (tensor<?x?x?x?xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pooling_nhwc_min"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.pooling_nhwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pooling_nhwc_sum"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.pooling_nhwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?xi8>, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>, sym_name = "pooling_nhwc_max_unsigned"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?xi8>, %arg2: tensor<?x?x?x?xi32>):
    %0 = "linalg.pooling_nhwc_max_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i32):
      %1 = "arith.extui"(%arg3) : (i8) -> i32
      %2 = "arith.maxui"(%arg5, %1) : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xi8>, tensor<?x?xi8>, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi32>, tensor<?x?xi32>, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>, sym_name = "pooling_nhwc_min_unsigned_integer"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?x?x?xi32>):
    %0 = "linalg.pooling_nhwc_min_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.minui"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xi32>, tensor<?x?xi32>, tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 * 3 + d4 * 2, d3 * 3 + d5 * 2)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pooling_nchw_sum"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.pooling_nchw_sum"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 * 2 + d4, d3 * 2 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "pooling_nchw_max"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.pooling_nchw_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3 * 3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "pooling_nwc_sum"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.pooling_nwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<3> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 * 3 + d3 * 2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "pooling_ncw_sum"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.pooling_ncw_sum"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "pooling_nwc_max"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xi8>, tensor<?xi8>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>, sym_name = "pooling_nwc_max_unsigned"}> ({
  ^bb0(%arg0: tensor<?x?x?xi8>, %arg1: tensor<?xi8>, %arg2: tensor<?x?x?xi32>):
    %0 = "linalg.pooling_nwc_max_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i32):
      %1 = "arith.extui"(%arg3) : (i8) -> i32
      %2 = "arith.maxui"(%arg5, %1) : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xi8>, tensor<?xi8>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 + d3 * 2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "pooling_ncw_max"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.pooling_ncw_max"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "pooling_nwc_min"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.pooling_nwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xi8>, tensor<?xi8>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>, sym_name = "pooling_nwc_min_unsigned"}> ({
  ^bb0(%arg0: tensor<?x?x?xi8>, %arg1: tensor<?xi8>, %arg2: tensor<?x?x?xi32>):
    %0 = "linalg.pooling_nwc_min_unsigned"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i32):
      %1 = "arith.extui"(%arg3) : (i8) -> i32
      %2 = "arith.minui"(%arg5, %1) : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xi8>, tensor<?xi8>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    "func.return"(%0) : (tensor<?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 * 3 + d5 * 2, d2 * 3 + d6 * 2, d3 * 3 + d7 * 2, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "pooling_ndhwc_sum"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.pooling_ndhwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 * 2 + d5, d2 * 2 + d6, d3 * 2 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "pooling_ndhwc_max"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.pooling_ndhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 * 4 + d5, d2 * 5 + d6 * 2, d3 * 6 + d7 * 3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "pooling_ndhwc_min"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.pooling_ndhwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<[1, 2, 3]> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[4, 5, 6]> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

