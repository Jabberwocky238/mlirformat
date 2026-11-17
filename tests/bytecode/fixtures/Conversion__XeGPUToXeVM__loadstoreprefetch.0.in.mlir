"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (i64, vector<1xindex>, memref<1xf16>, vector<1xi1>) -> ()}> ({
    ^bb0(%arg0: i64 loc("<stdin>":4:10), %arg1: vector<1xindex> loc("<stdin>":4:22), %arg2: memref<1xf16> loc("<stdin>":4:46), %arg3: vector<1xi1> loc("<stdin>":4:68)):
      %0 = "xegpu.load"(%arg0, %arg1, %arg3) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (i64, vector<1xindex>, vector<1xi1>) -> vector<1xf16> loc("<stdin>":5:12)
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:12)
      "vector.store"(%0, %arg2, %1) : (vector<1xf16>, memref<1xf16>, index) -> () loc("<stdin>":7:7)
      "gpu.return"() : () -> () loc("<stdin>":8:7)
    }) {sym_name = "load_gather_i64_src_value_offset"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
