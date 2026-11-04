#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xi32>, tensor<5x5xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d"}> ({
  ^bb0(%arg12: tensor<10x10xi32>, %arg13: tensor<5x5xi32>, %arg14: tensor<6x6xi32>):
    %36 = "linalg.conv_2d"(%arg12, %arg13, %arg14) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i32, %arg16: i32, %arg17: i32):
      %37 = "arith.muli"(%arg15, %arg16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %38 = "arith.addi"(%arg17, %37) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%38) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<10x10xi32>, tensor<5x5xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%36) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d_ss"}> ({
  ^bb0(%arg6: tensor<10x10xi32, #sparse>, %arg7: tensor<5x5xi32, #sparse>, %arg8: tensor<6x6xi32>):
    %33 = "linalg.conv_2d"(%arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      %34 = "arith.muli"(%arg9, %arg10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %35 = "arith.addi"(%arg11, %34) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%35) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%33) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d_bs"}> ({
  ^bb0(%arg0: tensor<10x10xi32, #sparse1>, %arg1: tensor<5x5xi32, #sparse>, %arg2: tensor<6x6xi32>):
    %30 = "linalg.conv_2d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %31 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %32 = "arith.addi"(%arg5, %31) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%32) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%30) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = dense<[[-1, -2, -3, -4, -5], [-6, -7, -8, -9, -10], [-11, -12, -13, -14, -15], [-16, -17, -18, -19, -20], [-21, -22, -23, -24, -25]]> : tensor<5x5xi32>}> : () -> tensor<5x5xi32>
    %3 = "arith.constant"() <{value = dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], [20, 21, 22, 23, 24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35, 36, 37, 38, 39], [40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [50, 51, 52, 53, 54, 55, 56, 57, 58, 59], [60, 61, 62, 63, 64, 65, 66, 67, 68, 69], [70, 71, 72, 73, 74, 75, 76, 77, 78, 79], [80, 81, 82, 83, 84, 85, 86, 87, 88, 89], [90, 91, 92, 93, 94, 95, 96, 97, 98, 99]]> : tensor<10x10xi32>}> : () -> tensor<10x10xi32>
    %4 = "arith.constant"() <{value = dense<[[0, -1, 0, -2, 0], [0, 0, 0, 0, 0], [0, 0, 8, 0, 0], [-3, 0, 0, -4, 0], [0, 0, -5, 0, -6]]> : tensor<5x5xi32>}> : () -> tensor<5x5xi32>
    %5 = "arith.constant"() <{value = dense<[[0, 1, 2, 3, 0, 0, 0, 0, 0, 0], [0, 4, 0, 0, 5, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 6, 0, 0, 7], [0, 0, 0, 0, 0, 0, 0, 8, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 9, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 10, 0, 0, 0, 0, 0]]> : tensor<10x10xi32>}> : () -> tensor<10x10xi32>
    %6 = "sparse_tensor.convert"(%3) : (tensor<10x10xi32>) -> tensor<10x10xi32, #sparse>
    %7 = "sparse_tensor.convert"(%3) : (tensor<10x10xi32>) -> tensor<10x10xi32, #sparse1>
    %8 = "sparse_tensor.convert"(%2) : (tensor<5x5xi32>) -> tensor<5x5xi32, #sparse>
    %9 = "sparse_tensor.convert"(%5) : (tensor<10x10xi32>) -> tensor<10x10xi32, #sparse>
    %10 = "sparse_tensor.convert"(%5) : (tensor<10x10xi32>) -> tensor<10x10xi32, #sparse1>
    %11 = "sparse_tensor.convert"(%4) : (tensor<5x5xi32>) -> tensor<5x5xi32, #sparse>
    %12 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %13 = "func.call"(%3, %2, %12) <{callee = @conv2d}> : (tensor<10x10xi32>, tensor<5x5xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %14 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %15 = "func.call"(%6, %8, %14) <{callee = @conv2d_ss}> : (tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %16 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %17 = "func.call"(%7, %8, %16) <{callee = @conv2d_bs}> : (tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %18 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %19 = "func.call"(%5, %4, %18) <{callee = @conv2d}> : (tensor<10x10xi32>, tensor<5x5xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %20 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %21 = "func.call"(%9, %11, %20) <{callee = @conv2d_ss}> : (tensor<10x10xi32, #sparse>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %22 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %23 = "func.call"(%10, %11, %22) <{callee = @conv2d_bs}> : (tensor<10x10xi32, #sparse1>, tensor<5x5xi32, #sparse>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %24 = "vector.transfer_read"(%13, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    %25 = "vector.transfer_read"(%15, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    %26 = "vector.transfer_read"(%17, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    %27 = "vector.transfer_read"(%19, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    %28 = "vector.transfer_read"(%21, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    %29 = "vector.transfer_read"(%23, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<10x10xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<10x10xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<5x5xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<10x10xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<10x10xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<5x5xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%23) : (tensor<6x6xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

