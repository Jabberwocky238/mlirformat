#map = affine_map<(d0) -> (d0)>
module {
  func.func @remove_deadargs_generic_basic(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim) : tensor<?xf32>
    %1 = tensor.empty(%dim) : tensor<?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %0 : tensor<?xf32>, tensor<?xf32>) outs(%1 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %cst : f32
      linalg.yield %3 : f32
    } -> tensor<?xf32>
    return %2 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @remove_deadargs_generic_mixedaccess(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    %cst_1 = arith.constant 6.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_2 = tensor.dim %arg0, %c0_0 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_2) : tensor<?x?xf32>
    %1 = tensor.empty(%dim_2, %dim) : tensor<?x?xf32>
    %2 = tensor.empty(%dim, %dim_2) : tensor<?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32):
      %4 = arith.divf %cst, %cst_1 : f32
      linalg.yield %4 : f32
    } -> tensor<?x?xf32>
    return %3 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @basic(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg0 : tensor<?xf32>, tensor<?xf32>) outs(%arg0 : tensor<?xf32>) attrs =  {someattr} {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @distinct_affine_maps(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @mixed_redundant_non_redundant(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32):
      %1 = "test.elementwise_mappable"(%in, %in_0, %in_1) : (f32, f32, f32) -> f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @multiple_different_redundant_args(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1, %arg0, %arg1 : tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) outs(%arg0 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %in_2: f32, %out: f32):
      %1 = "test.elementwise_mappable"(%in, %in_0, %in_1, %in_2) : (f32, f32, f32, f32) -> f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
module {
  func.func @drop_dead_results(%arg0: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    %0:4 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg0, %arg0, %arg0, %arg0 : tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32, %out_1: f32, %out_2: f32):
      %1 = arith.addf %in, %in : f32
      linalg.yield %1, %1, %1, %1 : f32, f32, f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return %0#0, %0#2 : tensor<?x?x?xf32>, tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @argmax_lowering(%arg0: tensor<?xf32>) -> tensor<i32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = tensor.empty() : tensor<i32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<?xf32>) outs(%0, %1 : tensor<f32>, tensor<i32>) {
    ^bb0(%in: f32, %out: f32, %out_0: i32):
      %3 = linalg.index 0 : index
      %4 = arith.index_cast %3 : index to i32
      %5 = arith.cmpf oge, %in, %out : f32
      %6 = arith.select %5, %in, %out : f32
      %7 = arith.cmpf oeq, %in, %out : f32
      %8 = arith.minsi %4, %out_0 : i32
      %9 = arith.select %5, %4, %out_0 : i32
      %10 = arith.select %7, %8, %9 : i32
      linalg.yield %6, %10 : f32, i32
    } -> (tensor<f32>, tensor<i32>)
    return %2#1 : tensor<i32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @loop_dim_operand(%arg0: tensor<?xf32>) -> tensor<i32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = tensor.empty() : tensor<i32>
    %1 = linalg.fill ins(%c0_i32 : i32) outs(%0 : tensor<i32>) -> tensor<i32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<?xf32>) outs(%1 : tensor<i32>) {
    ^bb0(%in: f32, %out: i32):
      %3 = linalg.index 0 : index
      %4 = arith.index_cast %3 : index to i32
      %5 = arith.addi %out, %4 : i32
      linalg.yield %5 : i32
    } -> tensor<i32>
    return %2 : tensor<i32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @loop_dim_outs_operand(%arg0: index) -> tensor<i32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = tensor.empty(%arg0) : tensor<?xi32>
    %1 = tensor.empty() : tensor<i32>
    %2 = linalg.fill ins(%c0_i32 : i32) outs(%1 : tensor<i32>) -> tensor<i32>
    %3:2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel"]} outs(%0, %2 : tensor<?xi32>, tensor<i32>) {
    ^bb0(%out: i32, %out_0: i32):
      %4 = linalg.index 0 : index
      %5 = arith.index_cast %4 : index to i32
      %6 = arith.addi %out_0, %5 : i32
      linalg.yield %5, %6 : i32, i32
    } -> (tensor<?xi32>, tensor<i32>)
    return %3#1 : tensor<i32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @multiple_redundant_args(%arg0: tensor<?x?xi32>, %arg1: tensor<?xi32>, %arg2: tensor<?xi32>, %arg3: tensor<?x?xi32>, %arg4: tensor<?xi32>) -> tensor<?xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map2, #map3, #map3, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg4, %arg0, %arg0, %arg1, %arg3, %arg3 : tensor<?xi32>, tensor<?x?xi32>, tensor<?x?xi32>, tensor<?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %in_1: i32, %in_2: i32, %in_3: i32, %in_4: i32, %out: i32):
      %1 = arith.addi %in, %in_0 : i32
      %2 = arith.addi %1, %in_1 : i32
      %3 = arith.addi %2, %in_2 : i32
      %4 = arith.addi %3, %in_3 : i32
      %5 = arith.addi %4, %in_4 : i32
      %6 = arith.addi %5, %out : i32
      linalg.yield %6 : i32
    } -> tensor<?xi32>
    return %0 : tensor<?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @drop_redundant_results(%arg0: tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %1 = arith.addf %in, %in : f32
      linalg.yield %1, %1 : f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>)
    return %0#0, %0#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
module {
  func.func @drop_dead_results_with_different_tensors(%arg0: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf32>
    %1:4 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg0, %arg0, %0, %0 : tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_2: f32, %out_3: f32, %out_4: f32):
      linalg.yield %in, %in, %out_3, %out_4 : f32, f32, f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return %1#0, %1#1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
module {
  func.func @drop_dead_results_with_unused_cycles(%arg0: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf32>
    %1:4 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg0, %arg0, %0, %0 : tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_2: f32, %out_3: f32, %out_4: f32):
      %2 = arith.addf %in, %in : f32
      %3 = arith.addf %in, %out_3 : f32
      %4 = arith.addf %in, %out_4 : f32
      linalg.yield %2, %2, %3, %4 : f32, f32, f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return %1#0, %1#1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
module {
  func.func @drop_only_the_results_not_used_by_others(%arg0: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf32>
    %1:3 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg0, %0, %0 : tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_2: f32, %out_3: f32):
      linalg.yield %out_2, %out, %out_3 : f32, f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return %1#0 : tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
module {
  func.func @drop_only_the_cycles_not_used_by_others(%arg0: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf32>
    %1:3 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg0, %0, %0 : tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_2: f32, %out_3: f32):
      %2 = arith.addf %out, %out_2 : f32
      %3 = arith.addf %out, %out_3 : f32
      linalg.yield %2, %out, %3 : f32, f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    return %1#0 : tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @remove_unnecessary_input(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

