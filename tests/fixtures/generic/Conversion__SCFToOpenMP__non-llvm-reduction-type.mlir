"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index), sym_name = "no_crash_index_reduction"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index
    %4:2 = "scf.parallel"(%0, %2, %1, %3, %0, %2, %arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 2, 2, 2>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.reduce"(%arg2, %arg3) ({
      ^bb0(%arg6: index, %arg7: index):
        %6 = "arith.addi"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.reduce.return"(%6) : (index) -> ()
      }, {
      ^bb0(%arg4: index, %arg5: index):
        %5 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.reduce.return"(%5) : (index) -> ()
      }) : (index, index) -> ()
    }) : (index, index, index, index, index, index, index, index) -> (index, index)
    "func.return"(%4#0, %4#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

