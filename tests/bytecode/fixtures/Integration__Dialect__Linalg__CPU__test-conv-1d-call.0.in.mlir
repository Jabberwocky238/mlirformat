"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (index, f32) -> memref<?xf32>, sym_name = "alloc_1d_filled_f32"}> ({
  ^bb0(%arg7: index loc("<stdin>":8:8), %arg8: f32 loc("<stdin>":8:22)):
    %14 = "memref.alloc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":9:11)
    "linalg.fill"(%arg8, %14) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":11:10), %arg10: f32 loc("<stdin>":11:22)):
      "linalg.yield"(%arg9) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, memref<?xf32>) -> () loc("<stdin>":10:5)
    "func.return"(%14) : (memref<?xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "conv_1d"}> ({
  ^bb0(%arg1: memref<?xf32> loc("<stdin>":17:8), %arg2: memref<?xf32> loc("<stdin>":17:30), %arg3: memref<?xf32> loc("<stdin>":17:52)):
    "linalg.conv_1d"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":19:10), %arg5: f32 loc("<stdin>":19:22), %arg6: f32 loc("<stdin>":19:34)):
      %12 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":20:13)
      %13 = "arith.addf"(%arg6, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":22:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0 + d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":16:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":28:10)):
      %10 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":29:13)
      %11:2 = "transform.structured.tile_using_for"(%10) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":30:15)
      "transform.yield"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":27:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":35:10)
    %1 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":36:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":37:10)
    %3 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":38:10)
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":39:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":40:10)
    %6 = "func.call"(%0, %4) <{callee = @alloc_1d_filled_f32}> : (index, f32) -> memref<?xf32> loc("<stdin>":41:10)
    %7 = "func.call"(%2, %4) <{callee = @alloc_1d_filled_f32}> : (index, f32) -> memref<?xf32> loc("<stdin>":42:10)
    %8 = "func.call"(%1, %5) <{callee = @alloc_1d_filled_f32}> : (index, f32) -> memref<?xf32> loc("<stdin>":43:10)
    "memref.store"(%3, %7, %0) : (f32, memref<?xf32>, index) -> () loc("<stdin>":44:5)
    "func.call"(%7, %6, %8) <{callee = @conv_1d}> : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":45:5)
    %9 = "memref.cast"(%8) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":46:10)
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":47:5)
    "memref.dealloc"(%6) : (memref<?xf32>) -> () loc("<stdin>":48:5)
    "memref.dealloc"(%7) : (memref<?xf32>) -> () loc("<stdin>":49:5)
    "memref.dealloc"(%8) : (memref<?xf32>) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":34:3)
}) : () -> () loc("<stdin>":4:1)
