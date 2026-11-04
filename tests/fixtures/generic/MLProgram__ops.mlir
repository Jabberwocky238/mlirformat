#extern = #ml_program.extern : tensor<4xi32>
"builtin.module"() ({
  "ml_program.func"() <{function_type = (i32) -> i32, sym_name = "extern_func", sym_visibility = "private"}> ({
  }) : () -> ()
  "ml_program.func"() <{function_type = (i32) -> i32, sym_name = "defined_func"}> ({
  ^bb0(%arg1: i32):
    "ml_program.return"(%arg1) : (i32) -> ()
  }) : () -> ()
  "ml_program.subgraph"() <{function_type = (i32) -> i32, sym_name = "extern_subgraph", sym_visibility = "private"}> ({
  }) : () -> ()
  "ml_program.subgraph"() <{function_type = (i32) -> i32, sym_name = "compute_subgraph"}> ({
  ^bb0(%arg0: i32):
    %6 = "ml_program.token"() : () -> !ml_program.token
    %7 = "unregistered.dummy"(%8, %6) : (i32, !ml_program.token) -> i32
    %8 = "unregistered.dummy"(%arg0) : (i32) -> i32
    "ml_program.output"(%8) : (i32) -> ()
  }) : () -> ()
  "ml_program.global"() <{sym_name = "global_same_type", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "ml_program.global"() <{is_mutable, sym_name = "global_mutable_undef", sym_visibility = "private", type = tensor<?xi32>}> : () -> ()
  "ml_program.global"() <{is_mutable, sym_name = "global_extern", sym_visibility = "private", type = tensor<?xi32>, value = #extern}> : () -> ()
  "ml_program.func"() <{function_type = () -> tensor<4xi32>, sym_name = "global_load_const"}> ({
    %5 = "ml_program.global_load_const"() <{global = @global_same_type}> : () -> tensor<4xi32>
    "ml_program.return"(%5) : (tensor<4xi32>) -> ()
  }) : () -> ()
  "ml_program.func"() <{function_type = () -> (), sym_name = "global_load_store"}> ({
    %4 = "ml_program.global_load"() <{global = @global_mutable_undef}> : () -> tensor<?xi32>
    "ml_program.global_store"(%4) <{global = @global_mutable_undef}> : (tensor<?xi32>) -> ()
    "ml_program.return"() : () -> ()
  }) : () -> ()
  "ml_program.subgraph"() <{function_type = () -> (tensor<?xi32>, !ml_program.token), sym_name = "global_load_store_tokens"}> ({
    %0 = "ml_program.token"() : () -> !ml_program.token
    %1:2 = "ml_program.global_load_graph"() <{global = @global_mutable_undef}> : () -> (tensor<?xi32>, !ml_program.token)
    %2 = "ml_program.global_store_graph"(%1#0, %0, %1#1) <{global = @global_mutable_undef}> : (tensor<?xi32>, !ml_program.token, !ml_program.token) -> !ml_program.token
    %3 = "ml_program.global_store_graph"(%1#0, %2) <{global = @global_mutable_undef}> : (tensor<?xi32>, !ml_program.token) -> !ml_program.token
    "ml_program.output"(%1#0, %2) : (tensor<?xi32>, !ml_program.token) -> ()
  }) : () -> ()
}) : () -> ()

