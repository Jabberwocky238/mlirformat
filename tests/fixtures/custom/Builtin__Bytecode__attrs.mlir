#distinct = distinct[0]<42 : i32>
#distinct1 = distinct[1]<42 : i32>
#loc = loc("foo")
#loc1 = loc("mysource.cc":10:8)
#loc2 = loc("foo2")
#loc3 = loc(unknown)
#loc4 = loc(callsite(#loc at #loc1))
#loc5 = loc(fused[#loc, #loc1])
#loc6 = loc(fused<"myPass">[#loc, #loc2])
#loc7 = loc("foo"(#loc1))
module {
  module @TestArray attributes {bytecode.array = [unit]} {
  }
  module @TestDenseArray attributes {bytecode.test1 = array<i1: true, false, true, false, false>, bytecode.test2 = array<i8: 10, 32, -1>, bytecode.test3 = array<f64: 1.000000e+01, 3.200000e+01, 1.809000e+03>} {
  }
  module @TestDenseIntOrFPElements attributes {bytecode.test1 = dense<true> : tensor<256xi1>, bytecode.test2 = dense<[10, 32, -1]> : tensor<3xi8>, bytecode.test3 = dense<[1.000000e+01, 3.200000e+01, 1.809000e+03]> : tensor<3xf64>} {
  }
  module @TestDenseStringElementsAttr attributes {bytecode.test1 = dense<"splat"> : tensor<256x!bytecode.string>, bytecode.test2 = dense<["foo", "bar", "baz"]> : tensor<3x!bytecode.string>} {
  }
  module @TestFloat attributes {bytecode.float = 1.000000e+01 : f64, bytecode.float1 = 0.100000000000000005551 : f80, bytecode.float2 = 0.100000000000000005551115123125782702 : f128, bytecode.float3 = -5.000000e-01 : bf16} {
  }
  module @TestInt attributes {bytecode.int = false, bytecode.int1 = -1 : i8, bytecode.int2 = 800 : ui64, bytecode.int3 = 90000000000000000300000000000000000001 : i128} {
  }
  module @TestSparseElements attributes {bytecode.sparse = sparse<[[0, 0], [1, 2]], [1, 5]> : tensor<3x4xi32>} {
  }
  module @TestString attributes {bytecode.string = "hello", bytecode.string2 = "hello" : i32} {
  }
  module @TestSymbolRef attributes {bytecode.ref = @foo, bytecode.ref2 = @foo::@bar::@foo} {
  }
  module @TestType attributes {bytecode.type = i178} {
  }
  module @TestDistinct attributes {bytecode.distinct = #distinct, bytecode.distinct2 = #distinct, bytecode.distinct3 = #distinct1} {
  }
  module @TestLocCallSite attributes {bytecode.loc = #loc4} {
  }
  module @TestLocFileLineCol attributes {bytecode.loc = #loc1} {
  }
  module @TestLocFused attributes {bytecode.loc = #loc5, bytecode.loc2 = #loc6} {
  }
  module @TestLocName attributes {bytecode.loc = #loc, bytecode.loc2 = #loc7} {
  }
  module @TestLocUnknown attributes {bytecode.loc = #loc3} {
  }
}

