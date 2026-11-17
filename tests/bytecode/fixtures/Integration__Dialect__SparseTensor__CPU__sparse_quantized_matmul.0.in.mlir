"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x3xi8>, tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x6xi32>) -> tensor<5x6xi32>, sym_name = "quantized_matmul"}> ({
  ^bb0(%arg0: tensor<5x3xi8> loc("<stdin>":9:8), %arg1: tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":9:31), %arg2: tensor<5x6xi32> loc("<stdin>":9:63)):
    %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":10:10)
    %9 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":11:10)
    %10 = "linalg.quantized_matmul"(%arg0, %arg1, %9, %8, %arg2) <{operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg3: i8 loc("<stdin>":13:10), %arg4: i8 loc("<stdin>":13:21), %arg5: i32 loc("<stdin>":13:32), %arg6: i32 loc("<stdin>":13:44), %arg7: i32 loc("<stdin>":13:56)):
      %11 = "arith.extsi"(%arg3) : (i8) -> i32 loc("<stdin>":14:13)
      %12 = "arith.subi"(%11, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":15:13)
      %13 = "arith.extsi"(%arg4) : (i8) -> i32 loc("<stdin>":16:13)
      %14 = "arith.subi"(%13, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":17:13)
      %15 = "arith.muli"(%12, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":18:13)
      %16 = "arith.addi"(%arg7, %15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":19:13)
      "linalg.yield"(%16) : (i32) -> () loc("<stdin>":20:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d0, d1)>]} : (tensor<5x3xi8>, tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, i32, i32, tensor<5x6xi32>) -> tensor<5x6xi32> loc("<stdin>":12:11)
    "func.return"(%10) : (tensor<5x6xi32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":25:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":26:10)
    %2 = "arith.constant"() <{value = dense<[[-128, 3, 127], [0, 0, 0], [11, 1, 0], [0, 5, -1], [13, 0, 3]]> : tensor<5x3xi8>}> : () -> tensor<5x3xi8> loc("<stdin>":27:10)
    %3 = "arith.constant"() <{value = dense<[[127, 0, -128, 0, 0, 3], [0, 0, 0, 0, 0, 0], [0, 0, 0, 100, 10, 0]]> : tensor<3x6xi8>}> : () -> tensor<3x6xi8> loc("<stdin>":28:10)
    %4 = "sparse_tensor.convert"(%3) : (tensor<3x6xi8>) -> tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":29:10)
    %5 = "arith.constant"() <{value = dense<0> : tensor<5x6xi32>}> : () -> tensor<5x6xi32> loc("<stdin>":30:10)
    %6 = "func.call"(%2, %4, %5) <{callee = @quantized_matmul}> : (tensor<5x3xi8>, tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x6xi32>) -> tensor<5x6xi32> loc("<stdin>":31:10)
    %7 = "vector.transfer_read"(%6, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<5x6xi32>, index, index, i32) -> vector<5x6xi32> loc("<stdin>":32:10)
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<5x6xi32>) -> () loc("<stdin>":33:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<3x6xi8, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":34:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<5x6xi32>) -> () loc("<stdin>":35:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":7:1)
