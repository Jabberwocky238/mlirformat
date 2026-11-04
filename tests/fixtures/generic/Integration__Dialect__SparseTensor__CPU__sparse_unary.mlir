#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse>, sym_name = "vector_complement_sparse"}> ({
  ^bb0(%arg19: tensor<?xf64, #sparse>):
    %65 = "arith.constant"() <{value = 0 : index}> : () -> index
    %66 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %67 = "tensor.dim"(%arg19, %65) : (tensor<?xf64, #sparse>, index) -> index
    %68 = "tensor.empty"(%67) : (index) -> tensor<?xi32, #sparse>
    %69 = "linalg.generic"(%arg19, %68) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f64, %arg21: i32):
      %70 = "sparse_tensor.unary"(%arg20) ({
      }, {
        "sparse_tensor.yield"(%66) : (i32) -> ()
      }) : (f64) -> i32
      "linalg.yield"(%70) : (i32) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    "func.return"(%69) : (tensor<?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xi32>, sym_name = "vector_complement_dense"}> ({
  ^bb0(%arg16: tensor<?xf64, #sparse>):
    %59 = "arith.constant"() <{value = 0 : index}> : () -> index
    %60 = "tensor.dim"(%arg16, %59) : (tensor<?xf64, #sparse>, index) -> index
    %61 = "tensor.empty"(%60) : (index) -> tensor<?xi32>
    %62 = "linalg.generic"(%arg16, %61) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f64, %arg18: i32):
      %63 = "sparse_tensor.unary"(%arg17) ({
      }, {
        %64 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        "sparse_tensor.yield"(%64) : (i32) -> ()
      }) : (f64) -> i32
      "linalg.yield"(%63) : (i32) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xi32>) -> tensor<?xi32>
    "func.return"(%62) : (tensor<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_negation"}> ({
  ^bb0(%arg12: tensor<?xf64, #sparse>):
    %52 = "arith.constant"() <{value = 0 : index}> : () -> index
    %53 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %54 = "tensor.dim"(%arg12, %52) : (tensor<?xf64, #sparse>, index) -> index
    %55 = "tensor.empty"(%54) : (index) -> tensor<?xf64, #sparse>
    %56 = "linalg.generic"(%arg12, %55) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64):
      %57 = "sparse_tensor.unary"(%arg13) ({
      ^bb0(%arg15: f64):
        %58 = "arith.negf"(%arg15) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
        "sparse_tensor.yield"(%58) : (f64) -> ()
      }, {
        "sparse_tensor.yield"(%53) : (f64) -> ()
      }) : (f64) -> f64
      "linalg.yield"(%57) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%56) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_magnify"}> ({
  ^bb0(%arg8: tensor<?xf64, #sparse>):
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "tensor.dim"(%arg8, %43) : (tensor<?xf64, #sparse>, index) -> index
    %45 = "tensor.empty"(%44) : (index) -> tensor<?xf64, #sparse>
    %46 = "linalg.generic"(%arg8, %45) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f64, %arg10: f64):
      %47 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %48 = "sparse_tensor.unary"(%arg9) ({
      ^bb0(%arg11: f64):
        %49 = "arith.index_cast"(%47) : (index) -> i64
        %50 = "arith.uitofp"(%49) : (i64) -> f64
        %51 = "arith.mulf"(%arg11, %50) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%51) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      "linalg.yield"(%48) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%46) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>, sym_name = "matrix_clip"}> ({
  ^bb0(%arg4: tensor<?x?xf64, #sparse1>):
    %30 = "arith.constant"() <{value = 0 : index}> : () -> index
    %31 = "arith.constant"() <{value = 1 : index}> : () -> index
    %32 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %33 = "arith.constant"() <{value = 7.000000e+00 : f64}> : () -> f64
    %34 = "tensor.dim"(%arg4, %30) : (tensor<?x?xf64, #sparse1>, index) -> index
    %35 = "tensor.dim"(%arg4, %31) : (tensor<?x?xf64, #sparse1>, index) -> index
    %36 = "tensor.empty"(%34, %35) : (index, index) -> tensor<?x?xf64, #sparse1>
    %37 = "linalg.generic"(%arg4, %36) <{indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64, %arg6: f64):
      %38 = "sparse_tensor.unary"(%arg5) ({
      ^bb0(%arg7: f64):
        %39 = "arith.cmpf"(%arg7, %32) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f64, f64) -> i1
        %40 = "arith.select"(%39, %arg7, %32) : (i1, f64, f64) -> f64
        %41 = "arith.cmpf"(%40, %33) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f64, f64) -> i1
        %42 = "arith.select"(%41, %40, %33) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%42) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      "linalg.yield"(%38) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    "func.return"(%37) : (tensor<?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>, sym_name = "matrix_slice"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse1>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 1 : index}> : () -> index
    %15 = "tensor.dim"(%arg0, %13) : (tensor<?x?xf64, #sparse1>, index) -> index
    %16 = "tensor.dim"(%arg0, %14) : (tensor<?x?xf64, #sparse1>, index) -> index
    %17 = "tensor.empty"(%15, %16) : (index, index) -> tensor<?x?xf64, #sparse1>
    %18 = "linalg.generic"(%arg0, %17) <{indexing_maps = [#map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %19 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %20 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %21 = "sparse_tensor.unary"(%arg1) ({
      ^bb0(%arg3: f64):
        %22 = "arith.constant"() <{value = 9.900000e+01 : f64}> : () -> f64
        %23 = "arith.constant"() <{value = 2 : index}> : () -> index
        %24 = "arith.muli"(%23, %19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %25 = "arith.muli"(%23, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %26 = "arith.cmpi"(%24, %15) <{predicate = 6 : i64}> : (index, index) -> i1
        %27 = "arith.select"(%26, %22, %arg3) : (i1, f64, f64) -> f64
        %28 = "arith.cmpi"(%25, %16) <{predicate = 6 : i64}> : (index, index) -> i1
        %29 = "arith.select"(%28, %22, %27) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%29) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      "linalg.yield"(%21) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    "func.return"(%18) : (tensor<?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = -99 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %3 = "sparse_tensor.convert"(%2) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %4 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 7], [2, 2], [2, 4], [2, 7], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %5 = "sparse_tensor.convert"(%4) : (tensor<4x8xf64>) -> tensor<?x?xf64, #sparse1>
    %6 = "func.call"(%3) <{callee = @vector_complement_sparse}> : (tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse>
    %7 = "func.call"(%3) <{callee = @vector_negation}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %8 = "func.call"(%3) <{callee = @vector_magnify}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %9 = "func.call"(%5) <{callee = @matrix_clip}> : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    %10 = "func.call"(%5) <{callee = @matrix_slice}> : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    %11 = "func.call"(%3) <{callee = @vector_complement_dense}> : (tensor<?xf64, #sparse>) -> tensor<?xi32>
    "sparse_tensor.print"(%3) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?xi32, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%8) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%10) : (tensor<?x?xf64, #sparse1>) -> ()
    %12 = "vector.transfer_read"(%11, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<?xi32>, index, i32) -> vector<32xi32>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<32xi32>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

