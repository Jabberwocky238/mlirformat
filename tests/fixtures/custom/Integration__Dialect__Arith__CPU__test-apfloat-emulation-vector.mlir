module {
  func.func @foo_vec() -> (vector<4xf8E4M3FN>, vector<4xf32>) {
    %cst = arith.constant dense<2.250000e+00> : vector<4xf8E4M3FN>
    %cst_0 = arith.constant dense<2.200000e+00> : vector<4xf32>
    return %cst, %cst_0 : vector<4xf8E4M3FN>, vector<4xf32>
  }
  func.func @entry() {
    %cst = arith.constant dense<1.375000e+00> : vector<4xf8E4M3FN>
    %0:2 = call @foo_vec() : () -> (vector<4xf8E4M3FN>, vector<4xf32>)
    %1 = arith.addf %cst, %0#0 : vector<4xf8E4M3FN>
    vector.print %1 : vector<4xf8E4M3FN>
    return
  }
}

