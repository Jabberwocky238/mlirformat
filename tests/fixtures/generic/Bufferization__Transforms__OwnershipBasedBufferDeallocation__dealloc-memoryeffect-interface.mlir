"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "redundantOperations"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg0, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%0, %1) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "allocaIsNotDeallocated"}> ({
  ^bb0(%arg0: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg0, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%0, %1) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>, memref<2xf32>) -> (), sym_name = "inserting_missing_dealloc_simple"}> ({
  ^bb0(%arg0: memref<2xf32>, %arg1: memref<2xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "test.buffer_based"(%arg0, %0) : (memref<2xf32>, memref<2xf32>) -> ()
    "test.copy"(%0, %arg1) : (memref<2xf32>, memref<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloca_ownership_indicator_is_false"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "cf.br"(%0)[^bb1] : (memref<2xf32>) -> ()
  ^bb1(%1: memref<2xf32>):  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>, memref<?x?xf64>) -> memref<?x?xf64>, sym_name = "dealloc_existing_clones"}> ({
  ^bb0(%arg0: memref<?x?xf64>, %arg1: memref<?x?xf64>):
    %0 = "bufferization.clone"(%arg0) : (memref<?x?xf64>) -> memref<?x?xf64>
    %1 = "bufferization.clone"(%arg1) : (memref<?x?xf64>) -> memref<?x?xf64>
    "func.return"(%0) : (memref<?x?xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : tensor<4xf32>, sym_name = "__constant_4xf32", sym_visibility = "private", type = memref<4xf32>}> : () -> ()
  "func.func"() <{function_type = () -> memref<4xf32>, sym_name = "op_without_aliasing_and_allocation"}> ({
    %0 = "memref.get_global"() <{name = @__constant_4xf32}> : () -> memref<4xf32>
    "func.return"(%0) : (memref<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, f32, index) -> f32, sym_name = "manual_deallocation"}> ({
  ^bb0(%arg0: i1, %arg1: f32, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {bufferization.manual_deallocation} : () -> memref<5xf32>
    "linalg.fill"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, memref<5xf32>) -> ()
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    "linalg.fill"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<5xf32>) -> ()
    %2 = "arith.select"(%arg0, %0, %1) : (i1, memref<5xf32>, memref<5xf32>) -> memref<5xf32>
    %3 = "memref.load"(%2, %arg2) : (memref<5xf32>, index) -> f32
    "memref.dealloc"(%0) {bufferization.manual_deallocation} : (memref<5xf32>) -> ()
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x252x380xui8>) -> memref<1x250x378x16xui8>, sym_name = "properly_creates_deallocations_in_execute_region", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<1x16x252x380xui8>):
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x250x378x16xui8>
    "scf.execute_region"() <{no_inline}> ({
      %1 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 16, 65, 380>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<1x16x252x380xui8>) -> memref<1x16x65x380xui8, strided<[1532160, 95760, 380, 1]>>
      %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x63x378x16xui8>
      "test.buffer_based"(%1, %2) : (memref<1x16x65x380xui8, strided<[1532160, 95760, 380, 1]>>, memref<1x63x378x16xui8>) -> ()
      %3 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 63, 378, 16>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<1x250x378x16xui8>) -> memref<1x63x378x16xui8, strided<[1512000, 6048, 16, 1]>>
      "test.copy"(%2, %3) : (memref<1x63x378x16xui8>, memref<1x63x378x16xui8, strided<[1512000, 6048, 16, 1]>>) -> ()
      "scf.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%0) : (memref<1x250x378x16xui8>) -> ()
  }) : () -> ()
}) : () -> ()

