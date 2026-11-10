#distinct = distinct[0]<42 : i32>
#distinct1 = distinct[1]<42 : i32>
#loc = loc("foo")
#loc1 = loc("mysource.cc":10:8)
#loc2 = loc("a":1:1)
#loc3 = loc("b":2:2)
#loc4 = loc("c":3:3)
#loc5 = loc("source.cc":10:8 to 12:4)
#loc6 = loc("source.cc":10:8 to :12)
#loc7 = loc("file.cc":0:0)
#loc8 = loc("file.cc":42:0)
#loc9 = loc("foo2")
#loc10 = loc(unknown)
#map = affine_map<(d0, d1)[s0] -> ((d0 * 5 + d1) floordiv 4, (d0 + d1 * 3) ceildiv s0, (d0 + d1) mod s0)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0) -> (d0 ceildiv 8)>
#map3 = affine_map<(d0) -> (d0 floordiv 4)>
#map4 = affine_map<(d0) -> (d0 mod 3)>
#map5 = affine_map<(d0) -> (d0 * 5)>
#map6 = affine_map<(d0) -> (d0 + 42)>
#map7 = affine_map<(d0)[s0] -> (d0 + s0)>
#map8 = affine_map<(d0, d1)[s0, s1] -> (d0 + s0, d1 + s1)>
#map9 = affine_map<()[s0] -> (s0 + 7)>
#map10 = affine_map<() -> ()>
#map11 = affine_map<(d0) -> (d0)>
#map12 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map13 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15) -> (d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15)>
#map14 = affine_map<(d0, d1) -> (d0 + d1, d0 * 2, d1 mod 5)>
#map15 = affine_map<(d0, d1)[s0] -> (((d0 + d1) floordiv 4 + s0) ceildiv 2 + (d0 mod 3 + d1 * 5) floordiv 7)>
#map16 = affine_map<(d0, d1)[s0] -> (d0 floordiv s0, d1 ceildiv s0, d0 + d1 + s0)>
#map17 = affine_map<(d0, d1) -> (d1, d0)>
#map18 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map19 = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
#map20 = affine_map<(d0, d1, d2) -> (d2)>
#set = affine_set<(d0, d1)[s0] : (d0 * 2 + d1 == 0, d0 - s0 >= 0, d1 mod 3 >= 0)>
#set1 = affine_set<(d0) : (d0 == 0)>
#set2 = affine_set<(d0, d1) : (d0 == 0, d1 >= 0)>
#set3 = affine_set<(d0) : (d0 >= 0)>
#set4 = affine_set<(d0, d1)[s0] : (d0 >= 0, -d0 + s0 >= 0, d1 >= 0)>
#set5 = affine_set<(d0)[s0, s1] : (d0 + s0 >= 0, d0 + s1 >= 0)>
#set6 = affine_set<(d0) : (d0 + 42 == 0)>
#loc11 = loc(callsite(#loc at #loc1))
#loc12 = loc(callsite(#loc3 at #loc4))
#loc13 = loc(fused[#loc, #loc1])
#loc14 = loc(fused<"myPass">[#loc, #loc9])
#loc15 = loc("foo"(#loc1))
#loc16 = loc(callsite(#loc2 at #loc12))
module {
  module @TestArray attributes {bytecode.array = [unit]} {
  }
  module @TestDenseArray attributes {bytecode.test1 = array<i1: true, false, true, false, false>, bytecode.test2 = array<i8: 10, 32, -1>, bytecode.test3 = array<f64: 1.000000e+01, 3.200000e+01, 1.809000e+03>} {
  }
  module @TestDenseTypedElements attributes {bytecode.bf16 = dense<[-5.000000e-01, 5.000000e-01]> : tensor<2xbf16>, bytecode.complex_val = dense<(1.000000e+00,2.000000e+00)> : tensor<1xcomplex<f32>>, bytecode.f16 = dense<[1.500000e+00, 2.500000e+00]> : tensor<2xf16>, bytecode.i16 = dense<[100, -200]> : tensor<2xi16>, bytecode.i64 = dense<1000000> : tensor<4xi64>, bytecode.test1 = dense<true> : tensor<256xi1>, bytecode.test2 = dense<[10, 32, -1]> : tensor<3xi8>, bytecode.test3 = dense<[1.000000e+01, 3.200000e+01, 1.809000e+03]> : tensor<3xf64>} {
  }
  module @TestDenseI1SingleElement attributes {bytecode.false_1 = dense<false> : tensor<1xi1>, bytecode.true_1 = dense<true> : tensor<1xi1>} {
  }
  module @TestDenseI1EightElements attributes {bytecode.all_false_8 = dense<false> : tensor<8xi1>, bytecode.all_true_8 = dense<true> : tensor<8xi1>, bytecode.mixed_8 = dense<[true, false, true, false, true, false, true, false]> : tensor<8xi1>} {
  }
  module @TestDenseI1VariedSizes attributes {bytecode.i1_16 = dense<[true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false]> : tensor<16xi1>, bytecode.i1_2 = dense<[true, false]> : tensor<2xi1>, bytecode.i1_7 = dense<[true, false, true, false, true, false, true]> : tensor<7xi1>, bytecode.i1_9 = dense<[true, false, true, false, true, false, true, false, true]> : tensor<9xi1>} {
  }
  module @TestDenseStringElementsAttr attributes {bytecode.test1 = dense<"splat"> : tensor<256x!bytecode.string>, bytecode.test2 = dense<["foo", "bar", "baz"]> : tensor<3x!bytecode.string>} {
  }
  module @TestFloat attributes {bytecode.float = 1.000000e+01 : f64, bytecode.float1 = 0.100000000000000005551 : f80, bytecode.float2 = 0.100000000000000005551115123125782702 : f128, bytecode.float3 = -5.000000e-01 : bf16, bytecode.inf = 0x7FF0000000000000 : f64, bytecode.nan = 0x7FF8000000000000 : f64, bytecode.ninf = 0xFFF0000000000000 : f64} {
  }
  module @TestInt attributes {bytecode.int = false, bytecode.int1 = -1 : i8, bytecode.int2 = 800 : ui64, bytecode.int3 = 90000000000000000300000000000000000001 : i128, bytecode.int4 = true, bytecode.int5 = 42 : i32, bytecode.int6 = -100 : si32, bytecode.int7 = 7 : index} {
  }
  module @TestSparseElements attributes {bytecode.sparse = sparse<[[0, 0], [1, 2]], [1, 5]> : tensor<3x4xi32>, bytecode.sparse_1d = sparse<[1, 3], [1.000000e+01, 2.000000e+01]> : tensor<5xf32>} {
  }
  module @TestString attributes {bytecode.string = "hello", bytecode.string2 = "hello" : i32, bytecode.string3 = ""} {
  }
  module @TestSymbolRef attributes {bytecode.ref = @foo, bytecode.ref2 = @foo::@bar::@foo} {
  }
  module @TestType attributes {bytecode.type = i178} {
  }
  module @TestDistinct attributes {bytecode.distinct = #distinct, bytecode.distinct2 = #distinct, bytecode.distinct3 = #distinct1} {
  }
  module @TestLocCallSite attributes {bytecode.loc = #loc11, bytecode.loc2 = #loc16} {
  }
  module @TestLocFileLineCol attributes {bytecode.loc = #loc1, bytecode.loc2 = #loc5, bytecode.loc3 = #loc6, bytecode.loc4 = #loc7, bytecode.loc5 = #loc8} {
  }
  module @TestLocFused attributes {bytecode.loc = #loc13, bytecode.loc2 = #loc14} {
  }
  module @TestLocName attributes {bytecode.loc = #loc, bytecode.loc2 = #loc15} {
  }
  module @TestLocUnknown attributes {bytecode.loc = #loc10} {
  }
  module @TestAffineMap attributes {bytecode.allops_combined = #map, bytecode.binop_add = #map1, bytecode.binop_ceildiv = #map2, bytecode.binop_floordiv = #map3, bytecode.binop_mod = #map4, bytecode.binop_mul = #map5, bytecode.dsc_const = #map6, bytecode.dsc_dim_sym = #map7, bytecode.dsc_multi_sym = #map8, bytecode.dsc_sym_only = #map9, bytecode.empty_map = #map10, bytecode.identity_1d = #map11, bytecode.identity_3d = #map12, bytecode.identity_large = #map13, bytecode.multi_mix = #map14, bytecode.multi_mix_deep = #map15, bytecode.multi_sym = #map16, bytecode.perm_2d = #map17, bytecode.perm_3d = #map18, bytecode.projperm_4d = #map19, bytecode.projperm_single = #map20} {
  }
  module @TestIntegerSetAttr attributes {bytecode.complex = #set, bytecode.eq = #set1, bytecode.eq_ineq = #set2, bytecode.ineq = #set3, bytecode.multi = #set4, bytecode.multi_sym = #set5, bytecode.neg_const = #set6} {
  }
  module @TestDictionaryAttr attributes {bytecode.empty_dict = {}, bytecode.nested_dict = {inner = {a = 1 : i32}}} {
  }
  module @TestUnitAttr attributes {bytecode.unit} {
  }
  module @TestEmptyContainers attributes {bytecode.empty_arr = [], bytecode.empty_dense_arr = array<i32>, bytecode.empty_dict = {}, bytecode.empty_func = () -> (), bytecode.empty_map = #map10, bytecode.empty_str = "", bytecode.empty_tensor = dense<> : tensor<0xi32>, bytecode.empty_tuple = tuple<>} {
  }
  module @TestStridedLayoutAttr attributes {bytecode.dynamic = strided<[?, 1], offset: ?>, bytecode.static_strides = strided<[3, 1]>, bytecode.with_offset = strided<[3, 1], offset: 5>} {
  }
}

