"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "access_chain"}> ({
    %31 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:11)
    %32 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function> loc("<stdin>":4:11)
    %33 = "spirv.AccessChain"(%32, %31, %31) : (!spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>, i32, i32) -> !spirv.ptr<f32, Function> loc("<stdin>":5:11)
    "spirv.Return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "access_chain_array"}> ({
  ^bb0(%arg5: i32 loc("<stdin>":9:8)):
    %28 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function> loc("<stdin>":10:11)
    %29 = "spirv.AccessChain"(%28, %arg5) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32) -> !spirv.ptr<!spirv.array<4 x f32>, Function> loc("<stdin>":11:11)
    %30 = "spirv.Load"(%29) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<!spirv.array<4 x f32>, Function>) -> !spirv.array<4 x f32> loc("<stdin>":12:11)
    "spirv.Return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":8:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var", type = !spirv.ptr<f32, Input>}> : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":15:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "struct", type = !spirv.ptr<!spirv.struct<(f32, !spirv.array<10 x f32>)>, Private>}> : () -> () loc("<stdin>":19:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "func"}> ({
      %27 = "spirv.mlir.addressof"() <{variable = @struct}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<10 x f32>)>, Private> loc("<stdin>":21:13)
      "spirv.Return"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "bar", type = !spirv.ptr<i32, StorageBuffer>}> : () -> () loc("<stdin>":26:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %26 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<i32, StorageBuffer> loc("<stdin>":28:13)
      "spirv.Return"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":25:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, sym_name = "name"}> ({
    "spirv.GlobalVariable"() <{binding = 0 : i32, descriptor_set = 0 : i32, sym_name = "bar", type = !spirv.ptr<i32, StorageBuffer>}> : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %25 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<i32, StorageBuffer> loc("<stdin>":35:13)
      "spirv.Return"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":32:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{location = 1 : i32, sym_name = "bar", type = !spirv.ptr<i32, Output>}> : () -> () loc("<stdin>":40:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %24 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<i32, Output> loc("<stdin>":42:13)
      "spirv.Return"() : () -> () loc("<stdin>":43:7)
    }) : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":39:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{descriptor_set = 0 : i32, location = 3 : i32, sym_name = "bar", type = !spirv.ptr<f32, UniformConstant>}> : () -> () loc("<stdin>":47:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "foo"}> ({
      %23 = "spirv.mlir.addressof"() <{variable = @bar}> : () -> !spirv.ptr<f32, UniformConstant> loc("<stdin>":49:13)
      "spirv.Return"() : () -> () loc("<stdin>":50:7)
    }) : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":46:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "load"}> ({
    %21 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":54:11)
    %22 = "spirv.Load"(%21) : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":55:11)
    "spirv.Return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":53:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "load_none"}> ({
    %19 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":59:11)
    %20 = "spirv.Load"(%19) <{memory_access = #spirv.memory_access<None>}> : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":60:11)
    "spirv.Return"() : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":58:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "load_with_alignment"}> ({
    %17 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":64:11)
    %18 = "spirv.Load"(%17) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":65:11)
    "spirv.Return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":63:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "load_volatile"}> ({
    %15 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":69:11)
    %16 = "spirv.Load"(%15) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":70:11)
    "spirv.Return"() : () -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":68:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "load_nontemporal"}> ({
    %13 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":74:11)
    %14 = "spirv.Load"(%13) <{memory_access = #spirv.memory_access<Nontemporal>}> : (!spirv.ptr<f32, Function>) -> f32 loc("<stdin>":75:11)
    "spirv.Return"() : () -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":73:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "store"}> ({
  ^bb0(%arg4: f32 loc("<stdin>":79:8)):
    %12 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":80:11)
    "spirv.Store"(%12, %arg4) : (!spirv.ptr<f32, Function>, f32) -> () loc("<stdin>":81:5)
    "spirv.Return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":78:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.struct<(f64)>) -> (), sym_name = "store_composite"}> ({
  ^bb0(%arg3: !spirv.struct<(f64)> loc("<stdin>":85:8)):
    %11 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.struct<(f64)>, Function> loc("<stdin>":86:11)
    "spirv.Store"(%11, %arg3) : (!spirv.ptr<!spirv.struct<(f64)>, Function>, !spirv.struct<(f64)>) -> () loc("<stdin>":87:5)
    "spirv.Return"() : () -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":84:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "store_with_alignment"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":91:8)):
    %10 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":92:11)
    "spirv.Store"(%10, %arg2) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, f32) -> () loc("<stdin>":93:5)
    "spirv.Return"() : () -> () loc("<stdin>":94:5)
  }) : () -> () loc("<stdin>":90:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "store_volatile"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":97:8)):
    %9 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":98:10)
    "spirv.Store"(%9, %arg1) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, f32) -> () loc("<stdin>":99:5)
    "spirv.Return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":96:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "store_nontemporal"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":103:8)):
    %8 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":104:10)
    "spirv.Store"(%8, %arg0) <{memory_access = #spirv.memory_access<Nontemporal>}> : (!spirv.ptr<f32, Function>, f32) -> () loc("<stdin>":105:5)
    "spirv.Return"() : () -> () loc("<stdin>":106:5)
  }) : () -> () loc("<stdin>":102:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_scalar"}> ({
    %6 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function> loc("<stdin>":109:10)
    %7 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<i8, Function> loc("<stdin>":110:10)
    "spirv.Return"() : () -> () loc("<stdin>":111:5)
  }) : () -> () loc("<stdin>":108:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_scalar_with_initialization"}> ({
    %4 = "spirv.Constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":114:10)
    %5 = "spirv.Variable"(%4) <{storage_class = #spirv.storage_class<Function>}> : (i64) -> !spirv.ptr<i64, Function> loc("<stdin>":115:10)
    "spirv.Return"() : () -> () loc("<stdin>":116:5)
  }) : () -> () loc("<stdin>":113:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_vector"}> ({
    %3 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<vector<3xf32>, Function> loc("<stdin>":119:10)
    "spirv.Return"() : () -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":118:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_vector_with_initialization"}> ({
    %1 = "spirv.Constant"() <{value = dense<false> : vector<3xi1>}> : () -> vector<3xi1> loc("<stdin>":123:10)
    %2 = "spirv.Variable"(%1) <{storage_class = #spirv.storage_class<Function>}> : (vector<3xi1>) -> !spirv.ptr<vector<3xi1>, Function> loc("<stdin>":124:10)
    "spirv.Return"() : () -> () loc("<stdin>":125:5)
  }) : () -> () loc("<stdin>":122:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_array"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<10 x i32>, Function> loc("<stdin>":128:10)
    "spirv.Return"() : () -> () loc("<stdin>":129:5)
  }) : () -> () loc("<stdin>":127:3)
}) : () -> () loc("<stdin>":1:1)
