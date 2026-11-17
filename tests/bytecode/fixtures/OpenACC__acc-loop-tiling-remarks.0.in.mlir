"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "single_loop_remark"}> ({
  ^bb0(%arg8: memref<100xf32> loc("<stdin>":3:8)):
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %23 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":5:11)
    %24 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    %25 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":7:11)
    "acc.loop"(%22, %23, %24, %25) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg9: index loc("<stdin>":9:10)):
      %26 = "arith.index_castui"(%arg9) : (index) -> i32 loc("<stdin>":10:13)
      %27 = "arith.sitofp"(%26) : (i32) -> f32 loc("<stdin>":11:13)
      "memref.store"(%27, %arg8, %arg9) : (f32, memref<100xf32>, index) -> () loc("<stdin>":12:7)
      "acc.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "nested_loop_remark"}> ({
  ^bb0(%arg5: memref<100x50xf32> loc("<stdin>":18:8)):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:11)
    %14 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":20:11)
    %15 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":21:11)
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:11)
    %17 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":23:11)
    %18 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":24:11)
    "acc.loop"(%13, %13, %14, %15, %16, %16, %17, %18) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg6: index loc("<stdin>":26:10), %arg7: index loc("<stdin>":26:24)):
      %19 = "arith.addi"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":27:13)
      %20 = "arith.index_castui"(%19) : (index) -> i32 loc("<stdin>":28:13)
      %21 = "arith.sitofp"(%20) : (i32) -> f32 loc("<stdin>":29:13)
      "memref.store"(%21, %arg5, %arg6, %arg7) : (f32, memref<100x50xf32>, index, index) -> () loc("<stdin>":30:7)
      "acc.yield"() : () -> () loc("<stdin>":31:7)
    }) : (index, index, index, index, index, index, index, index) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<1000xf32>) -> (), sym_name = "unknown_tile_remark"}> ({
  ^bb0(%arg3: memref<1000xf32> loc("<stdin>":36:8)):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":37:10)
    %8 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":38:10)
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":39:10)
    %10 = "arith.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":40:11)
    "acc.loop"(%7, %8, %9, %10) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg4: index loc("<stdin>":42:10)):
      %11 = "arith.index_castui"(%arg4) : (index) -> i32 loc("<stdin>":43:13)
      %12 = "arith.sitofp"(%11) : (i32) -> f32 loc("<stdin>":44:13)
      "memref.store"(%12, %arg3, %arg4) : (f32, memref<1000xf32>, index) -> () loc("<stdin>":45:7)
      "acc.yield"() : () -> () loc("<stdin>":46:7)
    }) : (index, index, index, i32) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<100x100xf32>) -> (), sym_name = "multiple_unknown_tiles_remark"}> ({
  ^bb0(%arg0: memref<100x100xf32> loc("<stdin>":51:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":52:10)
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":53:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":54:10)
    %3 = "arith.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":55:10)
    "acc.loop"(%0, %0, %1, %1, %2, %2, %3, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg1: index loc("<stdin>":57:10), %arg2: index loc("<stdin>":57:24)):
      %4 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":58:12)
      %5 = "arith.index_castui"(%4) : (index) -> i32 loc("<stdin>":59:12)
      %6 = "arith.sitofp"(%5) : (i32) -> f32 loc("<stdin>":60:12)
      "memref.store"(%6, %arg0, %arg1, %arg2) : (f32, memref<100x100xf32>, index, index) -> () loc("<stdin>":61:7)
      "acc.yield"() : () -> () loc("<stdin>":62:7)
    }) : (index, index, index, index, index, index, i32, i32) -> () loc("<stdin>":56:5)
    "func.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":50:3)
}) : () -> () loc("<stdin>":1:1)
