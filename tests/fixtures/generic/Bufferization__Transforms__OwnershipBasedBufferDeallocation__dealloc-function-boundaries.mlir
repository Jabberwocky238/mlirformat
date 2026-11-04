"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>) -> (), sym_name = "emptyUsesValue", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<4xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    "test.read_buffer"(%0) : (memref<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>) -> (), sym_name = "emptyUsesValue"}> ({
  ^bb0(%arg0: memref<4xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    "test.read_buffer"(%0) : (memref<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xf32>) -> (), sym_name = "redundantOperations", sym_visibility = "private"}> ({
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
  "func.func"() <{function_type = (memref<5xf32>, memref<10xf32>, memref<5xf32>) -> (memref<10xf32>, memref<15xf32>), sym_name = "memref_in_function_results", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<10xf32>, %arg2: memref<5xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<15xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    "test.buffer_based"(%arg0, %1) : (memref<5xf32>, memref<5xf32>) -> ()
    "test.copy"(%1, %arg2) : (memref<5xf32>, memref<5xf32>) -> ()
    "func.return"(%arg1, %0) : (memref<10xf32>, memref<15xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "private_callee", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<f32>):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "func.return"(%3) : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> f32, sym_name = "caller"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %1 = "func.call"(%0) <{callee = @private_callee}> : (memref<f32>) -> memref<f32>
    %2 = "memref.load"(%1) : (memref<f32>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

