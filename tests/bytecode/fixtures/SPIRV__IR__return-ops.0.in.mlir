"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "preserve_return_value"}> ({
  ^bb0(%arg0: vector<2xi32> loc("<stdin>":3:8), %arg1: vector<2xi32> loc("<stdin>":3:30)):
    %0 = "spirv.Bitcast"(%arg0) : (vector<2xi32>) -> vector<2xf32> loc("<stdin>":4:10)
    %1 = "spirv.Bitcast"(%arg1) : (vector<2xi32>) -> vector<2xf32> loc("<stdin>":5:10)
    %2 = "spirv.Bitcast"(%1) : (vector<2xf32>) -> vector<2xi32> loc("<stdin>":6:10)
    "spirv.ReturnValue"(%2) : (vector<2xi32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
