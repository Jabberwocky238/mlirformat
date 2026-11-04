#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>, sym_name = "vector_min"}> ({
  ^bb0(%arg71: tensor<?xi32, #sparse>, %arg72: tensor<?xi32, #sparse>):
    %107 = "arith.constant"() <{value = 0 : index}> : () -> index
    %108 = "tensor.dim"(%arg71, %107) : (tensor<?xi32, #sparse>, index) -> index
    %109 = "tensor.empty"(%108) : (index) -> tensor<?xi32, #sparse>
    %110 = "linalg.generic"(%arg71, %arg72, %109) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg73: i32, %arg74: i32, %arg75: i32):
      %111 = "sparse_tensor.binary"(%arg73, %arg74) <{left_identity, right_identity}> ({
      ^bb0(%arg76: i32, %arg77: i32):
        %112 = "arith.minsi"(%arg76, %arg77) : (i32, i32) -> i32
        "sparse_tensor.yield"(%112) : (i32) -> ()
      }, {
      }, {
      }) : (i32, i32) -> i32
      "linalg.yield"(%111) : (i32) -> ()
    }) : (tensor<?xi32, #sparse>, tensor<?xi32, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    "func.return"(%110) : (tensor<?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64>) -> tensor<?xf64, #sparse>, sym_name = "vector_mul"}> ({
  ^bb0(%arg64: tensor<?xf64, #sparse>, %arg65: tensor<?xf64>):
    %101 = "arith.constant"() <{value = 0 : index}> : () -> index
    %102 = "tensor.dim"(%arg64, %101) : (tensor<?xf64, #sparse>, index) -> index
    %103 = "tensor.empty"(%102) : (index) -> tensor<?xf64, #sparse>
    %104 = "linalg.generic"(%arg64, %arg65, %103) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg66: f64, %arg67: f64, %arg68: f64):
      %105 = "sparse_tensor.binary"(%arg66, %arg67) ({
      ^bb0(%arg69: f64, %arg70: f64):
        %106 = "arith.mulf"(%arg69, %arg70) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%106) : (f64) -> ()
      }, {
      }, {
      }) : (f64, f64) -> f64
      "linalg.yield"(%105) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%104) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_setdiff"}> ({
  ^bb0(%arg59: tensor<?xf64, #sparse>, %arg60: tensor<?xf64, #sparse>):
    %96 = "arith.constant"() <{value = 0 : index}> : () -> index
    %97 = "tensor.dim"(%arg59, %96) : (tensor<?xf64, #sparse>, index) -> index
    %98 = "tensor.empty"(%97) : (index) -> tensor<?xf64, #sparse>
    %99 = "linalg.generic"(%arg59, %arg60, %98) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg61: f64, %arg62: f64, %arg63: f64):
      %100 = "sparse_tensor.binary"(%arg61, %arg62) <{left_identity}> ({
      }, {
      }, {
      }) : (f64, f64) -> f64
      "linalg.yield"(%100) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%99) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse>, sym_name = "vector_index"}> ({
  ^bb0(%arg54: tensor<?xf64, #sparse>):
    %89 = "arith.constant"() <{value = 0 : index}> : () -> index
    %90 = "tensor.dim"(%arg54, %89) : (tensor<?xf64, #sparse>, index) -> index
    %91 = "tensor.empty"(%90) : (index) -> tensor<?xi32, #sparse>
    %92 = "linalg.generic"(%arg54, %91) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg55: f64, %arg56: i32):
      %93 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %94 = "sparse_tensor.binary"(%arg55, %93) ({
      ^bb0(%arg57: f64, %arg58: index):
        %95 = "arith.index_cast"(%arg58) : (index) -> i32
        "sparse_tensor.yield"(%95) : (i32) -> ()
      }, {
      }, {
      }) : (f64, index) -> i32
      "linalg.yield"(%94) : (i32) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    "func.return"(%92) : (tensor<?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>, sym_name = "matrix_intersect"}> ({
  ^bb0(%arg46: tensor<?x?xf64, #sparse1>, %arg47: tensor<?x?xf64, #sparse1>):
    %80 = "arith.constant"() <{value = 0 : index}> : () -> index
    %81 = "arith.constant"() <{value = 1 : index}> : () -> index
    %82 = "tensor.dim"(%arg46, %80) : (tensor<?x?xf64, #sparse1>, index) -> index
    %83 = "tensor.dim"(%arg46, %81) : (tensor<?x?xf64, #sparse1>, index) -> index
    %84 = "tensor.empty"(%82, %83) : (index, index) -> tensor<?x?xf64, #sparse1>
    %85 = "linalg.generic"(%arg46, %arg47, %84) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg48: f64, %arg49: f64, %arg50: f64):
      %86 = "sparse_tensor.binary"(%arg48, %arg49) ({
      ^bb0(%arg52: f64, %arg53: f64):
        %88 = "arith.addf"(%arg52, %arg53) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%88) : (f64) -> ()
      }, {
      }, {
      ^bb0(%arg51: f64):
        %87 = "arith.negf"(%arg51) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
        "sparse_tensor.yield"(%87) : (f64) -> ()
      }) : (f64, f64) -> f64
      "linalg.yield"(%86) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    "func.return"(%85) : (tensor<?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>, sym_name = "add_tensor_1"}> ({
  ^bb0(%arg39: tensor<4x4xf64, #sparse1>, %arg40: tensor<4x4xf64, #sparse1>):
    %76 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse1>
    %77 = "linalg.generic"(%arg39, %arg40, %76) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg41: f64, %arg42: f64, %arg43: f64):
      %78 = "sparse_tensor.binary"(%arg41, %arg42) <{left_identity, right_identity}> ({
      ^bb0(%arg44: f64, %arg45: f64):
        %79 = "arith.addf"(%arg44, %arg45) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%79) : (f64) -> ()
      }, {
      }, {
      }) : (f64, f64) -> f64
      "linalg.yield"(%78) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "func.return"(%77) : (tensor<4x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>, sym_name = "add_tensor_2"}> ({
  ^bb0(%arg30: tensor<4x4xf64, #sparse1>, %arg31: tensor<4x4xf64, #sparse1>):
    %72 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse1>
    %73 = "linalg.generic"(%arg30, %arg31, %72) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg32: f64, %arg33: f64, %arg34: f64):
      %74 = "sparse_tensor.binary"(%arg32, %arg33) ({
      ^bb0(%arg37: f64, %arg38: f64):
        %75 = "arith.addf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%75) : (f64) -> ()
      }, {
      ^bb0(%arg36: f64):
        "sparse_tensor.yield"(%arg36) : (f64) -> ()
      }, {
      ^bb0(%arg35: f64):
        "sparse_tensor.yield"(%arg35) : (f64) -> ()
      }) : (f64, f64) -> f64
      "linalg.yield"(%74) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "func.return"(%73) : (tensor<4x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>, sym_name = "triangular"}> ({
  ^bb0(%arg22: tensor<4x4xf64, #sparse1>, %arg23: tensor<4x4xf64, #sparse1>):
    %60 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse1>
    %61 = "linalg.generic"(%arg22, %arg23, %60) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg24: f64, %arg25: f64, %arg26: f64):
      %62 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %63 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %64 = "sparse_tensor.binary"(%arg24, %arg25) <{left_identity}> ({
      ^bb0(%arg28: f64, %arg29: f64):
        %68 = "arith.cmpi"(%63, %62) <{predicate = 9 : i64}> : (index, index) -> i1
        %69 = "arith.addf"(%arg28, %arg29) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %70 = "arith.subf"(%arg28, %arg29) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %71 = "arith.select"(%68, %69, %70) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%71) : (f64) -> ()
      }, {
      }, {
      ^bb0(%arg27: f64):
        %65 = "arith.cmpi"(%63, %62) <{predicate = 9 : i64}> : (index, index) -> i1
        %66 = "arith.negf"(%arg27) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
        %67 = "arith.select"(%65, %arg27, %66) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%67) : (f64) -> ()
      }) : (f64, f64) -> f64
      "linalg.yield"(%64) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "func.return"(%61) : (tensor<4x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>, sym_name = "sub_with_thres"}> ({
  ^bb0(%arg13: tensor<4x4xf64, #sparse1>, %arg14: tensor<4x4xf64, #sparse1>):
    %39 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse1>
    %40 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %41 = "arith.constant"() <{value = -2.000000e+00 : f64}> : () -> f64
    %42 = "linalg.generic"(%arg13, %arg14, %39) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f64, %arg16: f64, %arg17: f64):
      %43 = "sparse_tensor.binary"(%arg15, %arg16) ({
      ^bb0(%arg20: f64, %arg21: f64):
        %53 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
        %54 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
        %55 = "arith.subf"(%arg20, %arg21) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %56 = "arith.cmpf"(%55, %53) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f64, f64) -> i1
        %57 = "arith.select"(%56, %53, %55) : (i1, f64, f64) -> f64
        %58 = "arith.cmpf"(%57, %54) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (f64, f64) -> i1
        %59 = "arith.select"(%58, %54, %57) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%59) : (f64) -> ()
      }, {
      ^bb0(%arg19: f64):
        %49 = "arith.cmpf"(%arg19, %40) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f64, f64) -> i1
        %50 = "arith.select"(%49, %40, %arg19) : (i1, f64, f64) -> f64
        %51 = "arith.cmpf"(%50, %41) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (f64, f64) -> i1
        %52 = "arith.select"(%51, %41, %50) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%52) : (f64) -> ()
      }, {
      ^bb0(%arg18: f64):
        %44 = "arith.negf"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
        %45 = "arith.cmpf"(%44, %40) <{fastmath = #arith.fastmath<none>, predicate = 3 : i64}> : (f64, f64) -> i1
        %46 = "arith.select"(%45, %40, %44) : (i1, f64, f64) -> f64
        %47 = "arith.cmpf"(%46, %41) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (f64, f64) -> i1
        %48 = "arith.select"(%47, %41, %46) : (i1, f64, f64) -> f64
        "sparse_tensor.yield"(%48) : (f64) -> ()
      }) : (f64, f64) -> f64
      "linalg.yield"(%43) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "func.return"(%42) : (tensor<4x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xi8, #sparse1>, sym_name = "intersect_equal"}> ({
  ^bb0(%arg6: tensor<4x4xf64, #sparse1>, %arg7: tensor<4x4xf64, #sparse1>):
    %34 = "tensor.empty"() : () -> tensor<4x4xi8, #sparse1>
    %35 = "linalg.generic"(%arg6, %arg7, %34) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f64, %arg9: f64, %arg10: i8):
      %36 = "sparse_tensor.binary"(%arg8, %arg9) ({
      ^bb0(%arg11: f64, %arg12: f64):
        %37 = "arith.cmpf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f64, f64) -> i1
        %38 = "arith.extui"(%37) : (i1) -> i8
        "sparse_tensor.yield"(%38) : (i8) -> ()
      }, {
      }, {
      }) : (f64, f64) -> i8
      "linalg.yield"(%36) : (i8) -> ()
    }) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>, tensor<4x4xi8, #sparse1>) -> tensor<4x4xi8, #sparse1>
    "func.return"(%35) : (tensor<4x4xi8, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>, sym_name = "only_left_right"}> ({
  ^bb0(%arg0: tensor<4x4xf64, #sparse1>, %arg1: tensor<4x4xf64, #sparse1>):
    %30 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse1>
    %31 = "linalg.generic"(%arg0, %arg1, %30) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %32 = "sparse_tensor.binary"(%arg2, %arg3) <{left_identity}> ({
      }, {
      }, {
      ^bb0(%arg5: f64):
        %33 = "arith.negf"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
        "sparse_tensor.yield"(%33) : (f64) -> ()
      }) : (f64, f64) -> f64
      "linalg.yield"(%32) : (f64) -> ()
    }) : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "func.return"(%31) : (tensor<4x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %2 = "arith.constant"() <{value = sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %3 = "arith.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 0.000000e+00, 1.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %4 = "arith.fptosi"(%1) : (tensor<32xf64>) -> tensor<32xi32>
    %5 = "arith.fptosi"(%2) : (tensor<32xf64>) -> tensor<32xi32>
    %6 = "sparse_tensor.convert"(%1) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %7 = "sparse_tensor.convert"(%2) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %8 = "sparse_tensor.convert"(%4) : (tensor<32xi32>) -> tensor<?xi32, #sparse>
    %9 = "sparse_tensor.convert"(%5) : (tensor<32xi32>) -> tensor<?xi32, #sparse>
    %10 = "tensor.cast"(%3) : (tensor<32xf64>) -> tensor<?xf64>
    %11 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 7], [2, 2], [2, 4], [2, 7], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %12 = "arith.constant"() <{value = sparse<[[0, 0], [0, 7], [1, 0], [1, 6], [2, 1], [2, 7]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %13 = "sparse_tensor.convert"(%11) : (tensor<4x8xf64>) -> tensor<?x?xf64, #sparse1>
    %14 = "sparse_tensor.convert"(%12) : (tensor<4x8xf64>) -> tensor<?x?xf64, #sparse1>
    %15 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00], [3.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %16 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %17 = "sparse_tensor.convert"(%15) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse1>
    %18 = "sparse_tensor.convert"(%16) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse1>
    %19 = "func.call"(%8, %9) <{callee = @vector_min}> : (tensor<?xi32, #sparse>, tensor<?xi32, #sparse>) -> tensor<?xi32, #sparse>
    %20 = "func.call"(%6, %10) <{callee = @vector_mul}> : (tensor<?xf64, #sparse>, tensor<?xf64>) -> tensor<?xf64, #sparse>
    %21 = "func.call"(%6, %7) <{callee = @vector_setdiff}> : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %22 = "func.call"(%6) <{callee = @vector_index}> : (tensor<?xf64, #sparse>) -> tensor<?xi32, #sparse>
    %23 = "func.call"(%13, %14) <{callee = @matrix_intersect}> : (tensor<?x?xf64, #sparse1>, tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>
    %24 = "func.call"(%17, %18) <{callee = @add_tensor_1}> : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %25 = "func.call"(%17, %18) <{callee = @add_tensor_2}> : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %26 = "func.call"(%17, %18) <{callee = @triangular}> : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %27 = "func.call"(%17, %18) <{callee = @sub_with_thres}> : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %28 = "func.call"(%17, %18) <{callee = @intersect_equal}> : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xi8, #sparse1>
    %29 = "func.call"(%17, %18) <{callee = @only_left_right}> : (tensor<4x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "sparse_tensor.print"(%6) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%19) : (tensor<?xi32, #sparse>) -> ()
    "sparse_tensor.print"(%20) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%21) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%22) : (tensor<?xi32, #sparse>) -> ()
    "sparse_tensor.print"(%23) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%24) : (tensor<4x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%25) : (tensor<4x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%26) : (tensor<4x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%27) : (tensor<4x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%28) : (tensor<4x4xi8, #sparse1>) -> ()
    "sparse_tensor.print"(%29) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%22) : (tensor<?xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%23) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%24) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%25) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%26) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%27) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%28) : (tensor<4x4xi8, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%29) : (tensor<4x4xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

