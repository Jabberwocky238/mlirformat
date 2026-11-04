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
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64, #sparse>, sym_name = "concat_sparse_sparse_perm"}> ({
  ^bb0(%arg11: tensor<2x4xf64, #sparse>, %arg12: tensor<3x4xf64, #sparse1>, %arg13: tensor<4x4xf64, #sparse2>):
    %23 = "sparse_tensor.concatenate"(%arg11, %arg12, %arg13) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64, #sparse>
    "func.return"(%23) : (tensor<9x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64>, sym_name = "concat_sparse_dense_perm"}> ({
  ^bb0(%arg8: tensor<2x4xf64, #sparse>, %arg9: tensor<3x4xf64, #sparse3>, %arg10: tensor<4x4xf64, #sparse2>):
    %22 = "sparse_tensor.concatenate"(%arg8, %arg9, %arg10) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64>
    "func.return"(%22) : (tensor<9x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<3x4xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64, #sparse4>, sym_name = "concat_mix_sparse_perm"}> ({
  ^bb0(%arg5: tensor<2x4xf64>, %arg6: tensor<3x4xf64, #sparse3>, %arg7: tensor<4x4xf64, #sparse2>):
    %21 = "sparse_tensor.concatenate"(%arg5, %arg6, %arg7) <{dimension = 0 : index}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64, #sparse4>
    "func.return"(%21) : (tensor<9x4xf64, #sparse4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse5>) -> tensor<9x4xf64>, sym_name = "concat_mix_dense_perm"}> ({
  ^bb0(%arg2: tensor<2x4xf64>, %arg3: tensor<3x4xf64, #sparse1>, %arg4: tensor<4x4xf64, #sparse5>):
    %20 = "sparse_tensor.concatenate"(%arg2, %arg3, %arg4) <{dimension = 0 : index}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse5>) -> tensor<9x4xf64>
    "func.return"(%20) : (tensor<9x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<9x4xf64, #sparse4>) -> (), sym_name = "dump_mat_9x4"}> ({
  ^bb0(%arg1: tensor<9x4xf64, #sparse4>):
    %16 = "sparse_tensor.convert"(%arg1) : (tensor<9x4xf64, #sparse4>) -> tensor<9x4xf64>
    %17 = "tensor.cast"(%16) : (tensor<9x4xf64>) -> tensor<*xf64>
    "func.call"(%17) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    %18 = "sparse_tensor.number_of_entries"(%arg1) : (tensor<9x4xf64, #sparse4>) -> index
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    %19 = "sparse_tensor.values"(%arg1) : (tensor<9x4xf64, #sparse4>) -> memref<?xf64>
    "func.call"(%19) <{callee = @printMemref1dF64}> : (memref<?xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<9x4xf64>) -> (), sym_name = "dump_mat_dense_9x4"}> ({
  ^bb0(%arg0: tensor<9x4xf64>):
    %15 = "tensor.cast"(%arg0) : (tensor<9x4xf64>) -> tensor<*xf64>
    "func.call"(%15) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00], [0.000000e+00, 0.000000e+00]]> : tensor<4x2xf64>}> : () -> tensor<4x2xf64>
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00], [1.000000e+00, 0.000000e+00, 5.000000e-01], [0.000000e+00, 0.000000e+00, 1.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<4x3xf64>}> : () -> tensor<4x3xf64>
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64>
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64>
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %5 = "sparse_tensor.convert"(%2) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse4>
    %6 = "sparse_tensor.convert"(%3) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse1>
    %7 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse2>
    %8 = "sparse_tensor.convert"(%2) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse>
    %9 = "sparse_tensor.convert"(%3) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse3>
    %10 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse5>
    %11 = "func.call"(%8, %6, %7) <{callee = @concat_sparse_sparse_perm}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64, #sparse>
    "sparse_tensor.print"(%11) : (tensor<9x4xf64, #sparse>) -> ()
    %12 = "func.call"(%8, %9, %7) <{callee = @concat_sparse_dense_perm}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64>
    "func.call"(%12) <{callee = @dump_mat_dense_9x4}> : (tensor<9x4xf64>) -> ()
    %13 = "func.call"(%2, %9, %7) <{callee = @concat_mix_sparse_perm}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse3>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64, #sparse4>
    "sparse_tensor.print"(%13) : (tensor<9x4xf64, #sparse4>) -> ()
    %14 = "func.call"(%2, %6, %10) <{callee = @concat_mix_dense_perm}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse5>) -> tensor<9x4xf64>
    "func.call"(%14) <{callee = @dump_mat_dense_9x4}> : (tensor<9x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x4xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<3x4xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<4x4xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<9x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<9x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<9x4xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<9x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

