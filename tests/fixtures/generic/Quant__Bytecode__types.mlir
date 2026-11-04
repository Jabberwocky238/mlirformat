"builtin.module"() ({
  "builtin.module"() <{sym_name = "parseAnyFullySpecified"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<i8<-8:7>:f32>} : () -> ()
  "builtin.module"() <{sym_name = "parseAnyNoExpressedType"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<i8<-8:7>>} : () -> ()
  "builtin.module"() <{sym_name = "parseAnyOnlyStorageType"}> ({
  ^bb0:
  }) {bytecode.test = !quant.any<i8<-8:7>>} : () -> ()
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
}) : () -> ()

