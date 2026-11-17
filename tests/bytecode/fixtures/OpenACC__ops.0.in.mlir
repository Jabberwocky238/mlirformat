"builtin.module"() ({
  "func.func"() <{function_type = (memref<10x10xf32>, memref<10x10xf32>, memref<10x10xf32>) -> memref<10x10xf32>, sym_name = "compute1"}> ({
  ^bb0(%arg0: memref<10x10xf32> loc("<stdin>":3:8), %arg1: memref<10x10xf32> loc("<stdin>":3:34), %arg2: memref<10x10xf32> loc("<stdin>":3:60)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    "acc.parallel"(%3) <{asyncOperandsDeviceType = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.loop"(%0, %0, %0, %1, %1, %1, %2, %2, %2) <{collapse = [3], collapseDeviceType = [#acc.device_type<none>], gang = [#acc.device_type<none>], inclusiveUpperbound = array<i1: true, true, true>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0>, vector = [#acc.device_type<none>]}> ({
      ^bb0(%arg3: index loc("<stdin>":10:12), %arg4: index loc("<stdin>":10:26), %arg5: index loc("<stdin>":10:40)):
        %4 = "memref.load"(%arg0, %arg3, %arg5) : (memref<10x10xf32>, index, index) -> f32 loc("<stdin>":11:14)
        %5 = "memref.load"(%arg1, %arg5, %arg4) : (memref<10x10xf32>, index, index) -> f32 loc("<stdin>":12:14)
        %6 = "memref.load"(%arg2, %arg3, %arg4) : (memref<10x10xf32>, index, index) -> f32 loc("<stdin>":13:14)
        %7 = "arith.mulf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:14)
        %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:14)
        "memref.store"(%8, %arg2, %arg3, %arg4) : (f32, memref<10x10xf32>, index, index) -> () loc("<stdin>":16:9)
        "acc.yield"() : () -> () loc("<stdin>":17:9)
      }) : (index, index, index, index, index, index, index, index, index) -> () loc("<stdin>":9:7)
      "acc.yield"() : () -> () loc("<stdin>":19:7)
    }) : (i64) -> () loc("<stdin>":8:5)
    "func.return"(%arg2) : (memref<10x10xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
