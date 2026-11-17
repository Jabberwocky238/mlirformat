"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x6xf32> loc("<stdin>":3:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":4:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32> loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    "gpu.launch"(%3, %3, %3, %3, %3, %3) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":8:10), %arg1: index loc("<stdin>":8:24), %arg2: index loc("<stdin>":8:38), %arg3: index loc("<stdin>":8:52), %arg4: index loc("<stdin>":8:66), %arg5: index loc("<stdin>":8:80), %arg6: index loc("<stdin>":8:94), %arg7: index loc("<stdin>":8:108), %arg8: index loc("<stdin>":8:122), %arg9: index loc("<stdin>":8:136), %arg10: index loc("<stdin>":8:150), %arg11: index loc("<stdin>":8:165)):
      %4 = "memref.load"(%0, %arg0, %arg3) : (memref<2x6xf32>, index, index) -> f32 loc("<stdin>":9:12)
      %5 = "gpu.all_reduce"(%4) <{op = #gpu<all_reduce_op add>, uniform}> ({
      }) : (f32) -> f32 loc("<stdin>":10:12)
      "memref.store"(%5, %1, %arg0) : (f32, memref<2xf32>, index) -> () loc("<stdin>":12:7)
      %6 = "gpu.all_reduce"(%4) <{op = #gpu<all_reduce_op mul>, uniform}> ({
      }) : (f32) -> f32 loc("<stdin>":13:12)
      "memref.store"(%6, %2, %arg0) : (f32, memref<2xf32>, index) -> () loc("<stdin>":15:7)
      "gpu.terminator"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
