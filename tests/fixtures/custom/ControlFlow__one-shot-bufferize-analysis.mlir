module {
  func.func @single_branch(%arg0: tensor<5xf32>) -> tensor<5xf32> {
    cf.br ^bb1(%arg0 : tensor<5xf32>)
  ^bb1(%0: tensor<5xf32>):  // pred: ^bb0
    return %0 : tensor<5xf32>
  }
}

// -----
module {
  func.func @diamond_branch(%arg0: i1, %arg1: tensor<5xf32>, %arg2: tensor<5xf32>) -> tensor<5xf32> {
    cf.cond_br %arg0, ^bb2(%arg1 : tensor<5xf32>), ^bb3(%arg2 : tensor<5xf32>)
  ^bb1(%0: tensor<5xf32>):  // 2 preds: ^bb2, ^bb3
    return %0 : tensor<5xf32>
  ^bb2(%1: tensor<5xf32>):  // pred: ^bb0
    cf.br ^bb1(%1 : tensor<5xf32>)
  ^bb3(%2: tensor<5xf32>):  // pred: ^bb0
    cf.br ^bb1(%2 : tensor<5xf32>)
  }
}

// -----
module {
  func.func @looping_branches() -> tensor<5xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    cf.br ^bb1(%0 : tensor<5xf32>)
  ^bb1(%1: tensor<5xf32>):  // 2 preds: ^bb0, ^bb1
    %2 = "test.foo"() : () -> index
    %3 = "test.bar"() : () -> f32
    %inserted = tensor.insert %3 into %1[%2] : tensor<5xf32>
    %4 = "test.qux"() : () -> i1
    cf.cond_br %4, ^bb1(%inserted : tensor<5xf32>), ^bb2(%inserted : tensor<5xf32>)
  ^bb2(%5: tensor<5xf32>):  // pred: ^bb1
    return %5 : tensor<5xf32>
  }
}

// -----
module {
  func.func @looping_branches_with_conflict(%arg0: f32) -> tensor<5xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    cf.br ^bb2(%1 : tensor<5xf32>)
  ^bb1(%2: tensor<5xf32>):  // pred: ^bb2
    %3 = "test.foo"() : () -> index
    %extracted = tensor.extract %1[%3] : tensor<5xf32>
    return %2 : tensor<5xf32>
  ^bb2(%4: tensor<5xf32>):  // 2 preds: ^bb0, ^bb2
    %5 = "test.foo"() : () -> index
    %6 = "test.bar"() : () -> f32
    %inserted = tensor.insert %6 into %4[%5] : tensor<5xf32>
    %7 = "test.qux"() : () -> i1
    cf.cond_br %7, ^bb2(%inserted : tensor<5xf32>), ^bb1(%inserted : tensor<5xf32>)
  }
}

// -----
module {
  func.func @looping_branches_outside_def(%arg0: f32) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %2 = "test.foo"() : () -> index
    %3 = "test.bar"() : () -> f32
    %inserted = tensor.insert %3 into %1[%2] : tensor<5xf32>
    %4 = "test.foo"() : () -> index
    %extracted = tensor.extract %inserted[%4] : tensor<5xf32>
    %5 = "test.qux"(%extracted) : (f32) -> i1
    cf.cond_br %5, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @looping_branches_outside_def2(%arg0: f32) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    cf.br ^bb1(%1 : tensor<5xf32>)
  ^bb1(%2: tensor<5xf32>):  // 2 preds: ^bb0, ^bb1
    %3 = "test.foo"() : () -> index
    %4 = "test.bar"() : () -> f32
    %inserted = tensor.insert %4 into %2[%3] : tensor<5xf32>
    %5 = "test.foo"() : () -> index
    %extracted = tensor.extract %inserted[%5] : tensor<5xf32>
    %6 = "test.qux"(%extracted) : (f32) -> i1
    cf.cond_br %6, ^bb1(%2 : tensor<5xf32>), ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @looping_branches_outside_def3(%arg0: f32) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    cf.br ^bb1(%1 : tensor<5xf32>)
  ^bb1(%2: tensor<5xf32>):  // 2 preds: ^bb0, ^bb1
    %3 = "test.foo"() : () -> index
    %4 = "test.bar"() : () -> f32
    %inserted = tensor.insert %4 into %2[%3] : tensor<5xf32>
    %5 = "test.foo"() : () -> index
    %extracted = tensor.extract %inserted[%5] : tensor<5xf32>
    %6 = "test.qux"(%extracted) : (f32) -> i1
    cf.cond_br %6, ^bb1(%1 : tensor<5xf32>), ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @looping_branches_sequence_outside_def(%arg0: f32) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %2 = "test.foo"() : () -> index
    %3 = "test.bar"() : () -> f32
    %inserted = tensor.insert %3 into %1[%2] : tensor<5xf32>
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    %4 = "test.foo"() : () -> index
    %extracted = tensor.extract %inserted[%4] : tensor<5xf32>
    %5 = "test.qux"(%extracted) : (f32) -> i1
    cf.cond_br %5, ^bb1, ^bb3
  ^bb3:  // pred: ^bb2
    return
  }
}

// -----
module {
  func.func @looping_branches_sequence_inside_def(%arg0: f32) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    %2 = "test.foo"() : () -> index
    %3 = "test.bar"() : () -> f32
    %inserted = tensor.insert %3 into %1[%2] : tensor<5xf32>
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    %4 = "test.foo"() : () -> index
    %extracted = tensor.extract %inserted[%4] : tensor<5xf32>
    %5 = "test.qux"(%extracted) : (f32) -> i1
    cf.cond_br %5, ^bb1, ^bb3
  ^bb3:  // pred: ^bb2
    return
  }
}

