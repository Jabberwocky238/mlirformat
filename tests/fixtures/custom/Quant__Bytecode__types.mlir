module {
  module @parseAnyFullySpecified attributes {bytecode.test = !quant.any<i8<-8:7>:f32>} {
  }
  module @parseAnyNoExpressedType attributes {bytecode.test = !quant.any<i8<-8:7>>} {
  }
  module @parseAnyOnlyStorageType attributes {bytecode.test = !quant.any<i8<-8:7>>} {
  }
  module @parseCalibrated attributes {bytecode.test = !quant.calibrated<f32<-0.998:1.232100e+00>>} {
  }
  module @parseUniformPerLayer attributes {bytecode.test = !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>} {
  }
  module @parseUniformPerAxisScaleZero attributes {bytecode.test = !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>} {
  }
  module @parseUniformPerAxisScaleNoZero attributes {bytecode.test = !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>} {
  }
  module @parseUniformPerAxisMixed attributes {bytecode.test = !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>} {
  }
  module @parseUniformSubChannel attributes {bytecode.test = !quant.uniform<i8:f32:{0:1, 1:2}, {{2.000000e+00:10, 3.000000e+00:20}, {4.000000e+00:30, 5.000000e+00:40}}>} {
  }
}

