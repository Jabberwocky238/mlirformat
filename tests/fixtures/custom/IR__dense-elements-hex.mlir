module {
  "foo.op"() {dense.attr = dense<[1.000000e+01, 5.000000e+00]> : tensor<2xf32>} : () -> ()
  "foo.op"() {dense.attr = dense<[1.000000e+01, 5.000000e+00]> : tensor<2xf64>} : () -> ()
  "foo.op"() {dense.attr = dense<[1.000000e+01, 5.000000e+00]> : tensor<2xf32>} : () -> ()
  "foo.op"() {dense.attr = dense<[1.000000e+01, 5.000000e+00]> : tensor<2xf64>} : () -> ()
  "foo.op"() {dense.attr = dense<(1.000000e+01,5.000000e+00)> : tensor<2xcomplex<f32>>} : () -> ()
  "foo.op"() {dense.attr = dense<(1.000000e+01,5.000000e+00)> : tensor<2xcomplex<f64>>} : () -> ()
  "foo.op"() {dense.attr = dense<[1.000000e+01, 5.000000e+00]> : tensor<2xbf16>} : () -> ()
}

// -----
// -----
// -----
