"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, tensor<?xf32>, f32) -> (), sym_name = "make_pad_loop_independent_1"}> ({
  ^bb0(%arg1: index loc("<stdin>":4:8), %arg2: index loc("<stdin>":4:22), %arg3: index loc("<stdin>":4:36), %arg4: tensor<?xf32> loc("<stdin>":4:50), %arg5: f32 loc("<stdin>":4:72)):
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg6: index loc("<stdin>":6:10)):
      %2 = "affine.apply"(%arg6, %arg2) <{map = affine_map<(d0)[s0] -> (-d0 + s0)>}> : (index, index) -> index loc("<stdin>":7:12)
      %3 = "tensor.pad"(%arg4, %2) <{operandSegmentSizes = array<i32: 1, 0, 1>, static_high = array<i64: -9223372036854775808>, static_low = array<i64: 5>}> ({
      ^bb0(%arg7: index loc("<stdin>":9:12)):
        "tensor.yield"(%arg5) : (f32) -> () loc("<stdin>":10:9)
      }) : (tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":8:12)
      "dummy.some_use"(%3) : (tensor<?xf32>) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":19:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      %1 = "transform.tensor.make_loop_independent"(%0) <{num_loops = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":18:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":2:1)
