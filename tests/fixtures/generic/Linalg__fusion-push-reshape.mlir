#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16xf32>, tensor<16xf32>, tensor<?x112x16xf32>, index) -> tensor<?x112x16xf32>, sym_name = "reshape"}> ({
  ^bb0(%arg0: tensor<?x16xf32>, %arg1: tensor<16xf32>, %arg2: tensor<?x112x16xf32>, %arg3: index):
    %0 = "tensor.expand_shape"(%arg0, %arg3) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: -9223372036854775808, 112, 16>}> : (tensor<?x16xf32>, index) -> tensor<?x112x16xf32>
    %1 = "linalg.generic"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.subf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x112x16xf32>, tensor<16xf32>, tensor<?x112x16xf32>) -> tensor<?x112x16xf32>
    "func.return"(%1) : (tensor<?x112x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12544x16xf32>, tensor<12544x16xf32>, tensor<16xf32>) -> tensor<112x112x16xf32>, sym_name = "reshape_multiple"}> ({
  ^bb0(%arg0: tensor<12544x16xf32>, %arg1: tensor<12544x16xf32>, %arg2: tensor<16xf32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 112, 112, 16>}> : (tensor<12544x16xf32>) -> tensor<112x112x16xf32>
    %1 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 112, 112, 16>}> : (tensor<12544x16xf32>) -> tensor<112x112x16xf32>
    %2 = "tensor.empty"() : () -> tensor<112x112x16xf32>
    %3 = "linalg.generic"(%0, %1, %arg2, %2) <{indexing_maps = [#map, #map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.mulf"(%4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<112x112x16xf32>, tensor<112x112x16xf32>, tensor<16xf32>, tensor<112x112x16xf32>) -> tensor<112x112x16xf32>
    "func.return"(%3) : (tensor<112x112x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<12544x16xf32>, tensor<112xf32>) -> tensor<112x112x16xf32>, sym_name = "reshape_negative"}> ({
  ^bb0(%arg0: tensor<12544x16xf32>, %arg1: tensor<112xf32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 112, 112, 16>}> : (tensor<12544x16xf32>) -> tensor<112x112x16xf32>
    %1 = "tensor.empty"() : () -> tensor<112x112x16xf32>
    %2 = "linalg.generic"(%0, %arg1, %1) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %3 = "arith.subf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<112x112x16xf32>, tensor<112xf32>, tensor<112x112x16xf32>) -> tensor<112x112x16xf32>
    "func.return"(%2) : (tensor<112x112x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x5xi32>, tensor<5xf32>, tensor<5xf32>) -> tensor<2x3x5xf32>, sym_name = "type_correctness"}> ({
  ^bb0(%arg0: tensor<6x5xi32>, %arg1: tensor<5xf32>, %arg2: tensor<5xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 1.1920929E-7 : f32}> : () -> f32
    %3 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 2, 3, 5>}> : (tensor<6x5xi32>) -> tensor<2x3x5xi32>
    %4 = "tensor.empty"() : () -> tensor<2x3x5xf32>
    %5 = "linalg.generic"(%3, %arg1, %arg2, %4) <{indexing_maps = [#map, #map1, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i32, %arg4: f32, %arg5: f32, %arg6: f32):
      %6 = "arith.sitofp"(%arg3) : (i32) -> f32
      %7 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.divf"(%1, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.divf"(%0, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.mulf"(%6, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%10, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<2x3x5xi32>, tensor<5xf32>, tensor<5xf32>, tensor<2x3x5xf32>) -> tensor<2x3x5xf32>
    "func.return"(%5) : (tensor<2x3x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

