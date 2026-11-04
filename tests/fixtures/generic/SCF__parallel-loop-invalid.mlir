"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "parallel_loop"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    "scf.parallel"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg3: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

