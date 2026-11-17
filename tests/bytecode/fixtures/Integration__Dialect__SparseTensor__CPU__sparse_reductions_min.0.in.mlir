"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "min1"}> ({
  ^bb0(%arg5: tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:8), %arg6: tensor<i32> loc("<stdin>":6:40)):
    %17 = "tensor.extract"(%arg6) : (tensor<i32>) -> i32 loc("<stdin>":7:11)
    %18 = "linalg.generic"(%arg5, %arg6) <{doc = "x += MIN_i a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32 loc("<stdin>":9:10), %arg8: i32 loc("<stdin>":9:22)):
      %19 = "sparse_tensor.reduce"(%arg7, %arg8, %17) ({
      ^bb0(%arg9: i32 loc("<stdin>":11:12), %arg10: i32 loc("<stdin>":11:24)):
        %20 = "arith.minsi"(%arg9, %arg10) : (i32, i32) -> i32 loc("<stdin>":12:15)
        "sparse_tensor.yield"(%20) : (i32) -> () loc("<stdin>":13:9)
      }) : (i32, i32, i32) -> i32 loc("<stdin>":10:13)
      "linalg.yield"(%19) : (i32) -> () loc("<stdin>":15:7)
    }) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":8:11)
    "func.return"(%18) : (tensor<i32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32>, sym_name = "min2"}> ({
  ^bb0(%arg1: tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":20:8), %arg2: tensor<i32> loc("<stdin>":20:40)):
    %14 = "tensor.extract"(%arg2) : (tensor<i32>) -> i32 loc("<stdin>":21:11)
    %15 = "linalg.generic"(%arg1, %arg2) <{doc = "x += MIN_i a(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":23:10), %arg4: i32 loc("<stdin>":23:22)):
      %16 = "arith.minsi"(%arg3, %arg4) : (i32, i32) -> i32 loc("<stdin>":24:13)
      "linalg.yield"(%16) : (i32) -> () loc("<stdin>":25:7)
    }) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":22:11)
    "func.return"(%15) : (tensor<i32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":30:8)):
    %13 = "tensor.extract"(%arg0) : (tensor<i32>) -> i32 loc("<stdin>":31:11)
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<999> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":36:10)
    %1 = "arith.constant"() <{value = dense<[2, 2, 7, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 9, 2, 2, 2, 2, 0, 5, 1, 7, 3]> : tensor<32xi32>}> : () -> tensor<32xi32> loc("<stdin>":37:10)
    %2 = "arith.constant"() <{value = dense<[2, 2, 7, 2, 2, 2, 2, 2, 2, 2, 2, 4, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 7, 2, 2, 2, 2, 2, 2, 1, 7, 3]> : tensor<32xi32>}> : () -> tensor<32xi32> loc("<stdin>":38:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xi32>) -> tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":39:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xi32>) -> tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":40:10)
    %5 = "arith.constant"() <{value = sparse<[[1], [7]], [0, 22]> : tensor<32xi32>}> : () -> tensor<32xi32> loc("<stdin>":41:10)
    %6 = "sparse_tensor.convert"(%5) : (tensor<32xi32>) -> tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":42:10)
    %7 = "func.call"(%3, %0) <{callee = @min1}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":43:10)
    %8 = "func.call"(%4, %0) <{callee = @min1}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":44:10)
    %9 = "func.call"(%6, %0) <{callee = @min1}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":45:10)
    %10 = "func.call"(%3, %0) <{callee = @min2}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":46:11)
    %11 = "func.call"(%4, %0) <{callee = @min2}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":47:11)
    %12 = "func.call"(%6, %0) <{callee = @min2}> : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":48:11)
    "func.call"(%7) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":49:5)
    "func.call"(%8) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":50:5)
    "func.call"(%9) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":51:5)
    "func.call"(%10) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":52:5)
    "func.call"(%11) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":53:5)
    "func.call"(%12) <{callee = @dump_i32}> : (tensor<i32>) -> () loc("<stdin>":54:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":55:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":56:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<32xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":57:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<i32>) -> () loc("<stdin>":58:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<i32>) -> () loc("<stdin>":59:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<i32>) -> () loc("<stdin>":60:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<i32>) -> () loc("<stdin>":61:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<i32>) -> () loc("<stdin>":62:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<i32>) -> () loc("<stdin>":63:5)
    "func.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":4:1)
