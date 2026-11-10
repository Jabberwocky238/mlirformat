"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>, sym_name = "single_buffer_return", sym_visibility = "private"}> ({
  ^bb0(%arg3: memref<?xf32, strided<[?], offset: ?>>, %arg4: f32, %arg5: index):
    "memref.store"(%arg4, %arg3, %arg5) : (f32, memref<?xf32, strided<[?], offset: ?>>, index) -> ()
    "func.return"(%arg3) : (memref<?xf32, strided<[?], offset: ?>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> f32, sym_name = "caller"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32, %arg2: index):
    %0 = "func.call"(%arg0, %arg1, %arg2) <{callee = @single_buffer_return}> : (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>
    %1 = "memref.load"(%0, %arg2) : (memref<?xf32, strided<[?], offset: ?>>, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, memref<?x?xf32>, f32, index) -> (memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>), sym_name = "multiple_buffer_returns", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?x?xf32>, %arg2: f32, %arg3: index):
    "memref.store"(%arg2, %arg0, %arg3) : (f32, memref<?xf32, strided<[?], offset: ?>>, index) -> ()
    "memref.store"(%arg2, %arg1, %arg3, %arg3) : (f32, memref<?x?xf32>, index, index) -> ()
    "func.return"(%arg1, %arg0) : (memref<?x?xf32>, memref<?xf32, strided<[?], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, memref<?x?xf32>, f32, index) -> (memref<?x?xf32>, i32, memref<?xf32, strided<[?], offset: ?>>), sym_name = "multiple_mixed_returns", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: memref<?x?xf32>, %arg2: f32, %arg3: index):
    "memref.store"(%arg2, %arg0, %arg3) : (f32, memref<?xf32, strided<[?], offset: ?>>, index) -> ()
    "memref.store"(%arg2, %arg1, %arg3, %arg3) : (f32, memref<?x?xf32>, index, index) -> ()
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%arg1, %0, %arg0) : (memref<?x?xf32>, i32, memref<?xf32, strided<[?], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>, sym_name = "public_function"}> ({
  ^bb0(%arg3: memref<?xf32, strided<[?], offset: ?>>, %arg4: f32, %arg5: index):
    "memref.store"(%arg4, %arg3, %arg5) : (f32, memref<?xf32, strided<[?], offset: ?>>, index) -> ()
    "func.return"(%arg3) : (memref<?xf32, strided<[?], offset: ?>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> f32, sym_name = "caller"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32, %arg2: index):
    %0 = "func.call"(%arg0, %arg1, %arg2) <{callee = @public_function}> : (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>
    %1 = "memref.load"(%0, %arg2) : (memref<?xf32, strided<[?], offset: ?>>, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>>, sym_name = "negative_external_function", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

