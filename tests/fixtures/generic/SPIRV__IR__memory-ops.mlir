"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "access_chain_struct"}> ({
    %11 = "spirv.Constant"() <{value = 1 : i32}> : () -> i32
    %12 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>
    %13 = "spirv.AccessChain"(%12, %11, %11) : (!spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Function>, i32, i32) -> !spirv.ptr<f32, Function>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_1D_array"}> ({
  ^bb0(%arg3: i32):
    %9 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x f32>, Function>
    %10 = "spirv.AccessChain"(%9, %arg3) : (!spirv.ptr<!spirv.array<4 x f32>, Function>, i32) -> !spirv.ptr<f32, Function>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_2D_array_1"}> ({
  ^bb0(%arg2: i32):
    %6 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %7 = "spirv.AccessChain"(%6, %arg2, %arg2) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32, i32) -> !spirv.ptr<f32, Function>
    %8 = "spirv.Load"(%7) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_2D_array_2"}> ({
  ^bb0(%arg1: i32):
    %3 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>
    %4 = "spirv.AccessChain"(%3, %arg1) : (!spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, Function>, i32) -> !spirv.ptr<!spirv.array<4 x f32>, Function>
    %5 = "spirv.Load"(%4) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<!spirv.array<4 x f32>, Function>) -> !spirv.array<4 x f32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "access_chain_rtarray"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.rtarray<f32>, Function>
    %1 = "spirv.AccessChain"(%0, %arg0) : (!spirv.ptr<!spirv.rtarray<f32>, Function>, i32) -> !spirv.ptr<f32, Function>
    %2 = "spirv.Load"(%1) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_load"}> ({
    %8 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %9 = "spirv.Load"(%8) : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "load_none_access"}> ({
    %6 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %7 = "spirv.Load"(%6) <{memory_access = #spirv.memory_access<None>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "volatile_load"}> ({
    %4 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %5 = "spirv.Load"(%4) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "aligned_load"}> ({
    %2 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %3 = "spirv.Load"(%2) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "volatile_aligned_load"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %1 = "spirv.Load"(%0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Volatile|Aligned>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "load_none_access"}> ({
    %6 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %7 = "spirv.Load"(%6) <{memory_access = #spirv.memory_access<None>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "volatile_load"}> ({
    %4 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %5 = "spirv.Load"(%4) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "aligned_load"}> ({
    %2 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %3 = "spirv.Load"(%2) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "volatile_aligned_load"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %1 = "spirv.Load"(%0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Volatile|Aligned>}> : (!spirv.ptr<f32, Function>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.GlobalVariable"() <{sym_name = "var1", type = !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "simple_load"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @var0}> : () -> !spirv.ptr<f32, Input>
      %1 = "spirv.Load"(%0) : (!spirv.ptr<f32, Input>) -> f32
      %2 = "spirv.mlir.addressof"() <{variable = @var1}> : () -> !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>
      %3 = "spirv.Load"(%2) : (!spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>) -> !spirv.sampled_image<!spirv.image<f32, Dim2D, IsDepth, Arrayed, SingleSampled, NeedSampler, Unknown>>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "image_load"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, Function>
    %1 = "spirv.Load"(%0) : (!spirv.ptr<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>, Function>) -> !spirv.image<f32, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Rgba8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "simple_store"}> ({
  ^bb0(%arg2: f32):
    %2 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    "spirv.Store"(%2, %arg2) : (!spirv.ptr<f32, Function>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "volatile_store"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    "spirv.Store"(%1, %arg1) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "aligned_store"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    "spirv.Store"(%0, %arg0) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "var0", type = !spirv.ptr<f32, Input>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32) -> (), sym_name = "simple_store"}> ({
    ^bb0(%arg0: f32):
      %0 = "spirv.mlir.addressof"() <{variable = @var0}> : () -> !spirv.ptr<f32, Input>
      "spirv.Store"(%0, %arg0) : (!spirv.ptr<f32, Input>, f32) -> ()
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "variable"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "variable_init_normal_constant"}> ({
    %0 = "spirv.Constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %1 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (f32) -> !spirv.ptr<f32, Function>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.GlobalVariable"() <{sym_name = "global", type = !spirv.ptr<f32, Workgroup>}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_init_global_variable"}> ({
      %0 = "spirv.mlir.addressof"() <{variable = @global}> : () -> !spirv.ptr<f32, Workgroup>
      %1 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (!spirv.ptr<f32, Workgroup>) -> !spirv.ptr<!spirv.ptr<f32, Workgroup>, Function>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.SpecConstant"() <{default_value = 42 : i32, sym_name = "sc"}> : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "variable_init_spec_constant"}> ({
      %0 = "spirv.mlir.referenceof"() <{spec_const = @sc}> : () -> i32
      %1 = "spirv.Variable"(%0) <{storage_class = #spirv.storage_class<Function>}> : (i32) -> !spirv.ptr<i32, Function>
      "spirv.Return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "variable_ptr_physical_buffer"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> {aliased_pointer} : () -> !spirv.ptr<!spirv.ptr<f32, PhysicalStorageBuffer>, Function>
    %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> {restrict_pointer} : () -> !spirv.ptr<!spirv.ptr<f32, PhysicalStorageBuffer>, Function>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "variable_ptr_array_physical_buffer"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> {aliased_pointer} : () -> !spirv.ptr<!spirv.array<4 x !spirv.ptr<f32, PhysicalStorageBuffer>>, Function>
    %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> {restrict_pointer} : () -> !spirv.ptr<!spirv.array<4 x !spirv.ptr<f32, PhysicalStorageBuffer>>, Function>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "copy_memory_print_maa"}> ({
    %0 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    %1 = "spirv.Variable"() <{storage_class = #spirv.storage_class<Function>}> : () -> !spirv.ptr<f32, Function>
    "spirv.CopyMemory"(%0, %1) <{memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
    "spirv.CopyMemory"(%0, %1) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
    "spirv.CopyMemory"(%0, %1) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>, source_memory_access = #spirv.memory_access<Volatile>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
    "spirv.CopyMemory"(%0, %1) <{alignment = 4 : i32, memory_access = #spirv.memory_access<Aligned>, source_alignment = 8 : i32, source_memory_access = #spirv.memory_access<Aligned>}> : (!spirv.ptr<f32, Function>, !spirv.ptr<f32, Function>) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<f32, CrossWorkgroup>, i64) -> (), sym_name = "ptr_access_chain1"}> ({
  ^bb0(%arg0: !spirv.ptr<f32, CrossWorkgroup>, %arg1: i64):
    %0 = "spirv.PtrAccessChain"(%arg0, %arg1) : (!spirv.ptr<f32, CrossWorkgroup>, i64) -> !spirv.ptr<f32, CrossWorkgroup>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<f32, CrossWorkgroup>, i64) -> (), sym_name = "inbounds_ptr_access_chain1"}> ({
  ^bb0(%arg0: !spirv.ptr<f32, CrossWorkgroup>, %arg1: i64):
    %0 = "spirv.InBoundsPtrAccessChain"(%arg0, %arg1) : (!spirv.ptr<f32, CrossWorkgroup>, i64) -> !spirv.ptr<f32, CrossWorkgroup>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

