"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_one_loop"}> ({
  ^bb0(%arg14: memref<?xi32>, %arg15: index, %arg16: index):
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%24, %arg15, %25) ({
    ^bb0(%arg17: index):
      %27 = "arith.addi"(%arg16, %arg17) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %28 = "arith.muli"(%27, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %29 = "memref.load"(%arg14, %28) : (memref<?xi32>, index) -> i32
      %30 = "arith.muli"(%29, %29) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%30, %arg14, %28) : (i32, memref<?xi32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_one_loop2"}> ({
  ^bb0(%arg9: memref<?xi32>, %arg10: index, %arg11: index):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "arith.constant"() <{value = 4 : index}> : () -> index
    %19 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%16, %19, %17) ({
    ^bb0(%arg12: index):
      "scf.for"(%16, %arg10, %17) ({
      ^bb0(%arg13: index):
        %20 = "arith.addi"(%arg11, %arg13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %21 = "arith.muli"(%20, %18) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %22 = "memref.load"(%arg9, %21) : (memref<?xi32>, index) -> i32
        %23 = "arith.muli"(%22, %22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%23, %arg9, %21) : (i32, memref<?xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_two_loops"}> ({
  ^bb0(%arg4: memref<?xi32>, %arg5: index, %arg6: index):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 4 : index}> : () -> index
    %11 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%8, %11, %9) ({
    ^bb0(%arg7: index):
      "scf.for"(%arg7, %arg5, %9) ({
      ^bb0(%arg8: index):
        %12 = "arith.addi"(%arg6, %arg8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %13 = "arith.muli"(%12, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %14 = "memref.load"(%arg4, %13) : (memref<?xi32>, index) -> i32
        %15 = "arith.muli"(%14, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%15, %arg4, %13) : (i32, memref<?xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_only_first_add"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%0, %arg1, %1) ({
    ^bb0(%arg3: index):
      %3 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %4 = "arith.addi"(%arg2, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "memref.load"(%arg0, %5) : (memref<?xi32>, index) -> i32
      %7 = "arith.muli"(%6, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%7, %arg0, %5) : (i32, memref<?xi32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

