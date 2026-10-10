#map = affine_map<() -> ()>
module {
  func.func @main(%arg0: tensor<i32>, %arg1: tensor<i32>) -> tensor<i32> {
    cf.br ^bb1(%arg0 : tensor<i32>)
  ^bb1(%0: tensor<i32>):  // 2 preds: ^bb0, ^bb2
    %1 = tensor.empty() : tensor<i1>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%0, %arg1 : tensor<i32>, tensor<i32>) outs(%1 : tensor<i1>) {
    ^bb0(%in: i32, %in_0: i32, %out: i1):
      %7 = arith.cmpi slt, %in, %in_0 : i32
      linalg.yield %7 : i1
    } -> tensor<i1>
    %extracted = tensor.extract %2[] : tensor<i1>
    cf.cond_br %extracted, ^bb2(%0 : tensor<i32>), ^bb3(%0 : tensor<i32>)
  ^bb2(%3: tensor<i32>):  // pred: ^bb1
    %4 = tensor.empty() : tensor<i32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%3, %3 : tensor<i32>, tensor<i32>) outs(%4 : tensor<i32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %7 = arith.addi %in, %in_0 : i32
      linalg.yield %7 : i32
    } -> tensor<i32>
    cf.br ^bb1(%5 : tensor<i32>)
  ^bb3(%6: tensor<i32>):  // pred: ^bb1
    return %6 : tensor<i32>
  }
}

