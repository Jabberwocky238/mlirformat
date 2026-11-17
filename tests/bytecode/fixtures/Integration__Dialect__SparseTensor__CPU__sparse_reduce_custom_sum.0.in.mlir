"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "red0"}> ({
  ^bb0(%arg21: tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:8), %arg22: tensor<i32> loc("<stdin>":6:40)):
    %27 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":7:11)
    %28 = "linalg.generic"(%arg21, %arg22) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg23: i32 loc("<stdin>":9:10), %arg24: i32 loc("<stdin>":9:23)):
      %29 = "sparse_tensor.unary"(%arg23) ({
      }, {
      }) : (i32) -> i32 loc("<stdin>":10:13)
      %30 = "sparse_tensor.reduce"(%29, %arg24, %27) ({
      ^bb0(%arg25: i32 loc("<stdin>":14:12), %arg26: i32 loc("<stdin>":14:25)):
        %31 = "arith.addi"(%arg25, %arg26) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":15:15)
        "sparse_tensor.yield"(%31) : (i32) -> () loc("<stdin>":16:9)
      }) : (i32, i32, i32) -> i32 loc("<stdin>":13:13)
      "linalg.yield"(%30) : (i32) -> () loc("<stdin>":18:7)
    }) : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":8:11)
    "func.return"(%28) : (tensor<i32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "red1"}> ({
  ^bb0(%arg14: tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":23:8), %arg15: tensor<i32> loc("<stdin>":23:40)):
    %21 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":24:11)
    %22 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":25:11)
    %23 = "linalg.generic"(%arg14, %arg15) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: i32 loc("<stdin>":27:10), %arg17: i32 loc("<stdin>":27:23)):
      %24 = "sparse_tensor.unary"(%arg16) ({
      ^bb0(%arg20: i32 loc("<stdin>":29:12)):
        "sparse_tensor.yield"(%22) : (i32) -> () loc("<stdin>":30:9)
      }, {
      }) : (i32) -> i32 loc("<stdin>":28:13)
      %25 = "sparse_tensor.reduce"(%24, %arg17, %21) ({
      ^bb0(%arg18: i32 loc("<stdin>":34:12), %arg19: i32 loc("<stdin>":34:25)):
        %26 = "arith.addi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":35:15)
        "sparse_tensor.yield"(%26) : (i32) -> () loc("<stdin>":36:9)
      }) : (i32, i32, i32) -> i32 loc("<stdin>":33:13)
      "linalg.yield"(%25) : (i32) -> () loc("<stdin>":38:7)
    }) : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":26:11)
    "func.return"(%23) : (tensor<i32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "red2"}> ({
  ^bb0(%arg8: tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":43:8), %arg9: tensor<i32> loc("<stdin>":43:39)):
    %15 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":44:11)
    %16 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":45:11)
    %17 = "linalg.generic"(%arg8, %arg9) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i32 loc("<stdin>":47:10), %arg11: i32 loc("<stdin>":47:23)):
      %18 = "sparse_tensor.unary"(%arg10) ({
      }, {
        "sparse_tensor.yield"(%16) : (i32) -> () loc("<stdin>":50:9)
      }) : (i32) -> i32 loc("<stdin>":48:13)
      %19 = "sparse_tensor.reduce"(%18, %arg11, %15) ({
      ^bb0(%arg12: i32 loc("<stdin>":53:12), %arg13: i32 loc("<stdin>":53:25)):
        %20 = "arith.addi"(%arg12, %arg13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":54:15)
        "sparse_tensor.yield"(%20) : (i32) -> () loc("<stdin>":55:9)
      }) : (i32, i32, i32) -> i32 loc("<stdin>":52:13)
      "linalg.yield"(%19) : (i32) -> () loc("<stdin>":57:7)
    }) : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":46:11)
    "func.return"(%17) : (tensor<i32>) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "red3"}> ({
  ^bb0(%arg1: tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":62:8), %arg2: tensor<i32> loc("<stdin>":62:39)):
    %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":63:10)
    %9 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":64:10)
    %10 = "arith.constant"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":65:11)
    %11 = "linalg.generic"(%arg1, %arg2) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":67:10), %arg4: i32 loc("<stdin>":67:22)):
      %12 = "sparse_tensor.unary"(%arg3) ({
      ^bb0(%arg7: i32 loc("<stdin>":69:12)):
        "sparse_tensor.yield"(%9) : (i32) -> () loc("<stdin>":70:9)
      }, {
        "sparse_tensor.yield"(%10) : (i32) -> () loc("<stdin>":72:9)
      }) : (i32) -> i32 loc("<stdin>":68:13)
      %13 = "sparse_tensor.reduce"(%12, %arg4, %8) ({
      ^bb0(%arg5: i32 loc("<stdin>":75:12), %arg6: i32 loc("<stdin>":75:24)):
        %14 = "arith.addi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":76:15)
        "sparse_tensor.yield"(%14) : (i32) -> () loc("<stdin>":77:9)
      }) : (i32, i32, i32) -> i32 loc("<stdin>":74:13)
      "linalg.yield"(%13) : (i32) -> () loc("<stdin>":79:7)
    }) : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":66:11)
    "func.return"(%11) : (tensor<i32>) -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":61:3)
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":84:8)):
    %7 = "tensor.extract"(%arg0) : (tensor<i32>) -> i32 loc("<stdin>":85:10)
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":86:5)
    "func.return"() : () -> () loc("<stdin>":87:5)
  }) : () -> () loc("<stdin>":83:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":90:10)
    %1 = "arith.constant"() <{value = sparse<[[4], [6]], [99, 999]> : tensor<8xi32>}> : () -> tensor<8xi32> loc("<stdin>":91:10)
    %2 = "sparse_tensor.convert"(%1) : (tensor<8xi32>) -> tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":92:10)
    %3 = "func.call"(%2, %0) <{callee = @red0}> : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":93:10)
    %4 = "func.call"(%2, %0) <{callee = @red1}> : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":94:10)
    %5 = "func.call"(%2, %0) <{callee = @red2}> : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":95:10)
    %6 = "func.call"(%2, %0) <{callee = @red3}> : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":96:10)
    "func.call"(%3) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":97:5)
    "func.call"(%4) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":98:5)
    "func.call"(%5) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":99:5)
    "func.call"(%6) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":100:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<8xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":101:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<i32>) -> () loc("<stdin>":102:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<i32>) -> () loc("<stdin>":103:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<i32>) -> () loc("<stdin>":104:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<i32>) -> () loc("<stdin>":105:5)
    "func.return"() : () -> () loc("<stdin>":106:5)
  }) : () -> () loc("<stdin>":89:3)
}) : () -> () loc("<stdin>":4:1)
