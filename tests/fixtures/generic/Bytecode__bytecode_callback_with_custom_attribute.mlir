"builtin.module"() ({
  "test.versionedC"() <{attribute = #test.attr_params<42, 24>}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.versionedC"() <{attribute = dense<[42, 24]> : tensor<2xi32>}> : () -> ()
}) : () -> ()

