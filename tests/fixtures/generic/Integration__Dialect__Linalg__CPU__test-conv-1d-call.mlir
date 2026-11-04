#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, f32) -> memref<?xf32>, sym_name = "alloc_1d_filled_f32"}> ({
  ^bb0(%arg7: index, %arg8: f32):
    %14 = "memref.alloc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "linalg.fill"(%arg8, %14) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (f32, memref<?xf32>) -> ()
    "func.return"(%14) : (memref<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "conv_1d"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: memref<?xf32>):
    "linalg.conv_1d"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %12 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg6, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %10 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d"]}> : (!transform.any_op) -> !transform.any_op
      %11:2 = "transform.structured.tile_using_for"(%10) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 6 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "func.call"(%0, %4) <{callee = @alloc_1d_filled_f32}> : (index, f32) -> memref<?xf32>
    %7 = "func.call"(%2, %4) <{callee = @alloc_1d_filled_f32}> : (index, f32) -> memref<?xf32>
    %8 = "func.call"(%1, %5) <{callee = @alloc_1d_filled_f32}> : (index, f32) -> memref<?xf32>
    "memref.store"(%3, %7, %0) : (f32, memref<?xf32>, index) -> ()
    "func.call"(%7, %6, %8) <{callee = @conv_1d}> : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    %9 = "memref.cast"(%8) : (memref<?xf32>) -> memref<*xf32>
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%6) : (memref<?xf32>) -> ()
    "memref.dealloc"(%7) : (memref<?xf32>) -> ()
    "memref.dealloc"(%8) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

