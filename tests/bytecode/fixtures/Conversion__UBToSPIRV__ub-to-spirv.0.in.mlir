"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "check_poison"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> index loc("<stdin>":3:10)
    %1 = "ub.poison"() <{value = #ub.poison}> : () -> i16 loc("<stdin>":4:10)
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> f64 loc("<stdin>":5:10)
    %3 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4xf32> loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Shader], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
