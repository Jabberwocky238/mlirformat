#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(2, 2, 1)>, d1 : #sparse_tensor<slice(12, 13, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32, #sparse>) -> tensor<64xf32, #sparse>, sym_name = "sparse_nop_convert"}> ({
  ^bb0(%arg5: tensor<64xf32, #sparse>):
    %5 = "sparse_tensor.convert"(%arg5) : (tensor<64xf32, #sparse>) -> tensor<64xf32, #sparse>
    "func.return"(%5) : (tensor<64xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "sparse_hidden_nop_cast"}> ({
  ^bb0(%arg4: tensor<32xf32, #sparse>):
    %4 = "sparse_tensor.convert"(%arg4) : (tensor<32xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%4) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32, #sparse1>) -> tensor<?xf32, #sparse2>, sym_name = "sparse_convert_1d_ss"}> ({
  ^bb0(%arg3: tensor<?xf32, #sparse1>):
    %3 = "sparse_tensor.convert"(%arg3) : (tensor<?xf32, #sparse1>) -> tensor<?xf32, #sparse2>
    "func.return"(%3) : (tensor<?xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32, #sparse1>) -> tensor<?xf32, #sparse2>, sym_name = "sparse_convert"}> ({
  ^bb0(%arg2: tensor<?xf32, #sparse1>):
    %2 = "sparse_tensor.convert"(%arg2) : (tensor<?xf32, #sparse1>) -> tensor<?xf32, #sparse2>
    "func.return"(%2) : (tensor<?xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse4>, sym_name = "sparse_convert_permuted"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32, #sparse3>):
    %1 = "sparse_tensor.convert"(%arg1) : (tensor<?x?x?xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse4>
    "func.return"(%1) : (tensor<?x?x?xf32, #sparse4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x13xi32, #sparse5>) -> tensor<2x13xi32, #sparse6>, sym_name = "sparse_convert_slice"}> ({
  ^bb0(%arg0: tensor<2x13xi32, #sparse5>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<2x13xi32, #sparse5>) -> tensor<2x13xi32, #sparse6>
    "func.return"(%0) : (tensor<2x13xi32, #sparse6>) -> ()
  }) : () -> ()
}) : () -> ()

