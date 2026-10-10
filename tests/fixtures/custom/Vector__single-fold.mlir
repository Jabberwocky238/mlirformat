module {
  func.func @fold_extract_in_single_pass(%arg0: vector<4xf16>, %arg1: f16) -> f16 {
    %0 = vector.insert %arg1, %arg0 [1] : f16 into vector<4xf16>
    %c1 = arith.constant 1 : index
    %1 = vector.extract %0[%c1] : f16 from vector<4xf16>
    return %1 : f16
  }
}

// -----
module {
  func.func @fold_insert_in_single_pass() -> vector<2xf16> {
    %cst = arith.constant dense<0.000000e+00> : vector<2xf16>
    %c1 = arith.constant 1 : index
    %cst_0 = arith.constant 2.500000e+00 : f16
    %0 = vector.insert %cst_0, %cst [%c1] : f16 into vector<2xf16>
    return %0 : vector<2xf16>
  }
}

