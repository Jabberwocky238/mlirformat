"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> i1, sym_name = "cmpf_ordered"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":3:8), %arg3: f32 loc("<stdin>":3:20)):
    %1 = "arith.cmpf"(%arg2, %arg3) <{fastmath = #arith.fastmath<fast>, predicate = 7 : i64}> : (f32, f32) -> i1 loc("<stdin>":4:10)
    "func.return"(%1) : (i1) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> vector<4xi1>, sym_name = "cmpf_unordered"}> ({
  ^bb0(%arg0: vector<4xf32> loc("<stdin>":8:8), %arg1: vector<4xf32> loc("<stdin>":8:30)):
    %0 = "arith.cmpf"(%arg0, %arg1) <{fastmath = #arith.fastmath<nnan>, predicate = 14 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xi1> loc("<stdin>":9:10)
    "func.return"(%0) : (vector<4xi1>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
