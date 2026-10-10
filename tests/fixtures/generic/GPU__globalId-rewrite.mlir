"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<index, 1>) -> (), sym_name = "globalId"}> ({
  ^bb0(%arg0: index, %arg1: memref<index, 1>):
    "gpu.launch"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      %0 = "gpu.global_id"() <{dimension = #gpu<dim x>}> : () -> index
      "memref.store"(%0, %arg1) : (index, memref<index, 1>) -> ()
      %1 = "gpu.global_id"() <{dimension = #gpu<dim y>}> : () -> index
      "memref.store"(%1, %arg1) : (index, memref<index, 1>) -> ()
      %2 = "gpu.global_id"() <{dimension = #gpu<dim z>}> : () -> index
      "memref.store"(%2, %arg1) : (index, memref<index, 1>) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

