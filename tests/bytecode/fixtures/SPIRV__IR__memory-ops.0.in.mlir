"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "access_chain_struct"}> ({
    %11 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:11)
    %12 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function> loc("<stdin>":4:11)
    %13 = "spirv.AccessChain"(%12, %11, %11) : (!spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>, i32, i32) -> !spirv.ptr<f32, Function> loc("<stdin>":5:11)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_1D_array"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":9:8)):
    %9 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x f32>, Function> loc("<stdin>":10:10)
    %10 = "spirv.AccessChain"(%9, %arg3) : (!spirv.ptr<!spirv.array<4 x f32>, Function>, i32) -> !spirv.ptr<f32, Function> loc("<stdin>":11:11)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_2D_array_1"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":15:8)):
    %6 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function> loc("<stdin>":16:10)
    %7 = "spirv.AccessChain"(%6, %arg2, %arg2) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32) -> !spirv.ptr<f32, Function> loc("<stdin>":17:10)
    %8 = "spirv.Load"(%7) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":18:10)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_2D_array_2"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":22:8)):
    %3 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function> loc("<stdin>":23:10)
    %4 = "spirv.AccessChain"(%3, %arg1) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32) -> !spirv.ptr<!spirv.array<4 x f32>, Function> loc("<stdin>":24:10)
    %5 = "spirv.Load"(%4) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<!spirv.array<4 x f32>, Function>) -> !spirv.array<4 x f32> loc("<stdin>":25:10)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_rtarray"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":29:8)):
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.rtarray<f32>, Function> loc("<stdin>":30:10)
    %1 = "spirv.AccessChain"(%0, %arg0) : (!spirv.ptr<!spirv.rtarray<f32>, Function>, i32) -> !spirv.ptr<f32, Function> loc("<stdin>":31:10)
    %2 = "spirv.Load"(%1) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":32:10)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":1:1)
