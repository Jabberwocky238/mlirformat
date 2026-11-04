"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> (), sym_name = "construct_ranked_memref_descriptor"}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64):
    %0 = "test.direct_replacement"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> memref<5x4xf32>
    "test.legal_op"(%0) : (memref<5x4xf32>) -> ()
    "func.return"() : () -> ()
  }) {is_legal} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "invalid_ranked_memref_descriptor"}> ({
  ^bb0(%arg0: i1):
    %0 = "test.direct_replacement"(%arg0) : (i1) -> memref<5x4xf32>
    "test.legal_op"(%0) : (memref<5x4xf32>) -> ()
    "func.return"() : () -> ()
  }) {is_legal} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64, !llvm.ptr) -> (), sym_name = "construct_unranked_memref_descriptor"}> ({
  ^bb0(%arg0: i64, %arg1: !llvm.ptr):
    %0 = "test.direct_replacement"(%arg0, %arg1) : (i64, !llvm.ptr) -> memref<*xf32>
    "test.legal_op"(%0) : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) {is_legal} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "invalid_unranked_memref_descriptor"}> ({
  ^bb0(%arg0: i1):
    %0 = "test.direct_replacement"(%arg0) : (i1) -> memref<*xf32>
    "test.legal_op"(%0) : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) {is_legal} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> i64, sym_name = "simple_func_conversion"}> ({
  ^bb0(%arg0: i64):
    "func.return"(%arg0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i17) -> (), sym_name = "one_to_n_argument_conversion"}> ({
  ^bb0(%arg1: i17):
    "test.legal_op"(%arg1) : (i17) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i17) -> (), sym_name = "caller"}> ({
  ^bb0(%arg0: i17):
    "func.call"(%arg0) <{callee = @one_to_n_argument_conversion}> : (i17) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i17) -> i17, sym_name = "one_to_n_return_conversion"}> ({
  ^bb0(%arg1: i17):
    "func.return"(%arg1) : (i17) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i17) -> i17, sym_name = "caller"}> ({
  ^bb0(%arg0: i17):
    %0 = "func.call"(%arg0) <{callee = @one_to_n_return_conversion}> : (i17) -> i17
    "func.return"(%0) : (i17) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i17, i1) -> (i17, i1), sym_name = "multi_return"}> ({
  ^bb0(%arg2: i17, %arg3: i1):
    "func.return"(%arg2, %arg3) : (i17, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i17) -> (i17, i1, i17), sym_name = "caller"}> ({
  ^bb0(%arg0: i1, %arg1: i17):
    %0:2 = "func.call"(%arg1, %arg0) <{callee = @multi_return}> : (i17, i1) -> (i17, i1)
    "func.return"(%0#0, %0#1, %0#0) : (i17, i1, i17) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i17) -> (), sym_name = "branch"}> ({
  ^bb0(%arg0: i1, %arg1: i17):
    "cf.br"(%arg1, %arg0)[^bb1] : (i17, i1) -> ()
  ^bb1(%0: i17, %1: i1):  // 2 preds: ^bb0, ^bb1
    "cf.cond_br"(%1, %arg1, %1, %0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 2, 1>}> : (i1, i17, i1, i17) -> ()
  ^bb2(%2: i17):  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

