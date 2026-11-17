"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "named_barrier"}> ({
      %4 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":4:12)
      %5 = "gpu.initialize_named_barrier"(%4) : (i32) -> !gpu.named_barrier loc("<stdin>":5:12)
      "gpu.barrier"(%5) <{scope = #gpu.barrier_scope<workgroup>}> : (!gpu.named_barrier) -> () loc("<stdin>":6:7)
      "func.return"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "func.func"() <{function_type = () -> (), sym_name = "two_named_barriers"}> ({
      %0 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":10:12)
      %1 = "arith.constant"() <{value = 8 : i32}> : () -> i32 loc("<stdin>":11:12)
      %2 = "gpu.initialize_named_barrier"(%0) : (i32) -> !gpu.named_barrier loc("<stdin>":12:12)
      %3 = "gpu.initialize_named_barrier"(%1) : (i32) -> !gpu.named_barrier loc("<stdin>":13:12)
      "gpu.barrier"(%2) <{scope = #gpu.barrier_scope<workgroup>}> : (!gpu.named_barrier) -> () loc("<stdin>":14:7)
      "gpu.barrier"(%3) <{scope = #gpu.barrier_scope<workgroup>}> : (!gpu.named_barrier) -> () loc("<stdin>":15:7)
      "func.return"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.func"() <{function_type = () -> (), sym_name = "cluster_scope"}> ({
      "gpu.barrier"() <{scope = #gpu.barrier_scope<cluster>}> : () -> () loc("<stdin>":19:7)
      "func.return"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
