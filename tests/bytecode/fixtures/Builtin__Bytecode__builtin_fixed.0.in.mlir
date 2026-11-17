"builtin.module"() ({
  "builtin.module"() <{sym_name = "TestArrayAttr"}> ({
  ^bb0:
  }) {bytecode.empty = [], bytecode.nested = [[1 : i32, 2 : i32], [3 : i32]], bytecode.single = [unit]} : () -> () loc("<stdin>":31:3)
  "builtin.module"() <{sym_name = "TestDictionaryAttr"}> ({
  ^bb0:
  }) {bytecode.empty_dict = {}, bytecode.nested_dict = {inner = {a = 1 : i32}}} : () -> () loc("<stdin>":34:3)
  "builtin.module"() <{sym_name = "TestStringAttr"}> ({
  ^bb0:
  }) {bytecode.empty_str = "", bytecode.plain = "hello world", bytecode.typed = "typed" : i32} : () -> () loc("<stdin>":37:3)
  "builtin.module"() <{sym_name = "TestSymbolRefAttr"}> ({
  ^bb0:
  }) {bytecode.flat = @flat_sym, bytecode.nested = @root::@child1::@child2} : () -> () loc("<stdin>":40:3)
  "builtin.module"() <{sym_name = "TestTypeAttr"}> ({
  ^bb0:
  }) {bytecode.type_i32 = i32, bytecode.type_memref = memref<2x3xf32>} : () -> () loc("<stdin>":43:3)
  "builtin.module"() <{sym_name = "TestUnitAttr"}> ({
  ^bb0:
  }) {bytecode.unit} : () -> () loc("<stdin>":46:3)
  "builtin.module"() <{sym_name = "TestIntegerAttr"}> ({
  ^bb0:
  }) {bytecode.bool_false = false, bytecode.bool_true = true, bytecode.i128_large = 90000000000000000300000000000000000001 : i128, bytecode.i32_val = 42 : i32, bytecode.i8_neg = -1 : i8, bytecode.index_val = 7 : index, bytecode.si32_val = -100 : si32, bytecode.ui64_val = 800 : ui64} : () -> () loc("<stdin>":49:3)
  "builtin.module"() <{sym_name = "TestFloatAttr"}> ({
  ^bb0:
  }) {bytecode.bf16 = -5.000000e-01 : bf16, bytecode.f128 = 0.100000000000000005551115123125782702 : f128, bytecode.f16 = 1.500000e+00 : f16, bytecode.f32 = 3.140000e+00 : f32, bytecode.f4E2M1FN = 1.000000e+00 : f4E2M1FN, bytecode.f64 = 1.000000e+01 : f64, bytecode.f6E2M3FN = 1.000000e+00 : f6E2M3FN, bytecode.f6E3M2FN = 1.000000e+00 : f6E3M2FN, bytecode.f80 = 0.100000000000000005551 : f80, bytecode.f8E3M4 = 1.000000e+00 : f8E3M4, bytecode.f8E4M3 = 1.000000e+00 : f8E4M3, bytecode.f8E4M3B11FNUZ = 1.000000e+00 : f8E4M3B11FNUZ, bytecode.f8E4M3FN = 1.000000e+00 : f8E4M3FN, bytecode.f8E4M3FNUZ = 1.000000e+00 : f8E4M3FNUZ, bytecode.f8E5M2 = 1.000000e+00 : f8E5M2, bytecode.f8E5M2FNUZ = 1.000000e+00 : f8E5M2FNUZ, bytecode.f8E8M0FNU = 1.000000e+00 : f8E8M0FNU, bytecode.tf32 = 1.000000e+00 : tf32} : () -> () loc("<stdin>":52:3)
  "builtin.module"() <{sym_name = "TestDenseArrayAttr"}> ({
  ^bb0:
  }) {bytecode.bool_arr = array<i1: true, false, true>, bytecode.empty_arr = array<i32>, bytecode.f32_arr = array<f32: 1.000000e+00, 2.000000e+00>, bytecode.f64_arr = array<f64: 3.140000e+00>, bytecode.i16_arr = array<i16: 100, -200>, bytecode.i32_arr = array<i32: 1, 2, 3>, bytecode.i64_arr = array<i64: 1000000, -1000000>, bytecode.i8_arr = array<i8: 10, 32, -1>} : () -> () loc("<stdin>":55:3)
  "builtin.module"() <{sym_name = "TestDenseIntOrFPElementsAttr"}> ({
  ^bb0:
  }) {bytecode.dense_2d = dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>, bytecode.dense_f32 = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf32>, bytecode.dense_i1 = dense<[true, false, true]> : tensor<3xi1>, bytecode.dense_i8 = dense<[10, 20, 30]> : tensor<3xi8>, bytecode.splat_f32 = dense<1.000000e+00> : tensor<2x3xf32>, bytecode.splat_f64 = dense<0.000000e+00> : tensor<8xf64>, bytecode.splat_i1 = dense<true> : tensor<256xi1>, bytecode.splat_i32 = dense<42> : tensor<4x4xi32>} : () -> () loc("<stdin>":58:3)
  "builtin.module"() <{sym_name = "TestSparseElementsAttr"}> ({
  ^bb0:
  }) {bytecode.sparse = sparse<[[0, 0], [1, 2]], [1, 5]> : tensor<3x4xi32>, bytecode.sparse_1d = sparse<[1, 3], [1.000000e+01, 2.000000e+01]> : tensor<5xf32>} : () -> () loc("<stdin>":61:3)
  "builtin.module"() <{sym_name = "TestDistinctAttr"}> ({
  ^bb0:
  }) {bytecode.diff = distinct[0]<42 : i32>, bytecode.same1 = distinct[1]<42 : i32>, bytecode.same2 = distinct[1]<42 : i32>} : () -> () loc("<stdin>":64:3)
  "builtin.module"() <{sym_name = "TestLocationAttrs"}> ({
  ^bb0:
  }) {bytecode.callsite = loc(callsite("callee" at "caller.cc":5:3)), bytecode.flc = loc("source.cc":10:8), bytecode.flc_range1 = loc("source.cc":10:8 to 12:4), bytecode.flc_range2 = loc("source.cc":10:8 to :12), bytecode.flc_range3 = loc("source.cc":10:8 to 12:8), bytecode.fused = loc(fused["a", "b":1:2]), bytecode.fused_meta = loc(fused<"myPass">["x", "y"]), bytecode.name = loc("named"), bytecode.name_child = loc("named"("child.cc":1:1)), bytecode.unknown = loc(unknown)} : () -> () loc("<stdin>":67:3)
  "builtin.module"() <{sym_name = "TestAllFloatTypes"}> ({
  ^bb0:
  }) {bytecode.bf16 = bf16, bytecode.f128 = f128, bytecode.f16 = f16, bytecode.f32 = f32, bytecode.f4E2M1FN = f4E2M1FN, bytecode.f64 = f64, bytecode.f6E2M3FN = f6E2M3FN, bytecode.f6E3M2FN = f6E3M2FN, bytecode.f80 = f80, bytecode.f8E3M4 = f8E3M4, bytecode.f8E4M3 = f8E4M3, bytecode.f8E4M3B11FNUZ = f8E4M3B11FNUZ, bytecode.f8E4M3FN = f8E4M3FN, bytecode.f8E4M3FNUZ = f8E4M3FNUZ, bytecode.f8E5M2 = f8E5M2, bytecode.f8E5M2FNUZ = f8E5M2FNUZ, bytecode.f8E8M0FNU = f8E8M0FNU, bytecode.tf32 = tf32} : () -> () loc("<stdin>":70:3)
  "builtin.module"() <{sym_name = "TestBasicTypes"}> ({
  ^bb0:
  }) {bytecode.i1 = i1, bytecode.i1024 = i1024, bytecode.i32 = i32, bytecode.i8 = i8, bytecode.index = index, bytecode.none = none, bytecode.si32 = si32, bytecode.token = token, bytecode.ui64 = ui64} : () -> () loc("<stdin>":73:3)
  "builtin.module"() <{sym_name = "TestFunctionType"}> ({
  ^bb0:
  }) {bytecode.empty_func = () -> (), bytecode.func_args = (i32, f64) -> i1, bytecode.func_multi_res = (i32) -> (f32, f64)} : () -> () loc("<stdin>":76:3)
  "builtin.module"() <{sym_name = "TestComplexType"}> ({
  ^bb0:
  }) {bytecode.c_f64 = complex<f64>, bytecode.c_i32 = complex<i32>} : () -> () loc("<stdin>":79:3)
  "builtin.module"() <{sym_name = "TestMemRefType"}> ({
  ^bb0:
  }) {bytecode.dynamic = memref<?x?xf32>, bytecode.simple = memref<2x3xf32>, bytecode.with_memspace = memref<4xi8, 1>} : () -> () loc("<stdin>":82:3)
  "builtin.module"() <{sym_name = "TestRankedTensorType"}> ({
  ^bb0:
  }) {bytecode.dynamic = tensor<?x32x?xf32>, bytecode.static = tensor<16x32xf64>, bytecode.with_encoding = tensor<16xf64, "sparse">} : () -> () loc("<stdin>":85:3)
  "builtin.module"() <{sym_name = "TestUnrankedTensorType"}> ({
  ^bb0:
  }) {bytecode.unranked = tensor<*xi8>} : () -> () loc("<stdin>":88:3)
  "builtin.module"() <{sym_name = "TestUnrankedMemRefType"}> ({
  ^bb0:
  }) {bytecode.plain = memref<*xi8>, bytecode.with_memspace = memref<*xi8, 1>} : () -> () loc("<stdin>":91:3)
  "builtin.module"() <{sym_name = "TestVectorType"}> ({
  ^bb0:
  }) {bytecode.all_scalable = vector<[4]x[4]xf16>, bytecode.fixed = vector<8x8x128xi8>, bytecode.scalable = vector<8x[8]xf32>} : () -> () loc("<stdin>":94:3)
  "builtin.module"() <{sym_name = "TestTupleType"}> ({
  ^bb0:
  }) {bytecode.empty_tuple = tuple<>, bytecode.mixed_tuple = tuple<i32, f64, index>} : () -> () loc("<stdin>":97:3)
  "builtin.module"() <{sym_name = "TestAffineMapAttr"}> ({
  ^bb0:
  }) {bytecode.complex = affine_map<(d0, d1) -> (d0 floordiv 4, d1 mod 8)>, bytecode.constant = affine_map<() -> (42)>, bytecode.empty = affine_map<() -> ()>, bytecode.identity = affine_map<(d0) -> (d0)>, bytecode.multi_dim = affine_map<(d0, d1) -> (d0 + d1)>, bytecode.with_symbol = affine_map<(d0)[s0] -> (d0 + s0)>} : () -> () loc("<stdin>":100:3)
  "builtin.module"() <{sym_name = "TestIntegerSetAttr"}> ({
  ^bb0:
  }) {bytecode.eq = affine_set<(d0) : (d0 == 0)>, bytecode.eq_ineq = affine_set<(d0, d1) : (d0 == 0, d1 >= 0)>, bytecode.ineq = affine_set<(d0) : (d0 >= 0)>, bytecode.multi = affine_set<(d0, d1)[s0] : (d0 >= 0, -d0 + s0 >= 0, d1 >= 0)>} : () -> () loc("<stdin>":103:3)
  "builtin.module"() <{sym_name = "TestDenseResourceElementsAttr"}> ({
  ^bb0:
  }) {bytecode.resource = dense_resource<blob1> : tensor<3xi64>} : () -> () loc("<stdin>":106:3)
  "builtin.module"() <{sym_name = "TestDenseStringElementsAttr"}> ({
  ^bb0:
  }) {bytecode.dense_str = dense<["foo", "bar", "baz"]> : tensor<3x!bytecode.string>, bytecode.splat_str = dense<"splat"> : tensor<4x!bytecode.string>} : () -> () loc("<stdin>":109:3)
  "builtin.module"() <{sym_name = "TestStridedLayoutAttr"}> ({
  ^bb0:
  }) {bytecode.dynamic = strided<[?, 1], offset: ?>, bytecode.static_strides = strided<[3, 1]>, bytecode.with_offset = strided<[3, 1], offset: 5>} : () -> () loc("<stdin>":112:3)
}) : () -> () loc("<stdin>":30:1)
