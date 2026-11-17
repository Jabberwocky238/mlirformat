"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32>, sym_name = "dynamic_elem_pack"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: tensor<?x?x8x2xf32> loc("<stdin>":4:32)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index loc("<stdin>":7:10)
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index loc("<stdin>":8:10)
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32> loc("<stdin>":9:10)
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":11:10), %arg3: f32 loc("<stdin>":11:22)):
      %7 = "arith.addf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":10:10)
    %6 = "linalg.pack"(%5, %arg1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<?x?xf32>, tensor<?x?x8x2xf32>) -> tensor<?x?x8x2xf32> loc("<stdin>":15:10)
    "func.return"(%6) : (tensor<?x?x8x2xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
