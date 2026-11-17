"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index, index) -> (), sym_name = "expand_shape_dynamic"}> ({
  ^bb0(%arg5: memref<?xf32> loc("<stdin>":3:8), %arg6: index loc("<stdin>":3:30), %arg7: index loc("<stdin>":3:44)):
    %10 = "memref.expand_shape"(%arg5, %arg6, %arg7) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?xf32>, index, index) -> memref<?x?xf32> loc("<stdin>":4:11)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "expand_shape_mixed"}> ({
  ^bb0(%arg3: memref<?xf32> loc("<stdin>":8:8), %arg4: index loc("<stdin>":8:30)):
    %9 = "memref.expand_shape"(%arg3, %arg4) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 5>}> : (memref<?xf32>, index) -> memref<?x5xf32> loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "expand_shape_multi_group"}> ({
  ^bb0(%arg0: memref<?x?xf32> loc("<stdin>":13:8), %arg1: index loc("<stdin>":13:32), %arg2: index loc("<stdin>":13:46)):
    %8 = "memref.expand_shape"(%arg0, %arg1, %arg2) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 4>}> : (memref<?x?xf32>, index, index) -> memref<?x?x4xf32> loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32> loc("<stdin>":18:10)
    %1 = "memref.cast"(%0) : (memref<10xf32>) -> memref<?xf32> loc("<stdin>":19:10)
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x20xf32> loc("<stdin>":20:10)
    %3 = "memref.cast"(%2) : (memref<3x20xf32>) -> memref<?x?xf32> loc("<stdin>":21:10)
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":22:10)
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":23:10)
    %6 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":24:10)
    %7 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":25:10)
    "func.call"(%1, %5, %7) <{callee = @expand_shape_dynamic}> : (memref<?xf32>, index, index) -> () loc("<stdin>":26:5)
    "func.call"(%1, %6) <{callee = @expand_shape_mixed}> : (memref<?xf32>, index) -> () loc("<stdin>":27:5)
    "func.call"(%1, %4, %7) <{callee = @expand_shape_dynamic}> : (memref<?xf32>, index, index) -> () loc("<stdin>":28:5)
    "func.call"(%1, %4) <{callee = @expand_shape_mixed}> : (memref<?xf32>, index) -> () loc("<stdin>":29:5)
    "func.call"(%3, %5, %7) <{callee = @expand_shape_multi_group}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
