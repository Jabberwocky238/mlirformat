"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>, sym_name = "init_and_dot"}> ({
  ^bb0(%arg6: tensor<64xf32> loc("<stdin>":7:8), %arg7: tensor<64xf32> loc("<stdin>":7:31), %arg8: tensor<f32> loc("<stdin>":7:54)):
    %11 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":8:11)
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    %13 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":10:11)
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:11)
    %15 = "linalg.fill"(%12, %arg8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32 loc("<stdin>":13:10), %arg21: f32 loc("<stdin>":13:23)):
      "linalg.yield"(%arg20) : (f32) -> () loc("<stdin>":14:7)
    }) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":12:11)
    %16 = "affine.apply"(%14, %11, %13) <{map = affine_map<(d0, d1)[s0] -> ((d1 - d0) ceildiv s0)>}> : (index, index, index) -> index loc("<stdin>":16:11)
    %17 = "bufferization.alloc_tensor"(%16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x2xf32> loc("<stdin>":17:11)
    %18 = "scf.for"(%14, %11, %13, %17) ({
    ^bb0(%arg17: index loc("<stdin>":19:10), %arg18: tensor<?x2xf32> loc("<stdin>":19:25)):
      %39 = "affine.apply"(%arg17, %14, %13) <{map = affine_map<(d0, d1)[s0] -> ((d0 - d1) ceildiv s0)>}> : (index, index, index) -> index loc("<stdin>":20:13)
      %40 = "tensor.extract_slice"(%arg7, %arg17) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32> loc("<stdin>":21:13)
      %41 = "tensor.cast"(%40) : (tensor<2xf32>) -> tensor<?xf32> loc("<stdin>":22:13)
      %42 = "tensor.pad"(%41, %14, %14) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: -9223372036854775808>, static_low = array<i64: -9223372036854775808>}> ({
      ^bb0(%arg19: index loc("<stdin>":24:12)):
        "tensor.yield"(%12) : (f32) -> () loc("<stdin>":25:9)
      }) : (tensor<?xf32>, index, index) -> tensor<2xf32> loc("<stdin>":23:13)
      %43 = "tensor.insert_slice"(%42, %arg18, %39) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<2xf32>, tensor<?x2xf32>, index) -> tensor<?x2xf32> loc("<stdin>":27:13)
      "scf.yield"(%43) : (tensor<?x2xf32>) -> () loc("<stdin>":28:7)
    }) : (index, index, index, tensor<?x2xf32>) -> tensor<?x2xf32> loc("<stdin>":18:11)
    %19 = "affine.apply"(%14, %11, %13) <{map = affine_map<(d0, d1)[s0] -> ((d1 - d0) ceildiv s0)>}> : (index, index, index) -> index loc("<stdin>":30:11)
    %20 = "bufferization.alloc_tensor"(%19) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x2xf32> loc("<stdin>":31:11)
    %21 = "scf.for"(%14, %11, %13, %20) ({
    ^bb0(%arg14: index loc("<stdin>":33:10), %arg15: tensor<?x2xf32> loc("<stdin>":33:25)):
      %34 = "affine.apply"(%arg14, %14, %13) <{map = affine_map<(d0, d1)[s0] -> ((d0 - d1) ceildiv s0)>}> : (index, index, index) -> index loc("<stdin>":34:13)
      %35 = "tensor.extract_slice"(%arg6, %arg14) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32> loc("<stdin>":35:13)
      %36 = "tensor.cast"(%35) : (tensor<2xf32>) -> tensor<?xf32> loc("<stdin>":36:13)
      %37 = "tensor.pad"(%36, %14, %14) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: -9223372036854775808>, static_low = array<i64: -9223372036854775808>}> ({
      ^bb0(%arg16: index loc("<stdin>":38:12)):
        "tensor.yield"(%12) : (f32) -> () loc("<stdin>":39:9)
      }) : (tensor<?xf32>, index, index) -> tensor<2xf32> loc("<stdin>":37:13)
      %38 = "tensor.insert_slice"(%37, %arg15, %34) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<2xf32>, tensor<?x2xf32>, index) -> tensor<?x2xf32> loc("<stdin>":41:13)
      "scf.yield"(%38) : (tensor<?x2xf32>) -> () loc("<stdin>":42:7)
    }) : (index, index, index, tensor<?x2xf32>) -> tensor<?x2xf32> loc("<stdin>":32:11)
    %22 = "scf.for"(%14, %11, %13, %15) ({
    ^bb0(%arg9: index loc("<stdin>":45:10), %arg10: tensor<f32> loc("<stdin>":45:24)):
      %23 = "tensor.extract_slice"(%arg6, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32> loc("<stdin>":46:13)
      %24 = "tensor.cast"(%23) : (tensor<2xf32>) -> tensor<?xf32> loc("<stdin>":47:13)
      %25 = "tensor.extract_slice"(%arg7, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 2>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<2xf32> loc("<stdin>":48:13)
      %26 = "tensor.cast"(%25) : (tensor<2xf32>) -> tensor<?xf32> loc("<stdin>":49:13)
      %27 = "affine.apply"(%arg9, %14, %13) <{map = affine_map<(d0, d1)[s0] -> ((d0 - d1) ceildiv s0)>}> : (index, index, index) -> index loc("<stdin>":50:13)
      %28 = "tensor.extract_slice"(%21, %27) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x2xf32>, index) -> tensor<2xf32> loc("<stdin>":51:13)
      %29 = "affine.apply"(%arg9, %14, %13) <{map = affine_map<(d0, d1)[s0] -> ((d0 - d1) ceildiv s0)>}> : (index, index, index) -> index loc("<stdin>":52:13)
      %30 = "tensor.extract_slice"(%18, %29) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 2>, static_strides = array<i64: 1, 1>}> : (tensor<?x2xf32>, index) -> tensor<2xf32> loc("<stdin>":53:13)
      %31 = "linalg.dot"(%28, %30, %arg10) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg11: f32 loc("<stdin>":55:12), %arg12: f32 loc("<stdin>":55:25), %arg13: f32 loc("<stdin>":55:38)):
        %32 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":56:15)
        %33 = "arith.addf"(%arg13, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":57:15)
        "linalg.yield"(%33) : (f32) -> () loc("<stdin>":58:9)
      }) {linalg.memoized_indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>]} : (tensor<2xf32>, tensor<2xf32>, tensor<f32>) -> tensor<f32> loc("<stdin>":54:13)
      "scf.yield"(%31) : (tensor<f32>) -> () loc("<stdin>":60:7)
    }) : (index, index, index, tensor<f32>) -> tensor<f32> loc("<stdin>":44:11)
    "func.return"(%22) : (tensor<f32>) -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":65:10)
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":66:10)
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":67:10)
    %3 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<64xf32> loc("<stdin>":68:10)
    %4 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<64xf32> loc("<stdin>":69:10)
    %5 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<f32> loc("<stdin>":70:10)
    %6 = "linalg.fill"(%1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":72:10), %arg5: f32 loc("<stdin>":72:22)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":73:7)
    }) : (f32, tensor<64xf32>) -> tensor<64xf32> loc("<stdin>":71:10)
    %7 = "linalg.fill"(%2, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":76:10), %arg3: f32 loc("<stdin>":76:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":77:7)
    }) : (f32, tensor<64xf32>) -> tensor<64xf32> loc("<stdin>":75:10)
    %8 = "linalg.fill"(%0, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32 loc("<stdin>":80:10), %arg1: f32 loc("<stdin>":80:22)):
      "linalg.yield"(%arg0) : (f32) -> () loc("<stdin>":81:7)
    }) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":79:10)
    %9 = "func.call"(%6, %7, %8) <{callee = @init_and_dot}> : (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32> loc("<stdin>":83:10)
    %10 = "tensor.cast"(%9) : (tensor<f32>) -> tensor<*xf32> loc("<stdin>":84:11)
    "func.call"(%10) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":85:5)
    "func.return"() : () -> () loc("<stdin>":86:5)
  }) : () -> () loc("<stdin>":64:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":88:3)
}) : () -> () loc("<stdin>":5:1)
