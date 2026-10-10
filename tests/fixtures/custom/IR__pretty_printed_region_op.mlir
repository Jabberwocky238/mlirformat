module {
}

// -----
module {
  func.func @pretty_printed_region_op(%arg0: f32, %arg1: f32) -> f32 {
    %0 = test.pretty_printed_region %arg1, %arg0 start test.special.op end : (f32, f32) -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @pretty_printed_region_op(%arg0: f32, %arg1: f32) -> f32 {
    %0 = test.pretty_printed_region %arg1, %arg0 ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "test.non.special.op"(%arg2, %arg3) : (f32, f32) -> f32
      "test.return"(%1) : (f32) -> ()
    }) : (f32, f32) -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @pretty_printed_region_op_deferred_loc(%arg0: f32, %arg1: f32) -> f32 {
    %0 = test.pretty_printed_region %arg1, %arg0 start test.special.op end : (f32, f32) -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @block_names(%arg0: i1) {
    test.block_names {
      cf.br ^foo1
    ^foo1:  // pred: ^foo0
      cf.br ^foo2
    ^foo2:  // pred: ^foo1
      "test.return"() : () -> ()
    }
    return
  }
}

