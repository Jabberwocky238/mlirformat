"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>>, index, index) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>>, sym_name = "sparse_slice_canonicalize"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:43), %arg2: index loc("<stdin>":4:57)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "tensor.extract_slice"(%arg0, %0, %arg1, %1, %2, %1, %arg2, %1, %1, %1) <{operandSegmentSizes = array<i32: 1, 3, 3, 3>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>>, index, index, index, index, index, index, index, index, index) -> tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>> loc("<stdin>":8:10)
    "func.return"(%3) : (tensor<?x?x?xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
