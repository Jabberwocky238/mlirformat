"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "two_iters"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "func.call"(%arg6, %arg7) <{callee = @callee}> : (index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "repeated"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg8: index, %arg9: index):
      "func.call"(%arg8, %arg9) <{callee = @callee}> : (index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "func.call"(%arg6, %arg7) <{callee = @callee}> : (index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index, index, index, index, index, index, index) -> (), sym_name = "nested"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    "scf.parallel"(%arg0, %arg1, %arg4, %arg5, %arg8, %arg9) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg12: index, %arg13: index):
      "scf.parallel"(%arg2, %arg3, %arg6, %arg7, %arg10, %arg11) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg14: index, %arg15: index):
        "func.call"(%arg12, %arg13, %arg14, %arg15) <{callee = @callee}> : (index, index, index, index) -> ()
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i32, sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index) -> i32, sym_name = "two_iters_with_reduce"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %0) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %2 = "func.call"(%arg6, %arg7) <{callee = @callee}> : (index, index) -> i32
      "scf.reduce"(%2) ({
      ^bb0(%arg8: i32, %arg9: i32):
        %3 = "arith.addi"(%arg8, %arg9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.reduce.return"(%3) : (i32) -> ()
      }) : (i32) -> ()
    }) : (index, index, index, index, index, index, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

