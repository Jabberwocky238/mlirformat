#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 1, 1)>, d1 : #sparse_tensor<slice(?, 3, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "sparse_nop_cast"}> ({
  ^bb0(%arg9: tensor<?xf32, #sparse>):
    %7 = "tensor.cast"(%arg9) : (tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse>
    %8 = "tensor.cast"(%7) : (tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse>
    %9 = "tensor.cast"(%8) : (tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%9) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32, #sparse>, sym_name = "sparse_repair_cast"}> ({
  ^bb0(%arg8: tensor<?xf32>):
    %6 = "tensor.cast"(%arg8) : (tensor<?xf32>) -> tensor<?xf32, #sparse>
    "func.return"(%6) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3xi64, #sparse1>) -> tensor<1x3xi64, #sparse1>, sym_name = "sparse_fuse_slice"}> ({
  ^bb0(%arg7: tensor<2x3xi64, #sparse1>):
    %3 = "tensor.extract_slice"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 0>, static_sizes = array<i64: 1, 3>, static_strides = array<i64: 1, 1>}> : (tensor<2x3xi64, #sparse1>) -> tensor<1x3xi64>
    %4 = "tensor.cast"(%3) : (tensor<1x3xi64>) -> tensor<1x3xi64, #sparse2>
    %5 = "sparse_tensor.convert"(%4) : (tensor<1x3xi64, #sparse2>) -> tensor<1x3xi64, #sparse1>
    "func.return"(%5) : (tensor<1x3xi64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xi1>, tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse3>) -> tensor<4x4xf64, #sparse3>, sym_name = "sparse_select"}> ({
  ^bb0(%arg0: tensor<4x4xi1>, %arg1: tensor<4x4xf64, #sparse3>, %arg2: tensor<4x4xf64, #sparse3>):
    %0 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse3>
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [#map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1, %arg4: f64, %arg5: f64, %arg6: f64):
      %2 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f64, f64) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (tensor<4x4xi1>, tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse3>) -> tensor<4x4xf64, #sparse3>
    "func.return"(%1) : (tensor<4x4xf64, #sparse3>) -> ()
  }) : () -> ()
}) : () -> ()

