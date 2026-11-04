#map = affine_map<(d0, d1)[s0] -> ((d1 - d0) ceildiv s0)>
#map1 = affine_map<(d0, d1)[s0] -> ((d0 - d1) ceildiv s0)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>, sym_name = "init_and_dot"}> ({
  ^bb0(%arg6: tensor<64xf32>, %arg7: tensor<64xf32>, %arg8: tensor<f32>):
    %11 = "arith.constant"() <{value = 64 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = 2 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "linalg.fill"(%12, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32, %arg21: f32):
      "linalg.yield"(%arg20) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %16 = "affine.apply"(%14, %11, %13) <{map = #map}> : (index, index, index) -> index
    %17 = "bufferization.alloc_tensor"(%16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x2xf32>
    %18 = "scf.for"(%14, %11, %13, %17) ({
    ^bb0(%arg17: index, %arg18: tensor<?x2xf32>):
      %39 = "affine.apply"(%arg17, %14, %13) <{map = #map1}> : (index, index, index) -> index
      %40 = "tensor.extract_slice"(%arg7, %arg17) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32>
      %41 = "tensor.cast"(%40) : (tensor<2xf32>) -> tensor<?xf32>
      %42 = "tensor.pad"(%41, %14, %14) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: -9223372036854775808>, static_low = array<i64: -9223372036854775808>}> ({
      ^bb0(%arg19: index):
        "tensor.yield"(%12) : (f32) -> ()
      }) : (tensor<?xf32>, index, index) -> tensor<2xf32>
      %43 = "tensor.insert_slice"(%42, %arg18, %39) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<2xf32>, tensor<?x2xf32>, index) -> tensor<?x2xf32>
      "scf.yield"(%43) : (tensor<?x2xf32>) -> ()
    }) : (index, index, index, tensor<?x2xf32>) -> tensor<?x2xf32>
    %19 = "affine.apply"(%14, %11, %13) <{map = #map}> : (index, index, index) -> index
    %20 = "bufferization.alloc_tensor"(%19) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x2xf32>
    %21 = "scf.for"(%14, %11, %13, %20) ({
    ^bb0(%arg14: index, %arg15: tensor<?x2xf32>):
      %34 = "affine.apply"(%arg14, %14, %13) <{map = #map1}> : (index, index, index) -> index
      %35 = "tensor.extract_slice"(%arg6, %arg14) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32>
      %36 = "tensor.cast"(%35) : (tensor<2xf32>) -> tensor<?xf32>
      %37 = "tensor.pad"(%36, %14, %14) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: -9223372036854775808>, static_low = array<i64: -9223372036854775808>}> ({
      ^bb0(%arg16: index):
        "tensor.yield"(%12) : (f32) -> ()
      }) : (tensor<?xf32>, index, index) -> tensor<2xf32>
      %38 = "tensor.insert_slice"(%37, %arg15, %34) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<2xf32>, tensor<?x2xf32>, index) -> tensor<?x2xf32>
      "scf.yield"(%38) : (tensor<?x2xf32>) -> ()
    }) : (index, index, index, tensor<?x2xf32>) -> tensor<?x2xf32>
    %22 = "scf.for"(%14, %11, %13, %15) ({
    ^bb0(%arg9: index, %arg10: tensor<f32>):
      %23 = "tensor.extract_slice"(%arg6, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32>
      %24 = "tensor.cast"(%23) : (tensor<2xf32>) -> tensor<?xf32>
      %25 = "tensor.extract_slice"(%arg7, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32>
      %26 = "tensor.cast"(%25) : (tensor<2xf32>) -> tensor<?xf32>
      %27 = "affine.apply"(%arg9, %14, %13) <{map = #map1}> : (index, index, index) -> index
      %28 = "tensor.extract_slice"(%21, %27) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x2xf32>, index) -> tensor<2xf32>
      %29 = "affine.apply"(%arg9, %14, %13) <{map = #map1}> : (index, index, index) -> index
      %30 = "tensor.extract_slice"(%18, %29) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x2xf32>, index) -> tensor<2xf32>
      %31 = "linalg.dot"(%28, %30, %arg10) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
        %32 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %33 = "arith.addf"(%arg13, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%33) : (f32) -> ()
      }) {linalg.memoized_indexing_maps = [#map2, #map2, #map3]} : (tensor<2xf32>, tensor<2xf32>, tensor<f32>) -> tensor<f32>
      "scf.yield"(%31) : (tensor<f32>) -> ()
    }) : (index, index, index, tensor<f32>) -> tensor<f32>
    "func.return"(%22) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<64xf32>
    %4 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<64xf32>
    %5 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<f32>
    %6 = "linalg.fill"(%1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<64xf32>) -> tensor<64xf32>
    %7 = "linalg.fill"(%2, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, tensor<64xf32>) -> tensor<64xf32>
    %8 = "linalg.fill"(%0, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      "linalg.yield"(%arg0) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %9 = "func.call"(%6, %7, %8) <{callee = @init_and_dot}> : (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>
    %10 = "tensor.cast"(%9) : (tensor<f32>) -> tensor<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

