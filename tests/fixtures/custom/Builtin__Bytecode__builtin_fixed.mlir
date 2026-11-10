#distinct = distinct[0]<42 : i32>
#distinct1 = distinct[1]<42 : i32>
#loc = loc("callee")
#loc1 = loc("caller.cc":5:3)
#loc2 = loc("source.cc":10:8)
#loc3 = loc("source.cc":10:8 to 12:4)
#loc4 = loc("source.cc":10:8 to :12)
#loc5 = loc("source.cc":10:8 to 12:8)
#loc6 = loc("a")
#loc7 = loc("b":1:2)
#loc8 = loc("x")
#loc9 = loc("y")
#loc10 = loc("named")
#loc11 = loc("child.cc":1:1)
#loc12 = loc(unknown)
#map = affine_map<(d0, d1) -> (d0 floordiv 4, d1 mod 8)>
#map1 = affine_map<() -> (42)>
#map2 = affine_map<() -> ()>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<(d0, d1) -> (d0 + d1)>
#map5 = affine_map<(d0)[s0] -> (d0 + s0)>
#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0, d1) : (d0 == 0, d1 >= 0)>
#set2 = affine_set<(d0) : (d0 >= 0)>
#set3 = affine_set<(d0, d1)[s0] : (d0 >= 0, -d0 + s0 >= 0, d1 >= 0)>
#loc13 = loc(callsite(#loc at #loc1))
#loc14 = loc(fused[#loc6, #loc7])
#loc15 = loc(fused<"myPass">[#loc8, #loc9])
#loc16 = loc("named"(#loc11))
module {
  module @TestArrayAttr attributes {bytecode.empty = [], bytecode.nested = [[1 : i32, 2 : i32], [3 : i32]], bytecode.single = [unit]} {
  }
  module @TestDictionaryAttr attributes {bytecode.empty_dict = {}, bytecode.nested_dict = {inner = {a = 1 : i32}}} {
  }
  module @TestStringAttr attributes {bytecode.empty_str = "", bytecode.plain = "hello world", bytecode.typed = "typed" : i32} {
  }
  module @TestSymbolRefAttr attributes {bytecode.flat = @flat_sym, bytecode.nested = @root::@child1::@child2} {
  }
  module @TestTypeAttr attributes {bytecode.type_i32 = i32, bytecode.type_memref = memref<2x3xf32>} {
  }
  module @TestUnitAttr attributes {bytecode.unit} {
  }
  module @TestIntegerAttr attributes {bytecode.bool_false = false, bytecode.bool_true = true, bytecode.i128_large = 90000000000000000300000000000000000001 : i128, bytecode.i32_val = 42 : i32, bytecode.i8_neg = -1 : i8, bytecode.index_val = 7 : index, bytecode.si32_val = -100 : si32, bytecode.ui64_val = 800 : ui64} {
  }
  module @TestFloatAttr attributes {bytecode.bf16 = -5.000000e-01 : bf16, bytecode.f128 = 0.100000000000000005551115123125782702 : f128, bytecode.f16 = 1.500000e+00 : f16, bytecode.f32 = 3.140000e+00 : f32, bytecode.f4E2M1FN = 1.000000e+00 : f4E2M1FN, bytecode.f64 = 1.000000e+01 : f64, bytecode.f6E2M3FN = 1.000000e+00 : f6E2M3FN, bytecode.f6E3M2FN = 1.000000e+00 : f6E3M2FN, bytecode.f80 = 0.100000000000000005551 : f80, bytecode.f8E3M4 = 1.000000e+00 : f8E3M4, bytecode.f8E4M3 = 1.000000e+00 : f8E4M3, bytecode.f8E4M3B11FNUZ = 1.000000e+00 : f8E4M3B11FNUZ, bytecode.f8E4M3FN = 1.000000e+00 : f8E4M3FN, bytecode.f8E4M3FNUZ = 1.000000e+00 : f8E4M3FNUZ, bytecode.f8E5M2 = 1.000000e+00 : f8E5M2, bytecode.f8E5M2FNUZ = 1.000000e+00 : f8E5M2FNUZ, bytecode.f8E8M0FNU = 1.000000e+00 : f8E8M0FNU, bytecode.tf32 = 1.000000e+00 : tf32} {
  }
  module @TestDenseArrayAttr attributes {bytecode.bool_arr = array<i1: true, false, true>, bytecode.empty_arr = array<i32>, bytecode.f32_arr = array<f32: 1.000000e+00, 2.000000e+00>, bytecode.f64_arr = array<f64: 3.140000e+00>, bytecode.i16_arr = array<i16: 100, -200>, bytecode.i32_arr = array<i32: 1, 2, 3>, bytecode.i64_arr = array<i64: 1000000, -1000000>, bytecode.i8_arr = array<i8: 10, 32, -1>} {
  }
  module @TestDenseIntOrFPElementsAttr attributes {bytecode.dense_2d = dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>, bytecode.dense_f32 = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf32>, bytecode.dense_i1 = dense<[true, false, true]> : tensor<3xi1>, bytecode.dense_i8 = dense<[10, 20, 30]> : tensor<3xi8>, bytecode.splat_f32 = dense<1.000000e+00> : tensor<2x3xf32>, bytecode.splat_f64 = dense<0.000000e+00> : tensor<8xf64>, bytecode.splat_i1 = dense<true> : tensor<256xi1>, bytecode.splat_i32 = dense<42> : tensor<4x4xi32>} {
  }
  module @TestSparseElementsAttr attributes {bytecode.sparse = sparse<[[0, 0], [1, 2]], [1, 5]> : tensor<3x4xi32>, bytecode.sparse_1d = sparse<[1, 3], [1.000000e+01, 2.000000e+01]> : tensor<5xf32>} {
  }
  module @TestDistinctAttr attributes {bytecode.diff = #distinct, bytecode.same1 = #distinct1, bytecode.same2 = #distinct1} {
  }
  module @TestLocationAttrs attributes {bytecode.callsite = #loc13, bytecode.flc = #loc2, bytecode.flc_range1 = #loc3, bytecode.flc_range2 = #loc4, bytecode.flc_range3 = #loc5, bytecode.fused = #loc14, bytecode.fused_meta = #loc15, bytecode.name = #loc10, bytecode.name_child = #loc16, bytecode.unknown = #loc12} {
  }
  module @TestAllFloatTypes attributes {bytecode.bf16 = bf16, bytecode.f128 = f128, bytecode.f16 = f16, bytecode.f32 = f32, bytecode.f4E2M1FN = f4E2M1FN, bytecode.f64 = f64, bytecode.f6E2M3FN = f6E2M3FN, bytecode.f6E3M2FN = f6E3M2FN, bytecode.f80 = f80, bytecode.f8E3M4 = f8E3M4, bytecode.f8E4M3 = f8E4M3, bytecode.f8E4M3B11FNUZ = f8E4M3B11FNUZ, bytecode.f8E4M3FN = f8E4M3FN, bytecode.f8E4M3FNUZ = f8E4M3FNUZ, bytecode.f8E5M2 = f8E5M2, bytecode.f8E5M2FNUZ = f8E5M2FNUZ, bytecode.f8E8M0FNU = f8E8M0FNU, bytecode.tf32 = tf32} {
  }
  module @TestBasicTypes attributes {bytecode.i1 = i1, bytecode.i1024 = i1024, bytecode.i32 = i32, bytecode.i8 = i8, bytecode.index = index, bytecode.none = none, bytecode.si32 = si32, bytecode.token = token, bytecode.ui64 = ui64} {
  }
  module @TestFunctionType attributes {bytecode.empty_func = () -> (), bytecode.func_args = (i32, f64) -> i1, bytecode.func_multi_res = (i32) -> (f32, f64)} {
  }
  module @TestComplexType attributes {bytecode.c_f64 = complex<f64>, bytecode.c_i32 = complex<i32>} {
  }
  module @TestMemRefType attributes {bytecode.dynamic = memref<?x?xf32>, bytecode.simple = memref<2x3xf32>, bytecode.with_memspace = memref<4xi8, 1>} {
  }
  module @TestRankedTensorType attributes {bytecode.dynamic = tensor<?x32x?xf32>, bytecode.static = tensor<16x32xf64>, bytecode.with_encoding = tensor<16xf64, "sparse">} {
  }
  module @TestUnrankedTensorType attributes {bytecode.unranked = tensor<*xi8>} {
  }
  module @TestUnrankedMemRefType attributes {bytecode.plain = memref<*xi8>, bytecode.with_memspace = memref<*xi8, 1>} {
  }
  module @TestVectorType attributes {bytecode.all_scalable = vector<[4]x[4]xf16>, bytecode.fixed = vector<8x8x128xi8>, bytecode.scalable = vector<8x[8]xf32>} {
  }
  module @TestTupleType attributes {bytecode.empty_tuple = tuple<>, bytecode.mixed_tuple = tuple<i32, f64, index>} {
  }
  module @TestAffineMapAttr attributes {bytecode.complex = #map, bytecode.constant = #map1, bytecode.empty = #map2, bytecode.identity = #map3, bytecode.multi_dim = #map4, bytecode.with_symbol = #map5} {
  }
  module @TestIntegerSetAttr attributes {bytecode.eq = #set, bytecode.eq_ineq = #set1, bytecode.ineq = #set2, bytecode.multi = #set3} {
  }
  module @TestDenseResourceElementsAttr attributes {bytecode.resource = dense_resource<blob1> : tensor<3xi64>} {
  }
  module @TestDenseStringElementsAttr attributes {bytecode.dense_str = dense<["foo", "bar", "baz"]> : tensor<3x!bytecode.string>, bytecode.splat_str = dense<"splat"> : tensor<4x!bytecode.string>} {
  }
  module @TestStridedLayoutAttr attributes {bytecode.dynamic = strided<[?, 1], offset: ?>, bytecode.static_strides = strided<[3, 1]>, bytecode.with_offset = strided<[3, 1], offset: 5>} {
  }
}

{-#
  dialect_resources: {
    builtin: {
      blob1: "0x08000000010000000000000002000000000000000300000000000000"
    }
  }
#-}

