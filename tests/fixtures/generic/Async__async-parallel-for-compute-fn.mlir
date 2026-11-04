"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index, index, index) -> (), sym_name = "clone_constant"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.parallel"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg4: index):
      "memref.store"(%0, %arg0, %arg4) : (f32, memref<?xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index, index) -> (), sym_name = "sink_constant_step"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 123 : index}> : () -> index
    "scf.parallel"(%arg1, %arg2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg3: index):
      "memref.store"(%0, %arg0, %arg3) : (f32, memref<?xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "without_func_dialect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 22 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<22xf32>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<22xf32>
    "scf.parallel"(%1, %2, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      "memref.store"(%0, %5, %arg0) : (f32, memref<22xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x10xf32>, index, index) -> (), sym_name = "sink_constant_step"}> ({
  ^bb0(%arg0: memref<?x10xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.parallel"(%arg1, %1, %arg2, %3, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg3: index, %arg4: index):
      "memref.store"(%0, %arg0, %arg3, %arg4) : (f32, memref<?x10xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

