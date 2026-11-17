"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "warp_scf_for_yield_loop_carried_arg"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %3 = "scf.for"(%0, %1, %1, %0) ({
      ^bb0(%arg1: index loc("<stdin>":8:12), %arg2: index loc("<stdin>":8:26)):
        "scf.yield"(%arg2) : (index) -> () loc("<stdin>":9:9)
      }) : (index, index, index, index) -> index loc("<stdin>":7:12)
      "gpu.yield"(%3) : (index) -> () loc("<stdin>":11:7)
    }) : (index) -> index loc("<stdin>":6:10)
    "func.return"(%2) : (index) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
