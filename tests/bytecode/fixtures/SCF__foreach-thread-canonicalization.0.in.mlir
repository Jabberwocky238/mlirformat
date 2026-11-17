"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reduce"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":11:10)
    %1 = "arith.constant"() <{value = -0.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x384xf32> loc("<stdin>":13:10)
    "linalg.fill"(%1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":15:10), %arg6: f32 loc("<stdin>":15:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":16:7)
    }) : (f32, memref<128x384xf32>) -> () loc("<stdin>":14:5)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf32> loc("<stdin>":18:10)
    "linalg.fill"(%1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":20:10), %arg4: f32 loc("<stdin>":20:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":21:7)
    }) : (f32, memref<128xf32>) -> () loc("<stdin>":19:5)
    "scf.forall"(%0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg0: index loc("<stdin>":24:10)):
      %4 = "affine.min"(%arg0) <{map = affine_map<(d0) -> (d0 * -64 + 128, 64)>}> : (index) -> index loc("<stdin>":25:12)
      %5 = "affine.max"(%4) <{map = affine_map<(d0) -> (0, d0)>}> : (index) -> index loc("<stdin>":26:12)
      %6 = "affine.apply"(%arg0) <{map = affine_map<(d0) -> (d0 * 64)>}> : (index) -> index loc("<stdin>":27:12)
      %7 = "affine.min"(%5, %arg0) <{map = affine_map<(d0, d1) -> (d1 * -64 + 128, d0)>}> : (index, index) -> index loc("<stdin>":28:12)
      %8 = "memref.subview"(%2, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 384>, static_strides = array<i64: 1, 1>}> : (memref<128x384xf32>, index, index) -> memref<?x384xf32, affine_map<(d0, d1)[s0] -> (d0 * 384 + s0 + d1)>> loc("<stdin>":29:12)
      %9 = "memref.subview"(%3, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (memref<128xf32>, index, index) -> memref<?xf32, affine_map<(d0)[s0] -> (d0 + s0)>> loc("<stdin>":30:12)
      "linalg.generic"(%8, %9) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg1: f32 loc("<stdin>":32:12), %arg2: f32 loc("<stdin>":32:24)):
        %10 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":33:15)
        "linalg.yield"(%10) : (f32) -> () loc("<stdin>":34:9)
      }) : (memref<?x384xf32, affine_map<(d0, d1)[s0] -> (d0 * 384 + s0 + d1)>>, memref<?xf32, affine_map<(d0)[s0] -> (d0 + s0)>>) -> () loc("<stdin>":31:7)
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> () loc("<stdin>":36:7)
    }) : (index) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":9:1)
