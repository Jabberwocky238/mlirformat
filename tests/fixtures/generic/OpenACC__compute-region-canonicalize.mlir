"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "merge_duplicate_ins"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%0, %1) : (i32, memref<i32>) -> ()
    "acc.compute_region"(%1, %1) <{operandSegmentSizes = array<i32: 0, 2, 0>, origin = "acc.serial"}> ({
    ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
      %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %4 = "memref.load"(%arg0) : (memref<i32>) -> i32
      %5 = "arith.addi"(%4, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%5, %arg0) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    %2 = "memref.load"(%1) : (memref<i32>) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "merge_duplicate_ins_complex_pattern"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%0, %1) : (i32, memref<i32>) -> ()
    "memref.store"(%0, %2) : (i32, memref<i32>) -> ()
    "memref.store"(%0, %3) : (i32, memref<i32>) -> ()
    "acc.compute_region"(%1, %2, %1, %3, %3, %2, %1) <{operandSegmentSizes = array<i32: 0, 7, 0>, origin = "acc.serial"}> ({
    ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>, %arg3: memref<i32>, %arg4: memref<i32>, %arg5: memref<i32>, %arg6: memref<i32>):
      %5 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %6 = "memref.load"(%arg0) : (memref<i32>) -> i32
      %7 = "memref.load"(%arg1) : (memref<i32>) -> i32
      %8 = "memref.load"(%arg2) : (memref<i32>) -> i32
      %9 = "memref.load"(%arg3) : (memref<i32>) -> i32
      %10 = "memref.load"(%arg4) : (memref<i32>) -> i32
      %11 = "memref.load"(%arg5) : (memref<i32>) -> i32
      %12 = "memref.load"(%arg6) : (memref<i32>) -> i32
      %13 = "arith.addi"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %14 = "arith.addi"(%13, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.addi"(%14, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %16 = "arith.addi"(%15, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %17 = "arith.addi"(%16, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %18 = "arith.addi"(%17, %12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %19 = "arith.addi"(%18, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%19, %arg0) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>, memref<i32>, memref<i32>, memref<i32>, memref<i32>, memref<i32>, memref<i32>) -> ()
    %4 = "memref.load"(%1) : (memref<i32>) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "drop_unused_ins"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "memref.store"(%0, %1) : (i32, memref<i32>) -> ()
    "memref.store"(%0, %2) : (i32, memref<i32>) -> ()
    "memref.store"(%0, %3) : (i32, memref<i32>) -> ()
    "acc.compute_region"(%1, %2, %3) <{operandSegmentSizes = array<i32: 0, 3, 0>, origin = "acc.serial"}> ({
    ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>):
      %5 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %6 = "memref.load"(%arg0) : (memref<i32>) -> i32
      %7 = "arith.addi"(%6, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%7, %arg0) : (i32, memref<i32>) -> ()
      "acc.yield"() : () -> ()
    }) : (memref<i32>, memref<i32>, memref<i32>) -> ()
    %4 = "memref.load"(%1) : (memref<i32>) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

