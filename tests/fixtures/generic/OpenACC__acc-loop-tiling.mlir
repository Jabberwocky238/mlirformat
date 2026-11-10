"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "single_loop_tile"}> ({
  ^bb0(%arg14: memref<10xf32>):
    %47 = "arith.constant"() <{value = 0 : index}> : () -> index
    %48 = "arith.constant"() <{value = 10 : index}> : () -> index
    %49 = "arith.constant"() <{value = 1 : index}> : () -> index
    %50 = "arith.constant"() <{value = 2 : index}> : () -> index
    "acc.loop"(%47, %48, %49, %50) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg15: index):
      %51 = "arith.index_castui"(%arg15) : (index) -> i32
      %52 = "arith.sitofp"(%51) : (i32) -> f32
      "memref.store"(%52, %arg14, %arg15) : (f32, memref<10xf32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "nested_loop_tile"}> ({
  ^bb0(%arg11: memref<100x50xf32>):
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index
    %39 = "arith.constant"() <{value = 100 : index}> : () -> index
    %40 = "arith.constant"() <{value = 50 : index}> : () -> index
    %41 = "arith.constant"() <{value = 1 : index}> : () -> index
    %42 = "arith.constant"() <{value = 4 : index}> : () -> index
    %43 = "arith.constant"() <{value = 8 : index}> : () -> index
    "acc.loop"(%38, %38, %39, %40, %41, %41, %42, %43) <{gang = [#acc.device_type<none>], independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>, vector = [#acc.device_type<none>]}> ({
    ^bb0(%arg12: index, %arg13: index):
      %44 = "arith.addi"(%arg12, %arg13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %45 = "arith.index_castui"(%44) : (index) -> i32
      %46 = "arith.sitofp"(%45) : (i32) -> f32
      "memref.store"(%46, %arg11, %arg12, %arg13) : (f32, memref<100x50xf32>, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "gang_static_with_multi_dim_tile"}> ({
  ^bb0(%arg8: memref<100x50xf32>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 100 : index}> : () -> index
    %30 = "arith.constant"() <{value = 50 : index}> : () -> index
    %31 = "arith.constant"() <{value = 1 : index}> : () -> index
    %32 = "arith.constant"() <{value = 4 : index}> : () -> index
    %33 = "arith.constant"() <{value = 8 : index}> : () -> index
    %34 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "acc.loop"(%28, %28, %29, %30, %31, %31, %34, %32, %33) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Static>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 1>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 1, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg9: index, %arg10: index):
      %35 = "arith.addi"(%arg9, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %36 = "arith.index_castui"(%35) : (index) -> i32
      %37 = "arith.sitofp"(%36) : (i32) -> f32
      "memref.store"(%37, %arg8, %arg9, %arg10) : (f32, memref<100x50xf32>, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index, index, index, i32, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "worker_num_with_multi_dim_tile"}> ({
  ^bb0(%arg5: memref<100x50xf32>):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 100 : index}> : () -> index
    %20 = "arith.constant"() <{value = 50 : index}> : () -> index
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index
    %22 = "arith.constant"() <{value = 4 : index}> : () -> index
    %23 = "arith.constant"() <{value = 8 : index}> : () -> index
    %24 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    "acc.loop"(%18, %18, %19, %20, %21, %21, %24, %22, %23) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 1, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>, vector = [#acc.device_type<none>], workerNumOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg6: index, %arg7: index):
      %25 = "arith.addi"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %26 = "arith.index_castui"(%25) : (index) -> i32
      %27 = "arith.sitofp"(%26) : (i32) -> f32
      "memref.store"(%27, %arg5, %arg6, %arg7) : (f32, memref<100x50xf32>, index, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index, index, index, i32, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000xf32>) -> (), sym_name = "unknown_tile_size"}> ({
  ^bb0(%arg3: memref<1000xf32>):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 1000 : index}> : () -> index
    %14 = "arith.constant"() <{value = 1 : index}> : () -> index
    %15 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "acc.loop"(%12, %13, %14, %15) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg4: index):
      %16 = "arith.index_castui"(%arg4) : (index) -> i32
      %17 = "arith.sitofp"(%16) : (i32) -> f32
      "memref.store"(%17, %arg3, %arg4) : (f32, memref<1000xf32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_tile_values"}> ({
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 10 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    "acc.loop"(%9, %10, %11) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index):
      "acc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xi32>) -> (), sym_name = "body_with_nested_region"}> ({
  ^bb0(%arg0: memref<10xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    "acc.loop"(%0, %1, %2, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg1: index):
      %4 = "arith.constant"() <{value = 5 : index}> : () -> index
      %5 = "arith.cmpi"(%arg1, %4) <{predicate = 6 : i64}> : (index, index) -> i1
      %6 = "scf.if"(%5) ({
        %8 = "arith.index_castui"(%arg1) : (index) -> i32
        "scf.yield"(%8) : (i32) -> ()
      }, {
        %7 = "arith.constant"() <{value = 99 : i32}> : () -> i32
        "scf.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      "memref.store"(%6, %arg0, %arg1) : (i32, memref<10xi32>, index) -> ()
      "acc.yield"() : () -> ()
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

