"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "fuse_empty_loops"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "fuse_ops_between"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    %3 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "fuse_two"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %8 = "memref.load"(%arg1, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %9 = "arith.addf"(%8, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%9, %4, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %5 = "memref.load"(%4, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg1, %arg2, %arg3) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%4) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "fuse_three"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %11 = "memref.load"(%arg1, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      %12 = "arith.addf"(%11, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%12, %5, %arg6, %arg7) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %9 = "memref.load"(%5, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %10 = "arith.mulf"(%9, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%10, %6, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %7 = "memref.load"(%arg0, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %8 = "arith.addf"(%7, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%8, %arg1, %arg2, %arg3) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%5) : (memref<2x2xf32>) -> ()
    "memref.dealloc"(%6) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "do_not_fuse_nested_ploop1"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg4: index, %arg5: index):
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "do_not_fuse_nested_ploop2"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg2: index, %arg3: index):
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "do_not_fuse_loops_unmatching_num_loops"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %0, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg0: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "do_not_fuse_loops_with_side_effecting_ops_in_between"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "do_not_fuse_loops_unmatching_iteration_space"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.parallel"(%0, %0, %3, %3, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "do_not_fuse_unmatching_write_read_patterns"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>, %arg3: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %8 = "memref.load"(%arg1, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      %9 = "memref.load"(%arg2, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      %10 = "arith.addf"(%8, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%10, %3, %arg6, %arg7) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %4 = "arith.addi"(%arg4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "memref.load"(%3, %4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg3, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%3) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "do_not_fuse_unmatching_read_write_patterns"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %8 = "memref.load"(%arg1, %arg5, %arg6) : (memref<2x2xf32>, index, index) -> f32
      %9 = "memref.load"(%arg2, %arg5, %arg6) : (memref<2x2xf32>, index, index) -> f32
      %10 = "arith.addf"(%8, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%10, %3, %arg5, %arg6) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg3: index, %arg4: index):
      %4 = "arith.addi"(%arg3, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "memref.load"(%3, %4, %arg4) : (memref<2x2xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg3, %arg4) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg2, %arg4, %arg3) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%3) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "do_not_fuse_loops_with_memref_defined_in_loop_bodies"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg0: index, %arg1: index):
      %4 = "memref.subview"(%3, %1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<2x2xf32>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
      %5 = "memref.load"(%4, %arg0, %arg1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index) -> f32
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "nested_fuse"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%1, %0, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg2: index):
      "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg5: index, %arg6: index):
        %8 = "memref.load"(%arg1, %arg5, %arg6) : (memref<2x2xf32>, index, index) -> f32
        %9 = "arith.addf"(%8, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%9, %4, %arg5, %arg6) : (f32, memref<2x2xf32>, index, index) -> ()
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
      ^bb0(%arg3: index, %arg4: index):
        %5 = "memref.load"(%4, %arg3, %arg4) : (memref<2x2xf32>, index, index) -> f32
        %6 = "memref.load"(%arg0, %arg3, %arg4) : (memref<2x2xf32>, index, index) -> f32
        %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%7, %arg1, %arg3, %arg4) : (f32, memref<2x2xf32>, index, index) -> ()
        "scf.reduce"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "memref.dealloc"(%4) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "do_not_fuse_alias"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>, %arg3: memref<2x2xf32>, %arg4: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg7: index, %arg8: index):
      %6 = "memref.load"(%arg1, %arg7, %arg8) : (memref<2x2xf32>, index, index) -> f32
      %7 = "memref.load"(%arg2, %arg7, %arg8) : (memref<2x2xf32>, index, index) -> f32
      %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%8, %arg4, %arg7, %arg8) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%1, %1, %0, %0, %2, %2) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg5: index, %arg6: index):
      %3 = "memref.load"(%arg4, %arg5, %arg6) : (memref<2x2xf32>, index, index) -> f32
      %4 = "memref.load"(%arg0, %arg5, %arg6) : (memref<2x2xf32>, index, index) -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%5, %arg3, %arg5, %arg6) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "fuse_when_1st_has_multiple_stores"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "memref.store"(%3, %4, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      %8 = "memref.load"(%arg1, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %9 = "arith.addf"(%8, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%9, %4, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %5 = "memref.load"(%4, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg1, %arg2, %arg3) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%4) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "do_not_fuse_multiple_stores_on_diff_indices"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "memref.store"(%3, %4, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      %8 = "memref.load"(%arg1, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %9 = "arith.addf"(%8, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%9, %4, %0, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %5 = "memref.load"(%4, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg1, %arg2, %arg3) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%4) : (memref<2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "fuse_same_indices_by_affine_apply"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32>
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %8 = "memref.load"(%arg1, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %9 = "affine.apply"(%arg4, %arg5) <{map = #map}> : (index, index) -> index
      "memref.store"(%8, %3, %arg4, %9) : (f32, memref<2x3xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %4 = "affine.apply"(%arg2, %arg3) <{map = #map}> : (index, index) -> index
      %5 = "memref.load"(%3, %arg2, %4) : (memref<2x3xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg1, %arg2, %arg3) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%3) : (memref<2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>, index, index) -> (), sym_name = "do_not_fuse_affine_apply_to_non_ind_var"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32>
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %8 = "memref.load"(%arg1, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      %9 = "affine.apply"(%arg6, %arg2) <{map = #map}> : (index, index) -> index
      "memref.store"(%8, %3, %arg6, %9) : (f32, memref<2x3xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "scf.parallel"(%0, %0, %2, %2, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %4 = "affine.apply"(%arg4, %arg3) <{map = #map}> : (index, index) -> index
      %5 = "memref.load"(%3, %arg4, %4) : (memref<2x3xf32>, index, index) -> f32
      %6 = "memref.load"(%arg0, %arg4, %arg5) : (memref<2x2xf32>, index, index) -> f32
      %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%7, %arg1, %arg4, %arg5) : (f32, memref<2x2xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "memref.dealloc"(%3) : (memref<2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (f32, f32), sym_name = "fuse_reductions_two"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %9 = "memref.load"(%arg0, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%9) ({
      ^bb0(%arg8: f32, %arg9: f32):
        %10 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%10) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    %6 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %4) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %7 = "memref.load"(%arg1, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%7) ({
      ^bb0(%arg4: f32, %arg5: f32):
        %8 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%8) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"(%5, %6) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>) -> (f32, f32, f32), sym_name = "fuse_reductions_three"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %6 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg11: index, %arg12: index):
      %13 = "memref.load"(%arg0, %arg11, %arg12) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%13) ({
      ^bb0(%arg13: f32, %arg14: f32):
        %14 = "arith.addf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%14) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    %7 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %4) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg7: index, %arg8: index):
      %11 = "memref.load"(%arg1, %arg7, %arg8) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%11) ({
      ^bb0(%arg9: f32, %arg10: f32):
        %12 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%12) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    %8 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %5) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg3: index, %arg4: index):
      %9 = "memref.load"(%arg2, %arg3, %arg4) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%9) ({
      ^bb0(%arg5: f32, %arg6: f32):
        %10 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%10) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"(%6, %7, %8) : (f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (f32, f32), sym_name = "reductions_use_res"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %8 = "memref.load"(%arg0, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%8) ({
      ^bb0(%arg8: f32, %arg9: f32):
        %9 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%9) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    %5 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %4) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %6 = "memref.load"(%arg1, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%6) ({
      ^bb0(%arg4: f32, %arg5: f32):
        %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%7) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"(%4, %5) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (f32, f32), sym_name = "reductions_use_res_inside"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %10 = "memref.load"(%arg0, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%10) ({
      ^bb0(%arg8: f32, %arg9: f32):
        %11 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%11) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    %6 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %4) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %7 = "memref.load"(%arg1, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      %8 = "arith.addf"(%7, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.reduce"(%8) ({
      ^bb0(%arg4: f32, %arg5: f32):
        %9 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%9) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"(%5, %6) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>) -> (f32, f32, f32), sym_name = "reductions_use_res_between"}> ({
  ^bb0(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %3) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %10 = "memref.load"(%arg0, %arg6, %arg7) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%10) ({
      ^bb0(%arg8: f32, %arg9: f32):
        %11 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%11) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    %6 = "arith.addf"(%5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %7 = "scf.parallel"(%1, %1, %0, %0, %2, %2, %4) <{operandSegmentSizes = array<i32: 2, 2, 2, 1>}> ({
    ^bb0(%arg2: index, %arg3: index):
      %8 = "memref.load"(%arg1, %arg2, %arg3) : (memref<2x2xf32>, index, index) -> f32
      "scf.reduce"(%8) ({
      ^bb0(%arg4: f32, %arg5: f32):
        %9 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%9) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, index, index, index, f32) -> f32
    "func.return"(%5, %7, %6) : (f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

