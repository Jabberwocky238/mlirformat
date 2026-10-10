"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "uniqueSSAIDs"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg3: index):
      %7 = "memref.load"(%arg0) : (memref<i32>) -> i32
      %8 = "memref.load"(%arg1) : (memref<i32>) -> i32
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %10 = "arith.subi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %3 = "memref.load"(%arg0) : (memref<i32>) -> i32
      %4 = "memref.load"(%arg1) : (memref<i32>) -> i32
      %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.subi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

