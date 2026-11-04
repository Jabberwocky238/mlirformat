#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, index, index, index) -> tensor<1024xf32, #sparse>, sym_name = "for"}> ({
  ^bb0(%arg11: tensor<1024xf32, #sparse>, %arg12: index, %arg13: index, %arg14: index):
    %3 = "scf.for"(%arg12, %arg13, %arg14, %arg11) ({
    ^bb0(%arg15: index, %arg16: tensor<1024xf32, #sparse>):
      "scf.yield"(%arg16) : (tensor<1024xf32, #sparse>) -> ()
    }) : (index, index, index, tensor<1024xf32, #sparse>) -> tensor<1024xf32, #sparse>
    "func.return"(%3) : (tensor<1024xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>, i1) -> tensor<1024xf32, #sparse>, sym_name = "if"}> ({
  ^bb0(%arg8: tensor<1024xf32, #sparse>, %arg9: tensor<1024xf32, #sparse>, %arg10: i1):
    %2 = "scf.if"(%arg10) ({
      "scf.yield"(%arg8) : (tensor<1024xf32, #sparse>) -> ()
    }, {
      "scf.yield"(%arg9) : (tensor<1024xf32, #sparse>) -> ()
    }) : (i1) -> tensor<1024xf32, #sparse>
    "func.return"(%2) : (tensor<1024xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, i1) -> tensor<1024xf32, #sparse>, sym_name = "while"}> ({
  ^bb0(%arg4: tensor<1024xf32, #sparse>, %arg5: i1):
    %1 = "scf.while"(%arg4) ({
    ^bb0(%arg7: tensor<1024xf32, #sparse>):
      "scf.condition"(%arg5, %arg7) : (i1, tensor<1024xf32, #sparse>) -> ()
    }, {
    ^bb0(%arg6: tensor<1024xf32, #sparse>):
      "scf.yield"(%arg6) : (tensor<1024xf32, #sparse>) -> ()
    }) : (tensor<1024xf32, #sparse>) -> tensor<1024xf32, #sparse>
    "func.return"(%1) : (tensor<1024xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, tensor<5xf32, #sparse>, tensor<5xf32, #sparse>, tensor<5xf32, #sparse>) -> tensor<5xf32, #sparse>, sym_name = "index_switch"}> ({
  ^bb0(%arg0: index, %arg1: tensor<5xf32, #sparse>, %arg2: tensor<5xf32, #sparse>, %arg3: tensor<5xf32, #sparse>):
    %0 = "scf.index_switch"(%arg0) <{cases = array<i64: 1, 2>}> ({
      "scf.yield"(%arg3) : (tensor<5xf32, #sparse>) -> ()
    }, {
      "scf.yield"(%arg1) : (tensor<5xf32, #sparse>) -> ()
    }, {
      "scf.yield"(%arg2) : (tensor<5xf32, #sparse>) -> ()
    }) : (index) -> tensor<5xf32, #sparse>
    "func.return"(%0) : (tensor<5xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

