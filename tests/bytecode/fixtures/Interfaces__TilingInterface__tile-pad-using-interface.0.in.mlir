"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, f32) -> tensor<?x?xf32>, sym_name = "dynamic_2d_pad_tensor"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":3:8), %arg2: f32 loc("<stdin>":3:32)):
    %2 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 3>, static_low = array<i64: 3, 4>}> ({
    ^bb0(%arg3: index loc("<stdin>":5:10), %arg4: index loc("<stdin>":5:24)):
      "tensor.yield"(%arg2) : (f32) -> () loc("<stdin>":6:7)
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<?x?xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":14:14)
      "transform.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
