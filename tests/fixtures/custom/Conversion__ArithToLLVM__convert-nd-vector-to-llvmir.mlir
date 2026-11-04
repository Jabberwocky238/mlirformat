module {
  func.func @vec_bin(%arg0: vector<2x2x2xf32>) -> vector<2x2x2xf32> {
    %0 = arith.addf %arg0, %arg0 : vector<2x2x2xf32>
    return %0 : vector<2x2x2xf32>
  }
  func.func @sexti_vector(%arg0: vector<1x2x3xi32>, %arg1: vector<1x2x3xi64>) {
    %0 = arith.extsi %arg0 : vector<1x2x3xi32> to vector<1x2x3xi64>
    return
  }
  func.func @zexti_vector(%arg0: vector<1x2x3xi32>, %arg1: vector<1x2x3xi64>) {
    %0 = arith.extui %arg0 : vector<1x2x3xi32> to vector<1x2x3xi64>
    return
  }
  func.func @sitofp_vector(%arg0: vector<1x2x3xi32>) -> vector<1x2x3xf32> {
    %0 = arith.sitofp %arg0 : vector<1x2x3xi32> to vector<1x2x3xf32>
    return %0 : vector<1x2x3xf32>
  }
  func.func @uitofp_vector(%arg0: vector<1x2x3xi32>) -> vector<1x2x3xf32> {
    %0 = arith.uitofp %arg0 : vector<1x2x3xi32> to vector<1x2x3xf32>
    return %0 : vector<1x2x3xf32>
  }
  func.func @fptosi_vector(%arg0: vector<1x2x3xf32>) -> vector<1x2x3xi32> {
    %0 = arith.fptosi %arg0 : vector<1x2x3xf32> to vector<1x2x3xi32>
    return %0 : vector<1x2x3xi32>
  }
  func.func @fptoui_vector(%arg0: vector<1x2x3xf32>) -> vector<1x2x3xi32> {
    %0 = arith.fptoui %arg0 : vector<1x2x3xf32> to vector<1x2x3xi32>
    return %0 : vector<1x2x3xi32>
  }
  func.func @fpext_vector(%arg0: vector<1x2x3xf16>) -> vector<1x2x3xf64> {
    %0 = arith.extf %arg0 : vector<1x2x3xf16> to vector<1x2x3xf64>
    return %0 : vector<1x2x3xf64>
  }
  func.func @fptrunc_vector(%arg0: vector<1x2x3xf64>) -> vector<1x2x3xf16> {
    %0 = arith.truncf %arg0 : vector<1x2x3xf64> to vector<1x2x3xf16>
    return %0 : vector<1x2x3xf16>
  }
  func.func @trunci_vector(%arg0: vector<1x2x3xi64>) -> vector<1x2x3xi16> {
    %0 = arith.trunci %arg0 : vector<1x2x3xi64> to vector<1x2x3xi16>
    return %0 : vector<1x2x3xi16>
  }
  func.func @shl_vector(%arg0: vector<1x2x3xi64>) -> vector<1x2x3xi64> {
    %cst = arith.constant dense<1> : vector<1x2x3xi64>
    %0 = arith.shli %arg0, %cst : vector<1x2x3xi64>
    return %0 : vector<1x2x3xi64>
  }
  func.func @shrs_vector(%arg0: vector<1x2x3xi64>) -> vector<1x2x3xi64> {
    %cst = arith.constant dense<1> : vector<1x2x3xi64>
    %0 = arith.shrsi %arg0, %cst : vector<1x2x3xi64>
    return %0 : vector<1x2x3xi64>
  }
  func.func @shru_vector(%arg0: vector<1x2x3xi64>) -> vector<1x2x3xi64> {
    %cst = arith.constant dense<1> : vector<1x2x3xi64>
    %0 = arith.shrui %arg0, %cst : vector<1x2x3xi64>
    return %0 : vector<1x2x3xi64>
  }
}

// -----
module {
  func.func @bitcast_2d(%arg0: vector<2x4xf32>) {
    %0 = arith.bitcast %arg0 : vector<2x4xf32> to vector<2x4xi32>
    return
  }
}

// -----
module {
  func.func @select_2d(%arg0: vector<4x3xi1>, %arg1: vector<4x3xi32>, %arg2: vector<4x3xi32>) {
    %0 = arith.select %arg0, %arg1, %arg2 : vector<4x3xi1>, vector<4x3xi32>
    return
  }
  func.func @index_cast_2d(%arg0: vector<1x2x3xi1>) {
    %0 = arith.index_cast %arg0 : vector<1x2x3xi1> to vector<1x2x3xindex>
    %1 = arith.index_cast %0 : vector<1x2x3xindex> to vector<1x2x3xi1>
    return
  }
}

