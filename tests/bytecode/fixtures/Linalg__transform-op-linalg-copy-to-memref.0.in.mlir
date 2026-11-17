"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x64xf32>, memref<128x64xf32>) -> (), sym_name = "linalg_copy_to_memref_copy"}> ({
  ^bb0(%arg1: memref<128x64xf32> loc("<stdin>":3:8), %arg2: memref<128x64xf32> loc("<stdin>":3:35)):
    "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":5:10), %arg4: f32 loc("<stdin>":5:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":6:7)
    }) : (memref<128x64xf32>, memref<128x64xf32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      %1 = "transform.structured.linalg_copy_to_memref"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":14:12)
      "transform.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
