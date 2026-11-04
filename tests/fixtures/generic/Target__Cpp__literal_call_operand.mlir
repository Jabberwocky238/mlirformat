"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_operand"}> ({
    %2 = "emitc.literal"() <{value = "M_PI"}> : () -> f32
    %3 = "emitc.call_opaque"(%2) <{callee = "foo"}> : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_operand_arg"}> ({
    %0 = "emitc.literal"() <{value = "M_PI"}> : () -> f32
    %1 = "emitc.call_opaque"(%0) <{args = [42 : i32, 0 : index], callee = "bar"}> : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

