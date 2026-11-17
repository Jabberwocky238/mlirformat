"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "private_helper", sym_visibility = "private"}> ({
  ^bb0(%arg10: !transform.any_op loc("<stdin>":3:8)):
    "transform.debug.emit_remark_at"(%arg10) <{message = "message"}> : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.yield"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding", sym_visibility = "private"}> ({
  ^bb0(%arg9: !transform.any_op loc("<stdin>":8:8)):
    "transform.debug.emit_remark_at"(%arg9) <{message = "external colliding (without suffix)"}> : (!transform.any_op) -> () loc("<stdin>":9:5)
    "transform.yield"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_0", sym_visibility = "private"}> ({
  ^bb0(%arg8: !transform.any_op loc("<stdin>":13:8)):
    "transform.debug.emit_remark_at"(%arg8) <{message = "external colliding_0"}> : (!transform.any_op) -> () loc("<stdin>":14:5)
    "transform.yield"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_2", sym_visibility = "private"}> ({
  ^bb0(%arg7: !transform.any_op loc("<stdin>":18:8)):
    "transform.debug.emit_remark_at"(%arg7) <{message = "external colliding_2"}> : (!transform.any_op) -> () loc("<stdin>":19:5)
    "transform.yield"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_3", sym_visibility = "private"}> ({
  ^bb0(%arg6: !transform.any_op loc("<stdin>":23:8)):
    "transform.debug.emit_remark_at"(%arg6) <{message = "external colliding_3"}> : (!transform.any_op) -> () loc("<stdin>":24:5)
    "transform.yield"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_4", sym_visibility = "private"}> ({
  ^bb0(%arg5: !transform.any_op loc("<stdin>":28:8)):
    "transform.debug.emit_remark_at"(%arg5) <{message = "external colliding_4"}> : (!transform.any_op) -> () loc("<stdin>":29:5)
    "transform.yield"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_5"}> ({
  ^bb0(%arg4: !transform.any_op loc("<stdin>":33:8)):
    "transform.debug.emit_remark_at"(%arg4) <{message = "external colliding_5"}> : (!transform.any_op) -> () loc("<stdin>":34:5)
    "transform.yield"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_message"}> ({
  ^bb0(%arg3: !transform.any_op loc("<stdin>":38:8)):
    "transform.include"(%arg3) <{failure_propagation_mode = 1 : i32, target = @private_helper}> : (!transform.any_op) -> () loc("<stdin>":39:5)
    "transform.yield"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "consuming"}> ({
  ^bb0(%arg2: !transform.any_op loc("<stdin>":43:8)):
    "transform.test_consume_operand"(%arg2) : (!transform.any_op) -> () loc("<stdin>":44:5)
    "transform.yield"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "unannotated"}> ({
  ^bb0(%arg1: !transform.any_op loc("<stdin>":48:8)):
    "transform.debug.emit_remark_at"(%arg1) <{message = "unannotated"}> : (!transform.any_op) -> () loc("<stdin>":49:5)
    "transform.yield"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "symbol_user"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":53:8)):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding}> : (!transform.any_op) -> () loc("<stdin>":54:5)
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_0}> : (!transform.any_op) -> () loc("<stdin>":55:5)
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_2}> : (!transform.any_op) -> () loc("<stdin>":56:5)
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_3}> : (!transform.any_op) -> () loc("<stdin>":57:5)
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_4}> : (!transform.any_op) -> () loc("<stdin>":58:5)
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_5}> : (!transform.any_op) -> () loc("<stdin>":59:5)
    "transform.yield"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":52:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
