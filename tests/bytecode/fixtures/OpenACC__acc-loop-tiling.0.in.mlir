"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "single_loop_tile"}> ({
  ^bb0(%arg14: memref<10xf32> loc("<stdin>":3:8)):
    %47 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %48 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":5:11)
    %49 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    %50 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":7:11)
    "acc.loop"(%47, %48, %49, %50) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg15: index loc("<stdin>":9:10)):
      %51 = "arith.index_castui"(%arg15) : (index) -> i32 loc("<stdin>":10:13)
      %52 = "arith.sitofp"(%51) : (i32) -> f32 loc("<stdin>":11:13)
      "memref.store"(%52, %arg14, %arg15) : (f32, memref<10xf32>, index) -> () loc("<stdin>":12:7)
      "acc.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "nested_loop_tile"}> ({
  ^bb0(%arg11: memref<100x50xf32> loc("<stdin>":18:8)):
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:11)
    %39 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":20:11)
    %40 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":21:11)
    %41 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:11)
    %42 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":23:11)
    %43 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":24:11)
    "acc.loop"(%38, %38, %39, %40, %41, %41, %42, %43) <{gang = [#acc.device_type<none>], independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>, vector = [#acc.device_type<none>]}> ({
    ^bb0(%arg12: index loc("<stdin>":26:10), %arg13: index loc("<stdin>":26:25)):
      %44 = "arith.addi"(%arg12, %arg13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":27:13)
      %45 = "arith.index_castui"(%44) : (index) -> i32 loc("<stdin>":28:13)
      %46 = "arith.sitofp"(%45) : (i32) -> f32 loc("<stdin>":29:13)
      "memref.store"(%46, %arg11, %arg12, %arg13) : (f32, memref<100x50xf32>, index, index) -> () loc("<stdin>":30:7)
      "acc.yield"() : () -> () loc("<stdin>":31:7)
    }) : (index, index, index, index, index, index, index, index) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "gang_static_with_multi_dim_tile"}> ({
  ^bb0(%arg8: memref<100x50xf32> loc("<stdin>":36:8)):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":37:11)
    %29 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":38:11)
    %30 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":39:11)
    %31 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":40:11)
    %32 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":41:11)
    %33 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":42:11)
    %34 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":43:11)
    "acc.loop"(%28, %28, %29, %30, %31, %31, %34, %32, %33) <{gang = [], gangOperandsArgType = [#acc.gang_arg_type<Static>], gangOperandsDeviceType = [#acc.device_type<none>], gangOperandsSegments = array<i32: 1>, independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 1, 0, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>}> ({
    ^bb0(%arg9: index loc("<stdin>":45:10), %arg10: index loc("<stdin>":45:24)):
      %35 = "arith.addi"(%arg9, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":46:13)
      %36 = "arith.index_castui"(%35) : (index) -> i32 loc("<stdin>":47:13)
      %37 = "arith.sitofp"(%36) : (i32) -> f32 loc("<stdin>":48:13)
      "memref.store"(%37, %arg8, %arg9, %arg10) : (f32, memref<100x50xf32>, index, index) -> () loc("<stdin>":49:7)
      "acc.yield"() : () -> () loc("<stdin>":50:7)
    }) : (index, index, index, index, index, index, i32, index, index) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<100x50xf32>) -> (), sym_name = "worker_num_with_multi_dim_tile"}> ({
  ^bb0(%arg5: memref<100x50xf32> loc("<stdin>":55:8)):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":56:11)
    %19 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":57:11)
    %20 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":58:11)
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":59:11)
    %22 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":60:11)
    %23 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":61:11)
    %24 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":62:11)
    "acc.loop"(%18, %18, %19, %20, %21, %21, %24, %22, %23) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 2, 2, 2, 0, 1, 0, 2, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 2>, vector = [#acc.device_type<none>], workerNumOperandsDeviceType = [#acc.device_type<none>]}> ({
    ^bb0(%arg6: index loc("<stdin>":64:10), %arg7: index loc("<stdin>":64:24)):
      %25 = "arith.addi"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":65:13)
      %26 = "arith.index_castui"(%25) : (index) -> i32 loc("<stdin>":66:13)
      %27 = "arith.sitofp"(%26) : (i32) -> f32 loc("<stdin>":67:13)
      "memref.store"(%27, %arg5, %arg6, %arg7) : (f32, memref<100x50xf32>, index, index) -> () loc("<stdin>":68:7)
      "acc.yield"() : () -> () loc("<stdin>":69:7)
    }) : (index, index, index, index, index, index, i32, index, index) -> () loc("<stdin>":63:5)
    "func.return"() : () -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":54:3)
  "func.func"() <{function_type = (memref<1000xf32>) -> (), sym_name = "unknown_tile_size"}> ({
  ^bb0(%arg3: memref<1000xf32> loc("<stdin>":74:8)):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":75:11)
    %13 = "arith.constant"() <{value = 1000 : index}> : () -> index loc("<stdin>":76:11)
    %14 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":77:11)
    %15 = "arith.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":78:11)
    "acc.loop"(%12, %13, %14, %15) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg4: index loc("<stdin>":80:10)):
      %16 = "arith.index_castui"(%arg4) : (index) -> i32 loc("<stdin>":81:13)
      %17 = "arith.sitofp"(%16) : (i32) -> f32 loc("<stdin>":82:13)
      "memref.store"(%17, %arg3, %arg4) : (f32, memref<1000xf32>, index) -> () loc("<stdin>":83:7)
      "acc.yield"() : () -> () loc("<stdin>":84:7)
    }) : (index, index, index, i32) -> () loc("<stdin>":79:5)
    "func.return"() : () -> () loc("<stdin>":86:5)
  }) : () -> () loc("<stdin>":73:3)
  "func.func"() <{function_type = () -> (), sym_name = "no_tile_values"}> ({
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":89:10)
    %10 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":90:11)
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":91:11)
    "acc.loop"(%9, %10, %11) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":93:10)):
      "acc.yield"() : () -> () loc("<stdin>":94:7)
    }) : (index, index, index) -> () loc("<stdin>":92:5)
    "func.return"() : () -> () loc("<stdin>":96:5)
  }) : () -> () loc("<stdin>":88:3)
  "func.func"() <{function_type = (memref<10xi32>) -> (), sym_name = "body_with_nested_region"}> ({
  ^bb0(%arg0: memref<10xi32> loc("<stdin>":99:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":100:10)
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":101:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":102:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":103:10)
    "acc.loop"(%0, %1, %2, %3) <{independent = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0>, tileOperandsDeviceType = [#acc.device_type<none>], tileOperandsSegments = array<i32: 1>}> ({
    ^bb0(%arg1: index loc("<stdin>":105:10)):
      %4 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":106:12)
      %5 = "arith.cmpi"(%arg1, %4) <{predicate = 6 : i64}> : (index, index) -> i1 loc("<stdin>":107:12)
      %6 = "scf.if"(%5) ({
        %8 = "arith.index_castui"(%arg1) : (index) -> i32 loc("<stdin>":109:14)
        "scf.yield"(%8) : (i32) -> () loc("<stdin>":110:9)
      }, {
        %7 = "arith.constant"() <{value = 99 : i32}> : () -> i32 loc("<stdin>":112:14)
        "scf.yield"(%7) : (i32) -> () loc("<stdin>":113:9)
      }) : (i1) -> i32 loc("<stdin>":108:12)
      "memref.store"(%6, %arg0, %arg1) : (i32, memref<10xi32>, index) -> () loc("<stdin>":115:7)
      "acc.yield"() : () -> () loc("<stdin>":116:7)
    }) : (index, index, index, index) -> () loc("<stdin>":104:5)
    "func.return"() : () -> () loc("<stdin>":118:5)
  }) : () -> () loc("<stdin>":98:3)
}) : () -> () loc("<stdin>":1:1)
