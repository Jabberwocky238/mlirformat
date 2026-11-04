"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.calibrated<f32<-0.998:1.232100e+00>>, sym_name = "parseCalibrated"}> ({
    %0 = "foo"() : () -> !quant.calibrated<f32<-0.998:1.232100e+00>>
    "func.return"(%0) : (!quant.calibrated<f32<-0.998:1.232100e+00>>) -> ()
  }) : () -> ()
}) : () -> ()

