#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
#map6 = affine_map<(d0) -> (d0)>
#map7 = affine_map<(d0) -> ()>
#map8 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map9 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index, index, index) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg57: memref<?xi8>, %arg58: index, %arg59: index, %arg60: index):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index
    %32 = "arith.constant"() <{value = 1 : index}> : () -> index
    %33 = "memref.view"(%arg57, %31, %arg58, %arg60) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %34 = "memref.view"(%arg57, %31, %arg60, %arg59) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %35 = "memref.view"(%arg57, %31, %arg58, %arg59) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    "linalg.matmul"(%33, %34, %35) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg61: f32, %arg62: f32, %arg63: f32):
      %36 = "arith.mulf"(%arg61, %arg62) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %37 = "arith.addf"(%arg63, %36) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%37) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi8>, index, index) -> (), sym_name = "matvec"}> ({
  ^bb0(%arg51: memref<?xi8>, %arg52: index, %arg53: index):
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "memref.view"(%arg51, %24, %arg52, %arg53) : (memref<?xi8>, index, index, index) -> memref<?x?xf32>
    %27 = "memref.view"(%arg51, %24, %arg52) : (memref<?xi8>, index, index) -> memref<?xf32>
    %28 = "memref.view"(%arg51, %24, %arg53) : (memref<?xi8>, index, index) -> memref<?xf32>
    "linalg.matvec"(%26, %27, %28) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg54: f32, %arg55: f32, %arg56: f32):
      %29 = "arith.mulf"(%arg54, %arg55) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %30 = "arith.addf"(%arg56, %29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%30) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (memref<?x?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi8>, index) -> (), sym_name = "dot"}> ({
  ^bb0(%arg46: memref<?xi8>, %arg47: index):
    %17 = "arith.constant"() <{value = 0 : index}> : () -> index
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index
    %19 = "memref.view"(%arg46, %17, %arg47) : (memref<?xi8>, index, index) -> memref<?xf32>
    %20 = "memref.view"(%arg46, %17, %arg47) : (memref<?xi8>, index, index) -> memref<?xf32>
    %21 = "memref.view"(%arg46, %17) : (memref<?xi8>, index) -> memref<f32>
    "linalg.dot"(%19, %20, %21) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg48: f32, %arg49: f32, %arg50: f32):
      %22 = "arith.mulf"(%arg48, %arg49) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.addf"(%arg50, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map6, #map7]} : (memref<?xf32>, memref<?xf32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, memref<?xi32>, memref<i32>) -> (), sym_name = "dot_int"}> ({
  ^bb0(%arg40: memref<?xi32>, %arg41: memref<?xi32>, %arg42: memref<i32>):
    "linalg.dot"(%arg40, %arg41, %arg42) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg43: i32, %arg44: i32, %arg45: i32):
      %15 = "arith.muli"(%arg43, %arg44) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %16 = "arith.addi"(%arg45, %15) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%16) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map6, #map7]} : (memref<?xi32>, memref<?xi32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi1>, memref<?xi1>, memref<i1>) -> (), sym_name = "dot_bool"}> ({
  ^bb0(%arg34: memref<?xi1>, %arg35: memref<?xi1>, %arg36: memref<i1>):
    "linalg.dot"(%arg34, %arg35, %arg36) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg37: i1, %arg38: i1, %arg39: i1):
      %13 = "arith.andi"(%arg37, %arg38) : (i1, i1) -> i1
      %14 = "arith.ori"(%arg39, %13) : (i1, i1) -> i1
      "linalg.yield"(%14) : (i1) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map6, #map7]} : (memref<?xi1>, memref<?xi1>, memref<i1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> (), sym_name = "dot_view"}> ({
  ^bb0(%arg28: memref<?xf32, strided<[1], offset: ?>>, %arg29: memref<?xf32, strided<[1], offset: ?>>, %arg30: memref<f32>):
    "linalg.dot"(%arg28, %arg29, %arg30) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg31: f32, %arg32: f32, %arg33: f32):
      %11 = "arith.mulf"(%arg31, %arg32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "arith.addf"(%arg33, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map6, #map7]} : (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, f32) -> (), sym_name = "fill_view"}> ({
  ^bb0(%arg24: memref<?xf32, strided<[1], offset: ?>>, %arg25: f32):
    "linalg.fill"(%arg25, %arg24) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      "linalg.yield"(%arg26) : (f32) -> ()
    }) : (f32, memref<?xf32, strided<[1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, f32) -> (), sym_name = "fill_view0"}> ({
  ^bb0(%arg20: memref<f32>, %arg21: f32):
    "linalg.fill"(%arg21, %arg20) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32):
      "linalg.yield"(%arg22) : (f32) -> ()
    }) : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, f32) -> (), sym_name = "fill_view3"}> ({
  ^bb0(%arg16: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg17: f32):
    "linalg.fill"(%arg17, %arg16) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32):
      "linalg.yield"(%arg18) : (f32) -> ()
    }) : (f32, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>) -> (), sym_name = "copy_view"}> ({
  ^bb0(%arg12: memref<?xf32, strided<[1], offset: ?>>, %arg13: memref<?xf32, strided<[1], offset: ?>>):
    "linalg.generic"(%arg12, %arg13) <{indexing_maps = [#map6, #map6], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      "linalg.yield"(%arg14) : (f32) -> ()
    }) : (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> (), sym_name = "generic_region"}> ({
  ^bb0(%arg6: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg7: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg8: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>):
    "linalg.generic"(%arg6, %arg7, %arg8) <{doc = "B(i,j,k), C(i,k,j) = foo(A(i, j), B(i,j,k), C(i,k,j))", indexing_maps = [#map2, #map8, #map9], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_external_function_name_2", operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %9 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.addf"(%arg11, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9, %10) : (f32, f32) -> ()
    }) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> (), sym_name = "generic_index_region"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg2: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>):
    "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "B(i,j,k), C(i,k,j) = foo(A(i, j) * B(i,j,k), i * j * k + C(i,k,j))", indexing_maps = [#map2, #map8, #map9], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_external_function_name_2", operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %1 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %2 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %3 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %5 = "arith.addi"(%4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.sitofp"(%6) : (i32) -> f32
      %8 = "arith.addf"(%arg5, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3, %8) : (f32, f32) -> ()
    }) : (memref<?x?xf32, strided<[?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> ()>
#map4 = affine_map<() -> ()>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map6 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map7 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map9 = affine_map<(d0, d1) -> (d0 + d1)>
#map10 = affine_map<(d0, d1) -> (d1)>
#map11 = affine_map<(d0, d1) -> (d0)>
#map12 = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map13 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map14 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map15 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0 + d3, d1 + d4, d2 + d5)>
#map16 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5)>
#map17 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<3x4xf32>) -> (), sym_name = "generic_op_zero_rank"}> ({
  ^bb0(%arg57: memref<f32>, %arg58: memref<3x4xf32>):
    "linalg.generic"(%arg57, %arg58) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg59: f32, %arg60: f32):
      "linalg.yield"(%arg59) : (f32) -> ()
    }) : (memref<f32>, memref<3x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<3x4xf32>) -> (), sym_name = "generic_op_scalar"}> ({
  ^bb0(%arg53: f32, %arg54: memref<3x4xf32>):
    "linalg.generic"(%arg53, %arg54) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg55: f32, %arg56: f32):
      "linalg.yield"(%arg55) : (f32) -> ()
    }) : (f32, memref<3x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<3x4xi32>) -> (), sym_name = "generic_index_op_zero_rank"}> ({
  ^bb0(%arg49: memref<i32>, %arg50: memref<3x4xi32>):
    "linalg.generic"(%arg49, %arg50) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg51: i32, %arg52: i32):
      %18 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %19 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %20 = "arith.addi"(%18, %19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %21 = "arith.index_cast"(%20) : (index) -> i32
      %22 = "arith.addi"(%arg51, %21) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%22) : (i32) -> ()
    }) : (memref<i32>, memref<3x4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<f32>) -> (), sym_name = "generic_op_1D_reduce"}> ({
  ^bb0(%arg45: memref<?xf32>, %arg46: memref<f32>):
    "linalg.generic"(%arg45, %arg46) <{indexing_maps = [#map2, #map3], iterator_types = [#linalg.iterator_type<reduction>], library_call = "some_reduce_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg47: f32, %arg48: f32):
      %17 = "arith.addf"(%arg47, %arg48) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) : (memref<?xf32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<f32>, memref<f32>) -> (), sym_name = "generic_index_op_1D_reduce"}> ({
  ^bb0(%arg39: memref<?xf32>, %arg40: memref<f32>, %arg41: memref<f32>):
    "linalg.generic"(%arg39, %arg40, %arg41) <{indexing_maps = [#map2, #map3, #map3], iterator_types = [#linalg.iterator_type<reduction>], library_call = "some_reduce_external_fn", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg42: f32, %arg43: f32, %arg44: f32):
      %12 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %13 = "arith.constant"() <{value = 0 : index}> : () -> index
      %14 = "arith.cmpi"(%13, %12) <{predicate = 0 : i64}> : (index, index) -> i1
      %15 = "arith.select"(%14, %arg43, %arg44) : (i1, f32, f32) -> f32
      %16 = "arith.addf"(%arg42, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (memref<?xf32>, memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "generic_const_init"}> ({
  ^bb0(%arg37: memref<?xf32>):
    %11 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "linalg.generic"(%arg37) <{indexing_maps = [#map2], iterator_types = [#linalg.iterator_type<parallel>], library_call = "some_external_fn", operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg38: f32):
      "linalg.yield"(%11) : (f32) -> ()
    }) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, memref<f32>, memref<f32>, i1) -> (), sym_name = "scalar_code"}> ({
  ^bb0(%arg30: memref<f32>, %arg31: memref<f32>, %arg32: memref<f32>, %arg33: i1):
    "linalg.generic"(%arg30, %arg31, %arg32) <{indexing_maps = [#map4, #map4, #map4], iterator_types = [], library_call = "some_external_fn", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg34: f32, %arg35: f32, %arg36: f32):
      %10 = "scf.if"(%arg33) ({
        "scf.yield"(%arg34) : (f32) -> ()
      }, {
        "scf.yield"(%arg35) : (f32) -> ()
      }) : (i1) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (memref<f32>, memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?xf32>) -> (), sym_name = "batch_reduce_matmul_as_contract"}> ({
  ^bb0(%arg24: memref<?x?x?xf32>, %arg25: memref<?x?x?xf32>, %arg26: memref<?x?xf32>):
    "linalg.contract"(%arg24, %arg25, %arg26) <{indexing_maps = [#map5, #map6, #map7], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: f32, %arg28: f32, %arg29: f32):
      %8 = "arith.mulf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg29, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "named_batch_matmul"}> ({
  ^bb0(%arg18: memref<?x?x?xf32>, %arg19: memref<?x?x?xf32>, %arg20: memref<?x?x?xf32>):
    "linalg.batch_matmul"(%arg18, %arg19, %arg20) <{indexing_maps = [#map5, #map6, #map8], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %6 = "arith.mulf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg23, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "conv1d_no_symbols"}> ({
  ^bb0(%arg12: memref<?xf32>, %arg13: memref<?xf32>, %arg14: memref<?xf32>):
    "linalg.conv_1d"(%arg12, %arg13, %arg14) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %4 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg17, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map9, #map10, #map11]} : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "conv2d_no_symbols"}> ({
  ^bb0(%arg6: memref<?x?xf32>, %arg7: memref<?x?xf32>, %arg8: memref<?x?xf32>):
    "linalg.conv_2d"(%arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %2 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg11, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map12, #map13, #map14]} : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "conv3d_no_symbols"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.conv_3d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map15, #map16, #map17]} : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, memref<?x?xi32>, index, index, index) -> (), sym_name = "lower_to_loops_with_rank_reducing_subviews"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: memref<?x?xi32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.subview"(%arg0, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (memref<?xi32>, index, index) -> memref<?xi32, strided<[1], offset: ?>>
    %1 = "memref.subview"(%arg1, %arg4, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xi32>, index, index) -> memref<?xi32, strided<[1], offset: ?>>
    "linalg.generic"(%0, %1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: i32, %arg6: i32):
      "linalg.yield"(%arg5) : (i32) -> ()
    }) : (memref<?xi32, strided<[1], offset: ?>>, memref<?xi32, strided<[1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "transpose"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 0>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

