"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi32>
    %4 = "memref.cast"(%3) : (memref<?xi32>) -> memref<*xi32>
    "gpu.host_register"(%4) : (memref<*xi32>) -> ()
    %5 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "memref.store"(%5, %3, %0) : (i32, memref<?xi32>, index) -> ()
    "memref.store"(%5, %3, %1) : (i32, memref<?xi32>, index) -> ()
    %6:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %15 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xi32>
      "gpu.memcpy"(%15, %3) : (memref<?xi32>, memref<?xi32>) -> ()
      "async.yield"(%15) : (memref<?xi32>) -> ()
    }) : () -> (!async.token, !async.value<memref<?xi32>>)
    %7:2 = "async.execute"(%6#0, %6#1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: memref<?xi32>):
      %14 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xi32>
      "gpu.memcpy"(%14, %arg15) : (memref<?xi32>, memref<?xi32>) -> ()
      "async.yield"(%14) : (memref<?xi32>) -> ()
    }) : (!async.token, !async.value<memref<?xi32>>) -> (!async.token, !async.value<memref<?xi32>>)
    %8:2 = "async.execute"(%6#0, %6#1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: memref<?xi32>):
      %13 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xi32>
      "gpu.memcpy"(%13, %arg14) : (memref<?xi32>, memref<?xi32>) -> ()
      "async.yield"(%13) : (memref<?xi32>) -> ()
    }) : (!async.token, !async.value<memref<?xi32>>) -> (!async.token, !async.value<memref<?xi32>>)
    %9 = "async.execute"(%7#0, %8#0, %7#1, %8#1) <{operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg0: memref<?xi32>, %arg1: memref<?xi32>):
      "gpu.launch"(%1, %1, %1, %2, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
      ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
        %10 = "memref.load"(%arg0, %arg5) : (memref<?xi32>, index) -> i32
        %11 = "memref.load"(%arg1, %arg5) : (memref<?xi32>, index) -> i32
        %12 = "arith.addi"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "memref.store"(%12, %3, %arg5) : (i32, memref<?xi32>, index) -> ()
        "gpu.terminator"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
      "async.yield"() : () -> ()
    }) : (!async.token, !async.token, !async.value<memref<?xi32>>, !async.value<memref<?xi32>>) -> !async.token
    "async.await"(%9) : (!async.token) -> ()
    "func.call"(%4) <{callee = @printMemrefI32}> : (memref<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

