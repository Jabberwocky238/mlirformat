module {
  func.func @extract(%arg0: tensor<1xf32>, %arg1: index) {
    %extracted = tensor.extract %arg0[%arg1] : tensor<1xf32>
    return
  }
  func.func @extract_dynamic(%arg0: tensor<?xf32>, %arg1: index) {
    %extracted = tensor.extract %arg0[%arg1] : tensor<?xf32>
    return
  }
  func.func @extract_nd_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %extracted = tensor.extract %arg0[%arg1, %arg2, %arg3] : tensor<?x?x?xf32>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %c2 = arith.constant 2 : index
    %0 = tensor.empty() : tensor<1xf32>
    %1 = tensor.empty(%c1) : tensor<?xf32>
    %2 = tensor.empty(%c2, %c2, %c2) : tensor<?x?x?xf32>
    call @extract(%0, %c1) : (tensor<1xf32>, index) -> ()
    call @extract_dynamic(%1, %c1) : (tensor<?xf32>, index) -> ()
    call @extract_nd_dynamic(%2, %c1, %c-1, %c0) : (tensor<?x?x?xf32>, index, index, index) -> ()
    call @extract(%0, %c0) : (tensor<1xf32>, index) -> ()
    call @extract_dynamic(%1, %c0) : (tensor<?xf32>, index) -> ()
    call @extract_nd_dynamic(%2, %c1, %c1, %c0) : (tensor<?x?x?xf32>, index, index, index) -> ()
    return
  }
}

