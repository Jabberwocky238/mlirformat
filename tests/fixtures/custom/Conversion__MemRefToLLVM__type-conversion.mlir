module {
  func.func @construct_ranked_memref_descriptor(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) attributes {is_legal} {
    %0 = "test.direct_replacement"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> memref<5x4xf32>
    "test.legal_op"(%0) : (memref<5x4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @invalid_ranked_memref_descriptor(%arg0: i1) attributes {is_legal} {
    %0 = "test.direct_replacement"(%arg0) : (i1) -> memref<5x4xf32>
    "test.legal_op"(%0) : (memref<5x4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @construct_unranked_memref_descriptor(%arg0: i64, %arg1: !llvm.ptr) attributes {is_legal} {
    %0 = "test.direct_replacement"(%arg0, %arg1) : (i64, !llvm.ptr) -> memref<*xf32>
    "test.legal_op"(%0) : (memref<*xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @invalid_unranked_memref_descriptor(%arg0: i1) attributes {is_legal} {
    %0 = "test.direct_replacement"(%arg0) : (i1) -> memref<*xf32>
    "test.legal_op"(%0) : (memref<*xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @simple_func_conversion(%arg0: i64) -> i64 {
    return %arg0 : i64
  }
}

// -----
module {
  func.func @one_to_n_argument_conversion(%arg0: i17) {
    "test.legal_op"(%arg0) : (i17) -> ()
    return
  }
  func.func @caller(%arg0: i17) {
    call @one_to_n_argument_conversion(%arg0) : (i17) -> ()
    return
  }
}

// -----
module {
  func.func @one_to_n_return_conversion(%arg0: i17) -> i17 {
    return %arg0 : i17
  }
  func.func @caller(%arg0: i17) -> i17 {
    %0 = call @one_to_n_return_conversion(%arg0) : (i17) -> i17
    return %0 : i17
  }
}

// -----
module {
  func.func @multi_return(%arg0: i17, %arg1: i1) -> (i17, i1) {
    return %arg0, %arg1 : i17, i1
  }
  func.func @caller(%arg0: i1, %arg1: i17) -> (i17, i1, i17) {
    %0:2 = call @multi_return(%arg1, %arg0) : (i17, i1) -> (i17, i1)
    return %0#0, %0#1, %0#0 : i17, i1, i17
  }
}

// -----
module {
  func.func @branch(%arg0: i1, %arg1: i17) {
    cf.br ^bb1(%arg1, %arg0 : i17, i1)
  ^bb1(%0: i17, %1: i1):  // 2 preds: ^bb0, ^bb1
    cf.cond_br %1, ^bb1(%arg1, %1 : i17, i1), ^bb2(%0 : i17)
  ^bb2(%2: i17):  // pred: ^bb1
    return
  }
}

