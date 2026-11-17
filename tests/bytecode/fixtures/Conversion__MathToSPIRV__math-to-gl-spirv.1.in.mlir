"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> i64, sym_name = "ctlz_scalar"}> ({
  ^bb0(%arg1: i64 loc("<stdin>":4:8)):
    %1 = "math.ctlz"(%arg1) : (i64) -> i64 loc("<stdin>":5:10)
    "func.return"(%1) : (i64) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (vector<2xi16>) -> vector<2xi16>, sym_name = "ctlz_vector2"}> ({
  ^bb0(%arg0: vector<2xi16> loc("<stdin>":9:8)):
    %0 = "math.ctlz"(%arg0) : (vector<2xi16>) -> vector<2xi16> loc("<stdin>":10:10)
    "func.return"(%0) : (vector<2xi16>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64, Int16], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":2:1)
