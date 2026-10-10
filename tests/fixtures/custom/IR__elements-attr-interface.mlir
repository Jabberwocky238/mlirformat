module {
  %cst = arith.constant #test.i64_elements<[10, 11, 12, 13, 14]> : tensor<5xi64>
  %cst_0 = arith.constant dense<[10, 11, 12, 13, 14]> : tensor<5xi64>
  %cst_1 = arith.constant dense<[1.100000e+00, 1.200000e+00, 1.300000e+00]> : tensor<3xf32>
  %cst_2 = arith.constant dense<> : tensor<0xi64>
  %cst_3 = arith.constant #test.e1di64_elements<blob1> : tensor<3xi64>
  %cst_4 = arith.constant sparse<[[0, 0, 2]], 1> : vector<1x1x3xi64>
}

{-#
  dialect_resources: {
    test: {
      blob1: "0x08000000010000000000000002000000000000000300000000000000"
    }
  }
#-}

