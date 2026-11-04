"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, index) -> (f32, f32), sym_name = "read_after_write_conflict"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: index):
    %0 = "test.dummy_op"() : () -> tensor<10xf32>
    %1 = "tensor.insert"(%arg0, %0, %arg2) : (f32, tensor<10xf32>, index) -> tensor<10xf32>
    %2 = "test.some_use"(%0) : (tensor<10xf32>) -> f32
    %3 = "tensor.extract"(%1, %arg1) : (tensor<10xf32>, index) -> f32
    "func.return"(%2, %3) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

