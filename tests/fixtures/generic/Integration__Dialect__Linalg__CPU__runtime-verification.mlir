#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (0, d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, 0)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map5 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map6 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map7 = affine_map<(d0, d1, d2, d3) -> (d0 * 3 + d2, d1 * 4 + d3)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map10 = affine_map<(d0) -> (-d0 + 3)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %69 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<5xf32>}> : () -> tensor<5xf32>
    %70 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4xf32>}> : () -> tensor<4xf32>
    %71 = "tensor.cast"(%69) : (tensor<5xf32>) -> tensor<?xf32>
    %72 = "tensor.cast"(%70) : (tensor<4xf32>) -> tensor<?xf32>
    %73 = "func.call"(%71, %72) <{callee = @simple_add}> : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %74 = "func.call"(%72, %71) <{callee = @simple_add}> : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %75 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1x1xf32>}> : () -> tensor<1x1xf32>
    %76 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1x4xf32>}> : () -> tensor<1x4xf32>
    %77 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf32>}> : () -> tensor<4x4xf32>
    %78 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x5xf32>}> : () -> tensor<4x5xf32>
    %79 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<5x4xf32>}> : () -> tensor<5x4xf32>
    %80 = "tensor.cast"(%75) : (tensor<1x1xf32>) -> tensor<?x?xf32>
    %81 = "tensor.cast"(%76) : (tensor<1x4xf32>) -> tensor<?x?xf32>
    %82 = "tensor.cast"(%77) : (tensor<4x4xf32>) -> tensor<?x?xf32>
    %83 = "tensor.cast"(%78) : (tensor<4x5xf32>) -> tensor<?x?xf32>
    %84 = "tensor.cast"(%79) : (tensor<5x4xf32>) -> tensor<?x?xf32>
    %85 = "func.call"(%81, %83) <{callee = @broadcast_add}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %86 = "func.call"(%84, %83) <{callee = @broadcast_add}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %87 = "func.call"(%83, %83) <{callee = @matmul_generic}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %88 = "func.call"(%83, %83) <{callee = @matmul_named}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %89 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<16x29xf32>}> : () -> tensor<16x29xf32>
    %90 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<3x4xf32>}> : () -> tensor<3x4xf32>
    %91 = "func.call"(%71) <{callee = @reverse_from_3}> : (tensor<?xf32>) -> tensor<?xf32>
    %92 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<0xf32>}> : () -> tensor<0xf32>
    %93 = "tensor.cast"(%92) : (tensor<0xf32>) -> tensor<?xf32>
    %94 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<0x5xf32>}> : () -> tensor<0x5xf32>
    %95 = "tensor.cast"(%94) : (tensor<0x5xf32>) -> tensor<?x?xf32>
    %96 = "func.call"(%93) <{callee = @fill_empty_1d}> : (tensor<?xf32>) -> tensor<?xf32>
    %97 = "func.call"(%71, %71) <{callee = @simple_add}> : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    %98 = "func.call"(%95) <{callee = @fill_empty_2d}> : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %99 = "func.call"(%89, %90) <{callee = @conv}> : (tensor<16x29xf32>, tensor<3x4xf32>) -> tensor<5x7xf32>
    %100 = "func.call"(%72) <{callee = @reverse_from_3}> : (tensor<?xf32>) -> tensor<?xf32>
    %101 = "func.call"(%84, %83) <{callee = @matmul_named}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %102 = "func.call"(%84, %83) <{callee = @matmul_generic}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %103 = "func.call"(%80, %80) <{callee = @broadcast_add}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %104 = "func.call"(%80, %83) <{callee = @broadcast_add}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %105 = "func.call"(%82, %81) <{callee = @broadcast_add}> : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "simple_add"}> ({
  ^bb0(%arg37: tensor<?xf32>, %arg38: tensor<?xf32>):
    %67 = "linalg.generic"(%arg37, %arg38) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg39: f32, %arg40: f32):
      %68 = "arith.addf"(%arg39, %arg40) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%68) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%67) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "broadcast_add"}> ({
  ^bb0(%arg24: tensor<?x?xf32>, %arg25: tensor<?x?xf32>):
    %32 = "arith.constant"() <{value = 0 : index}> : () -> index
    %33 = "tensor.dim"(%arg24, %32) : (tensor<?x?xf32>, index) -> index
    %34 = "tensor.dim"(%arg25, %32) : (tensor<?x?xf32>, index) -> index
    %35 = "arith.maxui"(%33, %34) : (index, index) -> index
    %36 = "arith.constant"() <{value = 1 : index}> : () -> index
    %37 = "tensor.dim"(%arg24, %36) : (tensor<?x?xf32>, index) -> index
    %38 = "tensor.dim"(%arg25, %36) : (tensor<?x?xf32>, index) -> index
    %39 = "arith.maxui"(%37, %38) : (index, index) -> index
    %40 = "tensor.dim"(%arg24, %32) : (tensor<?x?xf32>, index) -> index
    %41 = "arith.cmpi"(%40, %36) <{predicate = 0 : i64}> : (index, index) -> i1
    %42 = "scf.if"(%41) ({
      %64 = "tensor.dim"(%arg24, %36) : (tensor<?x?xf32>, index) -> index
      %65 = "tensor.empty"(%35, %64) : (index, index) -> tensor<?x?xf32>
      %66 = "linalg.generic"(%arg24, %65) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg35: f32, %arg36: f32):
        "linalg.yield"(%arg35) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%66) : (tensor<?x?xf32>) -> ()
    }, {
      "scf.yield"(%arg24) : (tensor<?x?xf32>) -> ()
    }) : (i1) -> tensor<?x?xf32>
    %43 = "tensor.dim"(%42, %36) : (tensor<?x?xf32>, index) -> index
    %44 = "arith.cmpi"(%43, %36) <{predicate = 0 : i64}> : (index, index) -> i1
    %45 = "scf.if"(%44) ({
      %61 = "tensor.dim"(%42, %32) : (tensor<?x?xf32>, index) -> index
      %62 = "tensor.empty"(%61, %39) : (index, index) -> tensor<?x?xf32>
      %63 = "linalg.generic"(%42, %62) <{indexing_maps = [#map3, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg33: f32, %arg34: f32):
        "linalg.yield"(%arg33) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%63) : (tensor<?x?xf32>) -> ()
    }, {
      "scf.yield"(%42) : (tensor<?x?xf32>) -> ()
    }) : (i1) -> tensor<?x?xf32>
    %46 = "tensor.dim"(%arg25, %32) : (tensor<?x?xf32>, index) -> index
    %47 = "arith.cmpi"(%46, %36) <{predicate = 0 : i64}> : (index, index) -> i1
    %48 = "scf.if"(%47) ({
      %58 = "tensor.dim"(%arg25, %36) : (tensor<?x?xf32>, index) -> index
      %59 = "tensor.empty"(%35, %58) : (index, index) -> tensor<?x?xf32>
      %60 = "linalg.generic"(%arg25, %59) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg31: f32, %arg32: f32):
        "linalg.yield"(%arg31) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%60) : (tensor<?x?xf32>) -> ()
    }, {
      "scf.yield"(%arg25) : (tensor<?x?xf32>) -> ()
    }) : (i1) -> tensor<?x?xf32>
    %49 = "tensor.dim"(%48, %36) : (tensor<?x?xf32>, index) -> index
    %50 = "arith.cmpi"(%49, %36) <{predicate = 0 : i64}> : (index, index) -> i1
    %51 = "scf.if"(%50) ({
      %55 = "tensor.dim"(%48, %32) : (tensor<?x?xf32>, index) -> index
      %56 = "tensor.empty"(%55, %39) : (index, index) -> tensor<?x?xf32>
      %57 = "linalg.generic"(%48, %56) <{indexing_maps = [#map3, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg29: f32, %arg30: f32):
        "linalg.yield"(%arg29) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%57) : (tensor<?x?xf32>) -> ()
    }, {
      "scf.yield"(%48) : (tensor<?x?xf32>) -> ()
    }) : (i1) -> tensor<?x?xf32>
    %52 = "tensor.empty"(%35, %39) : (index, index) -> tensor<?x?xf32>
    %53 = "linalg.generic"(%45, %51, %52) <{indexing_maps = [#map2, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32, %arg28: f32):
      %54 = "arith.addf"(%arg26, %arg27) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%54) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%53) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_generic"}> ({
  ^bb0(%arg19: tensor<?x?xf32>, %arg20: tensor<?x?xf32>):
    %23 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "tensor.dim"(%arg19, %24) : (tensor<?x?xf32>, index) -> index
    %27 = "tensor.dim"(%arg20, %25) : (tensor<?x?xf32>, index) -> index
    %28 = "tensor.splat"(%23, %26, %27) : (f32, index, index) -> tensor<?x?xf32>
    %29 = "linalg.generic"(%arg19, %arg20, %28) <{indexing_maps = [#map4, #map5, #map6], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %30 = "arith.mulf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %31 = "arith.addf"(%arg23, %30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%29) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_named"}> ({
  ^bb0(%arg14: tensor<?x?xf32>, %arg15: tensor<?x?xf32>):
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    %17 = "tensor.dim"(%arg14, %15) : (tensor<?x?xf32>, index) -> index
    %18 = "tensor.dim"(%arg15, %16) : (tensor<?x?xf32>, index) -> index
    %19 = "tensor.splat"(%14, %17, %18) : (f32, index, index) -> tensor<?x?xf32>
    %20 = "linalg.matmul"(%arg14, %arg15, %19) <{indexing_maps = [#map4, #map5, #map6], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %21 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %22 = "arith.addf"(%arg18, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%22) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%20) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x29xf32>, tensor<3x4xf32>) -> tensor<5x7xf32>, sym_name = "conv"}> ({
  ^bb0(%arg9: tensor<16x29xf32>, %arg10: tensor<3x4xf32>):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "tensor.splat"(%9) : (f32) -> tensor<5x7xf32>
    %11 = "linalg.generic"(%arg9, %arg10, %10) <{indexing_maps = [#map7, #map8, #map9], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
      %12 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg13, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<16x29xf32>, tensor<3x4xf32>, tensor<5x7xf32>) -> tensor<5x7xf32>
    "func.return"(%11) : (tensor<5x7xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "reverse_from_3"}> ({
  ^bb0(%arg6: tensor<?xf32>):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "tensor.dim"(%arg6, %5) : (tensor<?xf32>, index) -> index
    %7 = "tensor.splat"(%4, %6) : (f32, index) -> tensor<?xf32>
    %8 = "linalg.generic"(%arg6, %7) <{indexing_maps = [#map10, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%8) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "fill_empty_1d"}> ({
  ^bb0(%arg3: tensor<?xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%3) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "fill_empty_2d"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "linalg.fill"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

