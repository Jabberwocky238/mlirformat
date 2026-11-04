"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "single_loop_tile"}> ({
  ^bb0(%arg5: memref<10xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 10 : index}> : () -> index
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "arith.constant"() <{value = 2 : index}> : () -> index
    "acc.loop"(%15, %16, %17, %18) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg6: index):
      %19 = "arith.index_castui"(%arg6) : (index) -> i32
      %20 = "arith.sitofp"(%19) : (i32) -> f32
      "memref.store"(%20, %arg5, %arg6) : (f32, memref<10xf32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "nested_loop_tile"}> ({
  ^bb0(%arg2: memref<100x50xf32>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 100 : index}> : () -> index
    %8 = "arith.constant"() <{value = 50 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 4 : index}> : () -> index
    %11 = "arith.constant"() <{value = 8 : index}> : () -> index
    "acc.loop"(%6, %6, %7, %8, %9, %9, %10, %11) <{gang = [#acc.device_type<none>], independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>, vector = [#acc.device_type<none>]}> ({
    ^bb0(%arg3: index, %arg4: index):
      %12 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.index_castui"(%12) : (index) -> i32
      %14 = "arith.sitofp"(%13) : (i32) -> f32
      "memref.store"(%14, %arg2, %arg3, %arg4) : (f32, memref<100x50xf32>, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000xf32>) -> (), sym_name = "unknown_tile_size"}> ({
  ^bb0(%arg0: memref<1000xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "acc.loop"(%0, %1, %2, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg1: index):
      %4 = "arith.index_castui"(%arg1) : (index) -> i32
      %5 = "arith.sitofp"(%4) : (i32) -> f32
      "memref.store"(%5, %arg0, %arg1) : (f32, memref<1000xf32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

