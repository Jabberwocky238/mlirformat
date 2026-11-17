"builtin.module"() ({
  "gpu.module"() <{sym_name = "create_nd_tdesc"}> ({
    "gpu.func"() <{function_type = (memref<16x32xf32, 1>, ui64, index, index, index, index, index, index, memref<?x?xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<16x32xf32, 1> loc("<stdin>":4:10), %arg1: ui64 loc("<stdin>":4:39), %arg2: index loc("<stdin>":4:52), %arg3: index loc("<stdin>":4:66), %arg4: index loc("<stdin>":4:80), %arg5: index loc("<stdin>":4:94), %arg6: index loc("<stdin>":4:108), %arg7: index loc("<stdin>":4:122), %arg8: memref<?x?xf16> loc("<stdin>":4:136)):
      %0 = "xegpu.create_nd_tdesc"(%arg1, %arg2, %arg3, %arg4, %arg5) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (ui64, index, index, index, index) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":5:12)
      %1 = "memref.memory_space_cast"(%arg0) : (memref<16x32xf32, 1>) -> memref<16x32xf32> loc("<stdin>":6:12)
      %2 = "xegpu.create_nd_tdesc"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x32xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":7:12)
      %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:12)
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":9:12)
      %5 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":10:12)
      %6 = "xegpu.create_nd_tdesc"(%arg8, %4, %5, %5, %3) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (memref<?x?xf16>, index, index, index, index) -> !xegpu.tensor_desc<16x16xf16> loc("<stdin>":11:12)
      "gpu.return"() : () -> () loc("<stdin>":12:7)
    }) {sym_name = "create_nd_tdesc"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
