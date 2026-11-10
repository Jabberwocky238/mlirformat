"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "yield_alloc_dominance_test_2"}> ({
  ^bb0(%arg0: f32, %arg1: index, %arg2: index):
    %0 = "bufferization.alloc_tensor"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    %1 = "scf.execute_region"() ({
      "scf.yield"(%0) : (tensor<?xf32>) -> ()
    }) : () -> tensor<?xf32>
    %2 = "tensor.insert"(%arg0, %1, %arg1) : (f32, tensor<?xf32>, index) -> tensor<?xf32>
    %3 = "tensor.extract"(%2, %arg2) : (tensor<?xf32>, index) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

