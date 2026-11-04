#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique), d2 : singleton), posWidth = 32, crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}], function_type = (tensor<?x?x?xf32>) -> (), sym_name = "printMemref3dF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.access = "read"}], function_type = (tensor<?x?xf32>) -> (), sym_name = "printMemref2dF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>, tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32>, sym_name = "test_sparse_rhs"}> ({
  ^bb0(%arg21: tensor<5x6xf32>, %arg22: tensor<6x2x3xf32, #sparse>):
    %38 = "tensor.collapse_shape"(%arg22) <{reassociation = [[0], [1, 2]]}> : (tensor<6x2x3xf32, #sparse>) -> tensor<6x6xf32, #sparse1>
    %39 = "tensor.empty"() : () -> tensor<5x6xf32>
    %40 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %41 = "linalg.fill"(%40, %39) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      "linalg.yield"(%arg26) : (f32) -> ()
    }) : (f32, tensor<5x6xf32>) -> tensor<5x6xf32>
    %42 = "linalg.matmul"(%arg21, %38, %41) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32, %arg24: f32, %arg25: f32):
      %45 = "arith.mulf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %46 = "arith.addf"(%arg25, %45) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%46) : (f32) -> ()
    }) : (tensor<5x6xf32>, tensor<6x6xf32, #sparse1>, tensor<5x6xf32>) -> tensor<5x6xf32>
    %43 = "tensor.expand_shape"(%42) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 5, 2, 3>}> : (tensor<5x6xf32>) -> tensor<5x2x3xf32>
    %44 = "tensor.cast"(%43) : (tensor<5x2x3xf32>) -> tensor<?x?x?xf32>
    "bufferization.dealloc_tensor"(%38) : (tensor<6x6xf32, #sparse1>) -> ()
    "func.return"(%44) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32, #sparse1>, tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32>, sym_name = "test_sparse_all"}> ({
  ^bb0(%arg14: tensor<5x6xf32, #sparse1>, %arg15: tensor<6x2x3xf32, #sparse>):
    %29 = "tensor.collapse_shape"(%arg15) <{reassociation = [[0], [1, 2]]}> : (tensor<6x2x3xf32, #sparse>) -> tensor<6x6xf32, #sparse1>
    %30 = "tensor.empty"() : () -> tensor<5x6xf32>
    %31 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %32 = "linalg.fill"(%31, %30) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32, %arg20: f32):
      "linalg.yield"(%arg19) : (f32) -> ()
    }) : (f32, tensor<5x6xf32>) -> tensor<5x6xf32>
    %33 = "linalg.matmul"(%arg14, %29, %32) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %36 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %37 = "arith.addf"(%arg18, %36) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%37) : (f32) -> ()
    }) : (tensor<5x6xf32, #sparse1>, tensor<6x6xf32, #sparse1>, tensor<5x6xf32>) -> tensor<5x6xf32>
    %34 = "tensor.expand_shape"(%33) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 5, 2, 3>}> : (tensor<5x6xf32>) -> tensor<5x2x3xf32>
    %35 = "tensor.cast"(%34) : (tensor<5x2x3xf32>) -> tensor<?x?x?xf32>
    "bufferization.dealloc_tensor"(%29) : (tensor<6x6xf32, #sparse1>) -> ()
    "func.return"(%35) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32>, tensor<6x2x3xf32>) -> tensor<?x?x?xf32>, sym_name = "test_dense"}> ({
  ^bb0(%arg7: tensor<5x6xf32>, %arg8: tensor<6x2x3xf32>):
    %20 = "tensor.collapse_shape"(%arg8) <{reassociation = [[0], [1, 2]]}> : (tensor<6x2x3xf32>) -> tensor<6x6xf32>
    %21 = "tensor.empty"() : () -> tensor<5x6xf32>
    %22 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %23 = "linalg.fill"(%22, %21) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (f32, tensor<5x6xf32>) -> tensor<5x6xf32>
    %24 = "linalg.matmul"(%arg7, %20, %23) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %27 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %28 = "arith.addf"(%arg11, %27) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%28) : (f32) -> ()
    }) : (tensor<5x6xf32>, tensor<6x6xf32>, tensor<5x6xf32>) -> tensor<5x6xf32>
    %25 = "tensor.expand_shape"(%24) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 5, 2, 3>}> : (tensor<5x6xf32>) -> tensor<5x2x3xf32>
    %26 = "tensor.cast"(%25) : (tensor<5x2x3xf32>) -> tensor<?x?x?xf32>
    "func.return"(%26) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf32, #sparse1>, tensor<2x3x6xf32, #sparse>) -> tensor<?x?x?xf32>, sym_name = "test_sparse_all_2"}> ({
  ^bb0(%arg0: tensor<5x6xf32, #sparse1>, %arg1: tensor<2x3x6xf32, #sparse>):
    %11 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1], [2]]}> : (tensor<2x3x6xf32, #sparse>) -> tensor<6x6xf32, #sparse1>
    %12 = "tensor.empty"() : () -> tensor<5x6xf32>
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %14 = "linalg.fill"(%13, %12) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<5x6xf32>) -> tensor<5x6xf32>
    %15 = "linalg.matmul"(%arg0, %11, %14) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %18 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.addf"(%arg4, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) : (tensor<5x6xf32, #sparse1>, tensor<6x6xf32, #sparse1>, tensor<5x6xf32>) -> tensor<5x6xf32>
    %16 = "tensor.expand_shape"(%15) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 5, 2, 3>}> : (tensor<5x6xf32>) -> tensor<5x2x3xf32>
    %17 = "tensor.cast"(%16) : (tensor<5x2x3xf32>) -> tensor<?x?x?xf32>
    "bufferization.dealloc_tensor"(%11) : (tensor<6x6xf32, #sparse1>) -> ()
    "func.return"(%17) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0, 0], [1, 1], [2, 2], [2, 3], [4, 5]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<5x6xf32>}> : () -> tensor<5x6xf32>
    %1 = "arith.constant"() <{value = sparse<[[0, 0, 0], [1, 1, 1], [2, 1, 1]], [6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<6x2x3xf32>}> : () -> tensor<6x2x3xf32>
    %2 = "arith.constant"() <{value = dense<[2, 3, 6]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %3 = "tensor.reshape"(%1, %2) : (tensor<6x2x3xf32>, tensor<3xi32>) -> tensor<2x3x6xf32>
    %4 = "sparse_tensor.convert"(%0) : (tensor<5x6xf32>) -> tensor<5x6xf32, #sparse1>
    %5 = "sparse_tensor.convert"(%1) : (tensor<6x2x3xf32>) -> tensor<6x2x3xf32, #sparse>
    %6 = "sparse_tensor.convert"(%3) : (tensor<2x3x6xf32>) -> tensor<2x3x6xf32, #sparse>
    %7 = "func.call"(%0, %1) <{callee = @test_dense}> : (tensor<5x6xf32>, tensor<6x2x3xf32>) -> tensor<?x?x?xf32>
    "func.call"(%7) <{callee = @printMemref3dF32}> : (tensor<?x?x?xf32>) -> ()
    %8 = "func.call"(%0, %5) <{callee = @test_sparse_rhs}> : (tensor<5x6xf32>, tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32>
    "func.call"(%8) <{callee = @printMemref3dF32}> : (tensor<?x?x?xf32>) -> ()
    %9 = "func.call"(%4, %5) <{callee = @test_sparse_all}> : (tensor<5x6xf32, #sparse1>, tensor<6x2x3xf32, #sparse>) -> tensor<?x?x?xf32>
    "func.call"(%9) <{callee = @printMemref3dF32}> : (tensor<?x?x?xf32>) -> ()
    %10 = "func.call"(%4, %6) <{callee = @test_sparse_all_2}> : (tensor<5x6xf32, #sparse1>, tensor<2x3x6xf32, #sparse>) -> tensor<?x?x?xf32>
    "func.call"(%9) <{callee = @printMemref3dF32}> : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<5x6xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<6x2x3xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x3x6xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

