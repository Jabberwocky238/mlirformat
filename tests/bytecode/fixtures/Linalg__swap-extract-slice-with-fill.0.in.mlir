"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, index, index) -> tensor<?x6xf32>, sym_name = "swap_fill_insert_slice"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:34), %arg2: index loc("<stdin>":3:48)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %1 = "linalg.fill"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":6:10), %arg4: f32 loc("<stdin>":6:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":7:7)
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":5:10)
    %2 = "tensor.extract_slice"(%1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 8, 4>, static_sizes = array<i64: 1, -9223372036854775808, 6>, static_strides = array<i64: 1, 3, 1>}> : (tensor<?x?x?xf32>, index, index) -> tensor<?x6xf32> loc("<stdin>":9:10)
    "func.return"(%2) : (tensor<?x6xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
