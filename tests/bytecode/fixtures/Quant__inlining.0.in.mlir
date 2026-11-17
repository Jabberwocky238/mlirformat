"builtin.module"() ({
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32, sym_name = "inner_dcast_inlinable"}> ({
  ^bb0(%arg5: !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":3:8)):
    %5 = "quant.dcast"(%arg5) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32 loc("<stdin>":4:10)
    "func.return"(%5) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32, sym_name = "test_inline_dcast"}> ({
  ^bb0(%arg4: !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":8:8)):
    %4 = "func.call"(%arg4) <{callee = @inner_dcast_inlinable}> : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32 loc("<stdin>":9:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "inner_qcast_inlinable"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":13:8)):
    %3 = "quant.qcast"(%arg3) : (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":14:10)
    "func.return"(%3) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "test_inline_qcast"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":18:8)):
    %2 = "func.call"(%arg2) <{callee = @inner_qcast_inlinable}> : (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":19:10)
    "func.return"(%2) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "inner_scast_inlinable"}> ({
  ^bb0(%arg1: i8 loc("<stdin>":23:8)):
    %1 = "quant.scast"(%arg1) : (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":24:10)
    "func.return"(%1) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>, sym_name = "test_inline_scast"}> ({
  ^bb0(%arg0: i8 loc("<stdin>":28:8)):
    %0 = "func.call"(%arg0) <{callee = @inner_scast_inlinable}> : (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10> loc("<stdin>":29:10)
    "func.return"(%0) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
