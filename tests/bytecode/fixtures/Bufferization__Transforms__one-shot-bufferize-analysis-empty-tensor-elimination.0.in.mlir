"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = true}, {}], function_type = (tensor<?xf32>, index) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "buffer_forwarding_conflict"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %1 = "tensor.empty"(%arg1) : (index) -> tensor<?xf32> loc("<stdin>":5:10)
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":7:10), %arg3: f32 loc("<stdin>":7:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":8:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":6:10)
    %3 = "tensor.insert_slice"(%2, %arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":10:10)
    %4 = "tensor.insert_slice"(%2, %arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 42>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":11:10)
    "func.return"(%3, %4) : (tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
