#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "min1"}> ({
  ^bb0(%arg5: tensor<32xi32, #sparse>, %arg6: tensor<i32>):
    %17 = "tensor.extract"(%arg6) : (tensor<i32>) -> i32
    %18 = "linalg.generic"(%arg5, %arg6) <{doc = "x += MIN_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: i32, %arg8: i32):
      %19 = "sparse_tensor.reduce"(%arg7, %arg8, %17) ({
      ^bb0(%arg9: i32, %arg10: i32):
        %20 = "arith.minsi"(%arg9, %arg10) : (i32, i32) -> i32
        "sparse_tensor.yield"(%20) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%19) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%18) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "min2"}> ({
  ^bb0(%arg1: tensor<32xi32, #sparse>, %arg2: tensor<i32>):
    %14 = "tensor.extract"(%arg2) : (tensor<i32>) -> i32
    %15 = "linalg.generic"(%arg1, %arg2) <{doc = "x += MIN_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %16 = "arith.minsi"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%16) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%15) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %13 = "tensor.extract"(%arg0) : (tensor<i32>) -> i32
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<999> : tensor<i32>}> : () -> tensor<i32>
    %1 = "arith.constant"() <{value = dense<[2, 2, 7, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 9, 2, 2, 2, 2, 0, 5, 1, 7, 3]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %2 = "arith.constant"() <{value = dense<[2, 2, 7, 2, 2, 2, 2, 2, 2, 2, 2, 4, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 7, 2, 2, 2, 2, 2, 2, 1, 7, 3]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %3 = "sparse_tensor.convert"(%1) : (tensor<32xi32>) -> tensor<32xi32, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xi32>) -> tensor<32xi32, #sparse>
    %5 = "arith.constant"() <{value = sparse<[[1], [7]], [0, 22]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %6 = "sparse_tensor.convert"(%5) : (tensor<32xi32>) -> tensor<32xi32, #sparse>
    %7 = "func.call"(%3, %0) <{callee = @min1}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %8 = "func.call"(%4, %0) <{callee = @min1}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %9 = "func.call"(%6, %0) <{callee = @min1}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %10 = "func.call"(%3, %0) <{callee = @min2}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %11 = "func.call"(%4, %0) <{callee = @min2}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %12 = "func.call"(%6, %0) <{callee = @min2}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.call"(%7) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%8) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%9) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%10) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%11) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%12) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<32xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<32xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<32xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

