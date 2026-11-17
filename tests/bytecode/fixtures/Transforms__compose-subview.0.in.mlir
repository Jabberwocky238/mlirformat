"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: 3456>>, sym_name = "subview_strided"}> ({
  ^bb0(%arg0: memref<4x1024xf32> loc("<stdin>":3:8)):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 256>, static_sizes = array<i64: 2, 256>, static_strides = array<i64: 1, 1>}> : (memref<4x1024xf32>) -> memref<2x256xf32, strided<[1024, 1], offset: 2304>> loc("<stdin>":4:10)
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 128>, static_sizes = array<i64: 1, 128>, static_strides = array<i64: 1, 1>}> : (memref<2x256xf32, strided<[1024, 1], offset: 2304>>) -> memref<1x128xf32, strided<[1024, 1], offset: 3456>> loc("<stdin>":5:10)
    "func.return"(%1) : (memref<1x128xf32, strided<[1024, 1], offset: 3456>>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
