"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<2xf16>) -> (vector<4xf16>, vector<1xf32>), sym_name = "bitcast"}> ({
  ^bb0(%arg0: vector<2xf32> loc("<stdin>":3:8), %arg1: vector<2xf16> loc("<stdin>":3:30)):
    %0 = "vector.bitcast"(%arg0) : (vector<2xf32>) -> vector<4xf16> loc("<stdin>":4:10)
    %1 = "vector.bitcast"(%arg1) : (vector<2xf16>) -> vector<1xf32> loc("<stdin>":5:10)
    "func.return"(%0, %1) : (vector<4xf16>, vector<1xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float16], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
