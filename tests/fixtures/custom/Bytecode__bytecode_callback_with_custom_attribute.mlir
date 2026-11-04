module {
  "test.versionedC"() <{attribute = #test.attr_params<42, 24>}> : () -> ()
}

// -----
module {
  "test.versionedC"() <{attribute = dense<[42, 24]> : tensor<2xi32>}> : () -> ()
}

