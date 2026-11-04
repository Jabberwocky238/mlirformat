"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: 3456>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 1, 1>}> : (memref<4x1024xf32>) -> memref<2x256xf32, strided<[1024, 1], offset: 2304>>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 128>, static_sizes = array<i64: 1, 128>, static_strides = array<i64: 1, 1>}> : (memref<2x256xf32, strided<[1024, 1], offset: 2304>>) -> memref<1x128xf32, strided<[1024, 1], offset: 3456>>
    "func.return"(%1) : (memref<1x128xf32, strided<[1024, 1], offset: 3456>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x10xf32, strided<[1024, 1], offset: 3745>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 512>, static_sizes = array<i64: 3, 256>, static_strides = array<i64: 1, 1>}> : (memref<4x1024xf32>) -> memref<3x256xf32, strided<[1024, 1], offset: 1536>>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 128>, static_sizes = array<i64: 2, 128>, static_strides = array<i64: 1, 1>}> : (memref<3x256xf32, strided<[1024, 1], offset: 1536>>) -> memref<2x128xf32, strided<[1024, 1], offset: 2688>>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 33>, static_sizes = array<i64: 1, 10>, static_strides = array<i64: 1, 1>}> : (memref<2x128xf32, strided<[1024, 1], offset: 2688>>) -> memref<1x10xf32, strided<[1024, 1], offset: 3745>>
    "func.return"(%2) : (memref<1x10xf32, strided<[1024, 1], offset: 3745>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: ?>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "memref.subview"(%arg0, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 1, 1>}> : (memref<4x1024xf32>, index) -> memref<2x256xf32, strided<[1024, 1], offset: ?>>
    %3 = "memref.subview"(%2, %0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 128>, static_sizes = array<i64: 1, 128>, static_strides = array<i64: 1, 1>}> : (memref<2x256xf32, strided<[1024, 1], offset: ?>>, index) -> memref<1x128xf32, strided<[1024, 1], offset: ?>>
    "func.return"(%3) : (memref<1x128xf32, strided<[1024, 1], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: ?>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 128 : index}> : () -> index
    %2 = "memref.subview"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 1, 1>}> : (memref<4x1024xf32>, index) -> memref<2x256xf32, strided<[1024, 1], offset: ?>>
    %3 = "memref.subview"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 1, -9223372036854775808>, static_sizes = array<i64: 1, 128>, static_strides = array<i64: 1, 1>}> : (memref<2x256xf32, strided<[1024, 1], offset: ?>>, index) -> memref<1x128xf32, strided<[1024, 1], offset: ?>>
    "func.return"(%3) : (memref<1x128xf32, strided<[1024, 1], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x1024xf32>) -> memref<1x64xf32, strided<[4096, 4], offset: 4480>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<8x1024xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 2, 2>}> : (memref<8x1024xf32>) -> memref<2x256xf32, strided<[2048, 2], offset: 2304>>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 64>, static_sizes = array<i64: 1, 64>, static_strides = array<i64: 2, 2>}> : (memref<2x256xf32, strided<[2048, 2], offset: 2304>>) -> memref<1x64xf32, strided<[4096, 4], offset: 4480>>
    "func.return"(%1) : (memref<1x64xf32, strided<[4096, 4], offset: 4480>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<30x30xf32>) -> memref<2x2xf32, strided<[240, 8], offset: 217>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<30x30xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 12, 12>, static_strides = array<i64: 2, 2>}> : (memref<30x30xf32>) -> memref<12x12xf32, strided<[60, 2], offset: 31>>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 5, 5>, static_strides = array<i64: 2, 2>}> : (memref<12x12xf32, strided<[60, 2], offset: 31>>) -> memref<5x5xf32, strided<[120, 4], offset: 93>>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 2, 2>}> : (memref<5x5xf32, strided<[120, 4], offset: 93>>) -> memref<2x2xf32, strided<[240, 8], offset: 217>>
    "func.return"(%2) : (memref<2x2xf32, strided<[240, 8], offset: 217>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x64xf32, strided<[4096, 4], offset: ?>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 64 : index}> : () -> index
    %2 = "memref.subview"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 2, 2>}> : (memref<4x1024xf32>, index) -> memref<2x256xf32, strided<[2048, 2], offset: ?>>
    %3 = "memref.subview"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 1, -9223372036854775808>, static_sizes = array<i64: 1, 64>, static_strides = array<i64: 2, 2>}> : (memref<2x256xf32, strided<[2048, 2], offset: ?>>, index) -> memref<1x64xf32, strided<[4096, 4], offset: ?>>
    "func.return"(%3) : (memref<1x64xf32, strided<[4096, 4], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x64xf32, strided<[4096, 4], offset: ?>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "memref.subview"(%arg0, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 2, 2>}> : (memref<4x1024xf32>, index) -> memref<2x256xf32, strided<[2048, 2], offset: ?>>
    %3 = "memref.subview"(%2, %0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 64>, static_sizes = array<i64: 1, 64>, static_strides = array<i64: 2, 2>}> : (memref<2x256xf32, strided<[2048, 2], offset: ?>>, index) -> memref<1x64xf32, strided<[4096, 4], offset: ?>>
    "func.return"(%3) : (memref<1x64xf32, strided<[4096, 4], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x?xf32>, index, index) -> memref<8x?xf32>, sym_name = "single_dynamic_size_subview"}> ({
  ^bb0(%arg0: memref<256x?xf32>, %arg1: index, %arg2: index):
    %0 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 8, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<256x?xf32>, index) -> memref<8x?xf32>
    %1 = "memref.subview"(%0, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 8, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<8x?xf32>, index) -> memref<8x?xf32>
    "func.return"(%1) : (memref<8x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x?xf32>, index, index) -> memref<?x?xf32>, sym_name = "all_dynamic_size_subview"}> ({
  ^bb0(%arg0: memref<256x?xf32>, %arg1: index, %arg2: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<256x?xf32>, index, index) -> memref<?x?xf32>
    %1 = "memref.subview"(%0, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?x?xf32>
    "func.return"(%1) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

