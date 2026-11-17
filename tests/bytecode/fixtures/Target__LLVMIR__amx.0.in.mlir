"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> (), sym_name = "amx_tile_zero"}> ({
  ^bb0(%arg28: memref<?x?xf32> loc("<stdin>":3:8), %arg29: index loc("<stdin>":3:33)):
    %33 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32> loc("<stdin>":4:11)
    "x86.amx.tile_store"(%arg28, %arg29, %arg29, %33) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, index) -> (), sym_name = "amx_tile_load_store"}> ({
  ^bb0(%arg25: memref<?x?xi8> loc("<stdin>":9:8), %arg26: memref<?x?xi8> loc("<stdin>":9:32), %arg27: index loc("<stdin>":9:56)):
    %32 = "x86.amx.tile_load"(%arg25, %arg27, %arg27) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":10:11)
    "x86.amx.tile_store"(%arg26, %arg27, %arg27, %32) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x64xi8>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<?xi8>, memref<?xi8>, index, index) -> (), sym_name = "amx_tile_load_store_strided"}> ({
  ^bb0(%arg21: memref<?xi8> loc("<stdin>":15:8), %arg22: memref<?xi8> loc("<stdin>":15:30), %arg23: index loc("<stdin>":15:52), %arg24: index loc("<stdin>":15:67)):
    %31 = "x86.amx.tile_load"(%arg21, %arg23, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":16:11)
    "x86.amx.tile_store"(%arg22, %arg23, %31, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<?xi8>, index, !x86.amx.tile<16x64xi8>, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<?x?xbf16>, memref<?x?xbf16>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_bf16"}> ({
  ^bb0(%arg17: memref<?x?xbf16> loc("<stdin>":21:8), %arg18: memref<?x?xbf16> loc("<stdin>":21:34), %arg19: index loc("<stdin>":21:60), %arg20: memref<?x?xf32> loc("<stdin>":21:75)):
    %27 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32> loc("<stdin>":22:11)
    %28 = "x86.amx.tile_load"(%arg17, %arg19, %arg19) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":23:11)
    %29 = "x86.amx.tile_load"(%arg18, %arg19, %arg19) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":24:11)
    %30 = "x86.amx.tile_mulf"(%28, %29, %27) : (!x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":25:11)
    "x86.amx.tile_store"(%arg20, %arg19, %arg19, %30) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (memref<?x?xf16>, memref<?x?xf16>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_f16"}> ({
  ^bb0(%arg13: memref<?x?xf16> loc("<stdin>":30:8), %arg14: memref<?x?xf16> loc("<stdin>":30:33), %arg15: index loc("<stdin>":30:58), %arg16: memref<?x?xf32> loc("<stdin>":30:73)):
    %23 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32> loc("<stdin>":31:11)
    %24 = "x86.amx.tile_load"(%arg13, %arg15, %arg15) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf16>, index, index) -> !x86.amx.tile<16x32xf16> loc("<stdin>":32:11)
    %25 = "x86.amx.tile_load"(%arg14, %arg15, %arg15) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf16>, index, index) -> !x86.amx.tile<16x32xf16> loc("<stdin>":33:11)
    %26 = "x86.amx.tile_mulf"(%24, %25, %23) : (!x86.amx.tile<16x32xf16>, !x86.amx.tile<16x32xf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":34:11)
    "x86.amx.tile_store"(%arg16, %arg15, %arg15, %26) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":35:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<?x?xf8E4M3FN>, memref<?x?xf8E5M2>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_f8"}> ({
  ^bb0(%arg9: memref<?x?xf8E4M3FN> loc("<stdin>":39:8), %arg10: memref<?x?xf8E5M2> loc("<stdin>":39:37), %arg11: index loc("<stdin>":39:65), %arg12: memref<?x?xf32> loc("<stdin>":39:80)):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":40:11)
    %13 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":41:11)
    %14 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32> loc("<stdin>":42:11)
    %15 = "x86.amx.tile_load"(%arg9, %arg11, %arg11) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E4M3FN>, index, index) -> !x86.amx.tile<16x64xf8E4M3FN> loc("<stdin>":43:11)
    %16 = "x86.amx.tile_load"(%arg10, %arg11, %arg11) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E5M2>, index, index) -> !x86.amx.tile<16x64xf8E5M2> loc("<stdin>":44:11)
    %17 = "x86.amx.tile_load"(%arg9, %12, %12) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E4M3FN>, index, index) -> !x86.amx.tile<16x64xf8E4M3FN> loc("<stdin>":45:11)
    %18 = "x86.amx.tile_load"(%arg10, %12, %12) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E5M2>, index, index) -> !x86.amx.tile<16x64xf8E5M2> loc("<stdin>":46:11)
    %19 = "x86.amx.tile_mulf"(%15, %17, %14) : (!x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":47:11)
    %20 = "x86.amx.tile_mulf"(%15, %16, %14) : (!x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":48:11)
    %21 = "x86.amx.tile_mulf"(%16, %15, %14) : (!x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":49:11)
    %22 = "x86.amx.tile_mulf"(%16, %18, %14) : (!x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":50:11)
    "x86.amx.tile_store"(%arg12, %arg11, %12, %19) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":51:5)
    "x86.amx.tile_store"(%arg12, %arg11, %13, %20) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":52:5)
    "x86.amx.tile_store"(%arg12, %12, %arg11, %21) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":53:5)
    "x86.amx.tile_store"(%arg12, %13, %arg11, %22) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":54:5)
    "func.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, memref<?x?xi32>, index, memref<?x?xi8>) -> (), sym_name = "amx_tile_muli"}> ({
  ^bb0(%arg4: memref<?x?xi8> loc("<stdin>":58:8), %arg5: memref<?x?xi8> loc("<stdin>":58:31), %arg6: memref<?x?xi32> loc("<stdin>":58:54), %arg7: index loc("<stdin>":58:78), %arg8: memref<?x?xi8> loc("<stdin>":58:92)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":59:10)
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":60:10)
    %5 = "x86.amx.tile_load"(%arg4, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":61:10)
    %6 = "x86.amx.tile_load"(%arg5, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":62:10)
    %7 = "x86.amx.tile_load"(%arg6, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi32>, index, index) -> !x86.amx.tile<16x16xi32> loc("<stdin>":63:10)
    %8 = "x86.amx.tile_muli"(%5, %6, %7) <{isZextLhs, isZextRhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":64:10)
    %9 = "x86.amx.tile_muli"(%5, %6, %7) : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":65:10)
    %10 = "x86.amx.tile_muli"(%5, %6, %7) <{isZextLhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":66:11)
    %11 = "x86.amx.tile_muli"(%5, %6, %7) <{isZextRhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":67:11)
    "x86.amx.tile_store"(%arg8, %3, %3, %8) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> () loc("<stdin>":68:5)
    "x86.amx.tile_store"(%arg8, %3, %4, %9) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> () loc("<stdin>":69:5)
    "x86.amx.tile_store"(%arg8, %4, %3, %10) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> () loc("<stdin>":70:5)
    "x86.amx.tile_store"(%arg8, %4, %4, %11) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> () loc("<stdin>":71:5)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, index, i1) -> (), sym_name = "amx_tile_type_through_cf"}> ({
  ^bb0(%arg0: memref<?x?xi8> loc("<stdin>":75:8), %arg1: memref<?x?xi8> loc("<stdin>":75:31), %arg2: index loc("<stdin>":75:54), %arg3: i1 loc("<stdin>":75:68)):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":76:5)
  ^bb1:  // pred: ^bb0
    %0 = "x86.amx.tile_load"(%arg0, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":78:10)
    "cf.br"(%0)[^bb3] : (!x86.amx.tile<16x64xi8>) -> () loc("<stdin>":79:5)
  ^bb2:  // pred: ^bb0
    %1 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x64xi8> loc("<stdin>":81:10)
    "cf.br"(%1)[^bb3] : (!x86.amx.tile<16x64xi8>) -> () loc("<stdin>":82:5)
  ^bb3(%2: !x86.amx.tile<16x64xi8> loc("<stdin>":83:8)):  // 2 preds: ^bb1, ^bb2
    "cf.br"()[^bb4] : () -> () loc("<stdin>":84:5)
  ^bb4:  // pred: ^bb3
    "x86.amx.tile_store"(%arg1, %arg2, %arg2, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x64xi8>) -> () loc("<stdin>":86:5)
    "func.return"() : () -> () loc("<stdin>":87:5)
  }) : () -> () loc("<stdin>":74:3)
}) : () -> () loc("<stdin>":1:1)
