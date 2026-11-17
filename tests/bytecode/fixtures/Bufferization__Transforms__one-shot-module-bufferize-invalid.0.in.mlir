"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, index) -> f32, sym_name = "yield_alloc_dominance_test_2"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:20), %arg2: index loc("<stdin>":3:34)):
    %0 = "bufferization.alloc_tensor"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32> loc("<stdin>":4:10)
    %1 = "scf.execute_region"() ({
      "scf.yield"(%0) : (tensor<?xf32>) -> () loc("<stdin>":6:7)
    }) : () -> tensor<?xf32> loc("<stdin>":5:10)
    %2 = "tensor.insert"(%arg0, %1, %arg1) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":8:10)
    %3 = "tensor.extract"(%2, %arg2) : (tensor<?xf32>, index) -> f32 loc("<stdin>":9:10)
    "func.return"(%3) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
