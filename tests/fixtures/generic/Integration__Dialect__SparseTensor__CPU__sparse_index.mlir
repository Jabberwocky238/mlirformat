#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>, sym_name = "sparse_index_1d_conj"}> ({
  ^bb0(%arg12: tensor<8xi64, #sparse>):
    %49 = "tensor.empty"() : () -> tensor<8xi64, #sparse>
    %50 = "linalg.generic"(%arg12, %49) <{doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: i64, %arg14: i64):
      %51 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %52 = "arith.index_cast"(%51) : (index) -> i64
      %53 = "arith.muli"(%arg13, %52) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%53) : (i64) -> ()
    }) : (tensor<8xi64, #sparse>, tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    "func.return"(%50) : (tensor<8xi64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>, sym_name = "sparse_index_1d_disj"}> ({
  ^bb0(%arg9: tensor<8xi64, #sparse>):
    %44 = "tensor.empty"() : () -> tensor<8xi64, #sparse>
    %45 = "linalg.generic"(%arg9, %44) <{doc = "X(i) = a(i) op i", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i64, %arg11: i64):
      %46 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %47 = "arith.index_cast"(%46) : (index) -> i64
      %48 = "arith.addi"(%arg10, %47) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%48) : (i64) -> ()
    }) : (tensor<8xi64, #sparse>, tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    "func.return"(%45) : (tensor<8xi64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>, sym_name = "sparse_index_2d_conj"}> ({
  ^bb0(%arg6: tensor<3x4xi64, #sparse1>):
    %36 = "tensor.empty"() : () -> tensor<3x4xi64, #sparse1>
    %37 = "linalg.generic"(%arg6, %36) <{doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i64, %arg8: i64):
      %38 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %39 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %40 = "arith.index_cast"(%38) : (index) -> i64
      %41 = "arith.index_cast"(%39) : (index) -> i64
      %42 = "arith.muli"(%40, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %43 = "arith.muli"(%41, %42) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%43) : (i64) -> ()
    }) : (tensor<3x4xi64, #sparse1>, tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    "func.return"(%37) : (tensor<3x4xi64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>, sym_name = "sparse_index_2d_disj"}> ({
  ^bb0(%arg3: tensor<3x4xi64, #sparse1>):
    %28 = "tensor.empty"() : () -> tensor<3x4xi64, #sparse1>
    %29 = "linalg.generic"(%arg3, %28) <{doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i64, %arg5: i64):
      %30 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %31 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %32 = "arith.index_cast"(%30) : (index) -> i64
      %33 = "arith.index_cast"(%31) : (index) -> i64
      %34 = "arith.addi"(%32, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %35 = "arith.addi"(%33, %34) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%35) : (i64) -> ()
    }) : (tensor<3x4xi64, #sparse1>, tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    "func.return"(%29) : (tensor<3x4xi64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3xf32, #sparse1>) -> tensor<2x3xf32, #sparse1>, sym_name = "add_outer_2d"}> ({
  ^bb0(%arg0: tensor<2x3xf32, #sparse1>):
    %22 = "tensor.empty"() : () -> tensor<2x3xf32, #sparse1>
    %23 = "linalg.generic"(%arg0, %22) <{doc = "X(i,j) = A(i,j) op i op j", indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %24 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %25 = "arith.index_cast"(%24) : (index) -> i64
      %26 = "arith.uitofp"(%25) : (i64) -> f32
      %27 = "arith.addf"(%arg1, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<2x3xf32, #sparse1>, tensor<2x3xf32, #sparse1>) -> tensor<2x3xf32, #sparse1>
    "func.return"(%23) : (tensor<2x3xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = sparse<[[2], [4]], [10, 20]> : tensor<8xi64>}> : () -> tensor<8xi64>
    %4 = "sparse_tensor.convert"(%3) : (tensor<8xi64>) -> tensor<8xi64, #sparse>
    %5 = "arith.constant"() <{value = dense<[1, 2, 4, 8, 16, 32, 64, 128]> : tensor<8xi64>}> : () -> tensor<8xi64>
    %6 = "sparse_tensor.convert"(%5) : (tensor<8xi64>) -> tensor<8xi64, #sparse>
    %7 = "arith.constant"() <{value = sparse<[[1, 1], [2, 3]], [10, 20]> : tensor<3x4xi64>}> : () -> tensor<3x4xi64>
    %8 = "sparse_tensor.convert"(%7) : (tensor<3x4xi64>) -> tensor<3x4xi64, #sparse1>
    %9 = "arith.constant"() <{value = dense<[[1, 1, 1, 1], [1, 2, 1, 1], [1, 1, 3, 4]]> : tensor<3x4xi64>}> : () -> tensor<3x4xi64>
    %10 = "sparse_tensor.convert"(%9) : (tensor<3x4xi64>) -> tensor<3x4xi64, #sparse1>
    %11 = "arith.constant"() <{value = sparse<[[0, 1], [1, 2]], [1.000000e+01, 4.100000e+01]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %12 = "sparse_tensor.convert"(%11) : (tensor<2x3xf32>) -> tensor<2x3xf32, #sparse1>
    %13 = "func.call"(%4) <{callee = @sparse_index_1d_conj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %14 = "func.call"(%4) <{callee = @sparse_index_1d_disj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %15 = "func.call"(%6) <{callee = @sparse_index_1d_conj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %16 = "func.call"(%6) <{callee = @sparse_index_1d_disj}> : (tensor<8xi64, #sparse>) -> tensor<8xi64, #sparse>
    %17 = "func.call"(%8) <{callee = @sparse_index_2d_conj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    %18 = "func.call"(%8) <{callee = @sparse_index_2d_disj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    %19 = "func.call"(%10) <{callee = @sparse_index_2d_conj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    %20 = "func.call"(%10) <{callee = @sparse_index_2d_disj}> : (tensor<3x4xi64, #sparse1>) -> tensor<3x4xi64, #sparse1>
    "sparse_tensor.print"(%13) : (tensor<8xi64, #sparse>) -> ()
    "sparse_tensor.print"(%14) : (tensor<8xi64, #sparse>) -> ()
    "sparse_tensor.print"(%15) : (tensor<8xi64, #sparse>) -> ()
    "sparse_tensor.print"(%16) : (tensor<8xi64, #sparse>) -> ()
    "sparse_tensor.print"(%17) : (tensor<3x4xi64, #sparse1>) -> ()
    "sparse_tensor.print"(%18) : (tensor<3x4xi64, #sparse1>) -> ()
    "sparse_tensor.print"(%19) : (tensor<3x4xi64, #sparse1>) -> ()
    "sparse_tensor.print"(%20) : (tensor<3x4xi64, #sparse1>) -> ()
    %21 = "func.call"(%12) <{callee = @add_outer_2d}> : (tensor<2x3xf32, #sparse1>) -> tensor<2x3xf32, #sparse1>
    "sparse_tensor.print"(%21) : (tensor<2x3xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<8xi64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<3x4xi64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<2x3xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<2x3xf32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

