"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "inline_into"}> ({
  ^bb0(%arg3: memref<?xf32> loc("<stdin>":4:8)):
    "func.call"(%arg3) <{callee = @inlined_fn}> : (memref<?xf32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "inlined_fn"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":9:8)):
    "linalg.generic"(%arg0, %arg0) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":11:10), %arg2: f32 loc("<stdin>":11:22)):
      %0 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%0) : (f32) -> () loc("<stdin>":13:7)
    }) : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":2:1)
