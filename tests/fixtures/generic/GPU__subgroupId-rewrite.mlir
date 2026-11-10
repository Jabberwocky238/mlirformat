"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<index, 1>) -> (), sym_name = "subgroupId"}> ({
  ^bb0(%arg14: index, %arg15: memref<index, 1>):
    "gpu.launch"(%arg14, %arg14, %arg14, %arg14, %arg14, %arg14) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg16: index, %arg17: index, %arg18: index, %arg19: index, %arg20: index, %arg21: index, %arg22: index, %arg23: index, %arg24: index, %arg25: index, %arg26: index, %arg27: index):
      %4 = "gpu.subgroup_id"() : () -> index
      "memref.store"(%4, %arg15) : (index, memref<index, 1>) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<index, 1>) -> (), sym_name = "subgroupIdConsts"}> ({
  ^bb0(%arg0: index, %arg1: memref<index, 1>):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    "gpu.launch"(%arg0, %arg0, %arg0, %0, %1, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      %3 = "gpu.subgroup_id"() : () -> index
      "memref.store"(%3, %arg1) : (index, memref<index, 1>) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

