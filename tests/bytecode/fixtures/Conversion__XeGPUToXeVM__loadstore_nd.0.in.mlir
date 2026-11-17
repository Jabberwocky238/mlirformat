"builtin.module"() ({
  "gpu.module"() <{sym_name = "load_store_check"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf32, 1>, memref<8x16xf32, 1>) -> (), kernel}> ({
    ^bb0(%arg4: memref<8x16xf32, 1> loc("<stdin>":4:10), %arg5: memref<8x16xf32, 1> loc("<stdin>":4:38)):
      %14 = "memref.memory_space_cast"(%arg4) : (memref<8x16xf32, 1>) -> memref<8x16xf32> loc("<stdin>":5:13)
      %15 = "memref.memory_space_cast"(%arg5) : (memref<8x16xf32, 1>) -> memref<8x16xf32> loc("<stdin>":6:13)
      %16 = "xegpu.create_nd_tdesc"(%14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":7:13)
      %17 = "xegpu.load_nd"(%16) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32> loc("<stdin>":8:13)
      %18 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":9:13)
      %19 = "arith.index_cast"(%18) : (index) -> i32 loc("<stdin>":10:13)
      %20 = "arith.sitofp"(%19) : (i32) -> f32 loc("<stdin>":11:13)
      %21 = "vector.insert"(%20, %17) <{static_position = array<i64: 0>}> : (f32, vector<8xf32>) -> vector<8xf32> loc("<stdin>":12:13)
      %22 = "xegpu.create_nd_tdesc"(%15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":13:13)
      "xegpu.store_nd"(%21, %22) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>) -> () loc("<stdin>":14:7)
      "gpu.return"() : () -> () loc("<stdin>":15:7)
    }) {sym_name = "load_store"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<8x16xf32, 1>, memref<8x16xf32, 1>) -> (), kernel}> ({
    ^bb0(%arg2: memref<8x16xf32, 1> loc("<stdin>":18:10), %arg3: memref<8x16xf32, 1> loc("<stdin>":18:38)):
      %5 = "memref.memory_space_cast"(%arg2) : (memref<8x16xf32, 1>) -> memref<8x16xf32> loc("<stdin>":19:12)
      %6 = "memref.memory_space_cast"(%arg3) : (memref<8x16xf32, 1>) -> memref<8x16xf32> loc("<stdin>":20:12)
      %7 = "xegpu.create_nd_tdesc"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":21:12)
      %8 = "xegpu.load_nd"(%7) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>}> : (!xegpu.tensor_desc<8x16xf32>) -> vector<8xf32> loc("<stdin>":22:12)
      %9 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":23:12)
      %10 = "arith.index_cast"(%9) : (index) -> i32 loc("<stdin>":24:13)
      %11 = "arith.sitofp"(%10) : (i32) -> f32 loc("<stdin>":25:13)
      %12 = "vector.insert"(%11, %8) <{static_position = array<i64: 0>}> : (f32, vector<8xf32>) -> vector<8xf32> loc("<stdin>":26:13)
      %13 = "xegpu.create_nd_tdesc"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32> loc("<stdin>":27:13)
      "xegpu.store_nd"(%12, %13) <{const_offsets = array<i64: 0, 0>}> : (vector<8xf32>, !xegpu.tensor_desc<8x16xf32>) -> () loc("<stdin>":28:7)
      "gpu.return"() : () -> () loc("<stdin>":29:7)
    }) {sym_name = "load_store_with_partial_cache_hints"} : () -> () loc("<stdin>":17:5)
    "gpu.func"() <{function_type = (memref<32x16xi8, 1>, memref<32x16xi8, 1>) -> (), kernel}> ({
    ^bb0(%arg0: memref<32x16xi8, 1> loc("<stdin>":32:10), %arg1: memref<32x16xi8, 1> loc("<stdin>":32:38)):
      %0 = "memref.memory_space_cast"(%arg0) : (memref<32x16xi8, 1>) -> memref<32x16xi8> loc("<stdin>":33:12)
      %1 = "memref.memory_space_cast"(%arg1) : (memref<32x16xi8, 1>) -> memref<32x16xi8> loc("<stdin>":34:12)
      %2 = "xegpu.create_nd_tdesc"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x16xi8>) -> !xegpu.tensor_desc<32x16xi8> loc("<stdin>":35:12)
      %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>, l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : (!xegpu.tensor_desc<32x16xi8>) -> vector<32xi8> loc("<stdin>":36:12)
      %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":37:12)
      "vector.store"(%3, %1, %4, %4) : (vector<32xi8>, memref<32x16xi8>, index, index) -> () loc("<stdin>":38:7)
      "gpu.return"() : () -> () loc("<stdin>":39:7)
    }) {sym_name = "load_nd_8bit"} : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
