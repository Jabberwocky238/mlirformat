module {
  func.func @cf_br_block_arg_narrow_type(%arg0: memref<8xi4>) -> memref<8xi4> {
    cf.br ^bb1(%arg0 : memref<8xi4>)
  ^bb1(%0: memref<8xi4>):  // pred: ^bb0
    return %0 : memref<8xi4>
  }
}

// -----
module {
  func.func @cf_cond_br_block_arg_narrow_type(%arg0: i1, %arg1: memref<8xi4>, %arg2: memref<8xi4>) -> memref<8xi4> {
    cf.cond_br %arg0, ^bb1(%arg1 : memref<8xi4>), ^bb2(%arg2 : memref<8xi4>)
  ^bb1(%0: memref<8xi4>):  // pred: ^bb0
    return %0 : memref<8xi4>
  ^bb2(%1: memref<8xi4>):  // pred: ^bb0
    return %1 : memref<8xi4>
  }
}

// -----
module {
  func.func @cf_switch_block_arg_narrow_type(%arg0: i32, %arg1: memref<8xi4>) -> memref<8xi4> {
    cf.switch %arg0 : i32, [
      default: ^bb1(%arg1 : memref<8xi4>),
      0: ^bb2(%arg1 : memref<8xi4>),
      1: ^bb3(%arg1 : memref<8xi4>)
    ]
  ^bb1(%0: memref<8xi4>):  // pred: ^bb0
    return %0 : memref<8xi4>
  ^bb2(%1: memref<8xi4>):  // pred: ^bb0
    return %1 : memref<8xi4>
  ^bb3(%2: memref<8xi4>):  // pred: ^bb0
    return %2 : memref<8xi4>
  }
}

