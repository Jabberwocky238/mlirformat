"builtin.module"() ({
  "builtin.module"() <{sym_name = "TestArray"}> ({
  ^bb0:
  }) {bytecode.array = [unit]} : () -> () loc("<stdin>":49:3)
  "builtin.module"() <{sym_name = "TestDenseArray"}> ({
  ^bb0:
  }) {bytecode.test1 = array<i1: true, false, true, false, false>, bytecode.test2 = array<i8: 10, 32, -1>, bytecode.test3 = array<f64: 1.000000e+01, 3.200000e+01, 1.809000e+03>} : () -> () loc("<stdin>":52:3)
  "builtin.module"() <{sym_name = "TestDenseTypedElements"}> ({
  ^bb0:
  }) {bytecode.bf16 = dense<[-5.000000e-01, 5.000000e-01]> : tensor<2xbf16>, bytecode.complex_val = dense<(1.000000e+00,2.000000e+00)> : tensor<1xcomplex<f32>>, bytecode.f16 = dense<[1.500000e+00, 2.500000e+00]> : tensor<2xf16>, bytecode.i16 = dense<[100, -200]> : tensor<2xi16>, bytecode.i64 = dense<1000000> : tensor<4xi64>, bytecode.test1 = dense<true> : tensor<256xi1>, bytecode.test2 = dense<[10, 32, -1]> : tensor<3xi8>, bytecode.test3 = dense<[1.000000e+01, 3.200000e+01, 1.809000e+03]> : tensor<3xf64>} : () -> () loc("<stdin>":55:3)
  "builtin.module"() <{sym_name = "TestDenseI1SingleElement"}> ({
  ^bb0:
  }) {bytecode.false_1 = dense<false> : tensor<1xi1>, bytecode.true_1 = dense<true> : tensor<1xi1>} : () -> () loc("<stdin>":58:3)
  "builtin.module"() <{sym_name = "TestDenseI1EightElements"}> ({
  ^bb0:
  }) {bytecode.all_false_8 = dense<false> : tensor<8xi1>, bytecode.all_true_8 = dense<true> : tensor<8xi1>, bytecode.mixed_8 = dense<[true, false, true, false, true, false, true, false]> : tensor<8xi1>} : () -> () loc("<stdin>":61:3)
  "builtin.module"() <{sym_name = "TestDenseI1VariedSizes"}> ({
  ^bb0:
  }) {bytecode.i1_16 = dense<[true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false]> : tensor<16xi1>, bytecode.i1_2 = dense<[true, false]> : tensor<2xi1>, bytecode.i1_7 = dense<[true, false, true, false, true, false, true]> : tensor<7xi1>, bytecode.i1_9 = dense<[true, false, true, false, true, false, true, false, true]> : tensor<9xi1>} : () -> () loc("<stdin>":64:3)
  "builtin.module"() <{sym_name = "TestDenseStringElementsAttr"}> ({
  ^bb0:
  }) {bytecode.test1 = dense<"splat"> : tensor<256x!bytecode.string>, bytecode.test2 = dense<["foo", "bar", "baz"]> : tensor<3x!bytecode.string>} : () -> () loc("<stdin>":67:3)
  "builtin.module"() <{sym_name = "TestFloat"}> ({
  ^bb0:
  }) {bytecode.float = 1.000000e+01 : f64, bytecode.float1 = 0.100000000000000005551 : f80, bytecode.float2 = 0.100000000000000005551115123125782702 : f128, bytecode.float3 = -5.000000e-01 : bf16, bytecode.inf = 0x7FF0000000000000 : f64, bytecode.nan = 0x7FF8000000000000 : f64, bytecode.ninf = 0xFFF0000000000000 : f64} : () -> () loc("<stdin>":70:3)
  "builtin.module"() <{sym_name = "TestInt"}> ({
  ^bb0:
  }) {bytecode.int = false, bytecode.int1 = -1 : i8, bytecode.int2 = 800 : ui64, bytecode.int3 = 90000000000000000300000000000000000001 : i128, bytecode.int4 = true, bytecode.int5 = 42 : i32, bytecode.int6 = -100 : si32, bytecode.int7 = 7 : index} : () -> () loc("<stdin>":73:3)
  "builtin.module"() <{sym_name = "TestSparseElements"}> ({
  ^bb0:
  }) {bytecode.sparse = sparse<[[0, 0], [1, 2]], [1, 5]> : tensor<3x4xi32>, bytecode.sparse_1d = sparse<[1, 3], [1.000000e+01, 2.000000e+01]> : tensor<5xf32>} : () -> () loc("<stdin>":76:3)
  "builtin.module"() <{sym_name = "TestString"}> ({
  ^bb0:
  }) {bytecode.string = "hello", bytecode.string2 = "hello" : i32, bytecode.string3 = ""} : () -> () loc("<stdin>":79:3)
  "builtin.module"() <{sym_name = "TestSymbolRef"}> ({
  ^bb0:
  }) {bytecode.ref = @foo, bytecode.ref2 = @foo::@bar::@foo} : () -> () loc("<stdin>":82:3)
  "builtin.module"() <{sym_name = "TestType"}> ({
  ^bb0:
  }) {bytecode.type = i178} : () -> () loc("<stdin>":85:3)
  "builtin.module"() <{sym_name = "TestDistinct"}> ({
  ^bb0:
  }) {bytecode.distinct = distinct[0]<42 : i32>, bytecode.distinct2 = distinct[0]<42 : i32>, bytecode.distinct3 = distinct[1]<42 : i32>} : () -> () loc("<stdin>":88:3)
  "builtin.module"() <{sym_name = "TestLocCallSite"}> ({
  ^bb0:
  }) {bytecode.loc = loc(callsite("foo" at "mysource.cc":10:8)), bytecode.loc2 = loc(callsite("a":1:1 at callsite("b":2:2 at "c":3:3)))} : () -> () loc("<stdin>":91:3)
  "builtin.module"() <{sym_name = "TestLocFileLineCol"}> ({
  ^bb0:
  }) {bytecode.loc = loc("mysource.cc":10:8), bytecode.loc2 = loc("source.cc":10:8 to 12:4), bytecode.loc3 = loc("source.cc":10:8 to :12), bytecode.loc4 = loc("file.cc":0:0), bytecode.loc5 = loc("file.cc":42:0)} : () -> () loc("<stdin>":94:3)
  "builtin.module"() <{sym_name = "TestLocFused"}> ({
  ^bb0:
  }) {bytecode.loc = loc(fused["foo", "mysource.cc":10:8]), bytecode.loc2 = loc(fused<"myPass">["foo", "foo2"])} : () -> () loc("<stdin>":97:3)
  "builtin.module"() <{sym_name = "TestLocName"}> ({
  ^bb0:
  }) {bytecode.loc = loc("foo"), bytecode.loc2 = loc("foo"("mysource.cc":10:8))} : () -> () loc("<stdin>":100:3)
  "builtin.module"() <{sym_name = "TestLocUnknown"}> ({
  ^bb0:
  }) {bytecode.loc = loc(unknown)} : () -> () loc("<stdin>":103:3)
  "builtin.module"() <{sym_name = "TestAffineMap"}> ({
  ^bb0:
  }) {bytecode.allops_combined = affine_map<(d0, d1)[s0] -> ((d0 * 5 + d1) floordiv 4, (d0 + d1 * 3) ceildiv s0, (d0 + d1) mod s0)>, bytecode.binop_add = affine_map<(d0, d1) -> (d0 + d1)>, bytecode.binop_ceildiv = affine_map<(d0) -> (d0 ceildiv 8)>, bytecode.binop_floordiv = affine_map<(d0) -> (d0 floordiv 4)>, bytecode.binop_mod = affine_map<(d0) -> (d0 mod 3)>, bytecode.binop_mul = affine_map<(d0) -> (d0 * 5)>, bytecode.dsc_const = affine_map<(d0) -> (d0 + 42)>, bytecode.dsc_dim_sym = affine_map<(d0)[s0] -> (d0 + s0)>, bytecode.dsc_multi_sym = affine_map<(d0, d1)[s0, s1] -> (d0 + s0, d1 + s1)>, bytecode.dsc_sym_only = affine_map<()[s0] -> (s0 + 7)>, bytecode.empty_map = affine_map<() -> ()>, bytecode.identity_1d = affine_map<(d0) -> (d0)>, bytecode.identity_3d = affine_map<(d0, d1, d2) -> (d0, d1, d2)>, bytecode.identity_large = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15) -> (d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15)>, bytecode.multi_mix = affine_map<(d0, d1) -> (d0 + d1, d0 * 2, d1 mod 5)>, bytecode.multi_mix_deep = affine_map<(d0, d1)[s0] -> (((d0 + d1) floordiv 4 + s0) ceildiv 2 + (d0 mod 3 + d1 * 5) floordiv 7)>, bytecode.multi_sym = affine_map<(d0, d1)[s0] -> (d0 floordiv s0, d1 ceildiv s0, d0 + d1 + s0)>, bytecode.perm_2d = affine_map<(d0, d1) -> (d1, d0)>, bytecode.perm_3d = affine_map<(d0, d1, d2) -> (d2, d0, d1)>, bytecode.projperm_4d = affine_map<(d0, d1, d2, d3) -> (d0, d2)>, bytecode.projperm_single = affine_map<(d0, d1, d2) -> (d2)>} : () -> () loc("<stdin>":106:3)
  "builtin.module"() <{sym_name = "TestIntegerSetAttr"}> ({
  ^bb0:
  }) {bytecode.complex = affine_set<(d0, d1)[s0] : (d0 * 2 + d1 == 0, d0 - s0 >= 0, d1 mod 3 >= 0)>, bytecode.eq = affine_set<(d0) : (d0 == 0)>, bytecode.eq_ineq = affine_set<(d0, d1) : (d0 == 0, d1 >= 0)>, bytecode.ineq = affine_set<(d0) : (d0 >= 0)>, bytecode.multi = affine_set<(d0, d1)[s0] : (d0 >= 0, -d0 + s0 >= 0, d1 >= 0)>, bytecode.multi_sym = affine_set<(d0)[s0, s1] : (d0 + s0 >= 0, d0 + s1 >= 0)>, bytecode.neg_const = affine_set<(d0) : (d0 + 42 == 0)>} : () -> () loc("<stdin>":109:3)
  "builtin.module"() <{sym_name = "TestDictionaryAttr"}> ({
  ^bb0:
  }) {bytecode.empty_dict = {}, bytecode.nested_dict = {inner = {a = 1 : i32}}} : () -> () loc("<stdin>":112:3)
  "builtin.module"() <{sym_name = "TestUnitAttr"}> ({
  ^bb0:
  }) {bytecode.unit} : () -> () loc("<stdin>":115:3)
  "builtin.module"() <{sym_name = "TestEmptyContainers"}> ({
  ^bb0:
  }) {bytecode.empty_arr = [], bytecode.empty_dense_arr = array<i32>, bytecode.empty_dict = {}, bytecode.empty_func = () -> (), bytecode.empty_map = affine_map<() -> ()>, bytecode.empty_str = "", bytecode.empty_tensor = dense<> : tensor<0xi32>, bytecode.empty_tuple = tuple<>} : () -> () loc("<stdin>":118:3)
  "builtin.module"() <{sym_name = "TestStridedLayoutAttr"}> ({
  ^bb0:
  }) {bytecode.dynamic = strided<[?, 1], offset: ?>, bytecode.static_strides = strided<[3, 1]>, bytecode.with_offset = strided<[3, 1], offset: 5>} : () -> () loc("<stdin>":121:3)
}) : () -> () loc("<stdin>":48:1)
