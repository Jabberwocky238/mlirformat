#extern = #ml_program.extern : tensor<4xi32>
module {
  ml_program.func private @extern_func(i32) -> i32
  ml_program.func @defined_func(%arg0: i32) -> i32 {
    ml_program.return %arg0 : i32
  }
  ml_program.subgraph private @extern_subgraph(i32) -> i32
  ml_program.subgraph @compute_subgraph(%arg0: i32) -> i32 {
    %0 = ml_program.token
    %1 = "unregistered.dummy"(%2, %0) : (i32, !ml_program.token) -> i32
    %2 = "unregistered.dummy"(%arg0) : (i32) -> i32
    ml_program.output %2 : i32
  }
  ml_program.global private @global_same_type(dense<4> : tensor<4xi32>) : tensor<4xi32>
  ml_program.global private mutable @global_mutable_undef : tensor<?xi32>
  ml_program.global private mutable @global_extern(#extern) : tensor<?xi32>
  ml_program.func @global_load_const() -> tensor<4xi32> {
    %global_same_type = ml_program.global_load_const @global_same_type : tensor<4xi32>
    ml_program.return %global_same_type : tensor<4xi32>
  }
  ml_program.func @global_load_store() {
    %global_mutable_undef = ml_program.global_load @global_mutable_undef : tensor<?xi32>
    ml_program.global_store @global_mutable_undef = %global_mutable_undef : tensor<?xi32>
    ml_program.return
  }
  ml_program.subgraph @global_load_store_tokens() -> (tensor<?xi32>, !ml_program.token) {
    %0 = ml_program.token
    %result, %produceToken = ml_program.global_load_graph @global_mutable_undef ordering(() -> !ml_program.token) : tensor<?xi32>
    %1 = ml_program.global_store_graph @global_mutable_undef = %result ordering(%0, %produceToken -> !ml_program.token) : tensor<?xi32>
    %2 = ml_program.global_store_graph @global_mutable_undef = %result ordering(%1 -> !ml_program.token) : tensor<?xi32>
    ml_program.output %result, %1 : tensor<?xi32>, !ml_program.token
  }
}

