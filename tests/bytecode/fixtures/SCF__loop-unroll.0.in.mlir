"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<?xf32>) -> (), sym_name = "dynamic_loop_unroll"}> ({
  ^bb0(%arg33: index loc("<stdin>":5:8), %arg34: index loc("<stdin>":5:23), %arg35: index loc("<stdin>":5:38), %arg36: memref<?xf32> loc("<stdin>":5:53)):
    %31 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:11)
    "scf.for"(%arg33, %arg34, %arg35) ({
    ^bb0(%arg37: index loc("<stdin>":8:10)):
      "memref.store"(%31, %arg36, %arg37) : (f32, memref<?xf32>, index) -> () loc("<stdin>":9:7)
      "scf.yield"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (index, index, index, index, index, index, memref<?xf32>) -> (), sym_name = "dynamic_loop_unroll_outer_by_2"}> ({
  ^bb0(%arg24: index loc("<stdin>":15:8), %arg25: index loc("<stdin>":15:23), %arg26: index loc("<stdin>":15:38), %arg27: index loc("<stdin>":15:53), %arg28: index loc("<stdin>":15:68), %arg29: index loc("<stdin>":15:83), %arg30: memref<?xf32> loc("<stdin>":15:98)):
    %30 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":16:11)
    "scf.for"(%arg24, %arg25, %arg26) ({
    ^bb0(%arg31: index loc("<stdin>":18:10)):
      "scf.for"(%arg27, %arg28, %arg29) ({
      ^bb0(%arg32: index loc("<stdin>":20:12)):
        "memref.store"(%30, %arg30, %arg32) : (f32, memref<?xf32>, index) -> () loc("<stdin>":21:9)
        "scf.yield"() : () -> () loc("<stdin>":22:9)
      }) : (index, index, index) -> () loc("<stdin>":19:7)
      "scf.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (index, index, index, index, index, index, memref<?xf32>) -> (), sym_name = "dynamic_loop_unroll_inner_by_2"}> ({
  ^bb0(%arg15: index loc("<stdin>":29:8), %arg16: index loc("<stdin>":29:23), %arg17: index loc("<stdin>":29:38), %arg18: index loc("<stdin>":29:53), %arg19: index loc("<stdin>":29:68), %arg20: index loc("<stdin>":29:83), %arg21: memref<?xf32> loc("<stdin>":29:98)):
    %29 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":30:11)
    "scf.for"(%arg15, %arg16, %arg17) ({
    ^bb0(%arg22: index loc("<stdin>":32:10)):
      "scf.for"(%arg18, %arg19, %arg20) ({
      ^bb0(%arg23: index loc("<stdin>":34:12)):
        "memref.store"(%29, %arg21, %arg23) : (f32, memref<?xf32>, index) -> () loc("<stdin>":35:9)
        "scf.yield"() : () -> () loc("<stdin>":36:9)
      }) : (index, index, index) -> () loc("<stdin>":33:7)
      "scf.yield"() : () -> () loc("<stdin>":38:7)
    }) : (index, index, index) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_2"}> ({
  ^bb0(%arg13: memref<?xf32> loc("<stdin>":43:8)):
    %25 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":44:11)
    %26 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":45:11)
    %27 = "arith.constant"() <{value = 20 : index}> : () -> index loc("<stdin>":46:11)
    %28 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":47:11)
    "scf.for"(%26, %27, %28) ({
    ^bb0(%arg14: index loc("<stdin>":49:10)):
      "memref.store"(%25, %arg13, %arg14) : (f32, memref<?xf32>, index) -> () loc("<stdin>":50:7)
      "scf.yield"() : () -> () loc("<stdin>":51:7)
    }) : (index, index, index) -> () loc("<stdin>":48:5)
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_step_2_unroll_by_2"}> ({
  ^bb0(%arg11: memref<?xf32> loc("<stdin>":56:8)):
    %21 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":57:11)
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":58:11)
    %23 = "arith.constant"() <{value = 19 : index}> : () -> index loc("<stdin>":59:11)
    %24 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":60:11)
    "scf.for"(%22, %23, %24) ({
    ^bb0(%arg12: index loc("<stdin>":62:10)):
      "memref.store"(%21, %arg11, %arg12) : (f32, memref<?xf32>, index) -> () loc("<stdin>":63:7)
      "scf.yield"() : () -> () loc("<stdin>":64:7)
    }) : (index, index, index) -> () loc("<stdin>":61:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_3"}> ({
  ^bb0(%arg9: memref<?xf32> loc("<stdin>":69:8)):
    %17 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":70:11)
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":71:11)
    %19 = "arith.constant"() <{value = 20 : index}> : () -> index loc("<stdin>":72:11)
    %20 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":73:11)
    "scf.for"(%18, %19, %20) ({
    ^bb0(%arg10: index loc("<stdin>":75:10)):
      "memref.store"(%17, %arg9, %arg10) : (f32, memref<?xf32>, index) -> () loc("<stdin>":76:7)
      "scf.yield"() : () -> () loc("<stdin>":77:7)
    }) : (index, index, index) -> () loc("<stdin>":74:5)
    "func.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_3_promote_epilogue"}> ({
  ^bb0(%arg7: memref<?xf32> loc("<stdin>":82:8)):
    %13 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":83:11)
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":84:11)
    %15 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":85:11)
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":86:11)
    "scf.for"(%14, %15, %16) ({
    ^bb0(%arg8: index loc("<stdin>":88:10)):
      "memref.store"(%13, %arg7, %arg8) : (f32, memref<?xf32>, index) -> () loc("<stdin>":89:7)
      "scf.yield"() : () -> () loc("<stdin>":90:7)
    }) : (index, index, index) -> () loc("<stdin>":87:5)
    "func.return"() : () -> () loc("<stdin>":92:5)
  }) : () -> () loc("<stdin>":81:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_up_to_factor"}> ({
  ^bb0(%arg5: memref<?xf32> loc("<stdin>":95:8)):
    %10 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":96:11)
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":97:11)
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":98:11)
    "affine.for"(%11, %12) <{lowerBoundMap = affine_map<()[s0] -> (s0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg6: index loc("<stdin>":100:10)):
      "affine.store"(%10, %arg5, %arg6) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<?xf32>, index) -> () loc("<stdin>":101:7)
      "affine.yield"() : () -> () loc("<stdin>":102:7)
    }) : (index, index) -> () loc("<stdin>":99:5)
    "func.return"() : () -> () loc("<stdin>":104:5)
  }) : () -> () loc("<stdin>":94:3)
  "func.func"() <{function_type = () -> (f32, f32), sym_name = "static_loop_unroll_by_3_rename_epilogue_arguments"}> ({
    %3 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":107:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":108:10)
    %5 = "arith.constant"() <{value = 20 : index}> : () -> index loc("<stdin>":109:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":110:10)
    %7:2 = "scf.for"(%4, %5, %6, %3, %3) ({
    ^bb0(%arg2: index loc("<stdin>":112:10), %arg3: f32 loc("<stdin>":112:24), %arg4: f32 loc("<stdin>":112:36)):
      %8 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":113:12)
      %9 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":114:12)
      "scf.yield"(%8, %9) : (f32, f32) -> () loc("<stdin>":115:7)
    }) : (index, index, index, f32, f32) -> (f32, f32) loc("<stdin>":111:12)
    "func.return"(%7#0, %7#1) : (f32, f32) -> () loc("<stdin>":117:5)
  }) : () -> () loc("<stdin>":106:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "static_loop_unroll_by_5_with_cleanup"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":120:8)):
    %0 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":121:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":122:10)
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":123:10)
    "affine.for"(%1, %2) <{lowerBoundMap = affine_map<()[s0] -> (s0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg1: index loc("<stdin>":125:10)):
      "memref.store"(%0, %arg0, %arg1) : (f32, memref<?xf32>, index) -> () loc("<stdin>":126:7)
      "affine.yield"() : () -> () loc("<stdin>":127:7)
    }) : (index, index) -> () loc("<stdin>":124:5)
    "func.return"() : () -> () loc("<stdin>":129:5)
  }) : () -> () loc("<stdin>":119:3)
}) : () -> () loc("<stdin>":3:1)
