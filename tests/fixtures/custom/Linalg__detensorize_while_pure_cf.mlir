#map = affine_map<() -> ()>
module {
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %from_elements = tensor.from_elements %c0_i32 : tensor<1xi32>
    %collapsed = tensor.collapse_shape %from_elements [] : tensor<1xi32> into tensor<i32>
    %c10_i32 = arith.constant 10 : i32
    %from_elements_0 = tensor.from_elements %c10_i32 : tensor<1xi32>
    %collapsed_1 = tensor.collapse_shape %from_elements_0 [] : tensor<1xi32> into tensor<i32>
    cf.br ^bb1(%collapsed : tensor<i32>)
  ^bb1(%0: tensor<i32>):  // 2 preds: ^bb0, ^bb2
    %1 = tensor.empty() : tensor<i1>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%0, %collapsed_1 : tensor<i32>, tensor<i32>) outs(%1 : tensor<i1>) {
    ^bb0(%in: i32, %in_2: i32, %out: i1):
      %6 = arith.cmpi slt, %in, %in_2 : i32
      linalg.yield %6 : i1
    } -> tensor<i1>
    %extracted = tensor.extract %2[] : tensor<i1>
    cf.cond_br %extracted, ^bb2(%0 : tensor<i32>), ^bb3
  ^bb2(%3: tensor<i32>):  // pred: ^bb1
    %4 = tensor.empty() : tensor<i32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%3, %3 : tensor<i32>, tensor<i32>) outs(%4 : tensor<i32>) {
    ^bb0(%in: i32, %in_2: i32, %out: i32):
      %6 = arith.addi %in, %in_2 : i32
      linalg.yield %6 : i32
    } -> tensor<i32>
    cf.br ^bb1(%5 : tensor<i32>)
  ^bb3:  // pred: ^bb1
    return
  }
}

