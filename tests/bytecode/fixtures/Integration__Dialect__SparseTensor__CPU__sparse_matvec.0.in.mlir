"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>, sym_name = "kernel_matvec"}> ({
  ^bb0(%arg2: tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>> loc("<stdin>":8:8), %arg3: tensor<?xi32> loc("<stdin>":8:41), %arg4: tensor<?xi32> loc("<stdin>":8:63)):
    %13 = "linalg.generic"(%arg2, %arg3, %arg4) <{doc = "X(i) += A(i,j) * B(j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: i32 loc("<stdin>":10:10), %arg6: i32 loc("<stdin>":10:22), %arg7: i32 loc("<stdin>":10:34)):
      %14 = "arith.muli"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:13)
      %15 = "arith.addi"(%arg7, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":12:13)
      "linalg.yield"(%15) : (i32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32> loc("<stdin>":9:11)
    "func.return"(%13) : (tensor<?xi32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":20:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":21:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":22:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":23:10)
    %4 = "arith.constant"() <{value = 256 : index}> : () -> index loc("<stdin>":24:10)
    %5 = "func.call"(%1) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr loc("<stdin>":25:10)
    %6 = "sparse_tensor.new"(%5) : (!llvm.ptr) -> tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>> loc("<stdin>":26:10)
    %7 = "tensor.generate"(%4) ({
    ^bb0(%arg1: index loc("<stdin>":28:10)):
      %11 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":29:13)
      %12 = "arith.index_cast"(%11) : (index) -> i32 loc("<stdin>":30:13)
      "tensor.yield"(%12) : (i32) -> () loc("<stdin>":31:7)
    }) : (index) -> tensor<?xi32> loc("<stdin>":27:10)
    %8 = "tensor.generate"(%3) ({
    ^bb0(%arg0: index loc("<stdin>":34:10)):
      "tensor.yield"(%0) : (i32) -> () loc("<stdin>":35:7)
    }) : (index) -> tensor<?xi32> loc("<stdin>":33:10)
    %9 = "func.call"(%6, %7, %8) <{callee = @kernel_matvec}> : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32> loc("<stdin>":37:10)
    %10 = "vector.transfer_read"(%9, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<?xi32>, index, i32) -> vector<4xi32> loc("<stdin>":38:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> () loc("<stdin>":39:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xi32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>>) -> () loc("<stdin>":40:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<?xi32>) -> () loc("<stdin>":41:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<?xi32>) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":6:1)
