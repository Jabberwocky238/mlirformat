"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>>, sym_name = "single_buffer_return", sym_visibility = "private"}> ({
  ^bb0(%arg3: memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":3:8), %arg4: f32 loc("<stdin>":3:55), %arg5: index loc("<stdin>":3:67)):
    "memref.store"(%arg4, %arg3, %arg5) : (f32, memref<?xf32, strided<[?], offset: ?>>, index) -> () loc("<stdin>":4:5)
    "func.return"(%arg3) : (memref<?xf32, strided<[?], offset: ?>>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> f32, sym_name = "caller"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":8:8), %arg1: f32 loc("<stdin>":8:55), %arg2: index loc("<stdin>":8:67)):
    %0 = "func.call"(%arg0, %arg1, %arg2) <{callee = @single_buffer_return}> : (memref<?xf32, strided<[?], offset: ?>>, f32, index) -> memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":9:10)
    %1 = "memref.load"(%0, %arg2) : (memref<?xf32, strided<[?], offset: ?>>, index) -> f32 loc("<stdin>":10:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
