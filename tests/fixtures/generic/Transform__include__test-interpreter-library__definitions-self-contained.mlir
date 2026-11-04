"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "private_helper", sym_visibility = "private"}> ({
  ^bb0(%arg10: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg10) <{message = "message"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding", sym_visibility = "private"}> ({
  ^bb0(%arg9: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg9) <{message = "external colliding (without suffix)"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_0", sym_visibility = "private"}> ({
  ^bb0(%arg8: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg8) <{message = "external colliding_0"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_2", sym_visibility = "private"}> ({
  ^bb0(%arg7: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg7) <{message = "external colliding_2"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_3", sym_visibility = "private"}> ({
  ^bb0(%arg6: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg6) <{message = "external colliding_3"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_4", sym_visibility = "private"}> ({
  ^bb0(%arg5: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg5) <{message = "external colliding_4"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "colliding_5"}> ({
  ^bb0(%arg4: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg4) <{message = "external colliding_5"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_message"}> ({
  ^bb0(%arg3: !transform.any_op):
    "transform.include"(%arg3) <{failure_propagation_mode = 1 : i32, target = @private_helper}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "consuming"}> ({
  ^bb0(%arg2: !transform.any_op):
    "transform.test_consume_operand"(%arg2) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "unannotated"}> ({
  ^bb0(%arg1: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg1) <{message = "unannotated"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "symbol_user"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding}> : (!transform.any_op) -> ()
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_0}> : (!transform.any_op) -> ()
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_2}> : (!transform.any_op) -> ()
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_3}> : (!transform.any_op) -> ()
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_4}> : (!transform.any_op) -> ()
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @colliding_5}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

