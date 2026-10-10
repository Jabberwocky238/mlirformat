#map = affine_map<(d0) -> (d0 * -64 + 128, 64)>
#map1 = affine_map<(d0) -> (0, d0)>
#map2 = affine_map<(d0) -> (d0 * 64)>
#map3 = affine_map<(d0, d1) -> (d1 * -64 + 128, d0)>
#map4 = affine_map<(d0, d1)[s0] -> (d0 * 384 + s0 + d1)>
#map5 = affine_map<(d0)[s0] -> (d0 + s0)>
#map6 = affine_map<(d0, d1) -> (d0, d1)>
#map7 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = -0.000000e+00 : f32}> : () -> f32
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x384xf32>
    "linalg.fill"(%1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, memref<128x384xf32>) -> ()
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32>
    "linalg.fill"(%1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<128xf32>) -> ()
    "scf.forall"(%0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg0: index):
      %4 = "affine.min"(%arg0) <{map = #map}> : (index) -> index
      %5 = "affine.max"(%4) <{map = #map1}> : (index) -> index
      %6 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
      %7 = "affine.min"(%5, %arg0) <{map = #map3}> : (index, index) -> index
      %8 = "memref.subview"(%2, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 384>, static_strides = array<i64: 1, 1>}> : (memref<128x384xf32>, index, index) -> memref<?x384xf32, #map4>
      %9 = "memref.subview"(%3, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (memref<128xf32>, index, index) -> memref<?xf32, #map5>
      "linalg.generic"(%8, %9) <{indexing_maps = [#map6, #map7], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg1: f32, %arg2: f32):
        %10 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%10) : (f32) -> ()
      }) : (memref<?x384xf32, #map4>, memref<?xf32, #map5>) -> ()
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

