"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_cos_f32"}> ({
  ^bb0(%arg7: f32 loc("<stdin>":3:8)):
    %7 = "nvvm.cos"(%arg7) <{ftz = false}> : (f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%7) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_cos_ftz_f32"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":8:8)):
    %6 = "nvvm.cos"(%arg6) <{ftz = true}> : (f32) -> f32 loc("<stdin>":9:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_sin_f32"}> ({
  ^bb0(%arg5: f32 loc("<stdin>":13:8)):
    %5 = "nvvm.sin"(%arg5) <{ftz = false}> : (f32) -> f32 loc("<stdin>":14:10)
    "func.return"(%5) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_sin_ftz_f32"}> ({
  ^bb0(%arg4: f32 loc("<stdin>":18:8)):
    %4 = "nvvm.sin"(%arg4) <{ftz = true}> : (f32) -> f32 loc("<stdin>":19:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_lg2_f32"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":23:8)):
    %3 = "nvvm.log2"(%arg3) <{ftz = false}> : (f32) -> f32 loc("<stdin>":24:10)
    "func.return"(%3) : (f32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_lg2_ftz_f32"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":28:8)):
    %2 = "nvvm.log2"(%arg2) <{ftz = true}> : (f32) -> f32 loc("<stdin>":29:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_ex2_f32"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":33:8)):
    %1 = "nvvm.ex2"(%arg1) <{ftz = false}> : (f32) -> f32 loc("<stdin>":34:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_ex2_ftz_f32"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":38:8)):
    %0 = "nvvm.ex2"(%arg0) <{ftz = true}> : (f32) -> f32 loc("<stdin>":39:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
