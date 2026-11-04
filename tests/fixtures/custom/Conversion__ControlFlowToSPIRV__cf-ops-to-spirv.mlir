module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @simple_loop(%arg0: i32, %arg1: i32, %arg2: i32) {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%arg0 : i32)
  ^bb2(%0: i32):  // 2 preds: ^bb1, ^bb3
    %1 = arith.cmpi slt, %0, %arg1 : i32
    cf.cond_br %1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %2 = arith.addi %0, %arg2 : i32
    cf.br ^bb2(%2 : i32)
  ^bb4:  // pred: ^bb2
    return
  }
}

// -----
module {
  func.func @main_graph(%arg0: index) {
    %c1 = arith.constant 1 : index
    cf.br ^bb1(%arg0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
    %1 = arith.cmpi slt, %0, %c1 : index
    cf.cond_br %1, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    cf.br ^bb1(%c1 : index)
  ^bb3:  // pred: ^bb1
    return
  }
}

