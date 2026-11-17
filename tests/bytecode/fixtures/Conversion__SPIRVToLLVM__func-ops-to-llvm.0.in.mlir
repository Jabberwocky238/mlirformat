"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "return"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> i32, sym_name = "return_value"}> ({
  ^bb0(%arg17: i32 loc("<stdin>":6:8)):
    "spirv.ReturnValue"(%arg17) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":5:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "none"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":9:3)
  "spirv.func"() <{function_control = #spirv.function_control<Inline>, function_type = () -> (), sym_name = "inline"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<DontInline>, function_type = () -> (), sym_name = "dont_inline"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":15:3)
  "spirv.func"() <{function_control = #spirv.function_control<Pure>, function_type = () -> (), sym_name = "pure"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":18:3)
  "spirv.func"() <{function_control = #spirv.function_control<Const>, function_type = () -> (), sym_name = "const"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":21:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i1, f64, f32) -> (), sym_name = "scalar_types"}> ({
  ^bb0(%arg13: i32 loc("<stdin>":25:8), %arg14: i1 loc("<stdin>":25:21), %arg15: f64 loc("<stdin>":25:33), %arg16: f32 loc("<stdin>":25:46)):
    "spirv.Return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":24:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi64>, vector<2xi64>) -> vector<2xi64>, sym_name = "vector_types"}> ({
  ^bb0(%arg11: vector<2xi64> loc("<stdin>":29:8), %arg12: vector<2xi64> loc("<stdin>":29:31)):
    %2 = "spirv.IAdd"(%arg11, %arg12) : (vector<2xi64>, vector<2xi64>) -> vector<2xi64> loc("<stdin>":30:10)
    "spirv.ReturnValue"(%2) : (vector<2xi64>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i1, f64, vector<2xi64>, vector<2xf32>) -> (), sym_name = "function_calls"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":34:8), %arg7: i1 loc("<stdin>":34:20), %arg8: f64 loc("<stdin>":34:31), %arg9: vector<2xi64> loc("<stdin>":34:43), %arg10: vector<2xf32> loc("<stdin>":34:65)):
    "spirv.FunctionCall"() <{callee = @void_1}> : () -> () loc("<stdin>":35:5)
    "spirv.FunctionCall"(%arg9) <{callee = @void_2}> : (vector<2xi64>) -> () loc("<stdin>":36:5)
    %0 = "spirv.FunctionCall"(%arg6, %arg7, %arg8) <{callee = @value_scalar}> : (i32, i1, f64) -> i32 loc("<stdin>":37:10)
    %1 = "spirv.FunctionCall"(%arg9, %arg10) <{callee = @value_vector}> : (vector<2xi64>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":38:10)
    "spirv.Return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":33:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "void_1"}> ({
    "spirv.Return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":41:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi64>) -> (), sym_name = "void_2"}> ({
  ^bb0(%arg5: vector<2xi64> loc("<stdin>":45:8)):
    "spirv.Return"() : () -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":44:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i1, f64) -> i32, sym_name = "value_scalar"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":49:8), %arg3: i1 loc("<stdin>":49:20), %arg4: f64 loc("<stdin>":49:31)):
    "spirv.ReturnValue"(%arg2) : (i32) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":48:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi64>, vector<2xf32>) -> vector<2xf32>, sym_name = "value_vector"}> ({
  ^bb0(%arg0: vector<2xi64> loc("<stdin>":53:8), %arg1: vector<2xf32> loc("<stdin>":53:30)):
    "spirv.ReturnValue"(%arg1) : (vector<2xf32>) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":52:3)
}) : () -> () loc("<stdin>":1:1)
