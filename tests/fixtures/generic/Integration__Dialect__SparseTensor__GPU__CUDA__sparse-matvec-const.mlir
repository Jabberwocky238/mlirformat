#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x64xf64, #sparse>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg3: tensor<1024x64xf64, #sparse>, %arg4: tensor<64xf64>, %arg5: tensor<1024xf64>):
    %13 = "linalg.matvec"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64, %arg7: f64, %arg8: f64):
      %14 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %15 = "arith.addf"(%arg8, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%15) : (f64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1024x64xf64, #sparse>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64>
    "func.return"(%13) : (tensor<1024xf64>) -> ()
  }) : () -> ()
  "memref.global"() <{alignment = 64 : i64, constant, initial_value = dense<1.000000e+00> : tensor<64xf64>, sym_name = "__constant_64xf64", sym_visibility = "private", type = memref<64xf64>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.generate"() ({
    ^bb0(%arg1: index, %arg2: index):
      %10 = "arith.addi"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %11 = "arith.index_cast"(%10) : (index) -> i64
      %12 = "arith.uitofp"(%11) : (i64) -> f64
      "tensor.yield"(%12) : (f64) -> ()
    }) : () -> tensor<1024x64xf64>
    %4 = "sparse_tensor.convert"(%3) : (tensor<1024x64xf64>) -> tensor<1024x64xf64, #sparse>
    %5 = "tensor.generate"() ({
    ^bb0(%arg0: index):
      "tensor.yield"(%0) : (f64) -> ()
    }) : () -> tensor<1024xf64>
    %6 = "memref.get_global"() <{name = @__constant_64xf64}> : () -> memref<64xf64>
    %7 = "bufferization.to_tensor"(%6) <{restrict}> : (memref<64xf64>) -> tensor<64xf64>
    %8 = "func.call"(%4, %7, %5) <{callee = @matvec}> : (tensor<1024x64xf64, #sparse>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64>
    %9 = "vector.transfer_read"(%8, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<1024xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<1024x64xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

