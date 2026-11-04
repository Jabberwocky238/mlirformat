#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "red0"}> ({
  ^bb0(%arg21: tensor<8xi32, #sparse>, %arg22: tensor<i32>):
    %27 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %28 = "linalg.generic"(%arg21, %arg22) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg23: i32, %arg24: i32):
      %29 = "sparse_tensor.unary"(%arg23) ({
      }, {
      }) : (i32) -> i32
      %30 = "sparse_tensor.reduce"(%29, %arg24, %27) ({
      ^bb0(%arg25: i32, %arg26: i32):
        %31 = "arith.addi"(%arg25, %arg26) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%31) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%30) : (i32) -> ()
    }) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%28) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "red1"}> ({
  ^bb0(%arg14: tensor<8xi32, #sparse>, %arg15: tensor<i32>):
    %21 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %22 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %23 = "linalg.generic"(%arg14, %arg15) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg16: i32, %arg17: i32):
      %24 = "sparse_tensor.unary"(%arg16) ({
      ^bb0(%arg20: i32):
        "sparse_tensor.yield"(%22) : (i32) -> ()
      }, {
      }) : (i32) -> i32
      %25 = "sparse_tensor.reduce"(%24, %arg17, %21) ({
      ^bb0(%arg18: i32, %arg19: i32):
        %26 = "arith.addi"(%arg18, %arg19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%26) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%25) : (i32) -> ()
    }) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%23) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "red2"}> ({
  ^bb0(%arg8: tensor<8xi32, #sparse>, %arg9: tensor<i32>):
    %15 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %16 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %17 = "linalg.generic"(%arg8, %arg9) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i32, %arg11: i32):
      %18 = "sparse_tensor.unary"(%arg10) ({
      }, {
        "sparse_tensor.yield"(%16) : (i32) -> ()
      }) : (i32) -> i32
      %19 = "sparse_tensor.reduce"(%18, %arg11, %15) ({
      ^bb0(%arg12: i32, %arg13: i32):
        %20 = "arith.addi"(%arg12, %arg13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%20) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%19) : (i32) -> ()
    }) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%17) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "red3"}> ({
  ^bb0(%arg1: tensor<8xi32, #sparse>, %arg2: tensor<i32>):
    %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %11 = "linalg.generic"(%arg1, %arg2) <{doc = "x += SUM_CUSTOM_i UNARY a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %12 = "sparse_tensor.unary"(%arg3) ({
      ^bb0(%arg7: i32):
        "sparse_tensor.yield"(%9) : (i32) -> ()
      }, {
        "sparse_tensor.yield"(%10) : (i32) -> ()
      }) : (i32) -> i32
      %13 = "sparse_tensor.reduce"(%12, %arg4, %8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %14 = "arith.addi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%14) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%11) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg0: tensor<i32>):
    %7 = "tensor.extract"(%arg0) : (tensor<i32>) -> i32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1 = "arith.constant"() <{value = sparse<[[4], [6]], [99, 999]> : tensor<8xi32>}> : () -> tensor<8xi32>
    %2 = "sparse_tensor.convert"(%1) : (tensor<8xi32>) -> tensor<8xi32, #sparse>
    %3 = "func.call"(%2, %0) <{callee = @red0}> : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %4 = "func.call"(%2, %0) <{callee = @red1}> : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %5 = "func.call"(%2, %0) <{callee = @red2}> : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %6 = "func.call"(%2, %0) <{callee = @red3}> : (tensor<8xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.call"(%3) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%4) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%5) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%6) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<8xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

