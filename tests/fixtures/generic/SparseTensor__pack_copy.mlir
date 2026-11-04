#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = false}, {bufferization.writable = false}, {bufferization.writable = false}], function_type = (tensor<3xi32>, tensor<11xi32>, tensor<3xf64>) -> index, sym_name = "foo"}> ({
  ^bb0(%arg4: tensor<3xi32>, %arg5: tensor<11xi32>, %arg6: tensor<3xf64>):
    %5 = "sparse_tensor.assemble"(%arg5, %arg4, %arg6) : (tensor<11xi32>, tensor<3xi32>, tensor<3xf64>) -> tensor<10x10xf64, #sparse>
    %6 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %7 = "linalg.generic"(%5) <{doc = "X(i,j) = X(i,j) * 2", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg7: f64):
      %9 = "arith.mulf"(%arg7, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%9) : (f64) -> ()
    }) : (tensor<10x10xf64, #sparse>) -> tensor<10x10xf64, #sparse>
    %8 = "sparse_tensor.number_of_entries"(%7) : (tensor<10x10xf64, #sparse>) -> index
    "func.return"(%8) : (index) -> ()
  }) : () -> ()
  "func.func"() <{arg_attrs = [{bufferization.writable = true}, {bufferization.writable = true}, {bufferization.writable = true}], function_type = (tensor<3xi32>, tensor<11xi32>, tensor<3xf64>) -> index, sym_name = "bar"}> ({
  ^bb0(%arg0: tensor<3xi32>, %arg1: tensor<11xi32>, %arg2: tensor<3xf64>):
    %0 = "sparse_tensor.assemble"(%arg1, %arg0, %arg2) : (tensor<11xi32>, tensor<3xi32>, tensor<3xf64>) -> tensor<10x10xf64, #sparse>
    %1 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %2 = "linalg.generic"(%0) <{doc = "X(i,j) = X(i,j) * 2", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg3: f64):
      %4 = "arith.mulf"(%arg3, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%4) : (f64) -> ()
    }) : (tensor<10x10xf64, #sparse>) -> tensor<10x10xf64, #sparse>
    %3 = "sparse_tensor.number_of_entries"(%2) : (tensor<10x10xf64, #sparse>) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

