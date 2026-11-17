"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_nop_cast"}> ({
  ^bb0(%arg9: tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:8)):
    %7 = "tensor.cast"(%arg9) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":9:10)
    %8 = "tensor.cast"(%7) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":10:10)
    %9 = "tensor.cast"(%8) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":11:10)
    "func.return"(%9) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_repair_cast"}> ({
  ^bb0(%arg8: tensor<?xf32> loc("<stdin>":15:8)):
    %6 = "tensor.cast"(%arg8) : (tensor<?xf32>) -> tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":16:10)
    "func.return"(%6) : (tensor<?xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<2x3xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<1x3xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, sym_name = "sparse_fuse_slice"}> ({
  ^bb0(%arg7: tensor<2x3xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":20:8)):
    %3 = "tensor.extract_slice"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 0>, static_sizes = array<i64: 1, 3>, static_strides = array<i64: 1, 1>}> : (tensor<2x3xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<1x3xi64> loc("<stdin>":21:10)
    %4 = "tensor.cast"(%3) : (tensor<1x3xi64>) -> tensor<1x3xi64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 1, 1)>, d1 : #sparse_tensor<slice(?, 3, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":22:10)
    %5 = "sparse_tensor.convert"(%4) : (tensor<1x3xi64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 1, 1)>, d1 : #sparse_tensor<slice(?, 3, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<1x3xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":23:10)
    "func.return"(%5) : (tensor<1x3xi64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<4x4xi1>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_select"}> ({
  ^bb0(%arg0: tensor<4x4xi1> loc("<stdin>":27:8), %arg1: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":27:31), %arg2: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":27:65)):
    %0 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":28:10)
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1 loc("<stdin>":30:10), %arg4: f64 loc("<stdin>":30:21), %arg5: f64 loc("<stdin>":30:33), %arg6: f64 loc("<stdin>":30:45)):
      %2 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f64, f64) -> f64 loc("<stdin>":31:12)
      "linalg.yield"(%2) : (f64) -> () loc("<stdin>":32:7)
    }) : (tensor<4x4xi1>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":29:10)
    "func.return"(%1) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":6:1)
