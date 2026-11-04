module @TestDialectResources attributes {bytecode.test = dense_resource<decl_resource> : tensor<2xui32>, bytecode.test2 = dense_resource<resource> : tensor<4xf64>, bytecode.test3 = dense_resource<resource_2> : tensor<4xf64>} {
}

{-#
  dialect_resources: {
    builtin: {
      resource: "0x08000000010000000000000002000000000000000300000000000000",
      resource_2: "0x08000000010000000000000002000000000000000300000000000000"
    }
  }
#-}

