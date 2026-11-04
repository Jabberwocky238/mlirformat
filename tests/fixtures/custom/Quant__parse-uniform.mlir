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

