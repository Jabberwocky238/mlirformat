module {
}

// -----
module {
  func.func @load_step_offsets(%arg0: i64) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<true> : vector<32xi1>
    %1 = xegpu.load %arg0[%0], %cst  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %1 : vector<32xf32>
  }
}

// -----
module {
  func.func @load_dense_ap_offsets(%arg0: i64) -> vector<32xi32> {
    %cst = arith.constant dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]> : vector<32xindex>
    %cst_0 = arith.constant dense<true> : vector<32xi1>
    %0 = xegpu.load %arg0[%cst], %cst_0  : i64, vector<32xindex>, vector<32xi1> -> vector<32xi32>
    return %0 : vector<32xi32>
  }
}

// -----
module {
  func.func @load_stride4_no_attr(%arg0: i64) -> vector<32xf32> {
    %c4 = arith.constant 4 : index
    %0 = vector.step : vector<32xindex>
    %1 = vector.broadcast %c4 : index to vector<32xindex>
    %2 = arith.muli %0, %1 : vector<32xindex>
    %cst = arith.constant dense<true> : vector<32xi1>
    %3 = xegpu.load %arg0[%2], %cst  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %3 : vector<32xf32>
  }
}

// -----
module {
  func.func @load_broadcast_offsets_no_attr(%arg0: i64) -> vector<32xf32> {
    %cst = arith.constant dense<0> : vector<32xindex>
    %cst_0 = arith.constant dense<true> : vector<32xi1>
    %0 = xegpu.load %arg0[%cst], %cst_0  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %0 : vector<32xf32>
  }
}

// -----
module {
  func.func @load_partial_mask(%arg0: i64, %arg1: vector<32xi1>) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %1 = xegpu.load %arg0[%0], %arg1  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %1 : vector<32xf32>
  }
}

// -----
module {
  func.func @store_step_offsets(%arg0: i64, %arg1: vector<32xf32>) {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<true> : vector<32xi1>
    xegpu.store %arg1, %arg0[%0], %cst  : vector<32xf32>, i64, vector<32xindex>, vector<32xi1>
    return
  }
}

// -----
module {
  func.func @load_2d_leading_unit(%arg0: i64) -> vector<1x32xf32> {
    %0 = vector.step : vector<32xindex>
    %1 = vector.shape_cast %0 : vector<32xindex> to vector<1x32xindex>
    %cst = arith.constant dense<true> : vector<1x32xi1>
    %2 = xegpu.load %arg0[%1], %cst  : i64, vector<1x32xindex>, vector<1x32xi1> -> vector<1x32xf32>
    return %2 : vector<1x32xf32>
  }
}

// -----
module {
  func.func @load_2d_dense_ap(%arg0: i64) -> vector<2x16xf32> {
    %cst = arith.constant dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]]> : vector<2x16xindex>
    %cst_0 = arith.constant dense<true> : vector<2x16xi1>
    %0 = xegpu.load %arg0[%cst], %cst_0  : i64, vector<2x16xindex>, vector<2x16xi1> -> vector<2x16xf32>
    return %0 : vector<2x16xf32>
  }
}

// -----
module {
  func.func @load_2d_non_ap(%arg0: i64) -> vector<2x16xf32> {
    %cst = arith.constant dense<[[0, 1, 2, 3, 4, 5, 6, 7, 100, 9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]]> : vector<2x16xindex>
    %cst_0 = arith.constant dense<true> : vector<2x16xi1>
    %0 = xegpu.load %arg0[%cst], %cst_0  : i64, vector<2x16xindex>, vector<2x16xi1> -> vector<2x16xf32>
    return %0 : vector<2x16xf32>
  }
}

// -----
module {
  func.func @load_divui_recovers(%arg0: i64) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<2> : vector<32xindex>
    %1 = arith.muli %0, %cst : vector<32xindex>
    %2 = arith.divui %1, %cst : vector<32xindex>
    %cst_0 = arith.constant dense<true> : vector<32xi1>
    %3 = xegpu.load %arg0[%2], %cst_0  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %3 : vector<32xf32>
  }
}

// -----
module {
  func.func @load_divui_non_divisor(%arg0: i64) -> vector<16xf32> {
    %0 = vector.step : vector<16xindex>
    %cst = arith.constant dense<2> : vector<16xindex>
    %1 = arith.muli %0, %cst : vector<16xindex>
    %cst_0 = arith.constant dense<3> : vector<16xindex>
    %2 = arith.divui %1, %cst_0 : vector<16xindex>
    %cst_1 = arith.constant dense<true> : vector<16xi1>
    %3 = xegpu.load %arg0[%2], %cst_1  : i64, vector<16xindex>, vector<16xi1> -> vector<16xf32>
    return %3 : vector<16xf32>
  }
}

// -----
module {
  func.func @load_remui_inner_uniform(%arg0: i64) -> vector<16xf32> {
    %0 = vector.step : vector<16xindex>
    %cst = arith.constant dense<2> : vector<16xindex>
    %1 = arith.muli %0, %cst : vector<16xindex>
    %2 = arith.remui %1, %cst : vector<16xindex>
    %cst_0 = arith.constant dense<true> : vector<16xi1>
    %3 = xegpu.load %arg0[%2], %cst_0  : i64, vector<16xindex>, vector<16xi1> -> vector<16xf32>
    return %3 : vector<16xf32>
  }
}

// -----
module {
  func.func @load_shli_then_shrui(%arg0: i64) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<1> : vector<32xindex>
    %1 = arith.shli %0, %cst : vector<32xindex>
    %2 = arith.shrui %1, %cst : vector<32xindex>
    %cst_0 = arith.constant dense<true> : vector<32xi1>
    %3 = xegpu.load %arg0[%2], %cst_0  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %3 : vector<32xf32>
  }
}

// -----
module {
  func.func @load_shli_unchanged(%arg0: i64) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<1> : vector<32xindex>
    %1 = arith.shli %0, %cst : vector<32xindex>
    %cst_0 = arith.constant dense<true> : vector<32xi1>
    %2 = xegpu.load %arg0[%1], %cst_0  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %2 : vector<32xf32>
  }
}

// -----
module {
  func.func @load_select_two_aps(%arg0: i64, %arg1: i1) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<0> : vector<32xindex>
    %cst_0 = arith.constant dense<64> : vector<32xindex>
    %1 = arith.addi %0, %cst : vector<32xindex>
    %2 = arith.addi %0, %cst_0 : vector<32xindex>
    %3 = arith.select %arg1, %1, %2 : vector<32xindex>
    %cst_1 = arith.constant dense<true> : vector<32xi1>
    %4 = xegpu.load %arg0[%3], %cst_1  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %4 : vector<32xf32>
  }
}

// -----
module {
  func.func @user_attr_preserved(%arg0: i64) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<true> : vector<32xi1>
    %1 = xegpu.load %arg0[%0], %cst <{contiguity = 2 : i64}> : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %1 : vector<32xf32>
  }
}

