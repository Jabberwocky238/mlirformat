"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_cos_f32"}> ({
  ^bb0(%arg7: f32):
    %7 = "nvvm.cos"(%arg7) <{ftz = false}> : (f32) -> f32
    "func.return"(%7) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_cos_ftz_f32"}> ({
  ^bb0(%arg6: f32):
    %6 = "nvvm.cos"(%arg6) <{ftz = true}> : (f32) -> f32
    "func.return"(%6) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_sin_f32"}> ({
  ^bb0(%arg5: f32):
    %5 = "nvvm.sin"(%arg5) <{ftz = false}> : (f32) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_sin_ftz_f32"}> ({
  ^bb0(%arg4: f32):
    %4 = "nvvm.sin"(%arg4) <{ftz = true}> : (f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_lg2_f32"}> ({
  ^bb0(%arg3: f32):
    %3 = "nvvm.log2"(%arg3) <{ftz = false}> : (f32) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_lg2_ftz_f32"}> ({
  ^bb0(%arg2: f32):
    %2 = "nvvm.log2"(%arg2) <{ftz = true}> : (f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_ex2_f32"}> ({
  ^bb0(%arg1: f32):
    %1 = "nvvm.ex2"(%arg1) <{ftz = false}> : (f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "nvvm_ex2_ftz_f32"}> ({
  ^bb0(%arg0: f32):
    %0 = "nvvm.ex2"(%arg0) <{ftz = true}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

