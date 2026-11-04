#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index, f32) -> memref<?x?xf32>, sym_name = "alloc_2d_filled_f32"}> ({
  ^bb0(%arg7: index, %arg8: index, %arg9: f32):
    %16 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "linalg.fill"(%arg9, %16) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    "func.return"(%16) : (memref<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "conv_2d"}> ({
  ^bb0(%arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>):
    "linalg.conv_2d"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %14 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.addf"(%arg6, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %12 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d"]}> : (!transform.any_op) -> !transform.any_op
      %13:3 = "transform.structured.tile_using_for"(%12) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "func.call"(%2, %2, %6) <{callee = @alloc_2d_filled_f32}> : (index, index, f32) -> memref<?x?xf32>
    %9 = "func.call"(%4, %4, %6) <{callee = @alloc_2d_filled_f32}> : (index, index, f32) -> memref<?x?xf32>
    %10 = "func.call"(%3, %3, %7) <{callee = @alloc_2d_filled_f32}> : (index, index, f32) -> memref<?x?xf32>
    "memref.store"(%5, %9, %0, %2) : (f32, memref<?x?xf32>, index, index) -> ()
    "func.call"(%9, %8, %10) <{callee = @conv_2d}> : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    %11 = "memref.cast"(%10) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%8) : (memref<?x?xf32>) -> ()
    "memref.dealloc"(%9) : (memref<?x?xf32>) -> ()
    "memref.dealloc"(%10) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

