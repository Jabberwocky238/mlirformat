#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> ()>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x3xi8>, tensor<3x6xi8, #sparse>, tensor<5x6xi32>) -> tensor<5x6xi32>, sym_name = "quantized_matmul"}> ({
  ^bb0(%arg0: tensor<5x3xi8>, %arg1: tensor<3x6xi8, #sparse>, %arg2: tensor<5x6xi32>):
    %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %10 = "linalg.quantized_matmul"(%arg0, %arg1, %9, %8, %arg2) <{operandSegmentSizes = array<i32: 4, 1>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i32, %arg6: i32, %arg7: i32):
      %11 = "arith.extsi"(%arg3) : (i8) -> i32
      %12 = "arith.subi"(%11, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %13 = "arith.extsi"(%arg4) : (i8) -> i32
      %14 = "arith.subi"(%13, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.muli"(%12, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %16 = "arith.addi"(%arg7, %15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%16) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<5x3xi8>, tensor<3x6xi8, #sparse>, i32, i32, tensor<5x6xi32>) -> tensor<5x6xi32>
    "func.return"(%10) : (tensor<5x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = dense<[[-128, 3, 127], [0, 0, 0], [11, 1, 0], [0, 5, -1], [13, 0, 3]]> : tensor<5x3xi8>}> : () -> tensor<5x3xi8>
    %3 = "arith.constant"() <{value = dense<[[127, 0, -128, 0, 0, 3], [0, 0, 0, 0, 0, 0], [0, 0, 0, 100, 10, 0]]> : tensor<3x6xi8>}> : () -> tensor<3x6xi8>
    %4 = "sparse_tensor.convert"(%3) : (tensor<3x6xi8>) -> tensor<3x6xi8, #sparse>
    %5 = "arith.constant"() <{value = dense<0> : tensor<5x6xi32>}> : () -> tensor<5x6xi32>
    %6 = "func.call"(%2, %4, %5) <{callee = @quantized_matmul}> : (tensor<5x3xi8>, tensor<3x6xi8, #sparse>, tensor<5x6xi32>) -> tensor<5x6xi32>
    %7 = "vector.transfer_read"(%6, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (tensor<5x6xi32>, index, index, i32) -> vector<5x6xi32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<5x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<3x6xi8, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<5x6xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

