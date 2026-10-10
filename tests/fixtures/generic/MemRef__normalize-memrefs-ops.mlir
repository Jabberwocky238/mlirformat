#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 floordiv 32, d3 floordiv 64, d2 mod 32, d3 mod 64)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 floordiv 32, d3 floordiv 32, d2 mod 32, d3 mod 32)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (14)>
#map4 = affine_map<() -> (16)>
#map5 = affine_map<() -> (1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x14x14xf32, #map>) -> (), sym_name = "test_norm"}> ({
  ^bb0(%arg9: memref<1x16x14x14xf32, #map>):
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32, #map>
    "test.op_norm"(%arg9, %10) : (memref<1x16x14x14xf32, #map>, memref<1x16x14x14xf32, #map>) -> ()
    "memref.dealloc"(%10) : (memref<1x16x14x14xf32, #map>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x16x14x14xf32, #map>) -> (), sym_name = "test_nonnorm"}> ({
  ^bb0(%arg8: memref<1x16x14x14xf32, #map>):
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32, #map>
    "test.op_nonnorm"(%arg8, %9) : (memref<1x16x14x14xf32, #map>, memref<1x16x14x14xf32, #map>) -> ()
    "memref.dealloc"(%9) : (memref<1x16x14x14xf32, #map>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x16x14x14xf32, #map>) -> (), sym_name = "test_nonnorm_identity_layout"}> ({
  ^bb0(%arg7: memref<1x16x14x14xf32, #map>):
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32>
    "test.op_nonnorm"(%8, %8) : (memref<1x16x14x14xf32>, memref<1x16x14x14xf32>) -> ()
    "test.op_norm"(%arg7, %8) : (memref<1x16x14x14xf32, #map>, memref<1x16x14x14xf32>) -> ()
    "memref.dealloc"(%8) : (memref<1x16x14x14xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x16x1x1x32x64xf32>) -> (), sym_name = "test_norm_mix"}> ({
  ^bb0(%arg6: memref<1x16x1x1x32x64xf32>):
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32, #map>
    "test.op_norm"(%arg6, %7) : (memref<1x16x1x1x32x64xf32>, memref<1x16x14x14xf32, #map>) -> ()
    "memref.dealloc"(%7) : (memref<1x16x14x14xf32, #map>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x16x14x14xf32>) -> (), sym_name = "test_load_store"}> ({
  ^bb0(%arg1: memref<1x16x14x14xf32>):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32, #map1>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32>
    "test.op_norm"(%2, %3) : (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>) -> ()
    %4 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg4: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg5: index):
            %5 = "memref.load"(%3, %arg2, %arg3, %arg4, %arg5) : (memref<1x16x14x14xf32>, index, index, index, index) -> f32
            %6 = "arith.addf"(%5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "memref.store"(%6, %arg1, %arg2, %arg3, %arg4, %arg5) : (f32, memref<1x16x14x14xf32>, index, index, index, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%2) : (memref<1x16x14x14xf32, #map1>) -> ()
    "memref.dealloc"(%3) : (memref<1x16x14x14xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x16x14x14xf32, #map1>) -> (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>), sym_name = "test_norm_ret"}> ({
  ^bb0(%arg0: memref<1x16x14x14xf32, #map1>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x16x14x14xf32, #map1>
    %1:2 = "test.op_norm_ret"(%arg0) : (memref<1x16x14x14xf32, #map1>) -> (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>)
    "test.op_norm"(%1#0, %0) : (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32, #map1>) -> ()
    "memref.dealloc"(%0) : (memref<1x16x14x14xf32, #map1>) -> ()
    "func.return"(%1#0, %1#1) : (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>) -> ()
  }) : () -> ()
  "test.op_funcref"() {func = @test_norm_mix} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3xf32, #map>) -> memref<3x1x1xf32>, sym_name = "test_norm_reinterpret_cast"}> ({
  ^bb0(%arg0: memref<3xf32, #map>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3xf32>
    "test.op_norm"(%arg0, %0) : (memref<3xf32, #map>, memref<3xf32>) -> ()
    %1 = "memref.reinterpret_cast"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 3, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<3xf32>) -> memref<3x1x1xf32>
    "func.return"(%1) : (memref<3x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (8)>
#map4 = affine_map<(d0, d1) -> (d0 * 7 + d1)>
#map5 = affine_map<(d0, d1) -> (d0, d1)>
#map6 = affine_map<() -> (7)>
#map7 = affine_map<() -> (5)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32, #map>) -> (), sym_name = "prefetch_normalize"}> ({
  ^bb0(%arg9: memref<512xf32, #map>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg10: index):
      "affine.prefetch"(%arg9, %arg10) <{isDataCache = true, isWrite = false, localityHint = 3 : i32, map = #map1}> : (memref<512xf32, #map>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x7xf32>, memref<5x7xf32>, memref<5x7xf32>) -> (), sym_name = "test_reinterpret_cast"}> ({
  ^bb0(%arg4: memref<5x7xf32>, %arg5: memref<5x7xf32>, %arg6: memref<5x7xf32>):
    %4 = "memref.reinterpret_cast"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5, 7>, static_strides = array<i64: 7, 1>}> : (memref<5x7xf32>) -> memref<5x7xf32, #map4>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg7: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
      ^bb0(%arg8: index):
        %5 = "affine.load"(%4, %arg7, %arg8) <{map = #map5}> : (memref<5x7xf32, #map4>, index, index) -> f32
        %6 = "affine.load"(%arg5, %arg7, %arg8) <{map = #map5}> : (memref<5x7xf32>, index, index) -> f32
        %7 = "arith.subf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%7, %arg6, %arg7, %arg8) <{map = #map5}> : (f32, memref<5x7xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<2x17xf32>, memref<1x10x17xi32>, memref<1x10x17xf32>), sym_name = "reinterpret_cast_non_zero_offset"}> ({
  ^bb0(%arg0: index, %arg1: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, %arg2: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, %arg3: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>):
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10x17xi32>
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x17xf32>
    %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10x17xf32>
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %3 = "memref.reinterpret_cast"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 27>, static_sizes = array<i64: 1, 5>, static_strides = array<i64: 17, 1>}> : (memref<2x17xf32>) -> memref<1x5xf32, strided<[17, 1], offset: 27>>
    "func.return"(%3, %3, %1, %0, %2) : (memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<2x17xf32>, memref<1x10x17xi32>, memref<1x10x17xf32>) -> ()
  }) : () -> ()
}) : () -> ()

