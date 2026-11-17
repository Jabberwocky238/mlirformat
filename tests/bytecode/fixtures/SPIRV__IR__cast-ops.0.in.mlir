"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cast1"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":3:8)):
    %6 = "spirv.Bitcast"(%arg6) : (f32) -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xf32>) -> (), sym_name = "cast2"}> ({
  ^bb0(%arg5: vector<2xf32> loc("<stdin>":8:8)):
    %5 = "spirv.Bitcast"(%arg5) : (vector<2xf32>) -> vector<2xi32> loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<2xf32>) -> (), sym_name = "cast3"}> ({
  ^bb0(%arg4: vector<2xf32> loc("<stdin>":13:8)):
    %4 = "spirv.Bitcast"(%arg4) : (vector<2xf32>) -> i64 loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (!spirv.ptr<f32, Function>) -> (), sym_name = "cast4"}> ({
  ^bb0(%arg3: !spirv.ptr<f32, Function> loc("<stdin>":18:8)):
    %3 = "spirv.Bitcast"(%arg3) : (!spirv.ptr<f32, Function>) -> !spirv.ptr<i32, Function> loc("<stdin>":19:10)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (!spirv.ptr<f32, Function>) -> (), sym_name = "cast5"}> ({
  ^bb0(%arg2: !spirv.ptr<f32, Function> loc("<stdin>":23:8)):
    %2 = "spirv.Bitcast"(%arg2) : (!spirv.ptr<f32, Function>) -> !spirv.ptr<vector<2xi32>, Function> loc("<stdin>":24:10)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "cast6"}> ({
  ^bb0(%arg1: vector<4xf32> loc("<stdin>":28:8)):
    %1 = "spirv.Bitcast"(%arg1) : (vector<4xf32>) -> vector<2xi64> loc("<stdin>":29:10)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (!spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>) -> (), sym_name = "cast_coop_matrix"}> ({
  ^bb0(%arg0: !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA> loc("<stdin>":33:8)):
    %0 = "spirv.Bitcast"(%arg0) : (!spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<4x4xi32, Subgroup, MatrixA> loc("<stdin>":34:10)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
