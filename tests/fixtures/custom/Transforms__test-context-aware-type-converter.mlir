module {
  func.func @simple_context_aware_conversion_1() attributes {increment = 1 : i64} {
    %0 = "test.context_op"() : () -> i37
    "test.replace_with_legal_op"(%0) : (i37) -> ()
    return
  }
  func.func @simple_context_aware_conversion_2() attributes {increment = 2 : i64} {
    %0 = "test.context_op"() : () -> i37
    "test.replace_with_legal_op"(%0) : (i37) -> ()
    return
  }
}

// -----
module {
  func.func @convert_block_arguments(%arg0: index, %arg1: index, %arg2: index) attributes {increment = 1 : i64} {
    %0 = "test.context_op"() : () -> i37
    %1 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %0) -> (i37) {
      scf.yield %arg4 : i37
    }
    return
  }
}

