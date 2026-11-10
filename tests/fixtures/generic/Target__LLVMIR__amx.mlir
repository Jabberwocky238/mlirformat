"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> (), sym_name = "amx_tile_zero"}> ({
  ^bb0(%arg28: memref<?x?xf32>, %arg29: index):
    %33 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32>
    "x86.amx.tile_store"(%arg28, %arg29, %arg29, %33) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, index) -> (), sym_name = "amx_tile_load_store"}> ({
  ^bb0(%arg25: memref<?x?xi8>, %arg26: memref<?x?xi8>, %arg27: index):
    %32 = "x86.amx.tile_load"(%arg25, %arg27, %arg27) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8>
    "x86.amx.tile_store"(%arg26, %arg27, %arg27, %32) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x64xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi8>, memref<?xi8>, index, index) -> (), sym_name = "amx_tile_load_store_strided"}> ({
  ^bb0(%arg21: memref<?xi8>, %arg22: memref<?xi8>, %arg23: index, %arg24: index):
    %31 = "x86.amx.tile_load"(%arg21, %arg23, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<?xi8>, index, index) -> !x86.amx.tile<16x64xi8>
    "x86.amx.tile_store"(%arg22, %arg23, %31, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<?xi8>, index, !x86.amx.tile<16x64xi8>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xbf16>, memref<?x?xbf16>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_bf16"}> ({
  ^bb0(%arg17: memref<?x?xbf16>, %arg18: memref<?x?xbf16>, %arg19: index, %arg20: memref<?x?xf32>):
    %27 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32>
    %28 = "x86.amx.tile_load"(%arg17, %arg19, %arg19) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !x86.amx.tile<16x32xbf16>
    %29 = "x86.amx.tile_load"(%arg18, %arg19, %arg19) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !x86.amx.tile<16x32xbf16>
    %30 = "x86.amx.tile_mulf"(%28, %29, %27) : (!x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32>
    "x86.amx.tile_store"(%arg20, %arg19, %arg19, %30) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf16>, memref<?x?xf16>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_f16"}> ({
  ^bb0(%arg13: memref<?x?xf16>, %arg14: memref<?x?xf16>, %arg15: index, %arg16: memref<?x?xf32>):
    %23 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32>
    %24 = "x86.amx.tile_load"(%arg13, %arg15, %arg15) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf16>, index, index) -> !x86.amx.tile<16x32xf16>
    %25 = "x86.amx.tile_load"(%arg14, %arg15, %arg15) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf16>, index, index) -> !x86.amx.tile<16x32xf16>
    %26 = "x86.amx.tile_mulf"(%24, %25, %23) : (!x86.amx.tile<16x32xf16>, !x86.amx.tile<16x32xf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32>
    "x86.amx.tile_store"(%arg16, %arg15, %arg15, %26) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf8E4M3FN>, memref<?x?xf8E5M2>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_f8"}> ({
  ^bb0(%arg9: memref<?x?xf8E4M3FN>, %arg10: memref<?x?xf8E5M2>, %arg11: index, %arg12: memref<?x?xf32>):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 16 : index}> : () -> index
    %14 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32>
    %15 = "x86.amx.tile_load"(%arg9, %arg11, %arg11) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E4M3FN>, index, index) -> !x86.amx.tile<16x64xf8E4M3FN>
    %16 = "x86.amx.tile_load"(%arg10, %arg11, %arg11) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E5M2>, index, index) -> !x86.amx.tile<16x64xf8E5M2>
    %17 = "x86.amx.tile_load"(%arg9, %12, %12) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E4M3FN>, index, index) -> !x86.amx.tile<16x64xf8E4M3FN>
    %18 = "x86.amx.tile_load"(%arg10, %12, %12) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf8E5M2>, index, index) -> !x86.amx.tile<16x64xf8E5M2>
    %19 = "x86.amx.tile_mulf"(%15, %17, %14) : (!x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32>
    %20 = "x86.amx.tile_mulf"(%15, %16, %14) : (!x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32>
    %21 = "x86.amx.tile_mulf"(%16, %15, %14) : (!x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x64xf8E4M3FN>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32>
    %22 = "x86.amx.tile_mulf"(%16, %18, %14) : (!x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x64xf8E5M2>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32>
    "x86.amx.tile_store"(%arg12, %arg11, %12, %19) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "x86.amx.tile_store"(%arg12, %arg11, %13, %20) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "x86.amx.tile_store"(%arg12, %12, %arg11, %21) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "x86.amx.tile_store"(%arg12, %13, %arg11, %22) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, memref<?x?xi32>, index, memref<?x?xi8>) -> (), sym_name = "amx_tile_muli"}> ({
  ^bb0(%arg4: memref<?x?xi8>, %arg5: memref<?x?xi8>, %arg6: memref<?x?xi32>, %arg7: index, %arg8: memref<?x?xi8>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "x86.amx.tile_load"(%arg4, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8>
    %6 = "x86.amx.tile_load"(%arg5, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8>
    %7 = "x86.amx.tile_load"(%arg6, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi32>, index, index) -> !x86.amx.tile<16x16xi32>
    %8 = "x86.amx.tile_muli"(%5, %6, %7) <{isZextLhs, isZextRhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32>
    %9 = "x86.amx.tile_muli"(%5, %6, %7) : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32>
    %10 = "x86.amx.tile_muli"(%5, %6, %7) <{isZextLhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32>
    %11 = "x86.amx.tile_muli"(%5, %6, %7) <{isZextRhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32>
    "x86.amx.tile_store"(%arg8, %3, %3, %8) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> ()
    "x86.amx.tile_store"(%arg8, %3, %4, %9) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> ()
    "x86.amx.tile_store"(%arg8, %4, %3, %10) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> ()
    "x86.amx.tile_store"(%arg8, %4, %4, %11) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x16xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, index, i1) -> (), sym_name = "amx_tile_type_through_cf"}> ({
  ^bb0(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: index, %arg3: i1):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "x86.amx.tile_load"(%arg0, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8>
    "cf.br"(%0)[^bb3] : (!x86.amx.tile<16x64xi8>) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x64xi8>
    "cf.br"(%1)[^bb3] : (!x86.amx.tile<16x64xi8>) -> ()
  ^bb3(%2: !x86.amx.tile<16x64xi8>):  // 2 preds: ^bb1, ^bb2
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    "x86.amx.tile_store"(%arg1, %arg2, %arg2, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !x86.amx.tile<16x64xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

