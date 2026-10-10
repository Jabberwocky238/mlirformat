#map = affine_map<(d0, d1, d2, d3) -> (d0 * 720 + d1 * 90 + d2 * 10 + d3)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<() -> (9)>
#map4 = affine_map<() -> (8)>
#map5 = affine_map<() -> (7)>
#map6 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x8x9x10xf32>) -> (), sym_name = "unflatten4d"}> ({
  ^bb0(%arg0: memref<7x8x9x10xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5040xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg6: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg7: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg8: index):
            "affine.store"(%1, %0, %arg5, %arg6, %arg7, %arg8) <{map = #map}> : (f32, memref<5040xf32>, index, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg3: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg4: index):
            %2 = "affine.load"(%0, %arg1, %arg2, %arg3, %arg4) <{map = #map}> : (memref<5040xf32>, index, index, index, index) -> f32
            "affine.store"(%2, %arg0, %arg1, %arg2, %arg3, %arg4) <{map = #map6}> : (f32, memref<7x8x9x10xf32>, index, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 * 8 + d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (8)>
#map3 = affine_map<() -> (7)>
#map4 = affine_map<(d0, d1) -> (d0 + d1 * 8)>
#map5 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x7xf32>) -> (), sym_name = "unflatten2d_with_transpose"}> ({
  ^bb0(%arg0: memref<8x7xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<56xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        "affine.store"(%1, %0, %arg3, %arg4) <{map = #map}> : (f32, memref<56xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg2: index):
        %2 = "affine.load"(%0, %arg1, %arg2) <{map = #map4}> : (memref<56xf32>, index, index) -> f32
        "affine.store"(%2, %arg0, %arg1, %arg2) <{map = #map5}> : (f32, memref<8x7xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (100)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>, memref<100xf32>, memref<100xf32>) -> (), sym_name = "check_src_dst_step"}> ({
  ^bb0(%arg0: memref<100xf32>, %arg1: memref<100xf32>, %arg2: memref<100xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %1 = "affine.load"(%arg1, %arg4) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%1, %arg0, %arg4) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %0 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<100xf32>, index) -> f32
      "affine.store"(%0, %arg2, %arg3) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (64)>
#map3 = affine_map<() -> (1)>
#map4 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32, 1>, memref<1x64xf32, 1>, memref<1x64xf32, 1>) -> (), sym_name = "reduce_add_non_maximal_f32_f32"}> ({
  ^bb0(%arg0: memref<64x64xf32, 1>, %arg1: memref<1x64xf32, 1>, %arg2: memref<1x64xf32, 1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg8: index):
        %6 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg9: index, %arg10: f32):
          %8 = "affine.load"(%arg0, %arg9, %arg8) <{map = #map}> : (memref<64x64xf32, 1>, index, index) -> f32
          %9 = "arith.addf"(%arg10, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%9) : (f32) -> ()
        }) : (f32) -> f32
        %7 = "arith.addf"(%6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%7, %arg1, %arg7, %arg8) <{map = #map}> : (f32, memref<1x64xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index):
        %2 = "affine.for"(%1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index, %arg6: f32):
          %4 = "affine.load"(%arg0, %arg5, %arg4) <{map = #map}> : (memref<64x64xf32, 1>, index, index) -> f32
          %5 = "arith.mulf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%5) : (f32) -> ()
        }) : (f32) -> f32
        %3 = "arith.mulf"(%2, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%3, %arg2, %arg3, %arg4) <{map = #map}> : (f32, memref<1x64xf32, 1>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "sibling_load_only"}> ({
  ^bb0(%arg0: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %1 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %0 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fusion_for_multiple_blocks"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      "affine.store"(%1, %0, %arg3) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %3 = "affine.load"(%0, %arg2) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      "affine.store"(%1, %0, %arg1) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (64)>
#map3 = affine_map<() -> (12)>
#map4 = affine_map<() -> (128)>
#map5 = affine_map<() -> (8)>
#map6 = affine_map<(d0, d1, d2) -> (d0, d1, d2 floordiv 64, d2 mod 64)>
#map7 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map8 = affine_map<() -> (768)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fuse_higher_dim_nest_into_lower_dim_nest"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x12x128x64xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x128x12x64xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg5: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
          ^bb0(%arg6: index):
            %5 = "affine.load"(%0, %arg3, %arg5, %arg4, %arg6) <{map = #map}> : (memref<8x12x128x64xf32>, index, index, index, index) -> f32
            "affine.store"(%5, %1, %arg3, %arg4, %arg5, %arg6) <{map = #map}> : (f32, memref<8x128x12x64xf32>, index, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x128x768xf16>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg1: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
        ^bb0(%arg2: index):
          %3 = "affine.load"(%1, %arg0, %arg1, %arg2) <{map = #map6}> : (memref<8x128x12x64xf32>, index, index, index) -> f32
          %4 = "arith.truncf"(%3) : (f32) -> f16
          "affine.store"(%4, %2, %arg0, %arg1, %arg2) <{map = #map7}> : (f16, memref<8x128x768xf16>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (1)>
#map4 = affine_map<() -> (8)>
#map5 = affine_map<() -> (32)>
"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.array<8192 x f32>) -> !spirv.array<8192 x f32>, sym_name = "test_avgpool2d_pad_right"}> ({
  ^bb0(%arg0: !spirv.array<8192 x f32>):
    %0 = "spirv.Constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "builtin.unrealized_conversion_cast"(%arg0) : (!spirv.array<8192 x f32>) -> tensor<1x32x32x8xf32>
    %2 = "tensor.pad"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 4, 8193, 0>, static_low = array<i64: 0, 4, 4, 0>}> ({
    ^bb0(%arg11: index, %arg12: index, %arg13: index, %arg14: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<1x32x32x8xf32>) -> tensor<1x40x8229x8xf32>
    %3 = "bufferization.to_buffer"(%2) : (tensor<1x40x8229x8xf32>) -> memref<1x40x8229x8xf32>
    %4 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x32x32x8xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg6: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg7: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
          ^bb0(%arg8: index):
            "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
            ^bb0(%arg9: index):
              "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
              ^bb0(%arg10: index):
                %9 = "affine.apply"(%arg6, %arg9) <{map = #map}> : (index, index) -> index
                %10 = "affine.apply"(%arg7, %arg10) <{map = #map}> : (index, index) -> index
                %11 = "affine.load"(%3, %arg5, %9, %10, %arg8) <{map = #map1}> : (memref<1x40x8229x8xf32>, index, index, index, index) -> f32
                %12 = "affine.load"(%4, %arg5, %arg6, %arg7, %arg8) <{map = #map1}> : (memref<1x32x32x8xf32>, index, index, index, index) -> f32
                %13 = "arith.addf"(%12, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                "affine.store"(%13, %4, %arg5, %arg6, %arg7, %arg8) <{map = #map1}> : (f32, memref<1x32x32x8xf32>, index, index, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : () -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x32x32x8xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg2: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg3: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
          ^bb0(%arg4: index):
            %8 = "affine.load"(%4, %arg1, %arg2, %arg3, %arg4) <{map = #map1}> : (memref<1x32x32x8xf32>, index, index, index, index) -> f32
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %6 = "bufferization.to_tensor"(%5) : (memref<1x32x32x8xf32>) -> tensor<1x32x32x8xf32>
    %7 = "builtin.unrealized_conversion_cast"(%6) : (tensor<1x32x32x8xf32>) -> !spirv.array<8192 x f32>
    "spirv.ReturnValue"(%7) : (!spirv.array<8192 x f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
#map3 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<16xf32>) -> (), sym_name = "same_memref_load_store"}> ({
  ^bb0(%arg0: memref<32xf32>, %arg1: memref<16xf32>):
    %0 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %3 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %4 = "arith.mulf"(%3, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %arg0, %arg3) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      %1 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<32xf32>, index) -> f32
      %2 = "arith.addf"(%1, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%2, %arg1, %arg2) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
#map3 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>, memref<32xf32>, memref<16xf32>) -> (), sym_name = "same_memref_load_multiple_stores"}> ({
  ^bb0(%arg0: memref<32xf32>, %arg1: memref<32xf32>, %arg2: memref<16xf32>):
    %0 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %4 = "affine.load"(%arg0, %arg4) <{map = #map}> : (memref<32xf32>, index) -> f32
      %5 = "arith.mulf"(%4, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%5, %arg0, %arg4) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.store"(%5, %arg1, %arg4) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      %1 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %2 = "affine.load"(%arg1, %arg3) <{map = #map}> : (memref<32xf32>, index) -> f32
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%3, %arg2, %arg3) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (3)>
#map3 = affine_map<()[s0] -> (s0 + 5)>
#map4 = affine_map<()[s0] -> (s0 + 17)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memref_index_type"}> ({
    %0 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %2 = "builtin.unrealized_conversion_cast"(%1) : (i64) -> index
    %3 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x18xf32>
    %4 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3xf32>
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3xindex>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %10 = "affine.load"(%5, %arg1) <{map = #map}> : (memref<3xindex>, index) -> index
      %11 = "builtin.unrealized_conversion_cast"(%10) : (index) -> i64
      %12 = "llvm.sub"(%0, %11) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      %13 = "builtin.unrealized_conversion_cast"(%12) : (i64) -> index
      "affine.store"(%13, %5, %arg1) <{map = #map}> : (index, memref<3xindex>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %6 = "affine.load"(%5, %arg0) <{map = #map}> : (memref<3xindex>, index) -> index
      %7 = "affine.apply"(%6) <{map = #map3}> : (index) -> index
      %8 = "affine.apply"(%2) <{map = #map4}> : (index) -> index
      %9 = "memref.load"(%3, %7, %8) : (memref<8x18xf32>, index, index) -> f32
      "affine.store"(%9, %4, %arg0) <{map = #map}> : (f32, memref<3xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (8)>
#map4 = affine_map<() -> (64)>
#map5 = affine_map<() -> (16)>
#map6 = affine_map<() -> (32)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "non_int_memory_space"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x8xf32, #spirv.storage_class<StorageBuffer>>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        %3 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
        %4 = "affine.load"(%0, %arg2, %3) <{map = #map1}> : (memref<256x8xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> f32
        "affine.store"(%4, %0, %arg2, %arg3) <{map = #map1}> : (f32, memref<256x8xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        %1 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
        %2 = "affine.load"(%0, %arg0, %1) <{map = #map1}> : (memref<256x8xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> f32
        "affine.store"(%2, %0, %arg0, %arg1) <{map = #map1}> : (f32, memref<256x8xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> (d0 + 1)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (26)>
#map6 = affine_map<() -> (8)>
#map7 = affine_map<() -> (1)>
#map8 = affine_map<(d0) -> (0, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>, memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>, memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>) -> (), sym_name = "slice_compute_check"}> ({
  ^bb0(%arg0: memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>, %arg1: memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>, %arg2: memref<1x8x26xi32, strided<[?, ?, ?], offset: ?>>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x8x26xi32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x26xi32>
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg4: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg5: index):
        "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
        ^bb0(%arg6: index):
          "affine.for"(%arg4, %arg4) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg7: index):
            "affine.for"(%arg5, %arg5) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
            ^bb0(%arg8: index):
              "affine.for"(%arg6, %arg6) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map3}> ({
              ^bb0(%arg9: index):
                %3 = "affine.load"(%0, %arg7, %arg8, %arg9) <{map = #map}> : (memref<1x8x26xi32>, index, index, index) -> i32
                %4 = "affine.load"(%1, %arg7, %arg9) <{map = #map1}> : (memref<1x26xi32>, index, index) -> i32
                %5 = "llvm.intr.smin"(%3, %4) : (i32, i32) -> i32
                "affine.store"(%5, %1, %arg7, %arg9) <{map = #map1}> : (i32, memref<1x26xi32>, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : (index, index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%1, %arg3) <{map = #map8}> : (memref<1x26xi32>, index) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%1) : (memref<1x26xi32>) -> ()
    "memref.dealloc"(%0) : (memref<1x8x26xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
#map4 = affine_map<() -> (3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_add_slice_bounds"}> ({
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %15 = "arith.constant"() <{value = 6.191520e-01 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg14: index):
      "affine.for"(%arg14, %arg14) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg15: index):
        "affine.store"(%15, %14, %arg15) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg10: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg11: index):
        "affine.for"(%arg10, %arg10) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
        ^bb0(%arg12: index):
          "affine.for"(%arg11, %arg11) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
          ^bb0(%arg13: index):
            %16 = "affine.apply"(%arg13) <{map = #map1}> : (index) -> index
            %17 = "affine.load"(%14, %16) <{map = #map}> : (memref<10xf32>, index) -> f32
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<1xf32>) -> (), sym_name = "producer_reduction_no_fusion"}> ({
  ^bb0(%arg5: memref<10xf32>, %arg6: memref<10xf32>, %arg7: memref<1xf32>):
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg9: index):
      %11 = "affine.load"(%arg5, %arg9) <{map = #map}> : (memref<10xf32>, index) -> f32
      %12 = "affine.load"(%arg7) <{map = #map2}> : (memref<1xf32>) -> f32
      %13 = "arith.addf"(%11, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%13, %arg7) <{map = #map2}> : (f32, memref<1xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg8: index):
      %9 = "affine.load"(%arg7) <{map = #map2}> : (memref<1xf32>) -> f32
      %10 = "arith.addf"(%9, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%10, %arg6, %arg8) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>, memref<10xf32>) -> (), sym_name = "sibling_reduction"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      %5 = "affine.load"(%arg0, %arg4) <{map = #map}> : (memref<10xf32>, index) -> f32
      %6 = "arith.addf"(%5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%6, %arg1, %arg4) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      %2 = "affine.load"(%arg0, %arg3) <{map = #map}> : (memref<10xf32>, index) -> f32
      %3 = "affine.load"(%arg2) <{map = #map2}> : (memref<10xf32>) -> f32
      %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %arg2) <{map = #map2}> : (f32, memref<10xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 65536)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (131072)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<() -> (30)>
#map6 = affine_map<() -> (0, 0)>
#map7 = affine_map<() -> (0, 1)>
#map8 = affine_map<() -> (0, 2)>
#map9 = affine_map<() -> (0, 3)>
#map10 = affine_map<() -> (1, 0)>
#map11 = affine_map<() -> (1, 1)>
#map12 = affine_map<() -> (1, 2)>
#map13 = affine_map<() -> (1, 3)>
#map14 = affine_map<() -> (0, 0, 0)>
#map15 = affine_map<() -> (0, 0, 1)>
#map16 = affine_map<() -> (0, 0, 2)>
#map17 = affine_map<() -> (0, 0, 3)>
#map18 = affine_map<() -> (0, 1, 0)>
#map19 = affine_map<() -> (0, 1, 1)>
#map20 = affine_map<() -> (0, 1, 2)>
#map21 = affine_map<() -> (0, 1, 3)>
#map22 = affine_map<() -> (1)>
#map23 = affine_map<(d0, d1) -> (0, d0, d1)>
#map24 = affine_map<() -> (4)>
#map25 = affine_map<() -> (2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<65536xcomplex<f64>>, memref<30x131072xi64>, memref<30xi64>, memref<30xi64>, memref<30xi64>, memref<30xi64>) -> (), sym_name = "zero_tolerance"}> ({
  ^bb0(%arg5: memref<65536xcomplex<f64>>, %arg6: memref<30x131072xi64>, %arg7: memref<30xi64>, %arg8: memref<30xi64>, %arg9: memref<30xi64>, %arg10: memref<30xi64>):
    %11 = "arith.constant"() <{value = 65536 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %13 = "arith.constant"() <{value = 0x4320000000380004 : f64}> : () -> f64
    %14 = "arith.constant"() <{value = 5.000000e-01 : f64}> : () -> f64
    %15 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<30x131072xi64>
    %16 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<131072xi1>
    %17 = "memref.alloc"() <{alignment = 128 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<131072xi128>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg15: index):
      %28 = "affine.apply"(%arg15) <{map = #map}> : (index) -> index
      %29 = "affine.load"(%arg5, %28) <{map = #map1}> : (memref<65536xcomplex<f64>>, index) -> complex<f64>
      %30 = "arith.cmpi"(%arg15, %11) <{predicate = 6 : i64}> : (index, index) -> i1
      %31 = "complex.im"(%29) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64
      %32 = "complex.re"(%29) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64
      %33 = "arith.select"(%30, %32, %31) : (i1, f64, f64) -> f64
      %34 = "arith.cmpf"(%33, %12) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f64, f64) -> i1
      %35 = "arith.negf"(%33) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      %36 = "arith.select"(%34, %35, %33) : (i1, f64, f64) -> f64
      %37 = "arith.mulf"(%36, %13) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %38 = "arith.addf"(%37, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %39 = "arith.fptosi"(%38) : (f64) -> i128
      "affine.store"(%39, %17, %arg15) <{map = #map1}> : (i128, memref<131072xi128>, index) -> ()
      "affine.store"(%34, %16, %arg15) <{map = #map1}> : (i1, memref<131072xi1>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg13: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg14: index):
        %19 = "affine.load"(%arg10, %arg13) <{map = #map1}> : (memref<30xi64>, index) -> i64
        %20 = "affine.load"(%arg7, %arg13) <{map = #map1}> : (memref<30xi64>, index) -> i64
        %21 = "affine.load"(%arg9, %arg13) <{map = #map1}> : (memref<30xi64>, index) -> i64
        %22 = "affine.load"(%arg8, %arg13) <{map = #map1}> : (memref<30xi64>, index) -> i64
        %23 = "affine.load"(%17, %arg14) <{map = #map1}> : (memref<131072xi128>, index) -> i128
        %24 = "affine.load"(%16, %arg14) <{map = #map1}> : (memref<131072xi1>, index) -> i1
        %25 = "func.call"(%19, %20, %21, %22, %23) <{callee = @__external_reduce_barrett}> {outputModFac = 1 : i64} : (i64, i64, i64, i64, i128) -> i64
        %26 = "arith.subi"(%19, %25) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        %27 = "arith.select"(%24, %26, %25) : (i1, i64, i64) -> i64
        "affine.store"(%27, %15, %arg13, %arg14) <{map = #map4}> : (i64, memref<30x131072xi64>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%15) <{callee = @__external_levelwise_forward_ntt}> : (memref<30x131072xi64>) -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg11: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg12: index):
        %18 = "affine.load"(%15, %arg11, %arg12) <{map = #map4}> : (memref<30x131072xi64>, index, index) -> i64
        "affine.store"(%18, %arg6, %arg11, %arg12) <{map = #map4}> : (i64, memref<30x131072xi64>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%17) : (memref<131072xi128>) -> ()
    "memref.dealloc"(%16) : (memref<131072xi1>) -> ()
    "memref.dealloc"(%15) : (memref<30x131072xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<30x131072xi64>) -> (), sym_name = "__external_levelwise_forward_ntt", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64, i64, i64, i128) -> i64, sym_name = "__external_reduce_barrett", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x4xf32>, memref<1x2x4xf32>) -> (), sym_name = "unrolled"}> ({
  ^bb0(%arg0: memref<2x4xf32>, %arg1: memref<1x2x4xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x2x4xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map22}> ({
    ^bb0(%arg4: index):
      %3 = "affine.load"(%arg0) <{map = #map6}> : (memref<2x4xf32>) -> f32
      %4 = "affine.load"(%arg0) <{map = #map7}> : (memref<2x4xf32>) -> f32
      %5 = "affine.load"(%arg0) <{map = #map8}> : (memref<2x4xf32>) -> f32
      %6 = "affine.load"(%arg0) <{map = #map9}> : (memref<2x4xf32>) -> f32
      %7 = "affine.load"(%arg0) <{map = #map10}> : (memref<2x4xf32>) -> f32
      %8 = "affine.load"(%arg0) <{map = #map11}> : (memref<2x4xf32>) -> f32
      %9 = "affine.load"(%arg0) <{map = #map12}> : (memref<2x4xf32>) -> f32
      %10 = "affine.load"(%arg0) <{map = #map13}> : (memref<2x4xf32>) -> f32
      "affine.store"(%3, %0) <{map = #map14}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%4, %0) <{map = #map15}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%5, %0) <{map = #map16}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%6, %0) <{map = #map17}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%7, %0) <{map = #map18}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%8, %0) <{map = #map19}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%9, %0) <{map = #map20}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.store"(%10, %0) <{map = #map21}> : (f32, memref<1x2x4xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map25}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map24}> ({
      ^bb0(%arg3: index):
        %1 = "affine.load"(%0, %arg2, %arg3) <{map = #map23}> : (memref<1x2x4xf32>, index, index) -> f32
        %2 = "arith.negf"(%1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "affine.store"(%2, %arg1, %arg2, %arg3) <{map = #map23}> : (f32, memref<1x2x4xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (6)>
#map3 = affine_map<() -> (5)>
#map4 = affine_map<() -> (7)>
#map5 = affine_map<() -> (3)>
#map6 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
#map7 = affine_map<() -> (1)>
#map8 = affine_map<() -> (10)>
#map9 = affine_map<(d0, d1) -> (d0 + d1)>
#map10 = affine_map<(d0, d1) -> (d0 * 2 + d1 * 2)>
#map11 = affine_map<() -> (2)>
#map12 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = () -> (), sym_name = "zero_candidates"}> ({
      %10 = "arith.constant"() <{value = 2.221140e+03 : f32}> : () -> f32
      %11 = "arith.constant"() <{value = 2.606200e+03 : f32}> : () -> f32
      %12 = "arith.constant"() <{value = 3.224000e+03 : f32}> : () -> f32
      %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %14 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x7x5x6xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg20: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg21: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg22: index):
            "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg23: index):
              "affine.store"(%12, %14, %arg20, %arg21, %arg22, %arg23) <{map = #map}> : (f32, memref<3x7x5x6xf32>, index, index, index, index) -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %15 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x10x7x6xf32>
      %16 = "memref.subview"(%15) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2, 1, 0>, static_sizes = array<i64: 3, 7, 5, 6>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<3x10x7x6xf32>) -> memref<3x7x5x6xf32, strided<[420, 42, 6, 1], offset: 90>>
      "memref.copy"(%14, %16) : (memref<3x7x5x6xf32>, memref<3x7x5x6xf32, strided<[420, 42, 6, 1], offset: 90>>) -> ()
      %17 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x10x3x6x1xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg15: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
        ^bb0(%arg16: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg17: index):
            "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg18: index):
              "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
              ^bb0(%arg19: index):
                "affine.store"(%13, %17, %arg15, %arg16, %arg17, %arg18, %arg19) <{map = #map6}> : (f32, memref<3x10x3x6x1xf32>, index, index, index, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : () -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg8: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
        ^bb0(%arg9: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg10: index):
            "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg11: index):
              "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
              ^bb0(%arg12: index):
                "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
                ^bb0(%arg13: index):
                  "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map11}> ({
                  ^bb0(%arg14: index):
                    %22 = "affine.apply"(%arg9, %arg13) <{map = #map9}> : (index, index) -> index
                    %23 = "affine.apply"(%arg10, %arg14) <{map = #map10}> : (index, index) -> index
                    %24 = "affine.load"(%15, %arg8, %22, %23, %arg11) <{map = #map}> : (memref<3x10x7x6xf32>, index, index, index, index) -> f32
                    %25 = "affine.load"(%17, %arg8, %arg9, %arg10, %arg11, %arg12) <{map = #map6}> : (memref<3x10x3x6x1xf32>, index, index, index, index, index) -> f32
                    %26 = "arith.mulf"(%24, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                    %27 = "arith.addf"(%25, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                    "affine.store"(%27, %17, %arg8, %arg9, %arg10, %arg11, %arg12) <{map = #map6}> : (f32, memref<3x10x3x6x1xf32>, index, index, index, index, index) -> ()
                    "affine.yield"() : () -> ()
                  }) : () -> ()
                  "affine.yield"() : () -> ()
                }) : () -> ()
                "affine.yield"() : () -> ()
              }) : () -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      %18 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x10x3x6xf32>
      %19 = "memref.expand_shape"(%18) <{reassociation = [[0], [1], [2], [3, 4]], static_output_shape = array<i64: 3, 10, 3, 6, 1>}> : (memref<3x10x3x6xf32>) -> memref<3x10x3x6x1xf32>
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
        ^bb0(%arg4: index):
          "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
          ^bb0(%arg5: index):
            "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
            ^bb0(%arg6: index):
              "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
              ^bb0(%arg7: index):
                %20 = "affine.load"(%17, %arg3, %arg4, %arg5, %arg6, %arg7) <{map = #map6}> : (memref<3x10x3x6x1xf32>, index, index, index, index, index) -> f32
                %21 = "arith.addf"(%20, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
                "affine.store"(%21, %19, %arg3, %arg4, %arg5, %arg6, %arg7) <{map = #map6}> : (f32, memref<3x10x3x6x1xf32>, index, index, index, index, index) -> ()
                "affine.yield"() : () -> ()
              }) : () -> ()
              "affine.yield"() : () -> ()
            }) : () -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "memref_cast_reused"}> ({
  ^bb0(%arg0: memref<*xf32>):
    %0 = "memref.cast"(%arg0) : (memref<*xf32>) -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
    ^bb0(%arg2: index):
      %8 = "affine.load"(%0, %arg2) <{map = #map12}> : (memref<10xf32>, index) -> f32
      %9 = "arith.addf"(%8, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%9, %1, %arg2) <{map = #map12}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map8}> ({
    ^bb0(%arg1: index):
      %5 = "affine.load"(%0, %arg1) <{map = #map12}> : (memref<10xf32>, index) -> f32
      %6 = "affine.load"(%2) <{map = #map1}> : (memref<10xf32>) -> f32
      %7 = "arith.addf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%7, %2) <{map = #map1}> : (f32, memref<10xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

