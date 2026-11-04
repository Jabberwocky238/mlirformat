"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1000 : i32}> : () -> i32
    %3 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<1xi32>
    "memref.store"(%2, %3, %0) : (i32, memref<1xi32>, index) -> ()
    "gpu.launch"(%0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %5 = "memref.load"(%3, %0) : (memref<1xi32>, index) -> i32
      %6 = "arith.addi"(%5, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%6, %3, %0) : (i32, memref<1xi32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    %4 = "memref.load"(%3, %0) : (memref<1xi32>, index) -> i32
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

