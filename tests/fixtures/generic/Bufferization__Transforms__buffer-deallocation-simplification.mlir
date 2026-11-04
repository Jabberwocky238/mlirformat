"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, i1, memref<2xi32>, i1) -> (i1, i1, i1, i1, i1, i1, i1), sym_name = "dealloc_deallocated_in_retained"}> ({
  ^bb0(%arg0: memref<2xi32>, %arg1: i1, %arg2: memref<2xi32>, %arg3: i1):
    %0 = "bufferization.dealloc"(%arg0, %arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<2xi32>, i1, memref<2xi32>) -> i1
    %1 = "bufferization.dealloc"(%arg0, %arg2, %arg1, %arg1, %arg0) <{operandSegmentSizes = array<i32: 2, 2, 1>}> : (memref<2xi32>, memref<2xi32>, i1, i1, memref<2xi32>) -> i1
    %2:2 = "bufferization.dealloc"(%arg0, %arg1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (memref<2xi32>, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1)
    %3 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<2xi32>) -> memref<i32>
    %4 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<2xi32>) -> memref<1xi32, strided<[1], offset: 1>>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %6:3 = "bufferization.dealloc"(%arg0, %4, %arg1, %arg3, %arg0, %5, %3) <{operandSegmentSizes = array<i32: 2, 2, 3>}> : (memref<2xi32>, memref<1xi32, strided<[1], offset: 1>>, i1, i1, memref<2xi32>, memref<2xi32>, memref<i32>) -> (i1, i1, i1)
    "func.return"(%0, %1, %2#0, %2#1, %6#0, %6#1, %6#2) : (i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, i1, memref<2xi32>, i1) -> (i1, i1, i1, i1, i1, i1, i1), sym_name = "dealloc_deallocated_in_retained_extract_base_memref"}> ({
  ^bb0(%arg0: memref<2xi32>, %arg1: i1, %arg2: memref<2xi32>, %arg3: i1):
    %0:4 = "memref.extract_strided_metadata"(%arg0) : (memref<2xi32>) -> (memref<i32>, index, index, index)
    %1:4 = "memref.extract_strided_metadata"(%arg2) : (memref<2xi32>) -> (memref<i32>, index, index, index)
    %2 = "bufferization.dealloc"(%0#0, %arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<i32>, i1, memref<2xi32>) -> i1
    %3 = "bufferization.dealloc"(%0#0, %1#0, %arg1, %arg1, %arg0) <{operandSegmentSizes = array<i32: 2, 2, 1>}> : (memref<i32>, memref<i32>, i1, i1, memref<2xi32>) -> i1
    %4:2 = "bufferization.dealloc"(%0#0, %arg1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (memref<i32>, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1)
    %5 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<2xi32>) -> memref<i32>
    %6 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<2xi32>) -> memref<1xi32, strided<[1], offset: 1>>
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %8:3 = "bufferization.dealloc"(%0#0, %6, %arg1, %arg3, %arg0, %7, %5) <{operandSegmentSizes = array<i32: 2, 2, 3>}> : (memref<i32>, memref<1xi32, strided<[1], offset: 1>>, i1, i1, memref<2xi32>, memref<2xi32>, memref<i32>) -> (i1, i1, i1)
    "func.return"(%2, %3, %4#0, %4#1, %8#0, %8#1, %8#2) : (i1, i1, i1, i1, i1, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xi32>) -> (i1, i1, memref<2xi32>), sym_name = "remove_retained_memrefs_guarateed_to_not_alias"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xi32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %2:2 = "bufferization.dealloc"(%0, %arg0, %1, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (memref<2xi32>, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1)
    "func.return"(%2#0, %2#1, %0) : (i1, i1, memref<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<2xi32>, memref<2xi32>, i1) -> (i1, i1), sym_name = "dealloc_split_when_no_other_aliasing"}> ({
  ^bb0(%arg0: i1, %arg1: memref<2xi32>, %arg2: memref<2xi32>, %arg3: i1):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %2 = "arith.select"(%arg0, %0, %1) : (i1, memref<2xi32>, memref<2xi32>) -> memref<2xi32>
    %3:2 = "bufferization.dealloc"(%0, %arg2, %arg0, %arg3, %arg1, %2) <{operandSegmentSizes = array<i32: 2, 2, 2>}> : (memref<2xi32>, memref<2xi32>, i1, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1)
    "func.return"(%3#0, %3#1) : (i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> (memref<2xi32>, memref<2xi32>, i1, i1), sym_name = "dealloc_remove_dealloc_memref_contained_in_retained_with_const_true_condition"}> ({
  ^bb0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1:2 = "bufferization.dealloc"(%arg0, %arg1, %arg2, %0, %0, %0, %arg0, %arg1) <{operandSegmentSizes = array<i32: 3, 3, 2>}> : (memref<2xi32>, memref<2xi32>, memref<2xi32>, i1, i1, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1)
    "func.return"(%arg0, %arg1, %1#0, %1#1) : (memref<2xi32>, memref<2xi32>, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, memref<2xi32>, memref<2xi32>) -> (memref<2xi32>, memref<2xi32>, i1, i1), sym_name = "dealloc_remove_dealloc_memref_contained_in_retained_with_const_true_condition"}> ({
  ^bb0(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1:4 = "memref.extract_strided_metadata"(%arg0) : (memref<2xi32>) -> (memref<i32>, index, index, index)
    %2:4 = "memref.extract_strided_metadata"(%arg1) : (memref<2xi32>) -> (memref<i32>, index, index, index)
    %3:4 = "memref.extract_strided_metadata"(%arg2) : (memref<2xi32>) -> (memref<i32>, index, index, index)
    %4:2 = "bufferization.dealloc"(%1#0, %2#0, %3#0, %0, %0, %0, %arg0, %arg1) <{operandSegmentSizes = array<i32: 3, 3, 2>}> : (memref<i32>, memref<i32>, memref<i32>, i1, i1, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1)
    "func.return"(%arg0, %arg1, %4#0, %4#1) : (memref<2xi32>, memref<2xi32>, i1, i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, index, index, index) -> f32, sym_name = "alloc_and_bbarg"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = true}> : () -> i1
    %1 = "arith.constant"() <{value = false}> : () -> i1
    %2:2 = "scf.for"(%arg1, %arg2, %arg3, %arg0, %1) ({
    ^bb0(%arg4: index, %arg5: memref<5xf32>, %arg6: i1):
      %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
      "memref.copy"(%arg5, %5) : (memref<5xf32>, memref<5xf32>) -> ()
      %6:4 = "memref.extract_strided_metadata"(%arg5) : (memref<5xf32>) -> (memref<f32>, index, index, index)
      %7 = "bufferization.dealloc"(%6#0, %5, %arg6, %0, %5) <{operandSegmentSizes = array<i32: 2, 2, 1>}> : (memref<f32>, memref<5xf32>, i1, i1, memref<5xf32>) -> i1
      "scf.yield"(%5, %7) : (memref<5xf32>, i1) -> ()
    }) : (index, index, index, memref<5xf32>, i1) -> (memref<5xf32>, i1)
    %3 = "memref.load"(%2#0, %arg1) : (memref<5xf32>, index) -> f32
    %4:4 = "memref.extract_strided_metadata"(%2#0) : (memref<5xf32>) -> (memref<f32>, index, index, index)
    "bufferization.dealloc"(%4#0, %2#1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<f32>, i1) -> ()
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<6xf32>, i1) -> i1, sym_name = "duplicate_memref"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<6xf32>, %arg2: i1):
    %0 = "bufferization.dealloc"(%arg0, %arg0, %arg2, %arg2, %arg1) <{operandSegmentSizes = array<i32: 2, 2, 1>}> : (memref<5xf32>, memref<5xf32>, i1, i1, memref<6xf32>) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

