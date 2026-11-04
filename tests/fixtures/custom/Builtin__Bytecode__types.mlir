module {
  module @TestComplex attributes {bytecode.test = complex<i32>} {
  }
  module @TestFloat attributes {bytecode.test = bf16, bytecode.test1 = f16, bytecode.test2 = f32, bytecode.test3 = f64, bytecode.test4 = f80, bytecode.test5 = f128} {
  }
  module @TestInteger attributes {bytecode.int = i1024, bytecode.int1 = si32, bytecode.int2 = ui512} {
  }
  module @TestIndex attributes {bytecode.index = index} {
  }
  module @TestFunc attributes {bytecode.func = () -> (), bytecode.func1 = (i1) -> i32} {
  }
  module @TestMemRef attributes {bytecode.test = memref<2xi8>, bytecode.test1 = memref<2xi8, 1>} {
  }
  module @TestNone attributes {bytecode.test = none} {
  }
  module @TestRankedTensor attributes {bytecode.test = tensor<16x32x?xf64>, bytecode.test1 = tensor<16xf64, "sparse">} {
  }
  module @TestTuple attributes {bytecode.test = tuple<>, bytecode.test1 = tuple<i32, i1, f32>} {
  }
  module @TestUnrankedMemRef attributes {bytecode.test = memref<*xi8>, bytecode.test1 = memref<*xi8, 1>} {
  }
  module @TestUnrankedTensor attributes {bytecode.test = tensor<*xi8>} {
  }
  module @TestVector attributes {bytecode.test = vector<8x8x128xi8>, bytecode.test1 = vector<8x[8]xf32>} {
  }
}

