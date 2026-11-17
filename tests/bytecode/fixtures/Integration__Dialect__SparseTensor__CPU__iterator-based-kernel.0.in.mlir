"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>>) -> tensor<i32>, sym_name = "sqsum"}> ({
  ^bb0(%arg5: tensor<2x3x4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>> loc("<stdin>":8:8)):
    %15 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":9:11)
    %16 = "linalg.generic"(%arg5, %15) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> ()>], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32 loc("<stdin>":11:10), %arg7: i32 loc("<stdin>":11:22)):
      %17 = "arith.muli"(%arg6, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:13)
      %18 = "arith.addi"(%arg7, %17) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":13:13)
      "linalg.yield"(%18) : (i32) -> () loc("<stdin>":14:7)
    }) : (tensor<2x3x4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>>, tensor<i32>) -> tensor<i32> loc("<stdin>":10:11)
    "func.return"(%16) : (tensor<i32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<4xi32>, sym_name = "vec_add"}> ({
  ^bb0(%arg0: tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":19:8), %arg1: tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":19:40)):
    %12 = "arith.constant"() <{value = dense<0> : tensor<4xi32>}> : () -> tensor<4xi32> loc("<stdin>":20:11)
    %13 = "linalg.generic"(%arg0, %arg1, %12) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32 loc("<stdin>":22:10), %arg3: i32 loc("<stdin>":22:22), %arg4: i32 loc("<stdin>":22:34)):
      %14 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":23:13)
      "linalg.yield"(%14) : (i32) -> () loc("<stdin>":24:7)
    }) : (tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<4xi32>) -> tensor<4xi32> loc("<stdin>":21:11)
    "func.return"(%13) : (tensor<4xi32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":30:10)
    %2 = "arith.constant"() <{value = sparse<[[0, 1, 2, 3], [1, 1, 2, 3], [1, 2, 2, 3], [1, 2, 3, 4]], 1> : tensor<2x3x4x5xi32>}> : () -> tensor<2x3x4x5xi32> loc("<stdin>":31:10)
    %3 = "arith.constant"() <{value = dense<[0, 1, 2, 3]> : tensor<4xi32>}> : () -> tensor<4xi32> loc("<stdin>":32:10)
    %4 = "arith.constant"() <{value = dense<[1, 0, 3, 0]> : tensor<4xi32>}> : () -> tensor<4xi32> loc("<stdin>":33:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<2x3x4x5xi32>) -> tensor<2x3x4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>> loc("<stdin>":34:10)
    %6 = "func.call"(%5) <{callee = @sqsum}> : (tensor<2x3x4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>>) -> tensor<i32> loc("<stdin>":35:10)
    %7 = "tensor.extract"(%6) : (tensor<i32>) -> i32 loc("<stdin>":36:10)
    %8 = "sparse_tensor.convert"(%3) : (tensor<4xi32>) -> tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":37:10)
    %9 = "sparse_tensor.convert"(%4) : (tensor<4xi32>) -> tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":38:10)
    %10 = "func.call"(%8, %9) <{callee = @vec_add}> : (tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<4xi32> loc("<stdin>":39:11)
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i32) -> () loc("<stdin>":40:5)
    %11 = "vector.transfer_read"(%10, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<4xi32>, index, i32) -> vector<4xi32> loc("<stdin>":41:11)
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> () loc("<stdin>":42:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4x5xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)), explicitVal = 1 : i32 }>>) -> () loc("<stdin>":43:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<i32>) -> () loc("<stdin>":44:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":45:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<4xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":46:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<4xi32>) -> () loc("<stdin>":47:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":6:1)
