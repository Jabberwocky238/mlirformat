"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_operand"}> ({
    %2 = "emitc.literal"() <{value = "M_PI"}> : () -> f32 loc("<stdin>":3:10)
    %3 = "emitc.call_opaque"(%2) <{callee = "foo"}> : (f32) -> f32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_operand_arg"}> ({
    %0 = "emitc.literal"() <{value = "M_PI"}> : () -> f32 loc("<stdin>":8:10)
    %1 = "emitc.call_opaque"(%0) <{args = [42 : i32, 0 : index], callee = "bar"}> : (f32) -> f32 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
