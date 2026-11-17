"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":4:10)):
      %6 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:12)
      "transform.apply_patterns"(%6) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.gpu.gpu_shuffle_to_amdgpu"() <{chipset = "gfx950"}> : () -> () loc("<stdin>":7:9)
      }) : (!transform.any_op) -> () loc("<stdin>":6:7)
      "transform.yield"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (i32, i1), sym_name = "gpu_shuffle_swizzle"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":13:8)):
    %3 = "arith.constant"() <{value = 64 : i32}> : () -> i32 loc("<stdin>":14:10)
    %4 = "arith.constant"() <{value = 23 : i32}> : () -> i32 loc("<stdin>":15:10)
    %5:2 = "gpu.shuffle"(%arg1, %4, %3) <{mode = #gpu<shuffle_mode xor>}> : (i32, i32, i32) -> (i32, i1) loc("<stdin>":16:12)
    "func.return"(%5#0, %5#1) : (i32, i1) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32) -> (i32, i1), sym_name = "gpu_shuffle_permlane_swap"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":20:8)):
    %0 = "arith.constant"() <{value = 64 : i32}> : () -> i32 loc("<stdin>":21:10)
    %1 = "arith.constant"() <{value = 32 : i32}> : () -> i32 loc("<stdin>":22:10)
    %2:2 = "gpu.shuffle"(%arg0, %1, %0) <{mode = #gpu<shuffle_mode xor>}> : (i32, i32, i32) -> (i32, i1) loc("<stdin>":23:12)
    "func.return"(%2#0, %2#1) : (i32, i1) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
