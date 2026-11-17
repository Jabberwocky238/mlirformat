"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, sym_name = "combine_full_access_chain"}> ({
    %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function> loc("<stdin>":4:10)
    %2 = "spirv.AccessChain"(%1, %0) : (!spirv.ptr<!spirv.struct<(!spirv.array<4 x !spirv.array<4 x f32>>, !spirv.array<4 x i32>)>, Function>, i32) -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function> loc("<stdin>":5:10)
    %3 = "spirv.AccessChain"(%2, %0, %0) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32) -> !spirv.ptr<f32, Function> loc("<stdin>":6:10)
    %4 = "spirv.Load"(%3) : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":7:10)
    "spirv.ReturnValue"(%4) : (f32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
