"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, index) -> (), sym_name = "load"}> ({
  ^bb0(%arg6: memref<1xf32> loc("<stdin>":3:8), %arg7: index loc("<stdin>":3:30)):
    %9 = "memref.load"(%arg6, %arg7) : (memref<1xf32>, index) -> f32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "load_dynamic"}> ({
  ^bb0(%arg4: memref<?xf32> loc("<stdin>":8:8), %arg5: index loc("<stdin>":8:30)):
    %8 = "memref.load"(%arg4, %arg5) : (memref<?xf32>, index) -> f32 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, index, index) -> (), sym_name = "load_nd_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32> loc("<stdin>":13:8), %arg1: index loc("<stdin>":13:34), %arg2: index loc("<stdin>":13:48), %arg3: index loc("<stdin>":13:62)):
    %7 = "memref.load"(%arg0, %arg1, %arg2, %arg3) : (memref<?x?x?xf32>, index, index, index) -> f32 loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index loc("<stdin>":20:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":21:10)
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32> loc("<stdin>":22:10)
    %5 = "memref.alloc"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":23:10)
    %6 = "memref.alloc"(%3, %3, %3) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x?x?xf32> loc("<stdin>":24:10)
    "func.call"(%4, %1) <{callee = @load}> : (memref<1xf32>, index) -> () loc("<stdin>":25:5)
    "func.call"(%5, %1) <{callee = @load_dynamic}> : (memref<?xf32>, index) -> () loc("<stdin>":26:5)
    "func.call"(%6, %1, %2, %0) <{callee = @load_nd_dynamic}> : (memref<?x?x?xf32>, index, index, index) -> () loc("<stdin>":27:5)
    "func.call"(%4, %0) <{callee = @load}> : (memref<1xf32>, index) -> () loc("<stdin>":28:5)
    "func.call"(%5, %0) <{callee = @load_dynamic}> : (memref<?xf32>, index) -> () loc("<stdin>":29:5)
    "func.call"(%6, %1, %1, %0) <{callee = @load_nd_dynamic}> : (memref<?x?x?xf32>, index, index, index) -> () loc("<stdin>":30:5)
    "memref.dealloc"(%5) : (memref<?xf32>) -> () loc("<stdin>":31:5)
    "memref.dealloc"(%6) : (memref<?x?x?xf32>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
