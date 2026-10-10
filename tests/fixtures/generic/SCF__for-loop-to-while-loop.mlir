"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, i32) -> (), sym_name = "single_loop"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: index, %arg2: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%0, %arg1, %1) ({
    ^bb0(%arg3: index):
      %2 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%2, %arg0, %arg3) : (i32, memref<?xi32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, i32) -> (), sym_name = "nested_loop"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: index, %arg2: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%0, %arg1, %1) ({
    ^bb0(%arg3: index):
      "scf.for"(%0, %arg1, %1) ({
      ^bb0(%arg4: index):
        %2 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%2, %arg0, %arg3) : (i32, memref<?xi32>, index) -> ()
        "memref.store"(%2, %arg0, %arg4) : (i32, memref<?xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> f32, sym_name = "for_iter_args"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1:2 = "scf.for"(%arg0, %arg1, %arg2, %0, %0) ({
    ^bb0(%arg3: index, %arg4: f32, %arg5: f32):
      %2 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%2, %2) : (f32, f32) -> ()
    }) : (index, index, index, f32, f32) -> (f32, f32)
    "func.return"(%1#1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, index, i32) -> i32, sym_name = "exec_region_multiple_yields"}> ({
  ^bb0(%arg0: i32, %arg1: index, %arg2: i32):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    %5 = "scf.for"(%2, %arg1, %3, %arg0) ({
    ^bb0(%arg3: index, %arg4: i32):
      %6 = "scf.execute_region"() ({
        %7 = "arith.cmpi"(%arg3, %3) <{predicate = 2 : i64}> : (index, index) -> i1
        "cf.cond_br"(%7)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb1:  // pred: ^bb0
        %8 = "arith.subi"(%arg4, %arg0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.yield"(%8) : (i32) -> ()
      ^bb2:  // pred: ^bb0
        %9 = "arith.muli"(%arg4, %arg2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.yield"(%9) : (i32) -> ()
      }) : () -> i32
      "scf.yield"(%6) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

