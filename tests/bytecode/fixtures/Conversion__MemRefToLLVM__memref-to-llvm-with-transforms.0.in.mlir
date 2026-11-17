"builtin.module"() ({
  "func.func"() <{function_type = (memref<100x100xf32>, index, index, index, index) -> memref<?x?xf32, strided<[100, 1], offset: ?>>, sym_name = "subview_folder"}> ({
  ^bb0(%arg0: memref<100x100xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36), %arg2: index loc("<stdin>":3:50), %arg3: index loc("<stdin>":3:64), %arg4: index loc("<stdin>":3:78)):
    %0 = "memref.subview"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<100x100xf32>, index, index, index, index) -> memref<?x?xf32, strided<[100, 1], offset: ?>> loc("<stdin>":4:10)
    "func.return"(%0) : (memref<?x?xf32, strided<[100, 1], offset: ?>>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
