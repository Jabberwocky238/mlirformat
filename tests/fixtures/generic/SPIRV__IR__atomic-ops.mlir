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
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_iadd"}> ({
  ^bb0(%arg16: !spirv.ptr<i32, StorageBuffer>, %arg17: i32):
    %9 = "spirv.AtomicIAdd"(%arg16, %arg17) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%9) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>) -> i32, sym_name = "atomic_idecrement"}> ({
  ^bb0(%arg15: !spirv.ptr<i32, StorageBuffer>):
    %8 = "spirv.AtomicIDecrement"(%arg15) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>) -> i32, sym_name = "atomic_iincrement"}> ({
  ^bb0(%arg14: !spirv.ptr<i32, StorageBuffer>):
    %7 = "spirv.AtomicIIncrement"(%arg14) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_isub"}> ({
  ^bb0(%arg12: !spirv.ptr<i32, StorageBuffer>, %arg13: i32):
    %6 = "spirv.AtomicISub"(%arg12, %arg13) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%6) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_or"}> ({
  ^bb0(%arg10: !spirv.ptr<i32, StorageBuffer>, %arg11: i32):
    %5 = "spirv.AtomicOr"(%arg10, %arg11) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_smax"}> ({
  ^bb0(%arg8: !spirv.ptr<i32, StorageBuffer>, %arg9: i32):
    %4 = "spirv.AtomicSMax"(%arg8, %arg9) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_smin"}> ({
  ^bb0(%arg6: !spirv.ptr<i32, StorageBuffer>, %arg7: i32):
    %3 = "spirv.AtomicSMin"(%arg6, %arg7) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
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
