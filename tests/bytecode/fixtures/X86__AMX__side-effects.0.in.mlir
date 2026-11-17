"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x32x32xbf16>, memref<2x16x32xbf16>) -> memref<16x32xf32>, sym_name = "do_not_fold_tiles"}> ({
  ^bb0(%arg0: memref<2x32x32xbf16> loc("<stdin>":3:8), %arg1: memref<2x16x32xbf16> loc("<stdin>":3:37)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x32xf32> loc("<stdin>":8:10)
    %5 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32> loc("<stdin>":9:10)
    %6 = "x86.amx.tile_zero"() : () -> !x86.amx.tile<16x16xf32> loc("<stdin>":10:10)
    %7:2 = "scf.for"(%1, %2, %0, %5, %6) ({
    ^bb0(%arg2: index loc("<stdin>":12:10), %arg3: !x86.amx.tile<16x16xf32> loc("<stdin>":12:24), %arg4: !x86.amx.tile<16x16xf32> loc("<stdin>":12:57)):
      %8 = "x86.amx.tile_load"(%arg0, %arg2, %1, %1) <{operandSegmentSizes = array<i32: 1, 3, 0>}> : (memref<2x32x32xbf16>, index, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":13:12)
      %9 = "x86.amx.tile_load"(%arg0, %arg2, %3, %1) <{operandSegmentSizes = array<i32: 1, 3, 0>}> : (memref<2x32x32xbf16>, index, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":14:12)
      %10 = "x86.amx.tile_load"(%arg1, %arg2, %1, %1) <{operandSegmentSizes = array<i32: 1, 3, 0>}> : (memref<2x16x32xbf16>, index, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":15:13)
      %11 = "x86.amx.tile_load"(%arg1, %arg2, %1, %1) <{operandSegmentSizes = array<i32: 1, 3, 0>}> : (memref<2x16x32xbf16>, index, index, index) -> !x86.amx.tile<16x32xbf16> loc("<stdin>":16:13)
      %12 = "x86.amx.tile_mulf"(%8, %10, %arg3) : (!x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":17:13)
      %13 = "x86.amx.tile_mulf"(%9, %11, %arg4) : (!x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x32xbf16>, !x86.amx.tile<16x16xf32>) -> !x86.amx.tile<16x16xf32> loc("<stdin>":18:13)
      "scf.yield"(%12, %13) : (!x86.amx.tile<16x16xf32>, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":19:7)
    }) : (index, index, index, !x86.amx.tile<16x16xf32>, !x86.amx.tile<16x16xf32>) -> (!x86.amx.tile<16x16xf32>, !x86.amx.tile<16x16xf32>) loc("<stdin>":11:12)
    "x86.amx.tile_store"(%4, %1, %1, %7#0) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<16x32xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":21:5)
    "x86.amx.tile_store"(%4, %1, %3, %7#1) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>}> : (memref<16x32xf32>, index, index, !x86.amx.tile<16x16xf32>) -> () loc("<stdin>":22:5)
    "func.return"(%4) : (memref<16x32xf32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
