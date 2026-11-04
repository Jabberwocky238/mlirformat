"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "parallel"}> ({
  ^bb0(%arg16: index, %arg17: index, %arg18: index, %arg19: index, %arg20: index, %arg21: index):
    "scf.parallel"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg22: index, %arg23: index):
      "test.payload"(%arg22, %arg23) : (index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "nested_loops"}> ({
  ^bb0(%arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
    "scf.parallel"(%arg8, %arg10, %arg12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg14: index):
      "scf.parallel"(%arg9, %arg11, %arg13) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
      ^bb0(%arg15: index):
        "test.payload"(%arg14, %arg15) : (index, index) -> ()
        "scf.reduce"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "adjacent_loops"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    "scf.parallel"(%arg0, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg7: index):
      "test.payload1"(%arg7) : (index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.parallel"(%arg1, %arg3, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg6: index):
      "test.payload2"(%arg6) : (index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

