#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi64, #sparse>) -> tensor<8xi64>, sym_name = "sparse_index_1d_conj"}> ({
  ^bb0(%arg9: tensor<8xi64, #sparse>):
    %47 = "tensor.empty"() : () -> tensor<8xi64>
    %48 = "linalg.generic"(%arg9, %47) <{doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i64, %arg11: i64):
      %49 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %50 = "arith.index_cast"(%49) : (index) -> i64
      %51 = "arith.muli"(%arg10, %50) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%51) : (i64) -> ()
    }) : (tensor<8xi64, #sparse>, tensor<8xi64>) -> tensor<8xi64>
    "func.return"(%48) : (tensor<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi64, #sparse>) -> tensor<8xi64>, sym_name = "sparse_index_1d_disj"}> ({
  ^bb0(%arg6: tensor<8xi64, #sparse>):
    %42 = "tensor.empty"() : () -> tensor<8xi64>
    %43 = "linalg.generic"(%arg6, %42) <{doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i64, %arg8: i64):
      %44 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %45 = "arith.index_cast"(%44) : (index) -> i64
      %46 = "arith.addi"(%arg7, %45) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%46) : (i64) -> ()
    }) : (tensor<8xi64, #sparse>, tensor<8xi64>) -> tensor<8xi64>
    "func.return"(%43) : (tensor<8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>, sym_name = "sparse_index_2d_conj"}> ({
  ^bb0(%arg3: tensor<3x4xi64, #sparse1>):
    %34 = "tensor.empty"() : () -> tensor<3x4xi64>
    %35 = "linalg.generic"(%arg3, %34) <{doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i64, %arg5: i64):
      %36 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %37 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %38 = "arith.index_cast"(%36) : (index) -> i64
      %39 = "arith.index_cast"(%37) : (index) -> i64
      %40 = "arith.muli"(%38, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %41 = "arith.muli"(%39, %40) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%41) : (i64) -> ()
    }) : (tensor<3x4xi64, #sparse1>, tensor<3x4xi64>) -> tensor<3x4xi64>
    "func.return"(%35) : (tensor<3x4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>, sym_name = "sparse_index_2d_disj"}> ({
  ^bb0(%arg0: tensor<3x4xi64, #sparse1>):
    %26 = "tensor.empty"() : () -> tensor<3x4xi64>
    %27 = "linalg.generic"(%arg0, %26) <{doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i64, %arg2: i64):
      %28 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %29 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %30 = "arith.index_cast"(%28) : (index) -> i64
      %31 = "arith.index_cast"(%29) : (index) -> i64
      %32 = "arith.addi"(%30, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %33 = "arith.addi"(%31, %32) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%33) : (i64) -> ()
    }) : (tensor<3x4xi64, #sparse1>, tensor<3x4xi64>) -> tensor<3x4xi64>
    "func.return"(%27) : (tensor<3x4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = sparse<[[2], [4]], [10, 20]> : tensor<8xi64>}> : () -> tensor<8xi64>
    %3 = "sparse_tensor.convert"(%2) : (tensor<8xi64>) -> tensor<8xi64, #sparse>
    %4 = "arith.constant"() <{value = dense<[1, 2, 4, 8, 16, 32, 64, 128]> : tensor<8xi64>}> : () -> tensor<8xi64>
    %5 = "sparse_tensor.convert"(%4) : (tensor<8xi64>) -> tensor<8xi64, #sparse>
    %6 = "arith.constant"() <{value = sparse<[[1, 1], [2, 3]], [10, 20]> : tensor<3x4xi64>}> : () -> tensor<3x4xi64>
    %7 = "sparse_tensor.convert"(%6) : (tensor<3x4xi64>) -> tensor<3x4xi64, #sparse1>
    %8 = "arith.constant"() <{value = dense<[[1, 1, 1, 1], [1, 2, 1, 1], [1, 1, 3, 4]]> : tensor<3x4xi64>}> : () -> tensor<3x4xi64>
    %9 = "sparse_tensor.convert"(%8) : (tensor<3x4xi64>) -> tensor<3x4xi64, #sparse1>
    %10 = "func.call"(%3) <{callee = @sparse_index_1d_conj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %11 = "func.call"(%3) <{callee = @sparse_index_1d_disj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %12 = "func.call"(%5) <{callee = @sparse_index_1d_conj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %13 = "func.call"(%5) <{callee = @sparse_index_1d_disj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64>
    %14 = "func.call"(%7) <{callee = @sparse_index_2d_conj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %15 = "func.call"(%7) <{callee = @sparse_index_2d_disj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %16 = "func.call"(%9) <{callee = @sparse_index_2d_conj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %17 = "func.call"(%9) <{callee = @sparse_index_2d_disj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64>
    %18 = "vector.transfer_read"(%10, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<8xi64>, index, i64) -> vector<8xi64>
    %19 = "vector.transfer_read"(%11, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<8xi64>, index, i64) -> vector<8xi64>
    %20 = "vector.transfer_read"(%12, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<8xi64>, index, i64) -> vector<8xi64>
    %21 = "vector.transfer_read"(%13, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<8xi64>, index, i64) -> vector<8xi64>
    %22 = "vector.transfer_read"(%14, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<3x4xi64>, index, index, i64) -> vector<3x4xi64>
    %23 = "vector.transfer_read"(%15, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<3x4xi64>, index, index, i64) -> vector<3x4xi64>
    %24 = "vector.transfer_read"(%16, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<3x4xi64>, index, index, i64) -> vector<3x4xi64>
    %25 = "vector.transfer_read"(%17, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<3x4xi64>, index, index, i64) -> vector<3x4xi64>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi64>) -> ()
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi64>) -> ()
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi64>) -> ()
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi64>) -> ()
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xi64>) -> ()
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xi64>) -> ()
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xi64>) -> ()
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xi64>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<8xi64>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<8xi64>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<8xi64>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<8xi64>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<3x4xi64>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<3x4xi64>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<3x4xi64>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<3x4xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

