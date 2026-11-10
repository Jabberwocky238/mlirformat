"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "barrier_default"}> ({
    "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "barrier_with_scope"}> ({
    "gpu.barrier"() <{scope = #gpu.barrier_scope<subgroup>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "barrier_workgroup_scope_not_printed"}> ({
    "gpu.barrier"() <{scope = #gpu.barrier_scope<workgroup>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "barrier_memfence_and_scope"}> ({
    "gpu.barrier"() <{address_spaces = [#gpu.address_space<workgroup>], scope = #gpu.barrier_scope<subgroup>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "initialize_named_barrier"}> ({
  ^bb0(%arg0: i32):
    %0 = "gpu.initialize_named_barrier"(%arg0) : (i32) -> !gpu.named_barrier
    "gpu.barrier"(%0) <{scope = #gpu.barrier_scope<workgroup>}> : (!gpu.named_barrier) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "named_barrier_with_memfence"}> ({
  ^bb0(%arg0: i32):
    %0 = "gpu.initialize_named_barrier"(%arg0) : (i32) -> !gpu.named_barrier
    "gpu.barrier"(%0) <{address_spaces = [#gpu.address_space<workgroup>], scope = #gpu.barrier_scope<workgroup>}> : (!gpu.named_barrier) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
