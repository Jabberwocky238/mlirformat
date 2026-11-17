"builtin.module"() ({
  "gpu.module"() <{sym_name = "fence_check"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf32, 1>) -> (), kernel}> ({
    ^bb0(%arg0: memref<8x16xf32, 1> loc("<stdin>":4:10)):
      %0 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":5:12)
      %1 = "arith.index_cast"(%0) : (index) -> i32 loc("<stdin>":6:12)
      %2 = "arith.sitofp"(%1) : (i32) -> f32 loc("<stdin>":7:12)
      "xegpu.fence"() <{fence_scope = #xegpu<fence_scope workgroup>, memory_kind = #xegpu<memory_space global>}> : () -> () loc("<stdin>":8:7)
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:12)
      "memref.store"(%2, %arg0, %3, %3) : (f32, memref<8x16xf32, 1>, index, index) -> () loc("<stdin>":10:7)
      "gpu.return"() : () -> () loc("<stdin>":11:7)
    }) {sym_name = "fence"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
