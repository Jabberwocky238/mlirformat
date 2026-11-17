"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foreach_print_const"}> ({
    %8 = "arith.constant"() <{value = sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32> loc("<stdin>":9:10)
    "sparse_tensor.foreach"(%8) ({
    ^bb0(%arg29: index loc("<stdin>":11:10), %arg30: index loc("<stdin>":11:25), %arg31: f32 loc("<stdin>":11:40)):
      "vector.print"(%arg29) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":12:7)
      "vector.print"(%arg30) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":13:7)
      "vector.print"(%arg31) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":14:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":15:7)
    }) : (tensor<8x7xf32>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> (), sym_name = "foreach_print_1"}> ({
  ^bb0(%arg25: tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":20:8)):
    "sparse_tensor.foreach"(%arg25) ({
    ^bb0(%arg26: index loc("<stdin>":22:10), %arg27: index loc("<stdin>":22:25), %arg28: f64 loc("<stdin>":22:40)):
      "vector.print"(%arg26) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":23:7)
      "vector.print"(%arg27) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":24:7)
      "vector.print"(%arg28) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":25:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":26:7)
    }) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> (), sym_name = "foreach_print_2"}> ({
  ^bb0(%arg21: tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":31:8)):
    "sparse_tensor.foreach"(%arg21) ({
    ^bb0(%arg22: index loc("<stdin>":33:10), %arg23: index loc("<stdin>":33:25), %arg24: f64 loc("<stdin>":33:40)):
      "vector.print"(%arg22) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":34:7)
      "vector.print"(%arg23) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":35:7)
      "vector.print"(%arg24) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":36:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":37:7)
    }) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> (), sym_name = "foreach_print_3"}> ({
  ^bb0(%arg17: tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":42:8)):
    "sparse_tensor.foreach"(%arg17) ({
    ^bb0(%arg18: index loc("<stdin>":44:10), %arg19: index loc("<stdin>":44:25), %arg20: f64 loc("<stdin>":44:40)):
      "vector.print"(%arg18) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":45:7)
      "vector.print"(%arg19) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":46:7)
      "vector.print"(%arg20) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":47:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":48:7)
    }) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":43:5)
    "func.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> (), sym_name = "foreach_print_4"}> ({
  ^bb0(%arg13: tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":53:8)):
    "sparse_tensor.foreach"(%arg13) ({
    ^bb0(%arg14: index loc("<stdin>":55:10), %arg15: index loc("<stdin>":55:25), %arg16: f64 loc("<stdin>":55:40)):
      "vector.print"(%arg14) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":56:7)
      "vector.print"(%arg15) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":57:7)
      "vector.print"(%arg16) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":58:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":59:7)
    }) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":54:5)
    "func.return"() : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>>) -> (), sym_name = "foreach_print_5"}> ({
  ^bb0(%arg9: tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>> loc("<stdin>":64:8)):
    "sparse_tensor.foreach"(%arg9) ({
    ^bb0(%arg10: index loc("<stdin>":66:10), %arg11: index loc("<stdin>":66:25), %arg12: f64 loc("<stdin>":66:40)):
      "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":67:7)
      "vector.print"(%arg11) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":68:7)
      "vector.print"(%arg12) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":69:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":70:7)
    }) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>>) -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (tensor<7x8x9xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>>) -> (), sym_name = "foreach_print_3d"}> ({
  ^bb0(%arg4: tensor<7x8x9xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>> loc("<stdin>":75:8)):
    "sparse_tensor.foreach"(%arg4) ({
    ^bb0(%arg5: index loc("<stdin>":77:10), %arg6: index loc("<stdin>":77:24), %arg7: index loc("<stdin>":77:38), %arg8: f64 loc("<stdin>":77:52)):
      "vector.print"(%arg5) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":78:7)
      "vector.print"(%arg6) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":79:7)
      "vector.print"(%arg7) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":80:7)
      "vector.print"(%arg8) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":81:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":82:7)
    }) : (tensor<7x8x9xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":76:5)
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = (tensor<2x2xf64>) -> (), sym_name = "foreach_print_dense"}> ({
  ^bb0(%arg0: tensor<2x2xf64> loc("<stdin>":87:8)):
    "sparse_tensor.foreach"(%arg0) ({
    ^bb0(%arg1: index loc("<stdin>":89:10), %arg2: index loc("<stdin>":89:24), %arg3: f64 loc("<stdin>":89:38)):
      "vector.print"(%arg1) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":90:7)
      "vector.print"(%arg2) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":91:7)
      "vector.print"(%arg3) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":92:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":93:7)
    }) : (tensor<2x2xf64>) -> () loc("<stdin>":88:5)
    "func.return"() : () -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":86:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00], [5.000000e+00, 6.000000e+00]]> : tensor<2x2xf64>}> : () -> tensor<2x2xf64> loc("<stdin>":98:10)
    %1 = "arith.constant"() <{value = sparse<[[1, 2, 3], [4, 5, 6]], [1.000000e+00, 2.000000e+00]> : tensor<7x8x9xf64>}> : () -> tensor<7x8x9xf64> loc("<stdin>":99:10)
    %2 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":100:10)
    %3 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":101:10)
    %4 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":102:10)
    %5 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":103:10)
    %6 = "sparse_tensor.convert"(%0) : (tensor<2x2xf64>) -> tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>> loc("<stdin>":104:10)
    %7 = "sparse_tensor.convert"(%1) : (tensor<7x8x9xf64>) -> tensor<7x8x9xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>> loc("<stdin>":105:10)
    "func.call"() <{callee = @foreach_print_const}> : () -> () loc("<stdin>":106:5)
    "func.call"(%0) <{callee = @foreach_print_dense}> : (tensor<2x2xf64>) -> () loc("<stdin>":107:5)
    "func.call"(%2) <{callee = @foreach_print_1}> : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":108:5)
    "func.call"(%3) <{callee = @foreach_print_2}> : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":109:5)
    "func.call"(%4) <{callee = @foreach_print_3}> : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":110:5)
    "func.call"(%5) <{callee = @foreach_print_4}> : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":111:5)
    "func.call"(%6) <{callee = @foreach_print_5}> : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>>) -> () loc("<stdin>":112:5)
    "func.call"(%7) <{callee = @foreach_print_3d}> : (tensor<7x8x9xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":113:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":114:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":115:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":116:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":117:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<2x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton) }>>) -> () loc("<stdin>":118:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<7x8x9xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":119:5)
    "func.return"() : () -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":97:3)
}) : () -> () loc("<stdin>":7:1)
