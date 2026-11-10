"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "warp_scf_for_yield_loop_carried_arg"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %3 = "scf.for"(%0, %1, %1, %0) ({
      ^bb0(%arg1: index, %arg2: index):
        "scf.yield"(%arg2) : (index) -> ()
      }) : (index, index, index, index) -> index
      "gpu.yield"(%3) : (index) -> ()
    }) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

