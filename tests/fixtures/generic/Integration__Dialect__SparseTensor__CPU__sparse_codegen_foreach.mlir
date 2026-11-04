#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foreach_print_const"}> ({
    %8 = "arith.constant"() <{value = sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32>
    "sparse_tensor.foreach"(%8) ({
    ^bb0(%arg29: index, %arg30: index, %arg31: f32):
      "vector.print"(%arg29) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg30) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg31) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<8x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse>) -> (), sym_name = "foreach_print_1"}> ({
  ^bb0(%arg25: tensor<2x2xf64, #sparse>):
    "sparse_tensor.foreach"(%arg25) ({
    ^bb0(%arg26: index, %arg27: index, %arg28: f64):
      "vector.print"(%arg26) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg27) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg28) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse1>) -> (), sym_name = "foreach_print_2"}> ({
  ^bb0(%arg21: tensor<2x2xf64, #sparse1>):
    "sparse_tensor.foreach"(%arg21) ({
    ^bb0(%arg22: index, %arg23: index, %arg24: f64):
      "vector.print"(%arg22) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg23) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg24) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse2>) -> (), sym_name = "foreach_print_3"}> ({
  ^bb0(%arg17: tensor<2x2xf64, #sparse2>):
    "sparse_tensor.foreach"(%arg17) ({
    ^bb0(%arg18: index, %arg19: index, %arg20: f64):
      "vector.print"(%arg18) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg19) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg20) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse3>) -> (), sym_name = "foreach_print_4"}> ({
  ^bb0(%arg13: tensor<2x2xf64, #sparse3>):
    "sparse_tensor.foreach"(%arg13) ({
    ^bb0(%arg14: index, %arg15: index, %arg16: f64):
      "vector.print"(%arg14) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg15) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg16) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64, #sparse3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse4>) -> (), sym_name = "foreach_print_5"}> ({
  ^bb0(%arg9: tensor<2x2xf64, #sparse4>):
    "sparse_tensor.foreach"(%arg9) ({
    ^bb0(%arg10: index, %arg11: index, %arg12: f64):
      "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg11) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg12) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64, #sparse4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x8x9xf64, #sparse5>) -> (), sym_name = "foreach_print_3d"}> ({
  ^bb0(%arg4: tensor<7x8x9xf64, #sparse5>):
    "sparse_tensor.foreach"(%arg4) ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: f64):
      "vector.print"(%arg5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg6) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg7) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg8) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<7x8x9xf64, #sparse5>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x2xf64>) -> (), sym_name = "foreach_print_dense"}> ({
  ^bb0(%arg0: tensor<2x2xf64>):
    "sparse_tensor.foreach"(%arg0) ({
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      "vector.print"(%arg1) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg2) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg3) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00], [5.000000e+00, 6.000000e+00]]> : tensor<2x2xf64>}> : () -> tensor<2x2xf64>
    %1 = "arith.constant"() <{value = sparse<[[1, 2, 3], [4, 5, 6]], [1.000000e+00, 2.000000e+00]> : tensor<7x8x9xf64>}> : () -> tensor<7x8x9xf64>
    %2 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse>
    %3 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse1>
    %4 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse2>
    %5 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse3>
    %6 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse4>
    %7 = "sparse_tensor.convert"(%1) : (tensor<7x8x9xf64>) -> tensor<7x8x9xf64, #sparse5>
    "func.call"() <{callee = @foreach_print_const}> : () -> ()
    "func.call"(%0) <{callee = @foreach_print_dense}> : (tensor<2x2xf64>) -> ()
    "func.call"(%2) <{callee = @foreach_print_1}> : (tensor<2x2xf64, #sparse>) -> ()
    "func.call"(%3) <{callee = @foreach_print_2}> : (tensor<2x2xf64, #sparse1>) -> ()
    "func.call"(%4) <{callee = @foreach_print_3}> : (tensor<2x2xf64, #sparse2>) -> ()
    "func.call"(%5) <{callee = @foreach_print_4}> : (tensor<2x2xf64, #sparse3>) -> ()
    "func.call"(%6) <{callee = @foreach_print_5}> : (tensor<2x2xf64, #sparse4>) -> ()
    "func.call"(%7) <{callee = @foreach_print_3d}> : (tensor<7x8x9xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<2x2xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<2x2xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x2xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x2xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x2xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<7x8x9xf64, #sparse5>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

