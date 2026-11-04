#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg14: memref<?x?xf32>, %arg15: memref<?x?xf32>):
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index
    %28 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %29 = "memref.dim"(%arg14, %26) : (memref<?x?xf32>, index) -> index
    %30 = "memref.dim"(%arg15, %27) : (memref<?x?xf32>, index) -> index
    %31 = "memref.alloc"(%29, %30) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "linalg.fill"(%28, %31) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32, %arg20: f32):
      "linalg.yield"(%arg19) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "linalg.matmul"(%arg14, %arg15, %31) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %32 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %33 = "arith.addf"(%arg18, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%33) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"(%31) : (memref<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>, sym_name = "matvec"}> ({
  ^bb0(%arg6: memref<?x?xf32>, %arg7: memref<?x?xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    %17 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %18 = "memref.dim"(%arg6, %15) : (memref<?x?xf32>, index) -> index
    %19 = "memref.dim"(%arg6, %16) : (memref<?x?xf32>, index) -> index
    %20 = "memref.dim"(%arg7, %16) : (memref<?x?xf32>, index) -> index
    %21 = "memref.alloc"(%18, %20) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "linalg.fill"(%17, %21) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "scf.for"(%15, %20, %16) ({
    ^bb0(%arg8: index):
      %22 = "memref.subview"(%arg7, %arg8, %19) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, strided<[?], offset: ?>>
      %23 = "memref.subview"(%21, %arg8, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, strided<[?], offset: ?>>
      "linalg.matvec"(%arg6, %22, %23) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
        %24 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %25 = "arith.addf"(%arg11, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%25) : (f32) -> ()
      }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>, memref<?xf32, strided<[?], offset: ?>>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"(%21) : (memref<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.300000e+01 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 1.700000e+01 : f32}> : () -> f32
    %7 = "memref.alloc"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %8 = "memref.alloc"(%3, %4) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "linalg.fill"(%5, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "linalg.fill"(%6, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "memref.store"(%5, %8, %0, %0) : (f32, memref<?x?xf32>, index, index) -> ()
    %9 = "func.call"(%7, %8) <{callee = @matmul}> : (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>
    %10 = "func.call"(%7, %8) <{callee = @matvec}> : (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %4, %1) ({
      ^bb0(%arg1: index):
        %12 = "memref.load"(%9, %arg0, %arg1) : (memref<?x?xf32>, index, index) -> f32
        %13 = "memref.load"(%10, %arg0, %arg1) : (memref<?x?xf32>, index, index) -> f32
        %14 = "arith.cmpf"(%12, %13) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
        "cf.assert"(%14) <{msg = "Matmul does not produce same output as matvec"}> : (i1) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %11 = "memref.cast"(%10) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%9) : (memref<?x?xf32>) -> ()
    "memref.dealloc"(%10) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

