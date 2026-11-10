#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @unary_ops(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.exp %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%0 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.log %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%1 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.absf %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%2 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.ceil %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%3 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.floor %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%4 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = arith.negf %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %6 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%5 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = arith.divf %cst, %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %7 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%6 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.round %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%7 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.sqrt %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %9 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%8 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.rsqrt %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %10 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%9 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = arith.mulf %in, %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %11 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%10 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.tanh %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %12 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%11 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.erf %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %13 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%12 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.sin %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %14 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%13 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.cos %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %15 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%14 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.tan %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %16 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%15 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.acos %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %17 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%16 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.acosh %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %18 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%17 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.asin %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %19 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%18 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.asinh %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %20 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%19 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.atan %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %21 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%20 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.atanh %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %22 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%21 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.log10 %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %23 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%22 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.log1p %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    %24 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%23 : tensor<?x?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %25 = math.log2 %in : f32
      linalg.yield %25 : f32
    } -> tensor<?x?x?xf32>
    return %24 : tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @unary_ops_non_identity(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = math.exp %in : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_int(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.addi %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.subi %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.muli %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.divsi %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %4 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%3, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.divui %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%4, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.maxsi %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    %6 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%5, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.minsi %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
    return %6 : tensor<?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_float(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = arith.addf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = arith.subf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = arith.mulf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = arith.divf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%3, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = arith.maximumf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%4, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = arith.minimumf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    %6 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%5, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %7 = math.powf %in, %in_0 : f32
      linalg.yield %7 : f32
    } -> tensor<?x?xf32>
    return %6 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_complex(%arg0: tensor<?x?xcomplex<f32>>, %arg1: tensor<?x?xcomplex<f32>>, %arg2: tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) {
    ^bb0(%in: complex<f32>, %in_0: complex<f32>, %out: complex<f32>):
      %4 = complex.add %in, %in_0 : complex<f32>
      linalg.yield %4 : complex<f32>
    } -> tensor<?x?xcomplex<f32>>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) {
    ^bb0(%in: complex<f32>, %in_0: complex<f32>, %out: complex<f32>):
      %4 = complex.sub %in, %in_0 : complex<f32>
      linalg.yield %4 : complex<f32>
    } -> tensor<?x?xcomplex<f32>>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) {
    ^bb0(%in: complex<f32>, %in_0: complex<f32>, %out: complex<f32>):
      %4 = complex.mul %in, %in_0 : complex<f32>
      linalg.yield %4 : complex<f32>
    } -> tensor<?x?xcomplex<f32>>
    %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) {
    ^bb0(%in: complex<f32>, %in_0: complex<f32>, %out: complex<f32>):
      %4 = complex.div %in, %in_0 : complex<f32>
      linalg.yield %4 : complex<f32>
    } -> tensor<?x?xcomplex<f32>>
    return %3 : tensor<?x?xcomplex<f32>>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_bool(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?xi1>) -> tensor<?x?xi1> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?xi1>) {
    ^bb0(%in: i1, %in_0: i1, %out: i1):
      %2 = arith.ori %in, %in_0 : i1
      linalg.yield %2 : i1
    } -> tensor<?x?xi1>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %arg1 : tensor<?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?xi1>) {
    ^bb0(%in: i1, %in_0: i1, %out: i1):
      %2 = arith.andi %in, %in_0 : i1
      linalg.yield %2 : i1
    } -> tensor<?x?xi1>
    return %1 : tensor<?x?xi1>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_uint(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %2 = arith.maxui %in, %in_0 : i32
      linalg.yield %2 : i32
    } -> tensor<?x?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %2 = arith.minui %in, %in_0 : i32
      linalg.yield %2 : i32
    } -> tensor<?x?xi32>
    return %1 : tensor<?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_ops_non_identity(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @binary_ops_swapped(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in_0, %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%0, %arg2 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg3 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.subf %in_0, %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @unary_op_with_scalar(%arg0: tensor<?xi32>, %arg1: tensor<?xi32>) -> tensor<?xi32> {
    %c123_i32 = arith.constant 123 : i32
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xi32>) outs(%arg1 : tensor<?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.addi %c123_i32, %in : i32
      linalg.yield %1 : i32
    } -> tensor<?xi32>
    return %0 : tensor<?xi32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @negative_unary_op_using_block_arg_twice(%arg0: tensor<?xi32>, %arg1: tensor<?xi32>) -> tensor<?xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xi32>) outs(%arg1 : tensor<?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.addi %in, %in : i32
      linalg.yield %1 : i32
    } -> tensor<?xi32>
    return %0 : tensor<?xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @op_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @op_matmul_unsigned_cast(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi32>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi32>) outs(%arg2 : tensor<16x32xi32>) {
    ^bb0(%in: i16, %in_0: i32, %out: i32):
      %1 = arith.extui %in : i16 to i32
      %2 = arith.muli %1, %in_0 : i32
      %3 = arith.addi %out, %2 : i32
      linalg.yield %3 : i32
    } -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
  func.func @op_matmul_unsigned_cast_and_truncate(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xi32>) {
    ^bb0(%in: i16, %in_0: i64, %out: i32):
      %1 = arith.extui %in : i16 to i32
      %2 = arith.trunci %in_0 : i64 to i32
      %3 = arith.muli %1, %2 : i32
      %4 = arith.addi %out, %3 : i32
      linalg.yield %4 : i32
    } -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
  func.func @op_matmul_signed_cast(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi16>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi16>) outs(%arg2 : tensor<16x32xi32>) {
    ^bb0(%in: i16, %in_0: i16, %out: i32):
      %1 = arith.extsi %in : i16 to i32
      %2 = arith.extsi %in_0 : i16 to i32
      %3 = arith.muli %1, %2 : i32
      %4 = arith.addi %out, %3 : i32
      linalg.yield %4 : i32
    } -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
  func.func @negative_op_matmul_mixed_cast(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi16>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi16>) outs(%arg2 : tensor<16x32xi32>) {
    ^bb0(%in: i16, %in_0: i16, %out: i32):
      %1 = arith.extui %in : i16 to i32
      %2 = arith.extsi %in_0 : i16 to i32
      %3 = arith.muli %1, %2 : i32
      %4 = arith.addi %out, %3 : i32
      linalg.yield %4 : i32
    } -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
  func.func @negative_op_matmul_output_cast(%arg0: tensor<16x8xi32>, %arg1: tensor<8x32xi32>, %arg2: tensor<16x32xi64>) -> tensor<16x32xi64> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi32>, tensor<8x32xi32>) outs(%arg2 : tensor<16x32xi64>) {
    ^bb0(%in: i32, %in_0: i32, %out: i64):
      %1 = arith.trunci %out : i64 to i32
      %2 = arith.muli %in, %in_0 : i32
      %3 = arith.addi %1, %2 : i32
      %4 = arith.extsi %3 : i32 to i64
      linalg.yield %4 : i64
    } -> tensor<16x32xi64>
    return %0 : tensor<16x32xi64>
  }
  func.func @op_matmul_bitcast_int_to_float(%arg0: tensor<16x8xi32>, %arg1: tensor<8x32xi32>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi32>, tensor<8x32xi32>) outs(%arg2 : tensor<16x32xf32>) {
    ^bb0(%in: i32, %in_0: i32, %out: f32):
      %1 = arith.bitcast %in : i32 to f32
      %2 = arith.bitcast %in_0 : i32 to f32
      %3 = arith.mulf %1, %2 : f32
      %4 = arith.addf %out, %3 : f32
      linalg.yield %4 : f32
    } -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
  func.func @op_matmul_signed_cast_float(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi16>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi16>) outs(%arg2 : tensor<16x32xf32>) {
    ^bb0(%in: i16, %in_0: i16, %out: f32):
      %1 = arith.sitofp %in : i16 to f32
      %2 = arith.sitofp %in_0 : i16 to f32
      %3 = arith.mulf %1, %2 : f32
      %4 = arith.addf %out, %3 : f32
      linalg.yield %4 : f32
    } -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
  func.func @op_matmul_unsigned_cast_float(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi16>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi16>) outs(%arg2 : tensor<16x32xf32>) {
    ^bb0(%in: i16, %in_0: i16, %out: f32):
      %1 = arith.uitofp %in : i16 to f32
      %2 = arith.uitofp %in_0 : i16 to f32
      %3 = arith.mulf %1, %2 : f32
      %4 = arith.addf %out, %3 : f32
      linalg.yield %4 : f32
    } -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @op_batch_matmul(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x16xf32>, %arg2: tensor<2x16x16xf32>) -> tensor<2x16x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x16x8xf32>, tensor<2x8x16xf32>) outs(%arg2 : tensor<2x16x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x16x16xf32>
    return %0 : tensor<2x16x16xf32>
  }
  func.func @op_batch_matmul_unsigned_cast(%arg0: tensor<2x16x8xi16>, %arg1: tensor<2x8x16xi64>, %arg2: tensor<2x16x16xi32>) -> tensor<2x16x16xi32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x16x8xi16>, tensor<2x8x16xi64>) outs(%arg2 : tensor<2x16x16xi32>) {
    ^bb0(%in: i16, %in_0: i64, %out: i32):
      %1 = arith.extui %in : i16 to i32
      %2 = arith.trunci %in_0 : i64 to i32
      %3 = arith.muli %1, %2 : i32
      %4 = arith.addi %out, %3 : i32
      linalg.yield %4 : i32
    } -> tensor<2x16x16xi32>
    return %0 : tensor<2x16x16xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @op_multi_reduction(%arg0: tensor<10x20x30xf32>, %arg1: tensor<30x20x40xf32>, %arg2: tensor<10x40xf32>) -> tensor<10x40xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<10x20x30xf32>, tensor<30x20x40xf32>) outs(%arg2 : tensor<10x40xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<10x40xf32>
    return %0 : tensor<10x40xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @batch_matmul_non_identity_batch(%arg0: tensor<4x2x8xf32>, %arg1: tensor<2x8x16xf32>, %arg2: tensor<2x4x16xf32>) -> tensor<2x4x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<4x2x8xf32>, tensor<2x8x16xf32>) outs(%arg2 : tensor<2x4x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x4x16xf32>
    return %0 : tensor<2x4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @op_matvec(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @op_matmul_transpose_a(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @op_matmul_transpose_b(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @op_batch_matmul_transpose_a(%arg0: tensor<2x8x4xf32>, %arg1: tensor<2x8x16xf32>, %arg2: tensor<2x4x16xf32>) -> tensor<2x4x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x8x4xf32>, tensor<2x8x16xf32>) outs(%arg2 : tensor<2x4x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x4x16xf32>
    return %0 : tensor<2x4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @op_batch_matmul_transpose_b(%arg0: tensor<2x4x8xf32>, %arg1: tensor<2x16x8xf32>, %arg2: tensor<2x4x16xf32>) -> tensor<2x4x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4x8xf32>, tensor<2x16x8xf32>) outs(%arg2 : tensor<2x4x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x4x16xf32>
    return %0 : tensor<2x4x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @op_matmul_transpose_a_and_b(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d0)>
module {
  func.func @op_matmul_transposed_output(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @op_matmul_non_canonical_loops(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
module {
  func.func @op_batch_matmul_non_canonical_loops(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x16xf32>, %arg2: tensor<2x16x16xf32>) -> tensor<2x16x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<2x16x8xf32>, tensor<2x8x16xf32>) outs(%arg2 : tensor<2x16x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x16x16xf32>
    return %0 : tensor<2x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @op_matmul_non_canonical_transpose_b(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
module {
  func.func @op_batch_matmul_non_canonical_transpose_b(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x16x8xf32>, %arg2: tensor<2x16x16xf32>) -> tensor<2x16x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<2x16x8xf32>, tensor<2x16x8xf32>) outs(%arg2 : tensor<2x16x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x16x16xf32>
    return %0 : tensor<2x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
module {
  func.func @op_matmul_fully_shuffled_loops(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @op_matmul_broadcast_a(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @op_batch_matmul_broadcast_a(%arg0: tensor<16x8xf32>, %arg1: tensor<2x8x16xf32>, %arg2: tensor<2x16x16xf32>) -> tensor<2x16x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<2x8x16xf32>) outs(%arg2 : tensor<2x16x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x16x16xf32>
    return %0 : tensor<2x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @op_batch_matmul_broadcast_b(%arg0: tensor<2x16x8xf32>, %arg1: tensor<8xf32>, %arg2: tensor<2x16x16xf32>) -> tensor<2x16x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x16x8xf32>, tensor<8xf32>) outs(%arg2 : tensor<2x16x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<2x16x16xf32>
    return %0 : tensor<2x16x16xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d2, d0, d5, d3)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d2, d1, d5, d4)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d0, d4, d3)>
#map6 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d4, d3)>
module {
  func.func @op_mmt4d(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @op_mmt4d_transpose_a(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map3, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @op_mmt4d_transpose_b(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map4, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @op_mmt4d_transpose_a_and_b(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map3, #map4, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @op_mmt4d_transpose_c(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map5], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @op_mmt4d_transpose_c_inner(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map6], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @negative_op_mmt4d(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map1, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

