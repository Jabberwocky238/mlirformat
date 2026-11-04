"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "calee"}> ({
  ^bb0(%arg1: f32):
    %1 = "amdgpu.permlane_swap"(%arg1) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "caller"}> ({
  ^bb0(%arg0: f32):
    %0 = "func.call"(%arg0) <{callee = @calee}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

