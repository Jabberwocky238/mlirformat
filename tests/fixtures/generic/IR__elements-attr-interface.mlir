"builtin.module"() ({
  %0 = "arith.constant"() <{value = #test.i64_elements<[10, 11, 12, 13, 14]> : tensor<5xi64>}> : () -> tensor<5xi64>
  %1 = "arith.constant"() <{value = dense<[10, 11, 12, 13, 14]> : tensor<5xi64>}> : () -> tensor<5xi64>
  %2 = "arith.constant"() <{value = dense<[1.100000e+00, 1.200000e+00, 1.300000e+00]> : tensor<3xf32>}> : () -> tensor<3xf32>
  %3 = "arith.constant"() <{value = dense<> : tensor<0xi64>}> : () -> tensor<0xi64>
  %4 = "arith.constant"() <{value = #test.e1di64_elements<blob1> : tensor<3xi64>}> : () -> tensor<3xi64>
  %5 = "arith.constant"() <{value = sparse<[[0, 0, 2]], 1> : vector<1x1x3xi64>}> : () -> vector<1x1x3xi64>
}) : () -> ()

{-#
  dialect_resources: {
    test: {
      blob1: "0x08000000010000000000000002000000000000000300000000000000"
    }
  }
#-}

