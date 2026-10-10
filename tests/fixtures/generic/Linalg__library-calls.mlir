#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg1, %1) : (memref<?x?xf32>, index) -> index
    %5 = "memref.alloc"(%3, %4) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "linalg.fill"(%2, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "linalg.matmul"(%arg0, %arg1, %5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %6 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg4, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"(%5) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf16, 1>, memref<32xf16, 1>, memref<32xf16, 1>) -> (), sym_name = "helper"}> ({
  ^bb0(%arg0: memref<32xf16, 1>, %arg1: memref<32xf16, 1>, %arg2: memref<32xf16, 1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf16, 6>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf16, 6>
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf16, 6>
    "linalg.copy"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f16, %arg11: f16):
      "linalg.yield"(%arg10) : (f16) -> ()
    }) : (memref<32xf16, 1>, memref<32xf16, 6>) -> ()
    "linalg.copy"(%arg2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f16, %arg9: f16):
      "linalg.yield"(%arg8) : (f16) -> ()
    }) : (memref<32xf16, 1>, memref<32xf16, 6>) -> ()
    "linalg.generic"(%0, %1, %2) <{doc = "...", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], library_call = "test", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f16, %arg6: f16, %arg7: f16):
      %3 = "arith.addf"(%arg6, %arg5) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%3) : (f16) -> ()
    }) : (memref<32xf16, 6>, memref<32xf16, 6>, memref<32xf16, 6>) -> ()
    "linalg.copy"(%2, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      "linalg.yield"(%arg3) : (f16) -> ()
    }) : (memref<32xf16, 6>, memref<32xf16, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

