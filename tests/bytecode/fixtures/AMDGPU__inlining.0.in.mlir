"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "calee"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":3:8)):
    %1 = "amdgpu.permlane_swap"(%arg1) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (f32) -> f32 loc("<stdin>":4:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "caller"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":8:8)):
    %0 = "func.call"(%arg0) <{callee = @calee}> : (f32) -> f32 loc("<stdin>":9:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
