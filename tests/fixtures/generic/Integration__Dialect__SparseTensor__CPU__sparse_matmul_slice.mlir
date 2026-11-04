#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 4, ?)>, d1 : #sparse_tensor<slice(?, 4, ?)>) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 4, ?)>, d1 : #sparse_tensor<slice(?, 4, ?)>) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(0, 4, 1)>) -> (d0 : dense, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(1, 4, 1)>) -> (d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(0, 8, 1)>) -> (d0 : dense, d1 : compressed) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 1)>, d1 : #sparse_tensor<slice(0, 8, 1)>) -> (d0 : compressed, d1 : compressed) }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(0, 4, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse9 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(0, 4, 2)>, d1 : #sparse_tensor<slice(1, 4, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse10 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf64>) -> (), sym_name = "printMemref1dF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse2>, sym_name = "matmul_dyn"}> ({
  ^bb0(%arg25: tensor<4x4xf64, #sparse>, %arg26: tensor<4x4xf64, #sparse1>):
    %49 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse2>
    %50 = "linalg.matmul"(%arg25, %arg26, %49) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: f64, %arg28: f64, %arg29: f64):
      %51 = "arith.mulf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %52 = "arith.addf"(%arg29, %51) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%52) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    "func.return"(%50) : (tensor<4x4xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse4>) -> tensor<4x4xf64, #sparse2>, sym_name = "matmul1"}> ({
  ^bb0(%arg20: tensor<4x4xf64, #sparse3>, %arg21: tensor<4x4xf64, #sparse4>):
    %45 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse2>
    %46 = "linalg.matmul"(%arg20, %arg21, %45) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg22: f64, %arg23: f64, %arg24: f64):
      %47 = "arith.mulf"(%arg22, %arg23) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %48 = "arith.addf"(%arg24, %47) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%48) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse4>, tensor<4x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    "func.return"(%46) : (tensor<4x4xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse5>, tensor<8x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>, sym_name = "matmul2"}> ({
  ^bb0(%arg15: tensor<4x8xf64, #sparse5>, %arg16: tensor<8x4xf64, #sparse2>):
    %41 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse2>
    %42 = "linalg.matmul"(%arg15, %arg16, %41) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: f64, %arg18: f64, %arg19: f64):
      %43 = "arith.mulf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %44 = "arith.addf"(%arg19, %43) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%44) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse5>, tensor<8x4xf64, #sparse2>, tensor<4x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    "func.return"(%42) : (tensor<4x4xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse6>, tensor<8x4xf64, #sparse7>) -> tensor<4x4xf64, #sparse7>, sym_name = "matmul3"}> ({
  ^bb0(%arg10: tensor<4x8xf64, #sparse6>, %arg11: tensor<8x4xf64, #sparse7>):
    %37 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse7>
    %38 = "linalg.matmul"(%arg10, %arg11, %37) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f64, %arg13: f64, %arg14: f64):
      %39 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %40 = "arith.addf"(%arg14, %39) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%40) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse6>, tensor<8x4xf64, #sparse7>, tensor<4x4xf64, #sparse7>) -> tensor<4x4xf64, #sparse7>
    "func.return"(%38) : (tensor<4x4xf64, #sparse7>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse8>, tensor<4x4xf64, #sparse9>) -> tensor<4x4xf64, #sparse10>, sym_name = "matmul5"}> ({
  ^bb0(%arg5: tensor<4x4xf64, #sparse8>, %arg6: tensor<4x4xf64, #sparse9>):
    %33 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse10>
    %34 = "linalg.matmul"(%arg5, %arg6, %33) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: f64):
      %35 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %36 = "arith.addf"(%arg9, %35) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%36) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse8>, tensor<4x4xf64, #sparse9>, tensor<4x4xf64, #sparse10>) -> tensor<4x4xf64, #sparse10>
    "func.return"(%34) : (tensor<4x4xf64, #sparse10>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %5 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00], [4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 7.000000e+00, 8.000000e+00]]> : tensor<8x4xf64>}> : () -> tensor<8x4xf64>
    %6 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse7>
    %7 = "tensor.extract_slice"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 8>, static_strides = array<i64: 1, 1>}> : (tensor<8x8xf64, #sparse7>) -> tensor<4x8xf64, #sparse6>
    %8 = "sparse_tensor.convert"(%5) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse7>
    %9 = "func.call"(%7, %8) <{callee = @matmul3}> : (tensor<4x8xf64, #sparse6>, tensor<8x4xf64, #sparse7>) -> tensor<4x4xf64, #sparse7>
    "sparse_tensor.print"(%9) : (tensor<4x4xf64, #sparse7>) -> ()
    %10 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse2>
    %11 = "tensor.extract_slice"(%10) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 8>, static_strides = array<i64: 1, 1>}> : (tensor<8x8xf64, #sparse2>) -> tensor<4x8xf64, #sparse5>
    %12 = "sparse_tensor.convert"(%5) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse2>
    %13 = "func.call"(%11, %12) <{callee = @matmul2}> : (tensor<4x8xf64, #sparse5>, tensor<8x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse2>
    "sparse_tensor.print"(%13) : (tensor<4x4xf64, #sparse2>) -> ()
    %14 = "tensor.extract_slice"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 1>}> : (tensor<8x8xf64, #sparse7>) -> tensor<4x4xf64, #sparse4>
    %15 = "tensor.extract_slice"(%12) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 1>}> : (tensor<8x4xf64, #sparse2>) -> tensor<4x4xf64, #sparse3>
    %16 = "func.call"(%15, %14) <{callee = @matmul1}> : (tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse4>) -> tensor<4x4xf64, #sparse2>
    "sparse_tensor.print"(%16) : (tensor<4x4xf64, #sparse2>) -> ()
    %17 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse10>
    %18 = "sparse_tensor.convert"(%5) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse10>
    %19 = "tensor.extract_slice"(%18) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 1>}> : (tensor<8x4xf64, #sparse10>) -> tensor<4x4xf64, #sparse8>
    %20 = "tensor.extract_slice"(%17) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 1>}> : (tensor<8x8xf64, #sparse10>) -> tensor<4x4xf64, #sparse9>
    %21 = "func.call"(%19, %20) <{callee = @matmul5}> : (tensor<4x4xf64, #sparse8>, tensor<4x4xf64, #sparse9>) -> tensor<4x4xf64, #sparse10>
    "sparse_tensor.print"(%21) : (tensor<4x4xf64, #sparse10>) -> ()
    %22 = "tensor.extract_slice"(%6, %0, %1, %2, %1) <{operandSegmentSizes = array<i32: 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<8x8xf64, #sparse7>, index, index, index, index) -> tensor<4x4xf64, #sparse1>
    %23 = "tensor.extract_slice"(%12, %0, %0, %2, %1) <{operandSegmentSizes = array<i32: 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<8x4xf64, #sparse2>, index, index, index, index) -> tensor<4x4xf64, #sparse>
    %24 = "func.call"(%23, %22) <{callee = @matmul_dyn}> : (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse2>
    "sparse_tensor.print"(%24) : (tensor<4x4xf64, #sparse2>) -> ()
    %25 = "tensor.extract_slice"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 1>}> : (tensor<8x8xf64>) -> tensor<4x4xf64>
    %26 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 1>}> : (tensor<8x4xf64>) -> tensor<4x4xf64>
    %27 = "tensor.empty"() : () -> tensor<4x4xf64>
    %28 = "linalg.fill"(%3, %27) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64):
      "linalg.yield"(%arg3) : (f64) -> ()
    }) : (f64, tensor<4x4xf64>) -> tensor<4x4xf64>
    %29 = "linalg.matmul"(%26, %25, %28) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg0: f64, %arg1: f64, %arg2: f64):
      %31 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %32 = "arith.addf"(%arg2, %31) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%32) : (f64) -> ()
    }) : (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %30 = "tensor.cast"(%29) : (tensor<4x4xf64>) -> tensor<*xf64>
    "func.call"(%30) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "bufferization.dealloc_tensor"(%27) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<8x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<8x8xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<8x4xf64, #sparse10>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<8x8xf64, #sparse10>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<4x4xf64, #sparse10>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<8x4xf64, #sparse7>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<8x8xf64, #sparse7>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<4x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<4x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<4x4xf64, #sparse7>) -> ()
    "bufferization.dealloc_tensor"(%24) : (tensor<4x4xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

