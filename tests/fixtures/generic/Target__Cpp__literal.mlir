"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "emitc_literal"}> ({
  ^bb0(%arg0: f32):
    %0 = "emitc.literal"() <{value = "M_PI"}> : () -> f32
    %1 = "emitc.add"(%arg0, %0) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

