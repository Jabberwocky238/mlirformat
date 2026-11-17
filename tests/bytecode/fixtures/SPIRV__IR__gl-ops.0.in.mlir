"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":3:8)):
    %1 = "spirv.GL.Exp"(%arg1) : (f32) -> f32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<3xf16>) -> (), sym_name = "expvec"}> ({
  ^bb0(%arg0: vector<3xf16> loc("<stdin>":8:8)):
    %0 = "spirv.GL.Exp"(%arg0) : (vector<3xf16>) -> vector<3xf16> loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
