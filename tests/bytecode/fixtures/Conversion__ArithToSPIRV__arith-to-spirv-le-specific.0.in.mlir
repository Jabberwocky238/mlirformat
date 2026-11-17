"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "constant_dense_resource"}> ({
    %0 = "arith.constant"() <{value = dense_resource<dense_resource_test_5xf32> : tensor<5xf32>}> : () -> tensor<5xf32> loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = dense_resource<dense_resource_test_2xi32> : vector<2xi32>}> : () -> vector<2xi32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = dense_resource<dense_resource_test_2x2xf32> : tensor<1x2x2xf32>}> : () -> tensor<1x2x2xf32> loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
