"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi32> loc("<stdin>":6:10)
    %4 = "memref.cast"(%3) : (memref<?xi32>) -> memref<*xi32> loc("<stdin>":7:10)
    "gpu.host_register"(%4) : (memref<*xi32>) -> () loc("<stdin>":8:5)
    %5 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":9:10)
    "memref.store"(%5, %3, %0) : (i32, memref<?xi32>, index) -> () loc("<stdin>":10:5)
    "memref.store"(%5, %3, %1) : (i32, memref<?xi32>, index) -> () loc("<stdin>":11:5)
    %6:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      %15 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xi32> loc("<stdin>":13:13)
      "gpu.memcpy"(%15, %3) : (memref<?xi32>, memref<?xi32>) -> () loc("<stdin>":14:7)
      "async.yield"(%15) : (memref<?xi32>) -> () loc("<stdin>":15:7)
    }) : () -> (!async.token, !async.value<memref<?xi32>>) loc("<stdin>":12:12)
    %7:2 = "async.execute"(%6#0, %6#1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: memref<?xi32> loc("<stdin>":18:10)):
      %14 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xi32> loc("<stdin>":19:13)
      "gpu.memcpy"(%14, %arg15) : (memref<?xi32>, memref<?xi32>) -> () loc("<stdin>":20:7)
      "async.yield"(%14) : (memref<?xi32>) -> () loc("<stdin>":21:7)
    }) : (!async.token, !async.value<memref<?xi32>>) -> (!async.token, !async.value<memref<?xi32>>) loc("<stdin>":17:12)
    %8:2 = "async.execute"(%6#0, %6#1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: memref<?xi32> loc("<stdin>":24:10)):
      %13 = "gpu.alloc"(%2) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (index) -> memref<?xi32> loc("<stdin>":25:13)
      "gpu.memcpy"(%13, %arg14) : (memref<?xi32>, memref<?xi32>) -> () loc("<stdin>":26:7)
      "async.yield"(%13) : (memref<?xi32>) -> () loc("<stdin>":27:7)
    }) : (!async.token, !async.value<memref<?xi32>>) -> (!async.token, !async.value<memref<?xi32>>) loc("<stdin>":23:12)
    %9 = "async.execute"(%7#0, %8#0, %7#1, %8#1) <{operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg0: memref<?xi32> loc("<stdin>":30:10), %arg1: memref<?xi32> loc("<stdin>":30:32)):
      "gpu.launch"(%1, %1, %1, %2, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
      ^bb0(%arg2: index loc("<stdin>":32:12), %arg3: index loc("<stdin>":32:26), %arg4: index loc("<stdin>":32:40), %arg5: index loc("<stdin>":32:54), %arg6: index loc("<stdin>":32:68), %arg7: index loc("<stdin>":32:82), %arg8: index loc("<stdin>":32:96), %arg9: index loc("<stdin>":32:110), %arg10: index loc("<stdin>":32:124), %arg11: index loc("<stdin>":32:139), %arg12: index loc("<stdin>":32:154), %arg13: index loc("<stdin>":32:169)):
        %10 = "memref.load"(%arg0, %arg5) : (memref<?xi32>, index) -> i32 loc("<stdin>":33:15)
        %11 = "memref.load"(%arg1, %arg5) : (memref<?xi32>, index) -> i32 loc("<stdin>":34:15)
        %12 = "arith.addi"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":35:15)
        "memref.store"(%12, %3, %arg5) : (i32, memref<?xi32>, index) -> () loc("<stdin>":36:9)
        "gpu.terminator"() : () -> () loc("<stdin>":37:9)
      }) : (index, index, index, index, index, index) -> () loc("<stdin>":31:7)
      "async.yield"() : () -> () loc("<stdin>":39:7)
    }) : (!async.token, !async.token, !async.value<memref<?xi32>>, !async.value<memref<?xi32>>) -> !async.token loc("<stdin>":29:10)
    "async.await"(%9) : (!async.token) -> () loc("<stdin>":41:5)
    "func.call"(%4) <{callee = @printMemrefI32}> : (memref<*xi32>) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":45:3)
}) : () -> () loc("<stdin>":1:1)
