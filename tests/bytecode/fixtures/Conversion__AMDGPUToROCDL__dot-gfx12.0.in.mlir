"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, f32) -> f32, sym_name = "dot_fp8_fp8"}> ({
  ^bb0(%arg9: vector<4xf8E4M3FN> loc("<stdin>":3:8), %arg10: vector<4xf8E4M3FN> loc("<stdin>":3:35), %arg11: f32 loc("<stdin>":3:63)):
    %3 = "amdgpu.dot"(%arg9, %arg10, %arg11) : (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%3) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, vector<4xf8E5M2>, f32) -> f32, sym_name = "dot_fp8_bf8"}> ({
  ^bb0(%arg6: vector<4xf8E4M3FN> loc("<stdin>":8:8), %arg7: vector<4xf8E5M2> loc("<stdin>":8:35), %arg8: f32 loc("<stdin>":8:60)):
    %2 = "amdgpu.dot"(%arg6, %arg7, %arg8) : (vector<4xf8E4M3FN>, vector<4xf8E5M2>, f32) -> f32 loc("<stdin>":9:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<4xf8E5M2>, vector<4xf8E4M3FN>, f32) -> f32, sym_name = "dot_bf8_fp8"}> ({
  ^bb0(%arg3: vector<4xf8E5M2> loc("<stdin>":13:8), %arg4: vector<4xf8E4M3FN> loc("<stdin>":13:33), %arg5: f32 loc("<stdin>":13:60)):
    %1 = "amdgpu.dot"(%arg3, %arg4, %arg5) : (vector<4xf8E5M2>, vector<4xf8E4M3FN>, f32) -> f32 loc("<stdin>":14:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<4xf8E5M2>, vector<4xf8E5M2>, f32) -> f32, sym_name = "dot_bf8_bf8"}> ({
  ^bb0(%arg0: vector<4xf8E5M2> loc("<stdin>":18:8), %arg1: vector<4xf8E5M2> loc("<stdin>":18:33), %arg2: f32 loc("<stdin>":18:58)):
    %0 = "amdgpu.dot"(%arg0, %arg1, %arg2) : (vector<4xf8E5M2>, vector<4xf8E5M2>, f32) -> f32 loc("<stdin>":19:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
