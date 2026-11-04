#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>, sym_name = "conv2d"}> ({
  ^bb0(%arg20: tensor<8x8xi32>, %arg21: tensor<3x3xi32>, %arg22: tensor<6x6xi32>):
    %35 = "linalg.conv_2d"(%arg20, %arg21, %arg22) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: i32, %arg24: i32, %arg25: i32):
      %36 = "arith.muli"(%arg23, %arg24) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %37 = "arith.addi"(%arg25, %36) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%37) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    "func.return"(%35) : (tensor<6x6xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse>, tensor<3x3xi32, #sparse>) -> tensor<6x6xi32, #sparse>, sym_name = "conv2d_all_sparse_DCSR"}> ({
  ^bb0(%arg15: tensor<8x8xi32, #sparse>, %arg16: tensor<3x3xi32, #sparse>):
    %31 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse>
    %32 = "linalg.conv_2d"(%arg15, %arg16, %31) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: i32, %arg18: i32, %arg19: i32):
      %33 = "arith.muli"(%arg17, %arg18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %34 = "arith.addi"(%arg19, %33) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%34) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse>, tensor<3x3xi32, #sparse>, tensor<6x6xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    "func.return"(%32) : (tensor<6x6xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse1>, tensor<3x3xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>, sym_name = "conv2d_all_sparse_CSR"}> ({
  ^bb0(%arg10: tensor<8x8xi32, #sparse1>, %arg11: tensor<3x3xi32, #sparse1>):
    %27 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse1>
    %28 = "linalg.conv_2d"(%arg10, %arg11, %27) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %29 = "arith.muli"(%arg12, %arg13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %30 = "arith.addi"(%arg14, %29) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%30) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse1>, tensor<3x3xi32, #sparse1>, tensor<6x6xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>
    "func.return"(%28) : (tensor<6x6xi32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse2>, tensor<3x3xi32, #sparse2>) -> tensor<6x6xi32, #sparse2>, sym_name = "conv2d_all_sparse_CD"}> ({
  ^bb0(%arg5: tensor<8x8xi32, #sparse2>, %arg6: tensor<3x3xi32, #sparse2>):
    %23 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse2>
    %24 = "linalg.conv_2d"(%arg5, %arg6, %23) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32, %arg9: i32):
      %25 = "arith.muli"(%arg7, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %26 = "arith.addi"(%arg9, %25) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%26) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse2>, tensor<3x3xi32, #sparse2>, tensor<6x6xi32, #sparse2>) -> tensor<6x6xi32, #sparse2>
    "func.return"(%24) : (tensor<6x6xi32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xi32, #sparse3>, tensor<3x3xi32, #sparse3>) -> tensor<6x6xi32, #sparse3>, sym_name = "conv2d_all_sparse_CSC"}> ({
  ^bb0(%arg0: tensor<8x8xi32, #sparse3>, %arg1: tensor<3x3xi32, #sparse3>):
    %19 = "tensor.empty"() : () -> tensor<6x6xi32, #sparse3>
    %20 = "linalg.conv_2d"(%arg0, %arg1, %19) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %21 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %22 = "arith.addi"(%arg4, %21) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%22) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x8xi32, #sparse3>, tensor<3x3xi32, #sparse3>, tensor<6x6xi32, #sparse3>) -> tensor<6x6xi32, #sparse3>
    "func.return"(%20) : (tensor<6x6xi32, #sparse3>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = dense<[[1, 0, -1], [0, 0, 0], [-1, 0, 1]]> : tensor<3x3xi32>}> : () -> tensor<3x3xi32>
    %3 = "sparse_tensor.convert"(%2) : (tensor<3x3xi32>) -> tensor<3x3xi32, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<3x3xi32>) -> tensor<3x3xi32, #sparse1>
    %5 = "sparse_tensor.convert"(%2) : (tensor<3x3xi32>) -> tensor<3x3xi32, #sparse2>
    %6 = "sparse_tensor.convert"(%2) : (tensor<3x3xi32>) -> tensor<3x3xi32, #sparse3>
    %7 = "arith.constant"() <{value = dense<[[1, 2, 3, 4, 0, 6, 7, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 4, 4, 0, 0, 6, 8], [2, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 0, 0, 6, 8], [3, 2, 3, 4, 0, 0, 7, 8], [1, 3, 3, 4, 3, 6, 6, 8], [1, 3, 3, 4, 3, 0, 7, 8]]> : tensor<8x8xi32>}> : () -> tensor<8x8xi32>
    %8 = "sparse_tensor.convert"(%7) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse>
    %9 = "sparse_tensor.convert"(%7) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse1>
    %10 = "sparse_tensor.convert"(%7) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse2>
    %11 = "sparse_tensor.convert"(%7) : (tensor<8x8xi32>) -> tensor<8x8xi32, #sparse3>
    %12 = "arith.constant"() <{value = dense<0> : tensor<6x6xi32>}> : () -> tensor<6x6xi32>
    %13 = "func.call"(%7, %2, %12) <{callee = @conv2d}> : (tensor<8x8xi32>, tensor<3x3xi32>, tensor<6x6xi32>) -> tensor<6x6xi32>
    %14 = "func.call"(%8, %3) <{callee = @conv2d_all_sparse_DCSR}> : (tensor<8x8xi32, #sparse>, tensor<3x3xi32, #sparse>) -> tensor<6x6xi32, #sparse>
    %15 = "func.call"(%9, %4) <{callee = @conv2d_all_sparse_CSR}> : (tensor<8x8xi32, #sparse1>, tensor<3x3xi32, #sparse1>) -> tensor<6x6xi32, #sparse1>
    %16 = "func.call"(%10, %5) <{callee = @conv2d_all_sparse_CD}> : (tensor<8x8xi32, #sparse2>, tensor<3x3xi32, #sparse2>) -> tensor<6x6xi32, #sparse2>
    %17 = "func.call"(%11, %6) <{callee = @conv2d_all_sparse_CSC}> : (tensor<8x8xi32, #sparse3>, tensor<3x3xi32, #sparse3>) -> tensor<6x6xi32, #sparse3>
    %18 = "vector.transfer_read"(%13, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<6x6xi32>, index, index, i32) -> vector<6x6xi32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6xi32>) -> ()
    "sparse_tensor.print"(%14) : (tensor<6x6xi32, #sparse>) -> ()
    "sparse_tensor.print"(%15) : (tensor<6x6xi32, #sparse1>) -> ()
    "sparse_tensor.print"(%16) : (tensor<6x6xi32, #sparse2>) -> ()
    "sparse_tensor.print"(%17) : (tensor<6x6xi32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<8x8xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<8x8xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<8x8xi32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<8x8xi32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<3x3xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<3x3xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<3x3xi32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<3x3xi32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<6x6xi32>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<6x6xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<6x6xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<6x6xi32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<6x6xi32, #sparse3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

