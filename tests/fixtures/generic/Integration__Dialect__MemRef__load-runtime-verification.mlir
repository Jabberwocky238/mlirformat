"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, index) -> (), sym_name = "load"}> ({
  ^bb0(%arg6: memref<1xf32>, %arg7: index):
    %9 = "memref.load"(%arg6, %arg7) : (memref<1xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "load_dynamic"}> ({
  ^bb0(%arg4: memref<?xf32>, %arg5: index):
    %8 = "memref.load"(%arg4, %arg5) : (memref<?xf32>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, index, index) -> (), sym_name = "load_nd_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index):
    %7 = "memref.load"(%arg0, %arg1, %arg2, %arg3) : (memref<?x?x?xf32>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %5 = "memref.alloc"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %6 = "memref.alloc"(%3, %3, %3) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x?x?xf32>
    "func.call"(%4, %1) <{callee = @load}> : (memref<1xf32>, index) -> ()
    "func.call"(%5, %1) <{callee = @load_dynamic}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %1, %2, %0) <{callee = @load_nd_dynamic}> : (memref<?x?x?xf32>, index, index, index) -> ()
    "func.call"(%4, %0) <{callee = @load}> : (memref<1xf32>, index) -> ()
    "func.call"(%5, %0) <{callee = @load_dynamic}> : (memref<?xf32>, index) -> ()
    "func.call"(%6, %1, %1, %0) <{callee = @load_nd_dynamic}> : (memref<?x?x?xf32>, index, index, index) -> ()
    "memref.dealloc"(%5) : (memref<?xf32>) -> ()
    "memref.dealloc"(%6) : (memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

