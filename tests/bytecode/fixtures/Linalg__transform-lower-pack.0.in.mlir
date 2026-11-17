"builtin.module"() ({
  "func.func"() <{function_type = (tensor<129x47x16x16xf32>, tensor<17x2x16x16x32x8xf32>) -> tensor<17x2x16x16x32x8xf32>, sym_name = "pack"}> ({
  ^bb0(%arg1: tensor<129x47x16x16xf32> loc("<stdin>":3:8), %arg2: tensor<17x2x16x16x32x8xf32> loc("<stdin>":3:41)):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<129x47x16x16xf32>, tensor<17x2x16x16x32x8xf32>, f32) -> tensor<17x2x16x16x32x8xf32> loc("<stdin>":5:10)
    "func.return"(%3) : (tensor<17x2x16x16x32x8xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":10:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack"> loc("<stdin>":11:12)
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">) loc("<stdin>":12:14)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
