module {
}

// -----
module {
  func.func @parse() -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127> {
    %0 = "foo"() : () -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>
    return %0 : !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127> {
    %0 = "foo"() : () -> !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>
    return %0 : !quant.uniform<i8<-8:7>:f32, 9.987200e-01:127>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32, 9.987200e-01> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 9.987200e-01>
    return %0 : !quant.uniform<u8:f32, 9.987200e-01>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32, 2.000000e-02> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 2.000000e-02>
    return %0 : !quant.uniform<u8:f32, 2.000000e-02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 2.000000e+02>
    return %0 : !quant.uniform<u8:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<i16:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<i16:f32, 2.000000e+02>
    return %0 : !quant.uniform<i16:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u16:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u16:f32, 2.000000e+02>
    return %0 : !quant.uniform<u16:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<i32:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<i32:f32, 2.000000e+02>
    return %0 : !quant.uniform<i32:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u32:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u32:f32, 2.000000e+02>
    return %0 : !quant.uniform<u32:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 2.000000e+02>
    return %0 : !quant.uniform<u8:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32, 0x41646ABBA0000000:128> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32, 0x41646ABBA0000000:128>
    return %0 : !quant.uniform<u8:f32, 0x41646ABBA0000000:128>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f16, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u8:f16, 2.000000e+02>
    return %0 : !quant.uniform<u8:f16, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f64, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u8:f64, 2.000000e+02>
    return %0 : !quant.uniform<u8:f64, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:bf16, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<u8:bf16, 2.000000e+02>
    return %0 : !quant.uniform<u8:bf16, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<ui8:f32, 1.000000e+00> {
    %0 = "foo"() : () -> !quant.uniform<ui8:f32, 1.000000e+00>
    return %0 : !quant.uniform<ui8:f32, 1.000000e+00>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<si8:f32, 1.000000e+00> {
    %0 = "foo"() : () -> !quant.uniform<si8:f32, 1.000000e+00>
    return %0 : !quant.uniform<si8:f32, 1.000000e+00>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>
    return %0 : !quant.uniform<u8:f32:1, {2.000000e+02:-120,9.987200e-01:127}>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}> {
    %0 = "foo"() : () -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>
    return %0 : !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01}>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}> {
    %0 = "foo"() : () -> !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>
    return %0 : !quant.uniform<i8:f32:1, {2.000000e+02,9.987200e-01:120}>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>
    return %0 : !quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<u8:f32:{}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}> {
    %0 = "foo"() : () -> !quant.uniform<u8:f32:{}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>
    return %0 : !quant.uniform<u8:f32:{}, {{2.000000e+00:120, 3.000000e+00:127}, {4.000000e+00, 5.000000e+00}}>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<f8E5M2:f32, 9.987200e-01:127> {
    %0 = "foo"() : () -> !quant.uniform<f8E5M2:f32, 9.987200e-01:127>
    return %0 : !quant.uniform<f8E5M2:f32, 9.987200e-01:127>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<f8E5M2:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<f8E5M2:f32, 2.000000e+02>
    return %0 : !quant.uniform<f8E5M2:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<f8E4M3FN:f32, 9.987200e-01:127> {
    %0 = "foo"() : () -> !quant.uniform<f8E4M3FN:f32, 9.987200e-01:127>
    return %0 : !quant.uniform<f8E4M3FN:f32, 9.987200e-01:127>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<f8E4M3FN:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<f8E4M3FN:f32, 2.000000e+02>
    return %0 : !quant.uniform<f8E4M3FN:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<f4E2M1FN:f32, 9.987200e-01:127> {
    %0 = "foo"() : () -> !quant.uniform<f4E2M1FN:f32, 9.987200e-01:127>
    return %0 : !quant.uniform<f4E2M1FN:f32, 9.987200e-01:127>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<f4E2M1FN:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<f4E2M1FN:f32, 2.000000e+02>
    return %0 : !quant.uniform<f4E2M1FN:f32, 2.000000e+02>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<!quant.quantile<f4E2M1FN:f16, {-1.000000e+00,-8.750000e-01,-7.500000e-01,-6.250000e-01,-5.000000e-01,-2.500000e-01,0.000000e+00,2.500000e-01,5.000000e-01,6.250000e-01,7.500000e-01,8.750000e-01,1.000000e+00}, <-6:6>>:f32, 9.987200e-01:127> {
    %0 = "foo"() : () -> !quant.uniform<!quant.quantile<f4E2M1FN:f16, {-1.000000e+00,-8.750000e-01,-7.500000e-01,-6.250000e-01,-5.000000e-01,-2.500000e-01,0.000000e+00,2.500000e-01,5.000000e-01,6.250000e-01,7.500000e-01,8.750000e-01,1.000000e+00}, <-6:6>>:f32, 9.987200e-01:127>
    return %0 : !quant.uniform<!quant.quantile<f4E2M1FN:f16, {-1.000000e+00,-8.750000e-01,-7.500000e-01,-6.250000e-01,-5.000000e-01,-2.500000e-01,0.000000e+00,2.500000e-01,5.000000e-01,6.250000e-01,7.500000e-01,8.750000e-01,1.000000e+00}, <-6:6>>:f32, 9.987200e-01:127>
  }
}

// -----
module {
  func.func @parse() -> !quant.uniform<!quant.quantile<f4E2M1FN:f16, {-1.000000e+00,-8.667000e-01,-7.333000e-01,-6.000000e-01,-4.667000e-01,-3.333000e-01,-2.000000e-01,-6.670000e-02,6.670000e-02,2.000000e-01,3.333000e-01,4.667000e-01,6.000000e-01,7.333000e-01,8.667000e-01,1.000000e+00}>:f32, 2.000000e+02> {
    %0 = "foo"() : () -> !quant.uniform<!quant.quantile<f4E2M1FN:f16, {-1.000000e+00,-8.667000e-01,-7.333000e-01,-6.000000e-01,-4.667000e-01,-3.333000e-01,-2.000000e-01,-6.670000e-02,6.670000e-02,2.000000e-01,3.333000e-01,4.667000e-01,6.000000e-01,7.333000e-01,8.667000e-01,1.000000e+00}>:f32, 2.000000e+02>
    return %0 : !quant.uniform<!quant.quantile<f4E2M1FN:f16, {-1.000000e+00,-8.667000e-01,-7.333000e-01,-6.000000e-01,-4.667000e-01,-3.333000e-01,-2.000000e-01,-6.670000e-02,6.670000e-02,2.000000e-01,3.333000e-01,4.667000e-01,6.000000e-01,7.333000e-01,8.667000e-01,1.000000e+00}>:f32, 2.000000e+02>
  }
}

