"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_and"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32):
    %0 = "spirv.AtomicAnd"(%arg0, %arg1) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "atomic_compare_exchange"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32):
    %0 = "spirv.AtomicCompareExchange"(%arg0, %arg1, %arg2) <{equal_semantics = #spirv.memory_semantics<Release>, memory_scope = #spirv.scope<Workgroup>, unequal_semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "atomic_compare_exchange_weak"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32):
    %0 = "spirv.AtomicCompareExchangeWeak"(%arg0, %arg1, %arg2) <{equal_semantics = #spirv.memory_semantics<Release>, memory_scope = #spirv.scope<Workgroup>, unequal_semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32) -> i32, sym_name = "atomic_exchange"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32):
    %0 = "spirv.AtomicExchange"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_iadd"}> ({
  ^bb0(%arg4: !spirv.ptr<i32, StorageBuffer>, %arg5: i32):
    %3 = "spirv.AtomicIAdd"(%arg4, %arg5) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>) -> i32, sym_name = "atomic_idecrement"}> ({
  ^bb0(%arg3: !spirv.ptr<i32, StorageBuffer>):
    %2 = "spirv.AtomicIDecrement"(%arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>) -> i32, sym_name = "atomic_iincrement"}> ({
  ^bb0(%arg2: !spirv.ptr<i32, StorageBuffer>):
    %1 = "spirv.AtomicIIncrement"(%arg2) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_isub"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32):
    %0 = "spirv.AtomicISub"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>) -> i32, sym_name = "atomic_load"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, Workgroup>):
    %0 = "spirv.AtomicLoad"(%arg0) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<f32, StorageBuffer>) -> f32, sym_name = "atomic_load_float"}> ({
  ^bb0(%arg0: !spirv.ptr<f32, StorageBuffer>):
    %0 = "spirv.AtomicLoad"(%arg0) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<f32, StorageBuffer>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_or"}> ({
  ^bb0(%arg4: !spirv.ptr<i32, StorageBuffer>, %arg5: i32):
    %2 = "spirv.AtomicOr"(%arg4, %arg5) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_smax"}> ({
  ^bb0(%arg2: !spirv.ptr<i32, StorageBuffer>, %arg3: i32):
    %1 = "spirv.AtomicSMax"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_smin"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32):
    %0 = "spirv.AtomicSMin"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, Workgroup>, i32) -> (), sym_name = "atomic_store"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32):
    "spirv.AtomicStore"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<f32, StorageBuffer>, f32) -> (), sym_name = "atomic_store_float"}> ({
  ^bb0(%arg0: !spirv.ptr<f32, StorageBuffer>, %arg1: f32):
    "spirv.AtomicStore"(%arg0, %arg1) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<f32, StorageBuffer>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_umax"}> ({
  ^bb0(%arg4: !spirv.ptr<i32, StorageBuffer>, %arg5: i32):
    %2 = "spirv.AtomicUMax"(%arg4, %arg5) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_umin"}> ({
  ^bb0(%arg2: !spirv.ptr<i32, StorageBuffer>, %arg3: i32):
    %1 = "spirv.AtomicUMin"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_xor"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32):
    %0 = "spirv.AtomicXor"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<f32, StorageBuffer>, f32) -> f32, sym_name = "atomic_fadd"}> ({
  ^bb0(%arg0: !spirv.ptr<f32, StorageBuffer>, %arg1: f32):
    %0 = "spirv.EXT.AtomicFAdd"(%arg0, %arg1) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<f32, StorageBuffer>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
