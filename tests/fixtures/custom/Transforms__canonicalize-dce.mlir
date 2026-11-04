module {
  func.func @f(%arg0: f32) {
    %0 = arith.addf %arg0, %arg0 : f32
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32) {
    "test.br"(%arg0)[^bb1] : (f32) -> ()
  ^bb1(%0: f32):  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32) {
    cf.br ^bb1(%arg0 : f32)
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    cf.br ^bb1(%0 : f32)
  }
}

// -----
module {
  func.func @f(%arg0: f32) {
    cf.br ^bb1(%arg0 : f32)
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    %1 = math.exp %0 : f32
    cf.br ^bb1(%1 : f32)
  }
}

// -----
module {
  func.func @f(%arg0: f32, %arg1: i1) {
    %0 = math.exp %arg0 : f32
    cf.cond_br %arg1, ^bb1(%0 : f32), ^bb2(%0 : f32)
  ^bb1(%1: f32):  // pred: ^bb0
    return
  ^bb2(%2: f32):  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32) {
    "test.region"() ({
      %0 = arith.addf %arg0, %arg0 : f32
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32) -> f32 {
    %0 = arith.addf %arg0, %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @f(%arg0: f32) {
    "foo.print"(%arg0) : (f32) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: f32) {
    %0 = math.exp %arg0 : f32
    "foo.has_region"() ({
      %1 = math.exp %0 : f32
      "foo.return"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: tensor<1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<3xf32>, %arg3: tensor<4xf32>, %arg4: tensor<5xf32>) {
    "test.br"(%arg0, %arg1, %arg2, %arg3, %arg4)[^bb1] : (tensor<1xf32>, tensor<2xf32>, tensor<3xf32>, tensor<4xf32>, tensor<5xf32>) -> ()
  ^bb1(%0: tensor<1xf32>, %1: tensor<2xf32>, %2: tensor<3xf32>, %3: tensor<4xf32>, %4: tensor<5xf32>):  // pred: ^bb0
    "foo.print"(%1) : (tensor<2xf32>) -> ()
    "foo.print"(%3) : (tensor<4xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    test.graph_region {
      %0 = math.exp %1 : f32
      %1 = math.exp %0 : f32
      "test.terminator"() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = "test.test_effects_result"() : () -> i32
    return
  }
}

