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
"builtin.module"() ({
  "builtin.module"() <{sym_name = "TestArray"}> ({
  ^bb0:
  }) {bytecode.array = [unit]} : () -> ()
  "builtin.module"() <{sym_name = "TestDenseArray"}> ({
  ^bb0:
  }) {bytecode.test1 = array<i1: true, false, true, false, false>, bytecode.test2 = array<i8: 10, 32, -1>, bytecode.test3 = array<f64: 1.000000e+01, 3.200000e+01, 1.809000e+03>} : () -> ()
  "builtin.module"() <{sym_name = "TestDenseIntOrFPElements"}> ({
  ^bb0:
  }) {bytecode.test1 = dense<true> : tensor<256xi1>, bytecode.test2 = dense<[10, 32, -1]> : tensor<3xi8>, bytecode.test3 = dense<[1.000000e+01, 3.200000e+01, 1.809000e+03]> : tensor<3xf64>} : () -> ()
  "builtin.module"() <{sym_name = "TestDenseStringElementsAttr"}> ({
  ^bb0:
  }) {bytecode.test1 = dense<"splat"> : tensor<256x!bytecode.string>, bytecode.test2 = dense<["foo", "bar", "baz"]> : tensor<3x!bytecode.string>} : () -> ()
  "builtin.module"() <{sym_name = "TestFloat"}> ({
  ^bb0:
  }) {bytecode.float = 1.000000e+01 : f64, bytecode.float1 = 0.100000000000000005551 : f80, bytecode.float2 = 0.100000000000000005551115123125782702 : f128, bytecode.float3 = -5.000000e-01 : bf16} : () -> ()
  "builtin.module"() <{sym_name = "TestInt"}> ({
  ^bb0:
  }) {bytecode.int = false, bytecode.int1 = -1 : i8, bytecode.int2 = 800 : ui64, bytecode.int3 = 90000000000000000300000000000000000001 : i128} : () -> ()
  "builtin.module"() <{sym_name = "TestSparseElements"}> ({
  ^bb0:
  }) {bytecode.sparse = sparse<[[0, 0], [1, 2]], [1, 5]> : tensor<3x4xi32>} : () -> ()
  "builtin.module"() <{sym_name = "TestString"}> ({
  ^bb0:
  }) {bytecode.string = "hello", bytecode.string2 = "hello" : i32} : () -> ()
  "builtin.module"() <{sym_name = "TestSymbolRef"}> ({
  ^bb0:
  }) {bytecode.ref = @foo, bytecode.ref2 = @foo::@bar::@foo} : () -> ()
  "builtin.module"() <{sym_name = "TestType"}> ({
  ^bb0:
  }) {bytecode.type = i178} : () -> ()
  "builtin.module"() <{sym_name = "TestDistinct"}> ({
  ^bb0:
  }) {bytecode.distinct = #distinct, bytecode.distinct2 = #distinct, bytecode.distinct3 = #distinct1} : () -> ()
  "builtin.module"() <{sym_name = "TestLocCallSite"}> ({
  ^bb0:
  }) {bytecode.loc = #loc4} : () -> ()
  "builtin.module"() <{sym_name = "TestLocFileLineCol"}> ({
  ^bb0:
  }) {bytecode.loc = #loc1} : () -> ()
  "builtin.module"() <{sym_name = "TestLocFused"}> ({
  ^bb0:
  }) {bytecode.loc = #loc5, bytecode.loc2 = #loc6} : () -> ()
  "builtin.module"() <{sym_name = "TestLocName"}> ({
  ^bb0:
  }) {bytecode.loc = #loc, bytecode.loc2 = #loc7} : () -> ()
  "builtin.module"() <{sym_name = "TestLocUnknown"}> ({
  ^bb0:
  }) {bytecode.loc = #loc3} : () -> ()
}) : () -> ()

