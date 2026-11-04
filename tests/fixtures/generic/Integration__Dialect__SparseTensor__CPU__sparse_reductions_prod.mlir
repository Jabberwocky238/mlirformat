#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>, sym_name = "prod_dreduction_i32"}> ({
  ^bb0(%arg27: tensor<32xi32, #sparse>, %arg28: tensor<i32>):
    %47 = "tensor.extract"(%arg28) : (tensor<i32>) -> i32
    %48 = "linalg.generic"(%arg27, %arg28) <{doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg29: i32, %arg30: i32):
      %49 = "sparse_tensor.reduce"(%arg29, %arg30, %47) ({
      ^bb0(%arg31: i32, %arg32: i32):
        %50 = "arith.muli"(%arg31, %arg32) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%50) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%49) : (i32) -> ()
    }) : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    "func.return"(%48) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>, sym_name = "prod_dreduction_f32"}> ({
  ^bb0(%arg21: tensor<32xf32, #sparse>, %arg22: tensor<f32>):
    %43 = "tensor.extract"(%arg22) : (tensor<f32>) -> f32
    %44 = "linalg.generic"(%arg21, %arg22) <{doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg23: f32, %arg24: f32):
      %45 = "sparse_tensor.reduce"(%arg23, %arg24, %43) ({
      ^bb0(%arg25: f32, %arg26: f32):
        %46 = "arith.mulf"(%arg25, %arg26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%46) : (f32) -> ()
      }) : (f32, f32, f32) -> f32
      "linalg.yield"(%45) : (f32) -> ()
    }) : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    "func.return"(%44) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>, sym_name = "prod_sreduction_i32"}> ({
  ^bb0(%arg15: tensor<32xi32, #sparse1>, %arg16: tensor<i32>):
    %39 = "tensor.extract"(%arg16) : (tensor<i32>) -> i32
    %40 = "linalg.generic"(%arg15, %arg16) <{doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: i32, %arg18: i32):
      %41 = "sparse_tensor.reduce"(%arg17, %arg18, %39) ({
      ^bb0(%arg19: i32, %arg20: i32):
        %42 = "arith.muli"(%arg19, %arg20) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%42) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%41) : (i32) -> ()
    }) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    "func.return"(%40) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse1>, tensor<f32>) -> tensor<f32>, sym_name = "prod_sreduction_f32"}> ({
  ^bb0(%arg9: tensor<32xf32, #sparse1>, %arg10: tensor<f32>):
    %35 = "tensor.extract"(%arg10) : (tensor<f32>) -> f32
    %36 = "linalg.generic"(%arg9, %arg10) <{doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      %37 = "sparse_tensor.reduce"(%arg11, %arg12, %35) ({
      ^bb0(%arg13: f32, %arg14: f32):
        %38 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "sparse_tensor.yield"(%38) : (f32) -> ()
      }) : (f32, f32, f32) -> f32
      "linalg.yield"(%37) : (f32) -> ()
    }) : (tensor<32xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    "func.return"(%36) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>, sym_name = "prod_xreduction_i32"}> ({
  ^bb0(%arg2: tensor<32xi32, #sparse1>, %arg3: tensor<i32>):
    %29 = "tensor.extract"(%arg3) : (tensor<i32>) -> i32
    %30 = "linalg.generic"(%arg2, %arg3) <{doc = "x += PROD_CUSTOM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      %31 = "sparse_tensor.unary"(%arg4) ({
      ^bb0(%arg8: i32):
        "sparse_tensor.yield"(%arg8) : (i32) -> ()
      }, {
        %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32
        "sparse_tensor.yield"(%34) : (i32) -> ()
      }) : (i32) -> i32
      %32 = "sparse_tensor.reduce"(%31, %arg5, %29) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %33 = "arith.muli"(%arg6, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "sparse_tensor.yield"(%33) : (i32) -> ()
      }) : (i32, i32, i32) -> i32
      "linalg.yield"(%32) : (i32) -> ()
    }) : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    "func.return"(%30) : (tensor<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>) -> (), sym_name = "dump_i32"}> ({
  ^bb0(%arg1: tensor<i32>):
    %28 = "tensor.extract"(%arg1) : (tensor<i32>) -> i32
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> (), sym_name = "dump_f32"}> ({
  ^bb0(%arg0: tensor<f32>):
    %27 = "tensor.extract"(%arg0) : (tensor<f32>) -> f32
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<7> : tensor<i32>}> : () -> tensor<i32>
    %1 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %2 = "arith.constant"() <{value = dense<[1, 1, 7, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 1, 1, 1, 1, 1, 0, 1, 1, 7, 3]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %3 = "arith.constant"() <{value = dense<[1.000000e+00, 1.000000e+00, 1.000000e+00, 3.500000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 2.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00]> : tensor<32xf32>}> : () -> tensor<32xf32>
    %4 = "arith.constant"() <{value = dense<[1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 3]> : tensor<32xi32>}> : () -> tensor<32xi32>
    %5 = "arith.constant"() <{value = dense<[1.000000e+00, 1.000000e+00, 1.000000e+00, 3.500000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 2.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 3.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 1.000000e+00, 4.000000e+00]> : tensor<32xf32>}> : () -> tensor<32xf32>
    %6 = "sparse_tensor.convert"(%2) : (tensor<32xi32>) -> tensor<32xi32, #sparse>
    %7 = "sparse_tensor.convert"(%3) : (tensor<32xf32>) -> tensor<32xf32, #sparse>
    %8 = "sparse_tensor.convert"(%2) : (tensor<32xi32>) -> tensor<32xi32, #sparse1>
    %9 = "sparse_tensor.convert"(%3) : (tensor<32xf32>) -> tensor<32xf32, #sparse1>
    %10 = "sparse_tensor.convert"(%4) : (tensor<32xi32>) -> tensor<32xi32, #sparse>
    %11 = "sparse_tensor.convert"(%5) : (tensor<32xf32>) -> tensor<32xf32, #sparse>
    %12 = "sparse_tensor.convert"(%4) : (tensor<32xi32>) -> tensor<32xi32, #sparse1>
    %13 = "sparse_tensor.convert"(%5) : (tensor<32xf32>) -> tensor<32xf32, #sparse1>
    %14 = "arith.constant"() <{value = sparse<1, 0> : tensor<32xi32>}> : () -> tensor<32xi32>
    %15 = "sparse_tensor.convert"(%14) : (tensor<32xi32>) -> tensor<32xi32, #sparse1>
    %16 = "func.call"(%6, %0) <{callee = @prod_dreduction_i32}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %17 = "func.call"(%7, %1) <{callee = @prod_dreduction_f32}> : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %18 = "func.call"(%8, %0) <{callee = @prod_sreduction_i32}> : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %19 = "func.call"(%9, %1) <{callee = @prod_sreduction_f32}> : (tensor<32xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    %20 = "func.call"(%10, %0) <{callee = @prod_dreduction_i32}> : (tensor<32xi32, #sparse>, tensor<i32>) -> tensor<i32>
    %21 = "func.call"(%11, %1) <{callee = @prod_dreduction_f32}> : (tensor<32xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %22 = "func.call"(%12, %0) <{callee = @prod_sreduction_i32}> : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %23 = "func.call"(%13, %1) <{callee = @prod_sreduction_f32}> : (tensor<32xf32, #sparse1>, tensor<f32>) -> tensor<f32>
    %24 = "func.call"(%15, %0) <{callee = @prod_sreduction_i32}> : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %25 = "func.call"(%8, %0) <{callee = @prod_xreduction_i32}> : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    %26 = "func.call"(%12, %0) <{callee = @prod_xreduction_i32}> : (tensor<32xi32, #sparse1>, tensor<i32>) -> tensor<i32>
    "func.call"(%16) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%17) <{callee = @dump_f32}> : (tensor<f32>) -> ()
    "func.call"(%18) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%19) <{callee = @dump_f32}> : (tensor<f32>) -> ()
    "func.call"(%20) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%21) <{callee = @dump_f32}> : (tensor<f32>) -> ()
    "func.call"(%22) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%23) <{callee = @dump_f32}> : (tensor<f32>) -> ()
    "func.call"(%24) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%25) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "func.call"(%26) <{callee = @dump_i32}> : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<32xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<32xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<32xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<32xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<32xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<32xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<32xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<32xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<32xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<f32>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<f32>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<f32>) -> ()
    "bufferization.dealloc_tensor"(%22) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%23) : (tensor<f32>) -> ()
    "bufferization.dealloc_tensor"(%24) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%25) : (tensor<i32>) -> ()
    "bufferization.dealloc_tensor"(%26) : (tensor<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

