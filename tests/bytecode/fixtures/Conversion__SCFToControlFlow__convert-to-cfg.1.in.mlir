"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "simple_std_for_loops_annotation"}> ({
  ^bb0(%arg0: index loc("<stdin>":8:8), %arg1: index loc("<stdin>":8:22), %arg2: index loc("<stdin>":8:36)):
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: index loc("<stdin>":10:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:12)
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":12:12)
      %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":13:12)
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg4: index loc("<stdin>":15:12)):
        %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":16:14)
        "scf.yield"() : () -> () loc("<stdin>":17:9)
      }) {llvm.loop_annotation = #llvm.loop_annotation<unroll = <full = true>>} : (index, index, index) -> () loc("<stdin>":14:7)
      "scf.yield"() : () -> () loc("<stdin>":19:7)
    }) {llvm.loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>} : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":6:1)
