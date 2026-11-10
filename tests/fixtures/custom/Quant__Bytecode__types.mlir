module {
  module @parseAnyFullySpecified attributes {bytecode.test = !quant.any<i8<-8:7>:f32>} {
  }
  module @parseAnyFullySpecifiedUi8 attributes {bytecode.test = !quant.any<ui8<0:7>:f32>} {
  }
  module @parseAnyFullySpecifiedSi8 attributes {bytecode.test = !quant.any<si8<-8:7>:f32>} {
  }
  module @parseAnyNoExpressedType attributes {bytecode.test = !quant.any<i8<-8:7>>} {
  }
  module @parseAnyOnlyStorageType attributes {bytecode.test = !quant.any<i8>} {
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
  module @parseQuantileNoStorageBounds attributes {bytecode.test = !quant.quantile<ui4:f16, {-1.000000e+00,-8.750000e-01,-7.500000e-01,-6.250000e-01,-5.000000e-01,-3.750000e-01,-2.500000e-01,-1.250000e-01,1.250000e-01,2.500000e-01,3.750000e-01,5.000000e-01,6.250000e-01,7.500000e-01,8.750000e-01,1.000000e+00}>} {
  }
  module @parseQuantileWithStorageBounds attributes {bytecode.test = !quant.quantile<ui4:f16, {-1.000000e+00,-5.000000e-01,2.500000e-01,7.500000e-01,1.000000e+00}, <-2:2>>} {
  }
}

