module {
  func.func @br(%arg0: tensor<5xf32>) {
    %0 = scf.execute_region -> tensor<5xf32> {
      cf.br ^bb1(%arg0 : tensor<5xf32>)
    ^bb1(%1: tensor<5xf32>):  // pred: ^bb0
      scf.yield %1 : tensor<5xf32>
    }
    return
  }
}

// -----
module {
  func.func @cond_br(%arg0: tensor<5xf32>, %arg1: i1) {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
    %1 = scf.execute_region -> tensor<5xf32> {
      cf.cond_br %arg1, ^bb1(%arg0 : tensor<5xf32>), ^bb2(%0 : tensor<5xf32>)
    ^bb1(%2: tensor<5xf32>):  // 2 preds: ^bb0, ^bb2
      scf.yield %2 : tensor<5xf32>
    ^bb2(%3: tensor<5xf32>):  // pred: ^bb0
      cf.br ^bb1(%3 : tensor<5xf32>)
    }
    return
  }
}

// -----
module {
  func.func @looping_branches() -> tensor<5xf32> {
    %0 = bufferization.alloc_tensor() : tensor<5xf32>
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

