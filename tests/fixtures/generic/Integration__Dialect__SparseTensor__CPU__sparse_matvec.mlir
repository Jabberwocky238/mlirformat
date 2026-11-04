#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32, #sparse>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>, sym_name = "kernel_matvec"}> ({
  ^bb0(%arg2: tensor<?x?xi32, #sparse>, %arg3: tensor<?xi32>, %arg4: tensor<?xi32>):
    %13 = "linalg.generic"(%arg2, %arg3, %arg4) <{doc = "X(i) += A(i,j) * B(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32, %arg7: i32):
      %14 = "arith.muli"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.addi"(%arg7, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%15) : (i32) -> ()
    }) : (tensor<?x?xi32, #sparse>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>
    "func.return"(%13) : (tensor<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 256 : index}> : () -> index
    %5 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %6 = "sparse_tensor.new"(%5) : (!llvm.ptr) -> tensor<?x?xi32, #sparse>
    %7 = "tensor.generate"(%4) ({
    ^bb0(%arg1: index):
      %11 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.index_cast"(%11) : (index) -> i32
      "tensor.yield"(%12) : (i32) -> ()
    }) : (index) -> tensor<?xi32>
    %8 = "tensor.generate"(%3) ({
    ^bb0(%arg0: index):
      "tensor.yield"(%0) : (i32) -> ()
    }) : (index) -> tensor<?xi32>
    %9 = "func.call"(%6, %7, %8) <{callee = @kernel_matvec}> : (tensor<?x?xi32, #sparse>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>
    %10 = "vector.transfer_read"(%9, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xi32>, index, i32) -> vector<4xi32>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?xi32>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

