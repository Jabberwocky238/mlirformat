module {
  func.func @entry() {
    %cst = arith.constant dense<-1.375000e+00> : vector<4xf8E4M3FN>
    %0 = math.absf %cst : vector<4xf8E4M3FN>
    vector.print %0 : vector<4xf8E4M3FN>
    %cst_0 = arith.constant dense<2.000000e+00> : vector<4xf8E4M3FN>
    %cst_1 = arith.constant dense<4.000000e+00> : vector<4xf8E4M3FN>
    %cst_2 = arith.constant dense<8.000000e+00> : vector<4xf8E4M3FN>
    %1 = math.fma %cst_0, %cst_1, %cst_2 : vector<4xf8E4M3FN>
    vector.print %1 : vector<4xf8E4M3FN>
    %2 = math.isinf %cst : vector<4xf8E4M3FN>
    vector.print %2 : vector<4xi1>
    %3 = math.isnan %cst : vector<4xf8E4M3FN>
    vector.print %3 : vector<4xi1>
    %4 = math.isnormal %cst : vector<4xf8E4M3FN>
    vector.print %4 : vector<4xi1>
    %5 = math.isfinite %cst : vector<4xf8E4M3FN>
    vector.print %5 : vector<4xi1>
    return
  }
}

