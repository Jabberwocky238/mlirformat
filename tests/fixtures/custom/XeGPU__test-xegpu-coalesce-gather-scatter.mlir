module {
}

// -----
module {
  gpu.module @kernel [#xevm.target<chip = "pvc">] {
    gpu.func @load_step(%arg0: i64) -> vector<32xf32> {
      %0 = vector.step : vector<32xindex>
      %cst = arith.constant dense<true> : vector<32xi1>
      %1 = xegpu.load %arg0[%0], %cst  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      gpu.return %1 : vector<32xf32>
    }
  }
}

// -----
module {
  gpu.module @kernel_store [#xevm.target<chip = "pvc">] {
    gpu.func @store_step(%arg0: i64, %arg1: vector<32xf32>) {
      %0 = vector.step : vector<32xindex>
      %cst = arith.constant dense<true> : vector<32xi1>
      xegpu.store %arg1, %arg0[%0], %cst  : vector<32xf32>, i64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel_stride4 [#xevm.target<chip = "pvc">] {
    gpu.func @load_stride4_unchanged(%arg0: i64) -> vector<32xf32> {
      %c4 = arith.constant 4 : index
      %0 = vector.step : vector<32xindex>
      %1 = vector.broadcast %c4 : index to vector<32xindex>
      %2 = arith.muli %0, %1 : vector<32xindex>
      %cst = arith.constant dense<true> : vector<32xi1>
      %3 = xegpu.load %arg0[%2], %cst  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      gpu.return %3 : vector<32xf32>
    }
  }
}

// -----
module {
  gpu.module @kernel_2d [#xevm.target<chip = "pvc">] {
    gpu.func @load_2d_leading_unit(%arg0: i64) -> vector<1x32xf32> {
      %0 = vector.step : vector<32xindex>
      %1 = vector.shape_cast %0 : vector<32xindex> to vector<1x32xindex>
      %cst = arith.constant dense<true> : vector<1x32xi1>
      %2 = xegpu.load %arg0[%1], %cst  : i64, vector<1x32xindex>, vector<1x32xi1> -> vector<1x32xf32>
      gpu.return %2 : vector<1x32xf32>
    }
  }
}

// -----
module {
  gpu.module @kernel_chunk4 [#xevm.target<chip = "pvc">] {
    gpu.func @load_step_chunk4(%arg0: i64) -> vector<32xf32> {
      %0 = vector.step : vector<32xindex>
      %cst = arith.constant dense<true> : vector<32xi1>
      %1 = xegpu.load %arg0[%0], %cst  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      gpu.return %1 : vector<32xf32>
    }
  }
}

// -----
module {
  func.func @load_no_target_unchanged(%arg0: i64) -> vector<32xf32> {
    %0 = vector.step : vector<32xindex>
    %cst = arith.constant dense<true> : vector<32xi1>
    %1 = xegpu.load %arg0[%0], %cst  : i64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
    return %1 : vector<32xf32>
  }
}

