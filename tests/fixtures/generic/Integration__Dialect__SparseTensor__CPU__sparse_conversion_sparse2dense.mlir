#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : dense, d2 : compressed, d0 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xf64>) -> (), sym_name = "dump_234"}> ({
  ^bb0(%arg7: tensor<2x3x4xf64>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %30 = "vector.transfer_read"(%arg7, %28, %28, %28, %29) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<2x3x4xf64>, index, index, index, f64) -> vector<2x3x4xf64>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x3x4xf64>) -> (), sym_name = "dump_p34"}> ({
  ^bb0(%arg6: tensor<?x3x4xf64>):
    %27 = "tensor.cast"(%arg6) : (tensor<?x3x4xf64>) -> tensor<2x3x4xf64>
    "func.call"(%27) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?x4xf64>) -> (), sym_name = "dump_2p4"}> ({
  ^bb0(%arg5: tensor<2x?x4xf64>):
    %26 = "tensor.cast"(%arg5) : (tensor<2x?x4xf64>) -> tensor<2x3x4xf64>
    "func.call"(%26) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x?xf64>) -> (), sym_name = "dump_23p"}> ({
  ^bb0(%arg4: tensor<2x3x?xf64>):
    %25 = "tensor.cast"(%arg4) : (tensor<2x3x?xf64>) -> tensor<2x3x4xf64>
    "func.call"(%25) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?x?xf64>) -> (), sym_name = "dump_2pp"}> ({
  ^bb0(%arg3: tensor<2x?x?xf64>):
    %24 = "tensor.cast"(%arg3) : (tensor<2x?x?xf64>) -> tensor<2x3x4xf64>
    "func.call"(%24) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x3x?xf64>) -> (), sym_name = "dump_p3p"}> ({
  ^bb0(%arg2: tensor<?x3x?xf64>):
    %23 = "tensor.cast"(%arg2) : (tensor<?x3x?xf64>) -> tensor<2x3x4xf64>
    "func.call"(%23) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x4xf64>) -> (), sym_name = "dump_pp4"}> ({
  ^bb0(%arg1: tensor<?x?x4xf64>):
    %22 = "tensor.cast"(%arg1) : (tensor<?x?x4xf64>) -> tensor<2x3x4xf64>
    "func.call"(%22) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64>) -> (), sym_name = "dump_ppp"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64>):
    %21 = "tensor.cast"(%arg0) : (tensor<?x?x?xf64>) -> tensor<2x3x4xf64>
    "func.call"(%21) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %1 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse>
    %2 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse1>
    %3 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse2>
    %4 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse3>
    %5 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse4>
    %6 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse5>
    %7 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<?x3x4xf64, #sparse3>
    %8 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x?x4xf64, #sparse4>
    %9 = "sparse_tensor.convert"(%0) : (tensor<2x3x4xf64>) -> tensor<2x3x?xf64, #sparse5>
    %10 = "sparse_tensor.convert"(%1) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    %11 = "sparse_tensor.convert"(%2) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    %12 = "sparse_tensor.convert"(%3) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    %13 = "sparse_tensor.convert"(%4) : (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>
    %14 = "sparse_tensor.convert"(%5) : (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>
    %15 = "sparse_tensor.convert"(%6) : (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>
    %16 = "sparse_tensor.convert"(%7) : (tensor<?x3x4xf64, #sparse3>) -> tensor<?x3x4xf64>
    %17 = "sparse_tensor.convert"(%8) : (tensor<2x?x4xf64, #sparse4>) -> tensor<2x?x4xf64>
    %18 = "sparse_tensor.convert"(%9) : (tensor<2x3x?xf64, #sparse5>) -> tensor<2x3x?xf64>
    %19 = "sparse_tensor.convert"(%7) : (tensor<?x3x4xf64, #sparse3>) -> tensor<?x3x?xf64>
    %20 = "sparse_tensor.convert"(%8) : (tensor<2x?x4xf64, #sparse4>) -> tensor<?x?x4xf64>
    "func.call"(%0) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%10) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%11) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%12) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%13) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%14) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%15) <{callee = @dump_234}> : (tensor<2x3x4xf64>) -> ()
    "func.call"(%16) <{callee = @dump_p34}> : (tensor<?x3x4xf64>) -> ()
    "func.call"(%17) <{callee = @dump_2p4}> : (tensor<2x?x4xf64>) -> ()
    "func.call"(%18) <{callee = @dump_23p}> : (tensor<2x3x?xf64>) -> ()
    "func.call"(%19) <{callee = @dump_p3p}> : (tensor<?x3x?xf64>) -> ()
    "func.call"(%20) <{callee = @dump_pp4}> : (tensor<?x?x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x4xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x3x4xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x3x4xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x?x4xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<2x3x?xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<?x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<2x?x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<2x3x?xf64>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<?x3x?xf64>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<?x?x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

