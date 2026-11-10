"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "global_double_load"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %2 = "unregistered.dummy"(%0, %1) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%2) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "global_double_store"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "global_store_load"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    %2 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %3 = "unregistered.dummy"(%2) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%3) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "global_store_load_region"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "unregistered.dummy2"() ({
      %4 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32>
      "ml_program.global_store"(%4) <{global = @global_variable}> : (tensor<4xi32>) -> ()
      "unregistered.terminator"() : () -> ()
    }) : () -> ()
    %2 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %3 = "unregistered.dummy"(%2) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%3) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "interrupt"}> ({
    %4 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32>
    "ml_program.global_store"(%4) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "call_global_store"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.call"() <{callee = @interrupt}> : () -> ()
    %2 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %3 = "unregistered.dummy"(%2) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%3) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "interrupt_indirect"}> ({
    %4 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32>
    "ml_program.global_store"(%4) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "interrupt"}> ({
    "func.call"() <{callee = @interrupt_indirect}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "call_indirect_store"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.call"() <{callee = @interrupt}> : () -> ()
    %2 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %3 = "unregistered.dummy"(%2) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%3) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> tensor<4xi32>, sym_name = "interrupt_indirect"}> ({
    %5 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    "func.return"(%5) : (tensor<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "interrupt"}> ({
    %4 = "func.call"() <{callee = @interrupt_indirect}> : () -> tensor<4xi32>
    "unregistered.dummy"(%4) : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "call_indirect_load"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.call"() <{callee = @interrupt}> : () -> ()
    %2 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %3 = "unregistered.dummy"(%2) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%3) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "call_with_unresolvable_callee"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    "test.call_and_store"(%arg0, %arg0) <{callee = @callee, store_before_call = false}> : (memref<f32>, memref<f32>) -> ()
    %1 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "call_recursive"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %1 = "unregistered.dummy"(%0) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%1) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.call"() <{callee = @call_recursive}> : () -> ()
    %2 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32>
    %3 = "unregistered.dummy"(%2) : (tensor<4xi32>) -> tensor<4xi32>
    "ml_program.global_store"(%3) <{global = @global_variable}> : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

