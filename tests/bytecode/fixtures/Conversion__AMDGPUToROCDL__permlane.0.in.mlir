"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_permlane16_i32"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":3:8)):
    %10 = "amdgpu.permlane_swap"(%arg10) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (i32) -> i32 loc("<stdin>":4:11)
    "func.return"(%10) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_permlane16_i32_optional_attr"}> ({
  ^bb0(%arg9: i32 loc("<stdin>":8:8)):
    %9 = "amdgpu.permlane_swap"(%arg9) <{bound_ctrl = true, fetch_inactive = true, row_length = 16 : i32}> : (i32) -> i32 loc("<stdin>":9:10)
    "func.return"(%9) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_permlane32_i32"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":13:8)):
    %8 = "amdgpu.permlane_swap"(%arg8) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (i32) -> i32 loc("<stdin>":14:10)
    "func.return"(%8) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test_permlane16_f32"}> ({
  ^bb0(%arg7: f32 loc("<stdin>":18:8)):
    %7 = "amdgpu.permlane_swap"(%arg7) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (f32) -> f32 loc("<stdin>":19:10)
    "func.return"(%7) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test_permlane32_f32"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":23:8)):
    %6 = "amdgpu.permlane_swap"(%arg6) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (f32) -> f32 loc("<stdin>":24:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "test_permlane16_f16"}> ({
  ^bb0(%arg5: f16 loc("<stdin>":28:8)):
    %5 = "amdgpu.permlane_swap"(%arg5) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (f16) -> f16 loc("<stdin>":29:10)
    "func.return"(%5) : (f16) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "test_permlane32_f16"}> ({
  ^bb0(%arg4: f16 loc("<stdin>":33:8)):
    %4 = "amdgpu.permlane_swap"(%arg4) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (f16) -> f16 loc("<stdin>":34:10)
    "func.return"(%4) : (f16) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "test_permlane16_2xi32"}> ({
  ^bb0(%arg3: vector<2xi32> loc("<stdin>":38:8)):
    %3 = "amdgpu.permlane_swap"(%arg3) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (vector<2xi32>) -> vector<2xi32> loc("<stdin>":39:10)
    "func.return"(%3) : (vector<2xi32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "test_permlane32_2xi32"}> ({
  ^bb0(%arg2: vector<2xi32> loc("<stdin>":43:8)):
    %2 = "amdgpu.permlane_swap"(%arg2) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (vector<2xi32>) -> vector<2xi32> loc("<stdin>":44:10)
    "func.return"(%2) : (vector<2xi32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf16>, sym_name = "test_permlane16_4xf16"}> ({
  ^bb0(%arg1: vector<4xf16> loc("<stdin>":48:8)):
    %1 = "amdgpu.permlane_swap"(%arg1) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (vector<4xf16>) -> vector<4xf16> loc("<stdin>":49:10)
    "func.return"(%1) : (vector<4xf16>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf16>, sym_name = "test_permlane32_4xf16"}> ({
  ^bb0(%arg0: vector<4xf16> loc("<stdin>":53:8)):
    %0 = "amdgpu.permlane_swap"(%arg0) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (vector<4xf16>) -> vector<4xf16> loc("<stdin>":54:10)
    "func.return"(%0) : (vector<4xf16>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
}) : () -> () loc("<stdin>":1:1)
