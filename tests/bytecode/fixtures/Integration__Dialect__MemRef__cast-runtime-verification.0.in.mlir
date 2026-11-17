"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> memref<10xf32>, sym_name = "cast_to_static_dim"}> ({
  ^bb0(%arg3: memref<?xf32> loc("<stdin>":3:8)):
    %11 = "memref.cast"(%arg3) : (memref<?xf32>) -> memref<10xf32> loc("<stdin>":4:11)
    "func.return"(%11) : (memref<10xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> memref<f32>, sym_name = "cast_to_ranked"}> ({
  ^bb0(%arg2: memref<*xf32> loc("<stdin>":8:8)):
    %10 = "memref.cast"(%arg2) : (memref<*xf32>) -> memref<f32> loc("<stdin>":9:11)
    "func.return"(%10) : (memref<f32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>>, sym_name = "cast_to_static_strides"}> ({
  ^bb0(%arg1: memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":13:8)):
    %9 = "memref.cast"(%arg1) : (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>> loc("<stdin>":14:10)
    "func.return"(%9) : (memref<?xf32, strided<[9], offset: 5>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<*xf32>) -> memref<?xf32>, sym_name = "valid_cast"}> ({
  ^bb0(%arg0: memref<*xf32> loc("<stdin>":18:8)):
    %8 = "memref.cast"(%arg0) : (memref<*xf32>) -> memref<?xf32> loc("<stdin>":19:10)
    "func.return"(%8) : (memref<?xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":23:10)
    %1 = "memref.cast"(%0) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":24:10)
    %2 = "func.call"(%1) <{callee = @cast_to_static_dim}> : (memref<?xf32>) -> memref<10xf32> loc("<stdin>":25:10)
    %3 = "memref.cast"(%0) : (memref<5xf32>) -> memref<*xf32> loc("<stdin>":26:10)
    %4 = "func.call"(%3) <{callee = @cast_to_ranked}> : (memref<*xf32>) -> memref<f32> loc("<stdin>":27:10)
    %5 = "memref.cast"(%0) : (memref<5xf32>) -> memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":28:10)
    %6 = "func.call"(%5) <{callee = @cast_to_static_strides}> : (memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[9], offset: 5>> loc("<stdin>":29:10)
    %7 = "func.call"(%3) <{callee = @valid_cast}> : (memref<*xf32>) -> memref<?xf32> loc("<stdin>":30:10)
    "memref.dealloc"(%0) : (memref<5xf32>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
