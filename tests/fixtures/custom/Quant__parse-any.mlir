module {
}

// -----
module {
  func.func @parseFullySpecified() -> !quant.any<i8<-8:7>:f32> {
    %0 = "foo"() : () -> !quant.any<i8<-8:7>:f32>
    return %0 : !quant.any<i8<-8:7>:f32>
  }
}

// -----
module {
  func.func @parseNoExpressedType() -> !quant.any<i8<-8:7>> {
    %0 = "foo"() : () -> !quant.any<i8<-8:7>>
    return %0 : !quant.any<i8<-8:7>>
  }
}

// -----
module {
  func.func @parseOnlyStorageType() -> !quant.any<i8> {
    %0 = "foo"() : () -> !quant.any<i8>
    return %0 : !quant.any<i8>
  }
}

