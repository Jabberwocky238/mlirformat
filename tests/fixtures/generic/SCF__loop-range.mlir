"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_one_loop"}> ({
  ^bb0(%arg19: memref<?xi32>, %arg20: index, %arg21: index):
    %42 = "arith.constant"() <{value = 0 : index}> : () -> index
    %43 = "arith.constant"() <{value = 1 : index}> : () -> index
    %44 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%42, %arg20, %43) ({
    ^bb0(%arg22: index):
      %45 = "arith.addi"(%arg21, %arg22) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %46 = "arith.muli"(%45, %44) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %47 = "memref.load"(%arg19, %46) : (memref<?xi32>, index) -> i32
      %48 = "arith.muli"(%47, %47) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%48, %arg19, %46) : (i32, memref<?xi32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_one_loop2"}> ({
  ^bb0(%arg14: memref<?xi32>, %arg15: index, %arg16: index):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index
    %35 = "arith.constant"() <{value = 1 : index}> : () -> index
    %36 = "arith.constant"() <{value = 4 : index}> : () -> index
    %37 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%34, %37, %35) ({
    ^bb0(%arg17: index):
      "scf.for"(%34, %arg15, %35) ({
      ^bb0(%arg18: index):
        %38 = "arith.addi"(%arg16, %arg18) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %39 = "arith.muli"(%38, %36) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %40 = "memref.load"(%arg14, %39) : (memref<?xi32>, index) -> i32
        %41 = "arith.muli"(%40, %40) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%41, %arg14, %39) : (i32, memref<?xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_two_loops"}> ({
  ^bb0(%arg9: memref<?xi32>, %arg10: index, %arg11: index):
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index
    %28 = "arith.constant"() <{value = 4 : index}> : () -> index
    %29 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%26, %29, %27) ({
    ^bb0(%arg12: index):
      "scf.for"(%arg12, %arg10, %27) ({
      ^bb0(%arg13: index):
        %30 = "arith.addi"(%arg11, %arg13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %31 = "arith.muli"(%30, %28) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %32 = "memref.load"(%arg9, %31) : (memref<?xi32>, index) -> i32
        %33 = "arith.muli"(%32, %32) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%33, %arg9, %31) : (i32, memref<?xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "fold_only_first_add"}> ({
  ^bb0(%arg5: memref<?xi32>, %arg6: index, %arg7: index):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%18, %arg6, %19) ({
    ^bb0(%arg8: index):
      %21 = "arith.addi"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %22 = "arith.addi"(%arg7, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %23 = "arith.muli"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %24 = "memref.load"(%arg5, %23) : (memref<?xi32>, index) -> i32
      %25 = "arith.muli"(%24, %24) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%25, %arg5, %23) : (i32, memref<?xi32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_fold_negative_mul"}> ({
    %13 = "arith.constant"() <{value = -1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 10 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%14, %15, %16) ({
    ^bb0(%arg4: index):
      %17 = "arith.muli"(%arg4, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "test.sink"(%17) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_fold_negative_mul_indvar_rhs"}> ({
    %8 = "arith.constant"() <{value = -1 : index}> : () -> index
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 10 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%9, %10, %11) ({
    ^bb0(%arg3: index):
      %12 = "arith.muli"(%8, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "test.sink"(%12) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_fold_zero_mul"}> ({
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 10 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%4, %5, %6) ({
    ^bb0(%arg2: index):
      %7 = "arith.muli"(%arg2, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "test.sink"(%7) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "no_fold_runtime_mul"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg1: index):
      %3 = "arith.muli"(%arg1, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "test.sink"(%3) : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

