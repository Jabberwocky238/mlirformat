#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf64>) -> (), sym_name = "printMemref1dF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse>, sym_name = "concat_sparse_sparse_perm_dim1"}> ({
  ^bb0(%arg10: tensor<4x2xf64, #sparse>, %arg11: tensor<4x3xf64, #sparse1>, %arg12: tensor<4x4xf64, #sparse2>):
    %19 = "sparse_tensor.concatenate"(%arg10, %arg11, %arg12) <{dimension = 1 : index}> : (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse>
    "func.return"(%19) : (tensor<4x9xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64>, sym_name = "concat_sparse_dense_perm_dim1"}> ({
  ^bb0(%arg7: tensor<4x2xf64, #sparse>, %arg8: tensor<4x3xf64, #sparse3>, %arg9: tensor<4x4xf64, #sparse2>):
    %18 = "sparse_tensor.concatenate"(%arg7, %arg8, %arg9) <{dimension = 1 : index}> : (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64>
    "func.return"(%18) : (tensor<4x9xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x2xf64>, tensor<4x3xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse4>, sym_name = "concat_mix_sparse_perm_dim1"}> ({
  ^bb0(%arg4: tensor<4x2xf64>, %arg5: tensor<4x3xf64, #sparse3>, %arg6: tensor<4x4xf64, #sparse2>):
    %17 = "sparse_tensor.concatenate"(%arg4, %arg5, %arg6) <{dimension = 1 : index}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse4>
    "func.return"(%17) : (tensor<4x9xf64, #sparse4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse5>) -> tensor<4x9xf64>, sym_name = "concat_mix_dense_perm_dim1"}> ({
  ^bb0(%arg1: tensor<4x2xf64>, %arg2: tensor<4x3xf64, #sparse1>, %arg3: tensor<4x4xf64, #sparse5>):
    %16 = "sparse_tensor.concatenate"(%arg1, %arg2, %arg3) <{dimension = 1 : index}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse5>) -> tensor<4x9xf64>
    "func.return"(%16) : (tensor<4x9xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x9xf64>) -> (), sym_name = "dump_mat_dense_4x9"}> ({
  ^bb0(%arg0: tensor<4x9xf64>):
    %15 = "tensor.cast"(%arg0) : (tensor<4x9xf64>) -> tensor<*xf64>
    "func.call"(%15) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00], [0.000000e+00, 0.000000e+00]]> : tensor<4x2xf64>}> : () -> tensor<4x2xf64>
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00], [1.000000e+00, 0.000000e+00, 5.000000e-01], [0.000000e+00, 0.000000e+00, 1.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<4x3xf64>}> : () -> tensor<4x3xf64>
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64>
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64>
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %5 = "sparse_tensor.convert"(%0) : (tensor<4x2xf64>) -> tensor<4x2xf64, #sparse4>
    %6 = "sparse_tensor.convert"(%1) : (tensor<4x3xf64>) -> tensor<4x3xf64, #sparse1>
    %7 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse2>
    %8 = "sparse_tensor.convert"(%0) : (tensor<4x2xf64>) -> tensor<4x2xf64, #sparse>
    %9 = "sparse_tensor.convert"(%1) : (tensor<4x3xf64>) -> tensor<4x3xf64, #sparse3>
    %10 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse5>
    %11 = "func.call"(%8, %6, %7) <{callee = @concat_sparse_sparse_perm_dim1}> : (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse>
    "sparse_tensor.print"(%11) : (tensor<4x9xf64, #sparse>) -> ()
    %12 = "func.call"(%8, %9, %7) <{callee = @concat_sparse_dense_perm_dim1}> : (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64>
    "func.call"(%12) <{callee = @dump_mat_dense_4x9}> : (tensor<4x9xf64>) -> ()
    %13 = "func.call"(%0, %9, %7) <{callee = @concat_mix_sparse_perm_dim1}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse4>
    "sparse_tensor.print"(%13) : (tensor<4x9xf64, #sparse4>) -> ()
    %14 = "func.call"(%0, %6, %10) <{callee = @concat_mix_dense_perm_dim1}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse5>) -> tensor<4x9xf64>
    "func.call"(%14) <{callee = @dump_mat_dense_4x9}> : (tensor<4x9xf64>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<4x2xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<4x3xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<4x2xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<4x3xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<4x4xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<4x9xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<4x9xf64>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<4x9xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<4x9xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

