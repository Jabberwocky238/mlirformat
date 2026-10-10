#map = affine_map<() -> ()>
module {
  func.func @if_true_test(%arg0: i1, %arg1: i32) -> tensor<i32> {
    %from_elements = tensor.from_elements %arg0 : tensor<i1>
    %from_elements_0 = tensor.from_elements %arg1 : tensor<i32>
    %cst = arith.constant dense<10> : tensor<i32>
    %0 = tensor.empty() : tensor<i8>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%from_elements : tensor<i1>) outs(%0 : tensor<i8>) {
    ^bb0(%in: i1, %out: i8):
      %6 = arith.extui %in : i1 to i8
      linalg.yield %6 : i8
    } -> tensor<i8>
    %extracted = tensor.extract %1[] : tensor<i8>
    %2 = arith.trunci %extracted : i8 to i1
    cf.cond_br %2, ^bb1, ^bb2(%from_elements_0 : tensor<i32>)
  ^bb1:  // pred: ^bb0
    %3 = tensor.empty() : tensor<i32>
    %4 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%from_elements_0, %cst : tensor<i32>, tensor<i32>) outs(%3 : tensor<i32>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %6 = arith.addi %in, %in_1 : i32
      linalg.yield %6 : i32
    } -> tensor<i32>
    cf.br ^bb2(%4 : tensor<i32>)
  ^bb2(%5: tensor<i32>):  // 2 preds: ^bb0, ^bb1
    return %5 : tensor<i32>
  }
}

