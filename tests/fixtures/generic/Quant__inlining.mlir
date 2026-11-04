"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32, sym_name = "inner_dcast_inlinable"}> ({
  ^bb0(%arg5: !quant.uniform<i8:f32, 2.000000e+00:10>):
    %5 = "quant.dcast"(%arg5) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32, sym_name = "test_inline_dcast"}> ({
  ^bb0(%arg4: !quant.uniform<i8:f32, 2.000000e+00:10>):
    %4 = "func.call"(%arg4) <{callee = @inner_dcast_inlinable}> : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "inner_qcast_inlinable"}> ({
  ^bb0(%arg3: f32):
    %3 = "quant.qcast"(%arg3) : (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    "func.return"(%3) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "test_inline_qcast"}> ({
  ^bb0(%arg2: f32):
    %2 = "func.call"(%arg2) <{callee = @inner_qcast_inlinable}> : (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    "func.return"(%2) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "inner_scast_inlinable"}> ({
  ^bb0(%arg1: i8):
    %1 = "quant.scast"(%arg1) : (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    "func.return"(%1) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "test_inline_scast"}> ({
  ^bb0(%arg0: i8):
    %0 = "func.call"(%arg0) <{callee = @inner_scast_inlinable}> : (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    "func.return"(%0) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> ()
  }) : () -> ()
}) : () -> ()

