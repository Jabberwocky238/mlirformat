"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "single_loop_remark"}> ({
  ^bb0(%arg8: memref<100xf32>):
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "arith.constant"() <{value = 100 : index}> : () -> index
    %24 = "arith.constant"() <{value = 1 : index}> : () -> index
    %25 = "arith.constant"() <{value = 4 : index}> : () -> index
    "acc.loop"(%22, %23, %24, %25) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg9: index):
      %26 = "arith.index_castui"(%arg9) : (index) -> i32
      %27 = "arith.sitofp"(%26) : (i32) -> f32
      "memref.store"(%27, %arg8, %arg9) : (f32, memref<100xf32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "nested_loop_remark"}> ({
  ^bb0(%arg5: memref<100x50xf32>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 100 : index}> : () -> index
    %15 = "arith.constant"() <{value = 50 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    %17 = "arith.constant"() <{value = 8 : index}> : () -> index
    %18 = "arith.constant"() <{value = 16 : index}> : () -> index
    "acc.loop"(%13, %13, %14, %15, %16, %16, %17, %18) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %19 = "arith.addi"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %20 = "arith.index_castui"(%19) : (index) -> i32
      %21 = "arith.sitofp"(%20) : (i32) -> f32
      "memref.store"(%21, %arg5, %arg6, %arg7) : (f32, memref<100x50xf32>, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000xf32>) -> (), sym_name = "unknown_tile_remark"}> ({
  ^bb0(%arg3: memref<1000xf32>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "acc.loop"(%7, %8, %9, %10) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg4: index):
      %11 = "arith.index_castui"(%arg4) : (index) -> i32
      %12 = "arith.sitofp"(%11) : (i32) -> f32
      "memref.store"(%12, %arg3, %arg4) : (f32, memref<1000xf32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x100xf32>) -> (), sym_name = "multiple_unknown_tiles_remark"}> ({
  ^bb0(%arg0: memref<100x100xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "acc.loop"(%0, %0, %1, %1, %2, %2, %3, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg1: index, %arg2: index):
      %4 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "arith.index_castui"(%4) : (index) -> i32
      %6 = "arith.sitofp"(%5) : (i32) -> f32
      "memref.store"(%6, %arg0, %arg1, %arg2) : (f32, memref<100x100xf32>, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index, index, index, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

