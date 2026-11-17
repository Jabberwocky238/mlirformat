"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "bufferization_alloc_tensor"}> ({
    %15 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":11:11)
    %16 = "sparse_tensor.load"(%15) : (tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":12:11)
    "func.return"(%16) : (tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_tensor_new"}> ({
  ^bb0(%arg15: !llvm.ptr loc("<stdin>":16:8)):
    %14 = "sparse_tensor.new"(%arg15) : (!llvm.ptr) -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":17:11)
    "func.return"(%14) : (tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (tensor<20x40xf32>) -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_tensor_new_from_tensor"}> ({
  ^bb0(%arg14: tensor<20x40xf32> loc("<stdin>":21:8)):
    %13 = "sparse_tensor.new"(%arg14) : (tensor<20x40xf32>) -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":22:11)
    "func.return"(%13) : (tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> tensor<20x40xf32>, sym_name = "sparse_tensor_convert"}> ({
    %10 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":26:11)
    %11 = "sparse_tensor.load"(%10) : (tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":27:11)
    %12 = "sparse_tensor.convert"(%11) : (tensor<20x40xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<20x40xf32> loc("<stdin>":28:11)
    "func.return"(%12) : (tensor<20x40xf32>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (tensor<10xf32>, tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> (tensor<10xf32>, tensor<10xf32>), sym_name = "update_notinplace"}> ({
  ^bb0(%arg10: tensor<10xf32> loc("<stdin>":32:8), %arg11: tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:32)):
    %8 = "linalg.generic"(%arg11, %arg10) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":34:10), %arg13: f32 loc("<stdin>":34:23)):
      %9 = "arith.addf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":35:12)
      "linalg.yield"(%9) : (f32) -> () loc("<stdin>":36:7)
    }) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<10xf32>) -> tensor<10xf32> loc("<stdin>":33:10)
    "func.return"(%8, %arg10) : (tensor<10xf32>, tensor<10xf32>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (tensor<64x64xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32>, sym_name = "sparse_non_elementwise"}> ({
  ^bb0(%arg0: tensor<64x64xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>> loc("<stdin>":41:8), %arg1: tensor<64x64xf32> loc("<stdin>":41:44), %arg2: tensor<64x64xf32> loc("<stdin>":41:70)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":42:10)
    %1 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<64x64xf32> loc("<stdin>":43:10)
    %2 = "linalg.generic"(%1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":45:10)):
      "linalg.yield"(%0) : (f32) -> () loc("<stdin>":46:7)
    }) : (tensor<64x64xf32>) -> tensor<64x64xf32> loc("<stdin>":44:10)
    %3 = "linalg.generic"(%arg2, %arg2, %2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":49:10), %arg7: f32 loc("<stdin>":49:22), %arg8: f32 loc("<stdin>":49:34)):
      %6 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":50:12)
      %7 = "arith.addf"(%arg8, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":51:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":52:7)
    }) : (tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32> loc("<stdin>":48:10)
    %4 = "linalg.generic"(%arg0, %3, %1) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":55:10), %arg4: f32 loc("<stdin>":55:22), %arg5: f32 loc("<stdin>":55:34)):
      %5 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":56:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":57:7)
    }) {sorted = true} : (tensor<64x64xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32> loc("<stdin>":54:10)
    "func.return"(%4) : (tensor<64x64xf32>) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":40:3)
}) : () -> () loc("<stdin>":9:1)
