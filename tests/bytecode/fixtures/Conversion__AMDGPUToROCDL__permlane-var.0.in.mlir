"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_permlane_var_i32"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":3:8), %arg13: i32 loc("<stdin>":3:21)):
    %6 = "amdgpu.permlane_var"(%arg12, %arg13) <{bound_ctrl = false, cross = false, fetch_inactive = false}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%6) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_permlane_var_cross_i32"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":8:8), %arg11: i32 loc("<stdin>":8:21)):
    %5 = "amdgpu.permlane_var"(%arg10, %arg11) <{bound_ctrl = false, cross = true, fetch_inactive = false}> : (i32, i32) -> i32 loc("<stdin>":9:10)
    "func.return"(%5) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "test_permlane_var_f32"}> ({
  ^bb0(%arg8: f32 loc("<stdin>":13:8), %arg9: i32 loc("<stdin>":13:20)):
    %4 = "amdgpu.permlane_var"(%arg8, %arg9) <{bound_ctrl = false, cross = false, fetch_inactive = false}> : (f32, i32) -> f32 loc("<stdin>":14:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f16, i32) -> f16, sym_name = "test_permlane_var_f16"}> ({
  ^bb0(%arg6: f16 loc("<stdin>":18:8), %arg7: i32 loc("<stdin>":18:20)):
    %3 = "amdgpu.permlane_var"(%arg6, %arg7) <{bound_ctrl = false, cross = false, fetch_inactive = false}> : (f16, i32) -> f16 loc("<stdin>":19:10)
    "func.return"(%3) : (f16) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f16, i32) -> f16, sym_name = "test_permlane_var_cross_f16"}> ({
  ^bb0(%arg4: f16 loc("<stdin>":23:8), %arg5: i32 loc("<stdin>":23:20)):
    %2 = "amdgpu.permlane_var"(%arg4, %arg5) <{bound_ctrl = false, cross = true, fetch_inactive = false}> : (f16, i32) -> f16 loc("<stdin>":24:10)
    "func.return"(%2) : (f16) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<4xf16>, i32) -> vector<4xf16>, sym_name = "test_permlane_var_4xf16"}> ({
  ^bb0(%arg2: vector<4xf16> loc("<stdin>":28:8), %arg3: i32 loc("<stdin>":28:30)):
    %1 = "amdgpu.permlane_var"(%arg2, %arg3) <{bound_ctrl = false, cross = false, fetch_inactive = false}> : (vector<4xf16>, i32) -> vector<4xf16> loc("<stdin>":29:10)
    "func.return"(%1) : (vector<4xf16>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_permlane_var_attrs"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":33:8), %arg1: i32 loc("<stdin>":33:20)):
    %0 = "amdgpu.permlane_var"(%arg0, %arg1) <{bound_ctrl = true, cross = true, fetch_inactive = true}> : (i32, i32) -> i32 loc("<stdin>":34:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
