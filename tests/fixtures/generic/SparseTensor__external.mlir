"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf32>) -> tensor<100xf32>, sym_name = "nop"}> ({
  ^bb0(%arg0: tensor<100xf32>):
    "func.return"(%arg0) : (tensor<100xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x64xf32, #sparse>) -> tensor<64x64xf32>, sym_name = "sparse_in"}> ({
  ^bb0(%arg0: tensor<64x64xf32, #sparse>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<64x64xf32, #sparse>) -> tensor<64x64xf32>
    "func.return"(%0) : (tensor<64x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf32>, tensor<64x64xf32, #sparse>) -> tensor<64x64xf32>, sym_name = "sparse_in2"}> ({
  ^bb0(%arg0: tensor<100xf32>, %arg1: tensor<64x64xf32, #sparse>):
    %0 = "sparse_tensor.convert"(%arg1) : (tensor<64x64xf32, #sparse>) -> tensor<64x64xf32>
    "func.return"(%0) : (tensor<64x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x64xf32>) -> tensor<64x64xf32, #sparse>, sym_name = "sparse_out"}> ({
  ^bb0(%arg0: tensor<64x64xf32>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<64x64xf32>) -> tensor<64x64xf32, #sparse>
    "func.return"(%0) : (tensor<64x64xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x64xf32>) -> (tensor<64x64xf32>, tensor<64x64xf32, #sparse>), sym_name = "sparse_out2"}> ({
  ^bb0(%arg0: tensor<64x64xf32>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<64x64xf32>) -> tensor<64x64xf32, #sparse>
    "func.return"(%arg0, %0) : (tensor<64x64xf32>, tensor<64x64xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x64xf32, #sparse>) -> tensor<64x64xf32, #sparse>, sym_name = "sparse_inout"}> ({
  ^bb0(%arg0: tensor<64x64xf32, #sparse>):
    "func.return"(%arg0) : (tensor<64x64xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x64xf32, #sparse>) -> tensor<64x64xf32, #sparse>, sym_name = "sparse_inout_coo_soa"}> ({
  ^bb0(%arg0: tensor<64x64xf32, #sparse>):
    "func.return"(%arg0) : (tensor<64x64xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

