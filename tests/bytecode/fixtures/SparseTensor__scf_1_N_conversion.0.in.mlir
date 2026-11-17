"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, index, index, index) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "for"}> ({
  ^bb0(%arg11: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":4:8), %arg12: index loc("<stdin>":4:43), %arg13: index loc("<stdin>":4:58), %arg14: index loc("<stdin>":4:73)):
    %3 = "scf.for"(%arg12, %arg13, %arg14, %arg11) ({
    ^bb0(%arg15: index loc("<stdin>":6:10), %arg16: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:25)):
      "scf.yield"(%arg16) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":7:7)
    }) : (index, index, index, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:10)
    "func.return"(%3) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, i1) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "if"}> ({
  ^bb0(%arg8: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":12:8), %arg9: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":12:42), %arg10: i1 loc("<stdin>":12:76)):
    %2 = "scf.if"(%arg10) ({
      "scf.yield"(%arg8) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":14:7)
    }, {
      "scf.yield"(%arg9) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":16:7)
    }) : (i1) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":13:10)
    "func.return"(%2) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, i1) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "while"}> ({
  ^bb0(%arg4: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":21:8), %arg5: i1 loc("<stdin>":21:42)):
    %1 = "scf.while"(%arg4) ({
    ^bb0(%arg7: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":23:10)):
      "scf.condition"(%arg5, %arg7) : (i1, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":24:7)
    }, {
    ^bb0(%arg6: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":26:10)):
      "scf.yield"(%arg6) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":27:7)
    }) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":22:10)
    "func.return"(%1) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (index, tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "index_switch"}> ({
  ^bb0(%arg0: index loc("<stdin>":32:8), %arg1: tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:22), %arg2: tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:53), %arg3: tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:84)):
    %0 = "scf.index_switch"(%arg0) <{cases = array<i64: 1, 2>}> ({
      "scf.yield"(%arg3) : (tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":34:7)
    }, {
      "scf.yield"(%arg1) : (tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":36:7)
    }, {
      "scf.yield"(%arg2) : (tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":38:7)
    }) : (index) -> tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":33:10)
    "func.return"(%0) : (tensor<5xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":2:1)
