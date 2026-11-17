"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<index, 1>) -> (), sym_name = "subgroupId"}> ({
  ^bb0(%arg14: index loc("<stdin>":3:8), %arg15: memref<index, 1> loc("<stdin>":3:23)):
    "gpu.launch"(%arg14, %arg14, %arg14, %arg14, %arg14, %arg14) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg16: index loc("<stdin>":5:10), %arg17: index loc("<stdin>":5:25), %arg18: index loc("<stdin>":5:40), %arg19: index loc("<stdin>":5:55), %arg20: index loc("<stdin>":5:70), %arg21: index loc("<stdin>":5:85), %arg22: index loc("<stdin>":5:100), %arg23: index loc("<stdin>":5:115), %arg24: index loc("<stdin>":5:130), %arg25: index loc("<stdin>":5:145), %arg26: index loc("<stdin>":5:160), %arg27: index loc("<stdin>":5:175)):
      %4 = "gpu.subgroup_id"() : () -> index loc("<stdin>":6:12)
      "memref.store"(%4, %arg15) : (index, memref<index, 1>) -> () loc("<stdin>":7:7)
      "gpu.terminator"() : () -> () loc("<stdin>":8:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, memref<index, 1>) -> (), sym_name = "subgroupIdConsts"}> ({
  ^bb0(%arg0: index loc("<stdin>":13:8), %arg1: memref<index, 1> loc("<stdin>":13:22)):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":14:10)
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":15:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":16:10)
    "gpu.launch"(%arg0, %arg0, %arg0, %0, %1, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":18:10), %arg3: index loc("<stdin>":18:24), %arg4: index loc("<stdin>":18:38), %arg5: index loc("<stdin>":18:52), %arg6: index loc("<stdin>":18:66), %arg7: index loc("<stdin>":18:80), %arg8: index loc("<stdin>":18:94), %arg9: index loc("<stdin>":18:108), %arg10: index loc("<stdin>":18:122), %arg11: index loc("<stdin>":18:137), %arg12: index loc("<stdin>":18:152), %arg13: index loc("<stdin>":18:167)):
      %3 = "gpu.subgroup_id"() : () -> index loc("<stdin>":19:12)
      "memref.store"(%3, %arg1) : (index, memref<index, 1>) -> () loc("<stdin>":20:7)
      "gpu.terminator"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
