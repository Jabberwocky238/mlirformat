"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>) -> memref<*xf32>, sym_name = "builtin_unranked"}> ({
  ^bb0(%arg0: tensor<*xf32>):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<*xf32>) -> memref<*xf32>
    "func.return"(%0) : (memref<*xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<42xf32>) -> memref<42xf32>, sym_name = "builtin_ranked"}> ({
  ^bb0(%arg0: tensor<42xf32>):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<42xf32>) -> memref<42xf32>
    "func.return"(%0) : (memref<42xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_tensor<[42], f32>) -> (), sym_name = "custom_tensor"}> ({
  ^bb0(%arg0: !test.test_tensor<[42], f32>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_memref<[42], f32>) -> (), sym_name = "custom_memref"}> ({
  ^bb0(%arg0: !test.test_memref<[42], f32>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

