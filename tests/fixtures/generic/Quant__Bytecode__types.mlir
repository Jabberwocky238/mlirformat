"builtin.module"() ({
  "builtin.module"() <{sym_name = "parseAnyFullySpecified"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<i8<-8:7>:f32>} : () -> ()
  "builtin.module"() <{sym_name = "parseAnyFullySpecifiedUi8"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<ui8<0:7>:f32>} : () -> ()
  "builtin.module"() <{sym_name = "parseAnyFullySpecifiedSi8"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<si8<-8:7>:f32>} : () -> ()
  "builtin.module"() <{sym_name = "parseAnyNoExpressedType"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<i8<-8:7>>} : () -> ()
  "builtin.module"() <{sym_name = "parseAnyOnlyStorageType"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<i8>} : () -> ()
  "builtin.module"() <{sym_name = "parseCalibrated"}> ({
  ^bb0:
  }) {bytecode.test = !quant.calibrated<f32<-0.998:1.232100e+00>>} : () -> ()
  "builtin.module"() <{sym_name = "parseUniformPerLayer"}> ({
  ^bb0:
  }) {bytecode.test = !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>} : () -> ()
  "builtin.module"() <{sym_name = "parseUniformPerAxisScaleZero"}> ({
  ^bb0:
  }) {bytecode.test = !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>} : () -> ()
  "builtin.module"() <{sym_name = "parseUniformPerAxisScaleNoZero"}> ({
  ^bb0:
  }) {bytecode.test = !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>} : () -> ()
  "builtin.module"() <{sym_name = "parseUniformPerAxisMixed"}> ({
  ^bb0:
  }) {bytecode.test = !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>} : () -> ()
  "builtin.module"() <{sym_name = "parseUniformSubChannel"}> ({
  ^bb0:
  }) {bytecode.test = !quant.uniform<i8:f32:{0:1, 1:2}, {{2.000000e+00:10, 3.000000e+00:20}, {4.000000e+00:30, 5.000000e+00:40}}>} : () -> ()
  "builtin.module"() <{sym_name = "parseQuantileNoStorageBounds"}> ({
  ^bb0:
  }) {bytecode.test = !quant.quantile<ui4:f16, {-1.000000e+00,-8.750000e-01,-7.500000e-01,-6.250000e-01,-5.000000e-01,-3.750000e-01,-2.500000e-01,-1.250000e-01,1.250000e-01,2.500000e-01,3.750000e-01,5.000000e-01,6.250000e-01,7.500000e-01,8.750000e-01,1.000000e+00}>} : () -> ()
  "builtin.module"() <{sym_name = "parseQuantileWithStorageBounds"}> ({
  ^bb0:
  }) {bytecode.test = !quant.quantile<ui4:f16, {-1.000000e+00,-5.000000e-01,2.500000e-01,7.500000e-01,1.000000e+00}, <-2:2>>} : () -> ()
}) : () -> ()

