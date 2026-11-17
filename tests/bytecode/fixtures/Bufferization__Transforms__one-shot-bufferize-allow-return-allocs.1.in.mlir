"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, i1, i32) -> tensor<i32>, sym_name = "write_to_alloc_tensor_or_readonly_tensor"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":4:8), %arg1: i1 loc("<stdin>":4:28), %arg2: i32 loc("<stdin>":4:39)):
    %0 = "scf.if"(%arg1) ({
      "scf.yield"(%arg0) : (tensor<i32>) -> () loc("<stdin>":6:7)
    }, {
      %1 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<i32> loc("<stdin>":8:12)
      %2 = "tensor.insert"(%arg2, %1) : (i32, tensor<i32>) -> tensor<i32> loc("<stdin>":9:12)
      "scf.yield"(%2) : (tensor<i32>) -> () loc("<stdin>":10:7)
    }) : (i1) -> tensor<i32> loc("<stdin>":5:10)
    "func.return"(%0) : (tensor<i32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
