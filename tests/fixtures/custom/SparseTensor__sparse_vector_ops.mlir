#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
module {
  func.func @vops(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32, #sparse>) -> tensor<1024xf32> {
    %0 = tensor.empty() : tensor<1024xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %c255_i64 = arith.constant 255 : i64
    %c4_i32 = arith.constant 4 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = linalg.generic {doc = "x(i) = a(i) ops b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>) outs(%0 : tensor<1024xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %2 = math.absf %in : f32
      %3 = math.ceil %2 : f32
      %4 = math.floor %3 : f32
      %5 = math.sqrt %4 : f32
      %6 = math.expm1 %5 : f32
      %7 = math.sin %6 : f32
      %8 = math.tanh %7 : f32
      %9 = arith.negf %8 : f32
      %10 = arith.mulf %9, %in_1 : f32
      %11 = arith.divf %10, %cst_0 : f32
      %12 = arith.addf %11, %cst_0 : f32
      %13 = arith.subf %12, %cst : f32
      %14 = arith.extf %13 : f32 to f64
      %15 = arith.bitcast %14 : f64 to i64
      %16 = arith.addi %15, %15 : i64
      %17 = arith.andi %16, %c255_i64 : i64
      %18 = arith.trunci %17 : i64 to i16
      %19 = arith.extsi %18 : i16 to i32
      %20 = arith.shrsi %19, %c4_i32 : i32
      %21 = arith.shrui %20, %c4_i32 : i32
      %22 = arith.shli %21, %c1_i32 : i32
      %23 = arith.uitofp %22 : i32 to f32
      linalg.yield %23 : f32
    } -> tensor<1024xf32>
    return %1 : tensor<1024xf32>
  }
}

