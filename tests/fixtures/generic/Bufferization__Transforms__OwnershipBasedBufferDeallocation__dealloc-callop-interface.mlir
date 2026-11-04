"builtin.module"() ({
  "func.func"() <{function_type = (memref<f64>) -> memref<f64>, sym_name = "f", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<f64>):
    "func.return"(%arg0) : (memref<f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "function_call"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    %2 = "func.call"(%0) <{callee = @f}> : (memref<f64>) -> memref<f64>
    "test.copy"(%2, %1) : (memref<f64>, memref<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f64>) -> memref<f64>, sym_name = "f"}> ({
  ^bb0(%arg0: memref<f64>):
    "func.return"(%arg0) : (memref<f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "function_call_non_private"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    %2 = "func.call"(%0) <{callee = @f}> : (memref<f64>) -> memref<f64>
    "test.copy"(%2, %1) : (memref<f64>, memref<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f64>) -> memref<f64>, sym_name = "f", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<f64>):
    "func.return"(%arg1) : (memref<f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "function_call_requries_merged_ownership_mid_block"}> ({
  ^bb0(%arg0: i1):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f64>
    %2 = "arith.select"(%arg0, %0, %1) : (i1, memref<f64>, memref<f64>) -> memref<f64>
    %3 = "func.call"(%2) <{callee = @f}> : (memref<f64>) -> memref<f64>
    "test.copy"(%3, %0) : (memref<f64>, memref<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "g"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "func.call"(%arg0) <{callee = @f}> : (memref<f32>) -> memref<f32>
    "func.return"(%0) : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, (memref<?xf32>) -> memref<?xf32>) -> (), sym_name = "func_call_indirect"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: (memref<?xf32>) -> memref<?xf32>):
    %0 = "func.call_indirect"(%arg1, %arg0) : ((memref<?xf32>) -> memref<?xf32>, memref<?xf32>) -> memref<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

