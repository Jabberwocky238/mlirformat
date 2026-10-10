"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x12xf32>, memref<1x16x12xf32>) -> (), sym_name = "unroll_simple_parallel_loop"}> ({
  ^bb0(%arg0: memref<1x16x12xf32>, %arg1: memref<1x16x12xf32>):
    %0 = "arith.constant"() <{value = 12 : index}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%2, %2, %2, %3, %1, %0, %3, %3, %3) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      %4 = "memref.load"(%arg0, %arg2, %arg3, %arg4) : (memref<1x16x12xf32>, index, index, index) -> f32
      "memref.store"(%4, %arg1, %arg2, %arg3, %arg4) : (f32, memref<1x16x12xf32>, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x12xf32>, memref<1x16x12xf32>) -> (), sym_name = "negative_unroll_factors_dont_divide_evenly"}> ({
  ^bb0(%arg0: memref<1x16x12xf32>, %arg1: memref<1x16x12xf32>):
    %0 = "arith.constant"() <{value = 12 : index}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%2, %2, %2, %3, %1, %0, %3, %3, %3) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      %4 = "memref.load"(%arg0, %arg2, %arg3, %arg4) : (memref<1x16x12xf32>, index, index, index) -> f32
      "memref.store"(%4, %arg1, %arg2, %arg3, %arg4) : (f32, memref<1x16x12xf32>, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + (d1 floordiv 4) * 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x16x12x4x4xf32>, memref<5x16x12x4x4xf32>) -> (), sym_name = "unroll_outer_nested_parallel_loop"}> ({
  ^bb0(%arg0: memref<5x16x12x4x4xf32>, %arg1: memref<5x16x12x4x4xf32>):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 12 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%4, %4, %4, %3, %2, %1, %5, %5, %5) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      "scf.parallel"(%4, %4, %0, %0, %5, %5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg5: index, %arg6: index):
        %6 = "affine.apply"(%arg3, %arg5) <{map = #map}> : (index, index) -> index
        %7 = "affine.apply"(%arg4, %arg6) <{map = #map}> : (index, index) -> index
        %8 = "memref.subview"(%arg0, %arg2, %6, %7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 1, 4, 4>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (memref<5x16x12x4x4xf32>, index, index, index) -> memref<4x4xf32, strided<[4, 1], offset: ?>>
        %9 = "memref.subview"(%arg1, %arg2, %6, %7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 1, 4, 4>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (memref<5x16x12x4x4xf32>, index, index, index) -> memref<4x4xf32, strided<[4, 1], offset: ?>>
        "linalg.erf"(%8, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
        ^bb0(%arg7: f32, %arg8: f32):
          %10 = "math.erf"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
          "linalg.yield"(%10) : (f32) -> ()
        }) : (memref<4x4xf32, strided<[4, 1], offset: ?>>, memref<4x4xf32, strided<[4, 1], offset: ?>>) -> ()
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x12xf32>, memref<1x16x12xf32>, index) -> (), sym_name = "negative_unroll_dynamic_parallel_loop"}> ({
  ^bb0(%arg0: memref<1x16x12xf32>, %arg1: memref<1x16x12xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 12 : index}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%2, %2, %2, %3, %1, %arg2, %3, %3, %3) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      %4 = "memref.load"(%arg0, %arg3, %arg4, %arg5) : (memref<1x16x12xf32>, index, index, index) -> f32
      "memref.store"(%4, %arg1, %arg3, %arg4, %arg5) : (f32, memref<1x16x12xf32>, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + (d1 floordiv 4) * 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x16x12x4x4xf32>, memref<5x16x12x4x4xf32>) -> (), sym_name = "unroll_inner_nested_parallel_loop"}> ({
  ^bb0(%arg0: memref<5x16x12x4x4xf32>, %arg1: memref<5x16x12x4x4xf32>):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.constant"() <{value = 12 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%4, %4, %4, %3, %2, %1, %5, %5, %5) <{operandSegmentSizes = array<i32: 3, 3, 3, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index):
      "scf.parallel"(%4, %4, %0, %0, %5, %5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg5: index, %arg6: index):
        %6 = "affine.apply"(%arg3, %arg5) <{map = #map}> : (index, index) -> index
        %7 = "affine.apply"(%arg4, %arg6) <{map = #map}> : (index, index) -> index
        %8 = "memref.subview"(%arg0, %arg2, %6, %7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 1, 4, 4>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (memref<5x16x12x4x4xf32>, index, index, index) -> memref<4x4xf32, strided<[4, 1], offset: ?>>
        %9 = "memref.subview"(%arg1, %arg2, %6, %7) <{operandSegmentSizes = array<i32: 1, 3, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 1, 4, 4>, static_strides = array<i64: 1, 1, 1, 1, 1>}> : (memref<5x16x12x4x4xf32>, index, index, index) -> memref<4x4xf32, strided<[4, 1], offset: ?>>
        "linalg.erf"(%8, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
        ^bb0(%arg7: f32, %arg8: f32):
          %10 = "math.erf"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
          "linalg.yield"(%10) : (f32) -> ()
        }) : (memref<4x4xf32, strided<[4, 1], offset: ?>>, memref<4x4xf32, strided<[4, 1], offset: ?>>) -> ()
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

