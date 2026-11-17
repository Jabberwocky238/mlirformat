"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1, i1) -> (), sym_name = "logical_equal_scalar"}> ({
  ^bb0(%arg24: i1 loc("<stdin>":3:8), %arg25: i1 loc("<stdin>":3:20)):
    %13 = "spirv.LogicalEqual"(%arg24, %arg25) : (i1, i1) -> i1 loc("<stdin>":4:11)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "logical_equal_vector"}> ({
  ^bb0(%arg22: vector<4xi1> loc("<stdin>":8:8), %arg23: vector<4xi1> loc("<stdin>":8:30)):
    %12 = "spirv.LogicalEqual"(%arg22, %arg23) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1> loc("<stdin>":9:11)
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1, i1) -> (), sym_name = "logical_not_equal_scalar"}> ({
  ^bb0(%arg20: i1 loc("<stdin>":13:8), %arg21: i1 loc("<stdin>":13:20)):
    %11 = "spirv.LogicalNotEqual"(%arg20, %arg21) : (i1, i1) -> i1 loc("<stdin>":14:11)
    "spirv.Return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "logical_not_equal_vector"}> ({
  ^bb0(%arg18: vector<4xi1> loc("<stdin>":18:8), %arg19: vector<4xi1> loc("<stdin>":18:30)):
    %10 = "spirv.LogicalNotEqual"(%arg18, %arg19) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1> loc("<stdin>":19:11)
    "spirv.Return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1) -> (), sym_name = "logical_not_scalar"}> ({
  ^bb0(%arg17: i1 loc("<stdin>":23:8)):
    %9 = "spirv.LogicalNot"(%arg17) : (i1) -> i1 loc("<stdin>":24:10)
    "spirv.Return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>) -> (), sym_name = "logical_not_vector"}> ({
  ^bb0(%arg16: vector<4xi1> loc("<stdin>":28:8)):
    %8 = "spirv.LogicalNot"(%arg16) : (vector<4xi1>) -> vector<4xi1> loc("<stdin>":29:10)
    "spirv.Return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1, i1) -> (), sym_name = "logical_and_scalar"}> ({
  ^bb0(%arg14: i1 loc("<stdin>":33:8), %arg15: i1 loc("<stdin>":33:20)):
    %7 = "spirv.LogicalAnd"(%arg14, %arg15) : (i1, i1) -> i1 loc("<stdin>":34:10)
    "spirv.Return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "logical_and_vector"}> ({
  ^bb0(%arg12: vector<4xi1> loc("<stdin>":38:8), %arg13: vector<4xi1> loc("<stdin>":38:30)):
    %6 = "spirv.LogicalAnd"(%arg12, %arg13) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1> loc("<stdin>":39:10)
    "spirv.Return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1, i1) -> (), sym_name = "logical_or_scalar"}> ({
  ^bb0(%arg10: i1 loc("<stdin>":43:8), %arg11: i1 loc("<stdin>":43:20)):
    %5 = "spirv.LogicalOr"(%arg10, %arg11) : (i1, i1) -> i1 loc("<stdin>":44:10)
    "spirv.Return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "logical_or_vector"}> ({
  ^bb0(%arg8: vector<4xi1> loc("<stdin>":48:8), %arg9: vector<4xi1> loc("<stdin>":48:29)):
    %4 = "spirv.LogicalOr"(%arg8, %arg9) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1> loc("<stdin>":49:10)
    "spirv.Return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "ordered_scalar"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":53:8), %arg7: f32 loc("<stdin>":53:20)):
    %3 = "spirv.Ordered"(%arg6, %arg7) : (f32, f32) -> i1 loc("<stdin>":54:10)
    "spirv.Return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "ordered_vector"}> ({
  ^bb0(%arg4: vector<4xf32> loc("<stdin>":58:8), %arg5: vector<4xf32> loc("<stdin>":58:30)):
    %2 = "spirv.Ordered"(%arg4, %arg5) : (vector<4xf32>, vector<4xf32>) -> vector<4xi1> loc("<stdin>":59:10)
    "spirv.Return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "unordered_scalar"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":63:8), %arg3: f32 loc("<stdin>":63:20)):
    %1 = "spirv.Unordered"(%arg2, %arg3) : (f32, f32) -> i1 loc("<stdin>":64:10)
    "spirv.Return"() : () -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "unordered_vector"}> ({
  ^bb0(%arg0: vector<4xf32> loc("<stdin>":68:8), %arg1: vector<4xf32> loc("<stdin>":68:30)):
    %0 = "spirv.Unordered"(%arg0, %arg1) : (vector<4xf32>, vector<4xf32>) -> vector<4xi1> loc("<stdin>":69:10)
    "spirv.Return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
}) : () -> () loc("<stdin>":1:1)
