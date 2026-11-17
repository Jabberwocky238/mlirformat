"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<8x16xf32>) -> tensor<16x16xf32>, sym_name = "matmul_static"}> ({
  ^bb0(%arg35: tensor<16x8xf32> loc("<stdin>":9:8), %arg36: tensor<8x16xf32> loc("<stdin>":9:34)):
    %46 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":10:11)
    %47 = "tensor.empty"() : () -> tensor<16x16xf32> loc("<stdin>":11:11)
    %48 = "linalg.fill"(%46, %47) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg40: f32 loc("<stdin>":13:10), %arg41: f32 loc("<stdin>":13:23)):
      "linalg.yield"(%arg40) : (f32) -> () loc("<stdin>":14:7)
    }) : (f32, tensor<16x16xf32>) -> tensor<16x16xf32> loc("<stdin>":12:11)
    %49 = "linalg.matmul"(%arg35, %arg36, %48) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg37: f32 loc("<stdin>":17:10), %arg38: f32 loc("<stdin>":17:23), %arg39: f32 loc("<stdin>":17:36)):
      %50 = "arith.mulf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      %51 = "arith.addf"(%arg39, %50) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":19:13)
      "linalg.yield"(%51) : (f32) -> () loc("<stdin>":20:7)
    }) : (tensor<16x8xf32>, tensor<8x16xf32>, tensor<16x16xf32>) -> tensor<16x16xf32> loc("<stdin>":16:11)
    "func.return"(%49) : (tensor<16x16xf32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_dynamic"}> ({
  ^bb0(%arg28: tensor<?x?xf32> loc("<stdin>":25:8), %arg29: tensor<?x?xf32> loc("<stdin>":25:33)):
    %36 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":26:11)
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:11)
    %38 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":28:11)
    %39 = "tensor.dim"(%arg28, %37) : (tensor<?x?xf32>, index) -> index loc("<stdin>":29:11)
    %40 = "tensor.dim"(%arg29, %38) : (tensor<?x?xf32>, index) -> index loc("<stdin>":30:11)
    %41 = "tensor.empty"(%39, %40) : (index, index) -> tensor<?x?xf32> loc("<stdin>":31:11)
    %42 = "linalg.fill"(%36, %41) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg33: f32 loc("<stdin>":33:10), %arg34: f32 loc("<stdin>":33:23)):
      "linalg.yield"(%arg33) : (f32) -> () loc("<stdin>":34:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":32:11)
    %43 = "linalg.matmul"(%arg28, %arg29, %42) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg30: f32 loc("<stdin>":37:10), %arg31: f32 loc("<stdin>":37:23), %arg32: f32 loc("<stdin>":37:36)):
      %44 = "arith.mulf"(%arg30, %arg31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":38:13)
      %45 = "arith.addf"(%arg32, %44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":39:13)
      "linalg.yield"(%45) : (f32) -> () loc("<stdin>":40:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":36:11)
    "func.return"(%43) : (tensor<?x?xf32>) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (tensor<?x8xf32>, tensor<8x16xf32>) -> tensor<?x16xf32>, sym_name = "matmul_mixed"}> ({
  ^bb0(%arg21: tensor<?x8xf32> loc("<stdin>":45:8), %arg22: tensor<8x16xf32> loc("<stdin>":45:33)):
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":46:11)
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":47:11)
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":48:11)
    %30 = "tensor.dim"(%arg21, %28) : (tensor<?x8xf32>, index) -> index loc("<stdin>":49:11)
    %31 = "tensor.empty"(%30) : (index) -> tensor<?x16xf32> loc("<stdin>":50:11)
    %32 = "linalg.fill"(%27, %31) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32 loc("<stdin>":52:10), %arg27: f32 loc("<stdin>":52:23)):
      "linalg.yield"(%arg26) : (f32) -> () loc("<stdin>":53:7)
    }) : (f32, tensor<?x16xf32>) -> tensor<?x16xf32> loc("<stdin>":51:11)
    %33 = "linalg.matmul"(%arg21, %arg22, %32) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32 loc("<stdin>":56:10), %arg24: f32 loc("<stdin>":56:23), %arg25: f32 loc("<stdin>":56:36)):
      %34 = "arith.mulf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":57:13)
      %35 = "arith.addf"(%arg25, %34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":58:13)
      "linalg.yield"(%35) : (f32) -> () loc("<stdin>":59:7)
    }) : (tensor<?x8xf32>, tensor<8x16xf32>, tensor<?x16xf32>) -> tensor<?x16xf32> loc("<stdin>":55:11)
    "func.return"(%33) : (tensor<?x16xf32>) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (tensor<2x16x8xf32>, tensor<2x8x16xf32>) -> tensor<2x16x16xf32>, sym_name = "batch_matmul_static"}> ({
  ^bb0(%arg14: tensor<2x16x8xf32> loc("<stdin>":64:8), %arg15: tensor<2x8x16xf32> loc("<stdin>":64:36)):
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":65:11)
    %22 = "tensor.empty"() : () -> tensor<2x16x16xf32> loc("<stdin>":66:11)
    %23 = "linalg.fill"(%21, %22) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32 loc("<stdin>":68:10), %arg20: f32 loc("<stdin>":68:23)):
      "linalg.yield"(%arg19) : (f32) -> () loc("<stdin>":69:7)
    }) : (f32, tensor<2x16x16xf32>) -> tensor<2x16x16xf32> loc("<stdin>":67:11)
    %24 = "linalg.batch_matmul"(%arg14, %arg15, %23) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32 loc("<stdin>":72:10), %arg17: f32 loc("<stdin>":72:23), %arg18: f32 loc("<stdin>":72:36)):
      %25 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":73:13)
      %26 = "arith.addf"(%arg18, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":74:13)
      "linalg.yield"(%26) : (f32) -> () loc("<stdin>":75:7)
    }) : (tensor<2x16x8xf32>, tensor<2x8x16xf32>, tensor<2x16x16xf32>) -> tensor<2x16x16xf32> loc("<stdin>":71:11)
    "func.return"(%24) : (tensor<2x16x16xf32>) -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "batch_matmul_dynamic"}> ({
  ^bb0(%arg7: tensor<?x?x?xf32> loc("<stdin>":80:8), %arg8: tensor<?x?x?xf32> loc("<stdin>":80:34)):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":81:10)
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":82:11)
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":83:11)
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":84:11)
    %13 = "tensor.dim"(%arg7, %10) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":85:11)
    %14 = "tensor.dim"(%arg7, %11) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":86:11)
    %15 = "tensor.dim"(%arg8, %12) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":87:11)
    %16 = "tensor.empty"(%13, %14, %15) : (index, index, index) -> tensor<?x?x?xf32> loc("<stdin>":88:11)
    %17 = "linalg.fill"(%9, %16) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":90:10), %arg13: f32 loc("<stdin>":90:23)):
      "linalg.yield"(%arg12) : (f32) -> () loc("<stdin>":91:7)
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":89:11)
    %18 = "linalg.batch_matmul"(%arg7, %arg8, %17) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":94:10), %arg10: f32 loc("<stdin>":94:22), %arg11: f32 loc("<stdin>":94:35)):
      %19 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":95:13)
      %20 = "arith.addf"(%arg11, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":96:13)
      "linalg.yield"(%20) : (f32) -> () loc("<stdin>":97:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":93:11)
    "func.return"(%18) : (tensor<?x?x?xf32>) -> () loc("<stdin>":99:5)
  }) : () -> () loc("<stdin>":79:3)
  "func.func"() <{function_type = (tensor<2x?x8xf32>, tensor<2x8x16xf32>) -> tensor<2x?x16xf32>, sym_name = "batch_matmul_mixed"}> ({
  ^bb0(%arg0: tensor<2x?x8xf32> loc("<stdin>":102:8), %arg1: tensor<2x8x16xf32> loc("<stdin>":102:34)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":103:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":104:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":105:10)
    %3 = "tensor.dim"(%arg0, %2) : (tensor<2x?x8xf32>, index) -> index loc("<stdin>":106:10)
    %4 = "tensor.empty"(%3) : (index) -> tensor<2x?x16xf32> loc("<stdin>":107:10)
    %5 = "linalg.fill"(%0, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":109:10), %arg6: f32 loc("<stdin>":109:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":110:7)
    }) : (f32, tensor<2x?x16xf32>) -> tensor<2x?x16xf32> loc("<stdin>":108:10)
    %6 = "linalg.batch_matmul"(%arg0, %arg1, %5) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":113:10), %arg3: f32 loc("<stdin>":113:22), %arg4: f32 loc("<stdin>":113:34)):
      %7 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":114:12)
      %8 = "arith.addf"(%arg4, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":115:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":116:7)
    }) : (tensor<2x?x8xf32>, tensor<2x8x16xf32>, tensor<2x?x16xf32>) -> tensor<2x?x16xf32> loc("<stdin>":112:10)
    "func.return"(%6) : (tensor<2x?x16xf32>) -> () loc("<stdin>":118:5)
  }) : () -> () loc("<stdin>":101:3)
}) : () -> () loc("<stdin>":7:1)
