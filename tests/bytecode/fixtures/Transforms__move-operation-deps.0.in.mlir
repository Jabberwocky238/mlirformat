"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "simple_move"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":3:8)):
    %2 = "before"() : () -> f32 loc("<stdin>":4:10)
    %3 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> {moved_op} : (f32, f32) -> f32 loc("<stdin>":5:10)
    %4 = "foo"(%3) : (f32) -> f32 loc("<stdin>":6:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":11:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["foo"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["before"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      "transform.test.move_operand_deps"(%0, %1) : (!transform.any_op, !transform.any_op) -> () loc("<stdin>":14:7)
      "transform.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
