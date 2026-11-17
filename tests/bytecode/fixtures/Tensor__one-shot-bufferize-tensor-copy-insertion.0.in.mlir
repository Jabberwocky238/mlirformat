"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, f32) -> (tensor<5xf32>, tensor<?xf32>), sym_name = "extract_slice"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30), %arg2: f32 loc("<stdin>":3:44)):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 10>, static_sizes = array<i64: 5>, static_strides = array<i64: 1>}> : (tensor<?xf32>) -> tensor<5xf32> loc("<stdin>":4:10)
    %1 = "tensor.insert"(%arg2, %0, %arg1) : (f32, tensor<5xf32>, index) -> tensor<5xf32> loc("<stdin>":5:10)
    "func.return"(%1, %arg0) : (tensor<5xf32>, tensor<?xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
