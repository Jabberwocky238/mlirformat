"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, index, memref<?xf32>, i8) -> (), sym_name = "outline_if_else"}> ({
  ^bb0(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8):
    %0 = "scf.if"(%arg0) ({
      %1 = "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> i8
      "scf.yield"(%1) : (i8) -> ()
    }, {
      "scf.yield"(%arg3) : (i8) -> ()
    }) : (i1) -> i8
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, index, memref<?xf32>, i8) -> (), sym_name = "outline_if"}> ({
  ^bb0(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8):
    "scf.if"(%arg0) ({
      "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, index, memref<?xf32>, i8) -> (), sym_name = "outline_empty_if_else"}> ({
  ^bb0(%arg0: i1, %arg1: index, %arg2: memref<?xf32>, %arg3: i8):
    "scf.if"(%arg0) ({
      "scf.yield"() : () -> ()
    }, {
      "some_op"(%arg0, %arg2) : (i1, memref<?xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1, %arg1: i32):
    "scf.if"(%arg0) ({
      "scf.yield"() : () -> ()
    }, {
      "some_op"(%arg0, %arg1) : (i1, i32) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

