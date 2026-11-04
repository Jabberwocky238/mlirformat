"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> memref<10xf32>, sym_name = "cast_to_static_dim"}> ({
  ^bb0(%arg3: memref<?xf32>):
    %11 = "memref.cast"(%arg3) : (memref<?xf32>) -> memref<10xf32>
    "func.return"(%11) : (memref<10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> memref<f32>, sym_name = "cast_to_ranked"}> ({
  ^bb0(%arg2: memref<*xf32>):
    %10 = "memref.cast"(%arg2) : (memref<*xf32>) -> memref<f32>
    "func.return"(%10) : (memref<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>>, sym_name = "cast_to_static_strides"}> ({
  ^bb0(%arg1: memref<?xf32, strided<[?], offset: ?>>):
    %9 = "memref.cast"(%arg1) : (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>>
    "func.return"(%9) : (memref<?xf32, strided<[9], offset: 5>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> memref<?xf32>, sym_name = "valid_cast"}> ({
  ^bb0(%arg0: memref<*xf32>):
    %8 = "memref.cast"(%arg0) : (memref<*xf32>) -> memref<?xf32>
    "func.return"(%8) : (memref<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %1 = "memref.cast"(%0) : (memref<5xf32>) -> memref<?xf32>
    %2 = "func.call"(%1) <{callee = @cast_to_static_dim}> : (memref<?xf32>) -> memref<10xf32>
    %3 = "memref.cast"(%0) : (memref<5xf32>) -> memref<*xf32>
    %4 = "func.call"(%3) <{callee = @cast_to_ranked}> : (memref<*xf32>) -> memref<f32>
    %5 = "memref.cast"(%0) : (memref<5xf32>) -> memref<?xf32, strided<[?], offset: ?>>
    %6 = "func.call"(%5) <{callee = @cast_to_static_strides}> : (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>>
    %7 = "func.call"(%3) <{callee = @valid_cast}> : (memref<*xf32>) -> memref<?xf32>
    "memref.dealloc"(%0) : (memref<5xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

