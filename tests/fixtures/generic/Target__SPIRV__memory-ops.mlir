"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Input>, !spirv.ptr<f32, Output>) -> (), sym_name = "load_store"}> ({
    ^bb0(%arg2: !spirv.ptr<f32, Input>, %arg3: !spirv.ptr<f32, Output>):
      %1 = "spirv.Load"(%arg2) : (!spirv.ptr<f32, Input>) -> f32
      "spirv.Store"(%arg3, %1) : (!spirv.ptr<f32, Output>, f32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Input>, !spirv.ptr<f32, Output>) -> (), sym_name = "load_store_memory_operands"}> ({
    ^bb0(%arg0: !spirv.ptr<f32, Input>, %arg1: !spirv.ptr<f32, Output>):
      %0 = "spirv.Load"(%arg0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Volatile|Aligned>}> : (!spirv.ptr<f32, Input>) -> f32
      "spirv.Store"(%arg1, %0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Volatile|Aligned>}> : (!spirv.ptr<f32, Output>, f32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32) -> (), sym_name = "access_chain"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, %arg1: i32, %arg2: i32):
      %0 = "spirv.AccessChain"(%arg0, %arg1) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32) -> !spirv.ptr<!spirv.array<4 x f32>, Function>
      %1 = "spirv.AccessChain"(%arg0, %arg1, %arg2) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32) -> !spirv.ptr<f32, Function>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_storage_buffer_storage_class]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>) -> (), sym_name = "load_store_zero_rank_float"}> ({
    ^bb0(%arg2: !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, %arg3: !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>):
      %5 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %6 = "spirv.AccessChain"(%arg2, %5, %5) : (!spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, i32, i32) -> !spirv.ptr<f32, StorageBuffer>
      %7 = "spirv.Load"(%6) : (!spirv.ptr<f32, StorageBuffer>) -> f32
      %8 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %9 = "spirv.AccessChain"(%arg3, %8, %8) : (!spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0]), Block>, StorageBuffer>, i32, i32) -> !spirv.ptr<f32, StorageBuffer>
      "spirv.Store"(%9, %7) : (!spirv.ptr<f32, StorageBuffer>, f32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>) -> (), sym_name = "load_store_zero_rank_int"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>):
      %0 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %1 = "spirv.AccessChain"(%arg0, %0, %0) : (!spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, i32, i32) -> !spirv.ptr<i32, StorageBuffer>
      %2 = "spirv.Load"(%1) : (!spirv.ptr<i32, StorageBuffer>) -> i32
      %3 = "spirv.Constant"() <{value = 0 : i32}> : () -> i32
      %4 = "spirv.AccessChain"(%arg1, %3, %3) : (!spirv.ptr<!spirv.struct<(!spirv.array<1 x i32, stride=4> [0]), Block>, StorageBuffer>, i32, i32) -> !spirv.ptr<i32, StorageBuffer>
      "spirv.Store"(%4, %2) : (!spirv.ptr<i32, StorageBuffer>, i32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "copy_memory_simple"}> ({
      %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
      %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
      "spirv.CopyMemory"(%0, %1) : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.array<4 x f32>, Input>, !spirv.ptr<!spirv.array<4 x f32>, Output>) -> (), sym_name = "copy_memory_different_storage_classes"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.array<4 x f32>, Input>, %arg1: !spirv.ptr<!spirv.array<4 x f32>, Output>):
      "spirv.CopyMemory"(%arg1, %arg0) : (!spirv.ptr<!spirv.array<4 x f32>, Output>, !spirv.ptr<!spirv.array<4 x f32>, Input>) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.4, [Shader, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "copy_memory_with_access_operands"}> ({
      %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
      %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
      "spirv.CopyMemory"(%0, %1) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.CopyMemory"(%0, %1) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.CopyMemory"(%0, %1) <{memory_access = #spirv.memory_access<Volatile>, source_memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.CopyMemory"(%0, %1) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>, source_memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.CopyMemory"(%0, %1) <{memory_access = #spirv.memory_access<Volatile>, source_alignment = 4 : i32, source_memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.CopyMemory"(%0, %1) <{alignment = 8 : i32, memory_access = #spirv.memory_access<Aligned>, source_alignment = 4 : i32, source_memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

