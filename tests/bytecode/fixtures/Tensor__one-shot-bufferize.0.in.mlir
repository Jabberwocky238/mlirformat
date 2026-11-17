"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = false}, {bufferization.writable = true}, {bufferization.writable = false}, {bufferization.writable = true}], function_type = (tensor<?xf32>, tensor<?xf32>, tensor<4xf32>, tensor<4xf32>) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>), sym_name = "insert_slice_fun", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: tensor<?xf32> loc("<stdin>":3:30), %arg2: tensor<4xf32> loc("<stdin>":3:52), %arg3: tensor<4xf32> loc("<stdin>":3:74)):
    %0 = "tensor.insert_slice"(%arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<4xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":4:10)
    %1 = "tensor.insert_slice"(%arg3, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<4xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":5:10)
    %2 = "tensor.insert_slice"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<4xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":6:10)
    %3 = "tensor.insert_slice"(%arg3, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (tensor<4xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":7:10)
    "func.return"(%0, %1, %2, %3) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
