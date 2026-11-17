"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "side_effect", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "use_i32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (f32, i32, index) -> (), sym_name = "broadcast_hoisting"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":7:8), %arg4: i32 loc("<stdin>":7:20), %arg5: index loc("<stdin>":7:32)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":9:10)
    "scf.for"(%3, %arg5, %4) ({
    ^bb0(%arg6: index loc("<stdin>":11:10)):
      %5 = "gpu.subgroup_broadcast"(%arg3) <{broadcast_type = #gpu<broadcast first_active_lane>}> : (f32) -> f32 loc("<stdin>":12:12)
      %6 = "gpu.subgroup_broadcast"(%arg3, %arg4) <{broadcast_type = #gpu<broadcast specific_lane>}> : (f32, i32) -> f32 loc("<stdin>":13:12)
      "func.call"(%5, %6) <{callee = @side_effect}> : (f32, f32) -> () loc("<stdin>":14:7)
      "scf.yield"() : () -> () loc("<stdin>":15:7)
    }) : (index, index, index) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (i1, index) -> (), sym_name = "ballot_no_hoisting"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":20:8), %arg1: index loc("<stdin>":20:19)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":21:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:10)
    "scf.for"(%0, %arg1, %1) ({
    ^bb0(%arg2: index loc("<stdin>":24:10)):
      %2 = "gpu.ballot"(%arg0) : (i1) -> i32 loc("<stdin>":25:12)
      "func.call"(%2) <{callee = @use_i32}> : (i32) -> () loc("<stdin>":26:7)
      "scf.yield"() : () -> () loc("<stdin>":27:7)
    }) : (index, index, index) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
