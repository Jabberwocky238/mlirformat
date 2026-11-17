"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, index, index, index) -> (index, index, index), sym_name = "insert_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32> loc("<stdin>":3:8), %arg1: tensor<?x?x?xf32> loc("<stdin>":3:34), %arg2: index loc("<stdin>":3:60), %arg3: index loc("<stdin>":3:74), %arg4: index loc("<stdin>":3:88)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":7:10)
    %4 = "tensor.dim"(%arg0, %1) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":8:10)
    %5 = "tensor.dim"(%arg0, %2) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":9:10)
    %6 = "tensor.insert_slice"(%arg0, %arg1, %arg2, %arg3, %arg4, %3, %4, %5) <{operandSegmentSizes = array<i32: 1, 1, 3, 3, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, index, index, index, index, index, index) -> tensor<?x?x?xf32> loc("<stdin>":10:10)
    %7 = "tensor.dim"(%6, %0) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":11:10)
    %8 = "tensor.dim"(%6, %1) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":12:10)
    %9 = "tensor.dim"(%6, %2) : (tensor<?x?x?xf32>, index) -> index loc("<stdin>":13:10)
    "func.return"(%7, %8, %9) : (index, index, index) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
