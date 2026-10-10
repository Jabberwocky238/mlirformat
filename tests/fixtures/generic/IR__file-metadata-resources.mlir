"builtin.module"() ({
^bb0:
}) {test.blob_ref = #test.e1di64_elements<blob1> : tensor<*xi1>} : () -> ()

{-#
  dialect_resources: {
    test: {
      blob1: "0x08000000010000000000000002000000000000000300000000000000"
    }
  },
  external_resources: {
    external: {
      blob: "0x08000000010000000000000002000000000000000300000000000000",
      bool: true,
      string: "string"
    },
    other_stuff: {
      bool: true
    }
  }
#-}

