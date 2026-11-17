"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "specialize_trivial_copy_memref"}> ({
  ^bb0(%arg13: memref<?x?xf32> loc("<stdin>":5:8), %arg14: memref<?x?xf32> loc("<stdin>":5:33)):
    "linalg.generic"(%arg13, %arg14) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: f32 loc("<stdin>":7:10), %arg16: f32 loc("<stdin>":7:23)):
      "linalg.yield"(%arg15) : (f32) -> () loc("<stdin>":8:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "specialize_trivial_copy_tensor"}> ({
  ^bb0(%arg9: tensor<?x?x?xf32> loc("<stdin>":13:8), %arg10: tensor<?x?x?xf32> loc("<stdin>":13:34)):
    %3 = "linalg.generic"(%arg9, %arg10) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":15:10), %arg12: f32 loc("<stdin>":15:23)):
      "linalg.yield"(%arg11) : (f32) -> () loc("<stdin>":16:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":14:10)
    "func.return"(%3) : (tensor<?x?x?xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "already_trivial_copy_memref"}> ({
  ^bb0(%arg5: memref<?x?xf32> loc("<stdin>":21:8), %arg6: memref<?x?xf32> loc("<stdin>":21:32)):
    "linalg.copy"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":23:10), %arg8: f32 loc("<stdin>":23:22)):
      "linalg.yield"(%arg7) : (f32) -> () loc("<stdin>":24:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "already_trivial_copy_tensor"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32> loc("<stdin>":29:8), %arg2: tensor<?x?x?xf32> loc("<stdin>":29:34)):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":31:10), %arg4: f32 loc("<stdin>":31:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":32:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":30:10)
    "func.return"(%2) : (tensor<?x?x?xf32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":28:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":38:10)):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":39:12)
      %1 = "transform.structured.specialize"(%0) <{emit_category = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":40:12)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":37:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":36:3)
}) : () -> () loc("<stdin>":3:1)
