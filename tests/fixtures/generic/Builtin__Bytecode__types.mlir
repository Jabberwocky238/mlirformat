"builtin.module"() ({
  "builtin.module"() <{sym_name = "TestComplex"}> ({
  ^bb0:
  }) {bytecode.test = complex<i32>} : () -> ()
  "builtin.module"() <{sym_name = "TestFloat"}> ({
  ^bb0:
  }) {bytecode.test = bf16, bytecode.test1 = f16, bytecode.test10 = f8E4M3FNUZ, bytecode.test11 = f8E4M3B11FNUZ, bytecode.test12 = f8E3M4, bytecode.test13 = f4E2M1FN, bytecode.test14 = f6E2M3FN, bytecode.test15 = f6E3M2FN, bytecode.test16 = f8E8M0FNU, bytecode.test17 = tf32, bytecode.test2 = f32, bytecode.test3 = f64, bytecode.test4 = f80, bytecode.test5 = f128, bytecode.test6 = f8E5M2, bytecode.test7 = f8E4M3, bytecode.test8 = f8E4M3FN, bytecode.test9 = f8E5M2FNUZ} : () -> ()
  "builtin.module"() <{sym_name = "TestInteger"}> ({
  ^bb0:
  }) {bytecode.int = i1024, bytecode.int1 = si32, bytecode.int2 = ui512} : () -> ()
  "builtin.module"() <{sym_name = "TestIndex"}> ({
  ^bb0:
  }) {bytecode.index = index} : () -> ()
  "builtin.module"() <{sym_name = "TestFunc"}> ({
  ^bb0:
  }) {bytecode.func = () -> (), bytecode.func1 = (i1) -> i32, bytecode.func2 = (i32) -> (f32, f64)} : () -> ()
  "builtin.module"() <{sym_name = "TestMemRef"}> ({
  ^bb0:
  }) {bytecode.test = memref<2xi8>, bytecode.test1 = memref<2xi8, 1>, bytecode.test2 = memref<?x?xf32>, bytecode.test3 = memref<2x3xf32, strided<[3, 1]>>} : () -> ()
  "builtin.module"() <{sym_name = "TestNone"}> ({
  ^bb0:
  }) {bytecode.test = none} : () -> ()
  "builtin.module"() <{sym_name = "TestRankedTensor"}> ({
  ^bb0:
  }) {bytecode.test = tensor<16x32x?xf64>, bytecode.test1 = tensor<16xf64, "sparse">} : () -> ()
  "builtin.module"() <{sym_name = "TestTuple"}> ({
  ^bb0:
  }) {bytecode.test = tuple<>, bytecode.test1 = tuple<i32, i1, f32>} : () -> ()
  "builtin.module"() <{sym_name = "TestUnrankedMemRef"}> ({
  ^bb0:
  }) {bytecode.test = memref<*xi8>, bytecode.test1 = memref<*xi8, 1>} : () -> ()
  "builtin.module"() <{sym_name = "TestUnrankedTensor"}> ({
  ^bb0:
  }) {bytecode.test = tensor<*xi8>} : () -> ()
  "builtin.module"() <{sym_name = "TestVector"}> ({
  ^bb0:
  }) {bytecode.test = vector<8x8x128xi8>, bytecode.test1 = vector<8x[8]xf32>, bytecode.test2 = vector<[4]x[4]xf16>} : () -> ()
  "builtin.module"() <{sym_name = "TestToken"}> ({
  ^bb0:
  }) {bytecode.test = token} : () -> ()
  "builtin.module"() <{sym_name = "TestIntegerTypePacking"}> ({
  ^bb0:
  }) {bytecode.i1 = i1, bytecode.i2 = i2, bytecode.i4096 = i4096, bytecode.si1 = si1, bytecode.ui1 = ui1} : () -> ()
}) : () -> ()

