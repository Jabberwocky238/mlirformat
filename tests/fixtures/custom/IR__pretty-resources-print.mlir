module {
  "test.blob1op"() {attr = dense_resource<blob1> : tensor<3xi64>} : () -> ()
  "test.blob2op"() {attr = dense_resource<blob2> : tensor<3xi64>} : () -> ()
}

{-#
  dialect_resources: {
    builtin: {
      blob1: "0x08000000010000000000000002000000000000000300000000000000",
      blob2: "0x08000000040000000000000005000000000000000600000000000000"
    }
  },
  external_resources: {
    external: {
      blob: "0x08000000010000000000000002000000000000000300000000000000",
      "backslash\\tab\09": true,
      string: "\22string\22"
    },
    other_stuff: {
      bool: true
    }
  }
#-}

