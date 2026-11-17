"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xbf16>, memref<?x?xbf16>, memref<?x?xbf16, strided<[64, 1]>>) -> (), sym_name = "tloadstore"}> ({
  ^bb0(%arg6: index loc("<stdin>":3:8), %arg7: memref<?xbf16> loc("<stdin>":3:22), %arg8: memref<?x?xbf16> loc("<stdin>":3:45), %arg9: memref<?x?xbf16, strided<[64, 1]>> loc("<stdin>":3:70)):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %15 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":5:11)
    %16 = "x86.amx.tile_load"(%arg7, %14, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<?xbf16>, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":6:11)
    %17 = "x86.amx.tile_load"(%arg8, %14, %14, %arg6) <{operandSegmentSizes = array<i32: 1, 2, 1>}> : (memref<?x?xbf16>, index, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":7:11)
    %18 = "x86.amx.tile_load"(%arg9, %14, %14) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16, strided<[64, 1]>>, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":8:11)
    "x86.amx.tile_store"(%arg7, %14, %18, %arg6) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<?xbf16>, index, !x86.amx.tile<16x32xbf16>, index) -> () loc("<stdin>":9:5)
    "x86.amx.tile_store"(%arg8, %14, %14, %16, %arg6) <{operandSegmentSizes = array<i32: 1, 2, 1, 1>}> : (memref<?x?xbf16>, index, index, !x86.amx.tile<16x32xbf16>, index) -> () loc("<stdin>":10:5)
    "x86.amx.tile_store"(%arg9, %14, %14, %17) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xbf16, strided<[64, 1]>>, index, index, !x86.amx.tile<16x32xbf16>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?x?xbf16>) -> (), sym_name = "tzero"}> ({
  ^bb0(%arg5: memref<?x?xbf16> loc("<stdin>":15:8)):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":16:11)
    %13 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xbf16> loc("<stdin>":17:11)
    "x86.amx.tile_store"(%arg5, %12, %12, %13) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xbf16>, index, index, !x86.amx.tile<16x16xbf16>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<?x?xbf16>, memref<?x?xf32>) -> (), sym_name = "tmulf"}> ({
  ^bb0(%arg3: memref<?x?xbf16> loc("<stdin>":22:8), %arg4: memref<?x?xf32> loc("<stdin>":22:33)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":23:10)
    %9 = "x86.amx.tile_load"(%arg3, %8, %8) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xbf16>, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":24:10)
    %10 = "x86.amx.tile_load"(%arg4, %8, %8) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xf32>, index, index) -> !x86.amx.tile<16x16xf32> loc("<stdin>":25:11)
    %11 = "x86.amx.tile_mulf"(%9, %9, %10) : (!x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":26:11)
    "x86.amx.tile_store"(%arg4, %8, %8, %11) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<?x?xi8>, memref<?x?xi8>, memref<?x?xi32>) -> (), sym_name = "tmuli"}> ({
  ^bb0(%arg0: memref<?x?xi8> loc("<stdin>":31:8), %arg1: memref<?x?xi8> loc("<stdin>":31:31), %arg2: memref<?x?xi32> loc("<stdin>":31:54)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":32:10)
    %1 = "x86.amx.tile_load"(%arg0, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":33:10)
    %2 = "x86.amx.tile_load"(%arg1, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi8>, index, index) -> !x86.amx.tile<16x64xi8> loc("<stdin>":34:10)
    %3 = "x86.amx.tile_load"(%arg2, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (memref<?x?xi32>, index, index) -> !x86.amx.tile<16x16xi32> loc("<stdin>":35:10)
    %4 = "x86.amx.tile_muli"(%1, %2, %3) <{isZextLhs, isZextRhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":36:10)
    "x86.amx.tile_store"(%arg2, %0, %0, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<?x?xi32>, index, index, !x86.amx.tile<16x16xi32>) -> () loc("<stdin>":37:5)
    %5 = "x86.amx.tile_muli"(%1, %2, %3) <{isZextRhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":38:10)
    %6 = "x86.amx.tile_muli"(%1, %2, %3) <{isZextLhs}> : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":39:10)
    %7 = "x86.amx.tile_muli"(%1, %2, %3) : (!x86.amx.tile<16x64xi8>, !x86.amx.tile<16x64xi8>, !x86.amx.tile<16x16xi32>) -> !x86.amx.tile<16x16xi32> loc("<stdin>":40:10)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
