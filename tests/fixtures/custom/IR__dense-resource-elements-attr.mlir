module {
  "test.user_op"() {attr = dense_resource<blob1> : tensor<3xi64>} : () -> ()
}

{-#
  dialect_resources: {
    builtin: {
      blob1: "0x08000000010000000000000002000000000000000300000000000000"
    }
  }
#-}

// -----
module {
  "test.user_op"() {attr = dense_resource<"blob\\-\22one\22"> : tensor<2xi16>} : () -> ()
}

{-#
  dialect_resources: {
    builtin: {
      "blob\\-\22one\22": "0x0200000001000200"
    }
  }
#-}

