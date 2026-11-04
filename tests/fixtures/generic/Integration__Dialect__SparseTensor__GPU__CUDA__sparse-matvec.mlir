#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg4: tensor<?x?xf64, #sparse>, %arg5: tensor<?xf64>, %arg6: tensor<?xf64>):
    %17 = "linalg.matvec"(%arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: f64):
      %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %19 = "arith.addf"(%arg9, %18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%19) : (f64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    "func.return"(%17) : (tensor<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.generate"() ({
    ^bb0(%arg2: index, %arg3: index):
      %14 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %15 = "arith.index_cast"(%14) : (index) -> i64
      %16 = "arith.uitofp"(%15) : (i64) -> f64
      "tensor.yield"(%16) : (f64) -> ()
    }) : () -> tensor<1024x64xf64>
    %4 = "sparse_tensor.convert"(%3) : (tensor<1024x64xf64>) -> tensor<?x?xf64, #sparse>
    %5 = "tensor.dim"(%4, %2) : (tensor<?x?xf64, #sparse>, index) -> index
    %6 = "tensor.generate"(%5) ({
    ^bb0(%arg1: index):
      %11 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.index_cast"(%11) : (index) -> i64
      %13 = "arith.uitofp"(%12) : (i64) -> f64
      "tensor.yield"(%13) : (f64) -> ()
    }) : (index) -> tensor<?xf64>
    %7 = "tensor.dim"(%4, %1) : (tensor<?x?xf64, #sparse>, index) -> index
    %8 = "tensor.generate"(%7) ({
    ^bb0(%arg0: index):
      "tensor.yield"(%0) : (f64) -> ()
    }) : (index) -> tensor<?xf64>
    %9 = "func.call"(%4, %6, %8) <{callee = @matvec}> : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %10 = "vector.transfer_read"(%9, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map3}> : (tensor<?xf64>, index, f64) -> vector<64xf64>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

