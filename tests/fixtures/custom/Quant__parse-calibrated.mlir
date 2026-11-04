module {
}

// -----
module {
  func.func @parseCalibrated() -> !quant.calibrated<f32<-0.998:1.232100e+00>> {
    %0 = "foo"() : () -> !quant.calibrated<f32<-0.998:1.232100e+00>>
    return %0 : !quant.calibrated<f32<-0.998:1.232100e+00>>
  }
}

