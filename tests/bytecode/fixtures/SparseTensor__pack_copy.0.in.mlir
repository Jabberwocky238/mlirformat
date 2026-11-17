"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = false}, {bufferization.writable = false}, {bufferization.writable = false}], function_type = (tensor<3xi32>, tensor<11xi32>, tensor<3xf64>) -> index, sym_name = "foo"}> ({
  ^bb0(%arg4: tensor<3xi32> loc("<stdin>":5:8), %arg5: tensor<11xi32> loc("<stdin>":5:30), %arg6: tensor<3xf64> loc("<stdin>":5:53)):
    %5 = "sparse_tensor.assemble"(%arg5, %arg4, %arg6) : (tensor<11xi32>, tensor<3xi32>, tensor<3xf64>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":6:10)
    %6 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":7:10)
    %7 = "linalg.generic"(%5) <{doc = "X(i,j) = X(i,j) * 2", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg7: f64 loc("<stdin>":9:10)):
      %9 = "arith.mulf"(%arg7, %6) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":10:12)
      "linalg.yield"(%9) : (f64) -> () loc("<stdin>":11:7)
    }) : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":8:10)
    %8 = "sparse_tensor.number_of_entries"(%7) : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> index loc("<stdin>":13:10)
    "func.return"(%8) : (index) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{arg_attrs = [{bufferization.writable = true}, {bufferization.writable = true}, {bufferization.writable = true}], function_type = (tensor<3xi32>, tensor<11xi32>, tensor<3xf64>) -> index, sym_name = "bar"}> ({
  ^bb0(%arg0: tensor<3xi32> loc("<stdin>":17:8), %arg1: tensor<11xi32> loc("<stdin>":17:30), %arg2: tensor<3xf64> loc("<stdin>":17:53)):
    %0 = "sparse_tensor.assemble"(%arg1, %arg0, %arg2) : (tensor<11xi32>, tensor<3xi32>, tensor<3xf64>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:10)
    %2 = "linalg.generic"(%0) <{doc = "X(i,j) = X(i,j) * 2", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":21:10)):
      %4 = "arith.mulf"(%arg3, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":22:12)
      "linalg.yield"(%4) : (f64) -> () loc("<stdin>":23:7)
    }) : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":20:10)
    %3 = "sparse_tensor.number_of_entries"(%2) : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>>) -> index loc("<stdin>":25:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":3:1)
