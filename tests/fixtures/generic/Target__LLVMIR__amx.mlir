"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index) -> (), sym_name = "amx_tile_zero"}> ({
  ^bb0(%arg24: memref<?x?xf32>, %arg25: index):
    %22 = "amx.tile_zero"() : () -> !amx.tile<16x16xf32>
    "amx.tile_store"(%arg24, %arg25, %arg25, %22) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, index) -> (), sym_name = "amx_tile_load_store"}> ({
  ^bb0(%arg21: memref<?x?xi8>, %arg22: memref<?x?xi8>, %arg23: index):
    %21 = "amx.tile_load"(%arg21, %arg23, %arg23) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !amx.tile<16x64xi8>
    "amx.tile_store"(%arg22, %arg23, %arg23, %21) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !amx.tile<16x64xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi8>, memref<?xi8>, index, index) -> (), sym_name = "amx_tile_load_store_strided"}> ({
  ^bb0(%arg17: memref<?xi8>, %arg18: memref<?xi8>, %arg19: index, %arg20: index):
    %20 = "amx.tile_load"(%arg17, %arg19, %arg20) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<?xi8>, index, index) -> !amx.tile<16x64xi8>
    "amx.tile_store"(%arg18, %arg19, %20, %arg20) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<?xi8>, index, !amx.tile<16x64xi8>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xbf16>, memref<?x?xbf16>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_bf16"}> ({
  ^bb0(%arg13: memref<?x?xbf16>, %arg14: memref<?x?xbf16>, %arg15: index, %arg16: memref<?x?xf32>):
    %16 = "amx.tile_zero"() : () -> !amx.tile<16x16xf32>
    %17 = "amx.tile_load"(%arg13, %arg15, %arg15) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !amx.tile<16x32xbf16>
    %18 = "amx.tile_load"(%arg14, %arg15, %arg15) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !amx.tile<16x32xbf16>
    %19 = "amx.tile_mulf"(%17, %18, %16) : (!amx.tile<16x32xbf16>, !amx.tile<16x32xbf16>, !amx.tile<16x16xf32>) -> !amx.tile<16x16xf32>
    "amx.tile_store"(%arg16, %arg15, %arg15, %19) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf16>, memref<?x?xf16>, index, memref<?x?xf32>) -> (), sym_name = "amx_tile_mulf_f16"}> ({
  ^bb0(%arg9: memref<?x?xf16>, %arg10: memref<?x?xf16>, %arg11: index, %arg12: memref<?x?xf32>):
    %12 = "amx.tile_zero"() : () -> !amx.tile<16x16xf32>
    %13 = "amx.tile_load"(%arg9, %arg11, %arg11) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf16>, index, index) -> !amx.tile<16x32xf16>
    %14 = "amx.tile_load"(%arg10, %arg11, %arg11) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf16>, index, index) -> !amx.tile<16x32xf16>
    %15 = "amx.tile_mulf"(%13, %14, %12) : (!amx.tile<16x32xf16>, !amx.tile<16x32xf16>, !amx.tile<16x16xf32>) -> !amx.tile<16x16xf32>
    "amx.tile_store"(%arg12, %arg11, %arg11, %15) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !amx.tile<16x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, memref<?x?xi32>, index, memref<?x?xi8>) -> (), sym_name = "amx_tile_muli"}> ({
  ^bb0(%arg4: memref<?x?xi8>, %arg5: memref<?x?xi8>, %arg6: memref<?x?xi32>, %arg7: index, %arg8: memref<?x?xi8>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index
    %5 = "amx.tile_load"(%arg4, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !amx.tile<16x64xi8>
    %6 = "amx.tile_load"(%arg5, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !amx.tile<16x64xi8>
    %7 = "amx.tile_load"(%arg6, %arg7, %arg7) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi32>, index, index) -> !amx.tile<16x16xi32>
    %8 = "amx.tile_muli"(%5, %6, %7) <{isZextLhs, isZextRhs}> : (!amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>) -> !amx.tile<16x16xi32>
    %9 = "amx.tile_muli"(%5, %6, %7) : (!amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>) -> !amx.tile<16x16xi32>
    %10 = "amx.tile_muli"(%5, %6, %7) <{isZextLhs}> : (!amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>) -> !amx.tile<16x16xi32>
    %11 = "amx.tile_muli"(%5, %6, %7) <{isZextRhs}> : (!amx.tile<16x64xi8>, !amx.tile<16x64xi8>, !amx.tile<16x16xi32>) -> !amx.tile<16x16xi32>
    "amx.tile_store"(%arg8, %3, %3, %8) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !amx.tile<16x16xi32>) -> ()
    "amx.tile_store"(%arg8, %3, %4, %9) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !amx.tile<16x16xi32>) -> ()
    "amx.tile_store"(%arg8, %4, %3, %10) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !amx.tile<16x16xi32>) -> ()
    "amx.tile_store"(%arg8, %4, %4, %11) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !amx.tile<16x16xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, index, i1) -> (), sym_name = "amx_tile_type_through_cf"}> ({
  ^bb0(%arg0: memref<?x?xi8>, %arg1: memref<?x?xi8>, %arg2: index, %arg3: i1):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "amx.tile_load"(%arg0, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !amx.tile<16x64xi8>
    "cf.br"(%0)[^bb3] : (!amx.tile<16x64xi8>) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "amx.tile_zero"() : () -> !amx.tile<16x64xi8>
    "cf.br"(%1)[^bb3] : (!amx.tile<16x64xi8>) -> ()
  ^bb3(%2: !amx.tile<16x64xi8>):  // 2 preds: ^bb1, ^bb2
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // pred: ^bb3
    "amx.tile_store"(%arg1, %arg2, %arg2, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi8>, index, index, !amx.tile<16x64xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

