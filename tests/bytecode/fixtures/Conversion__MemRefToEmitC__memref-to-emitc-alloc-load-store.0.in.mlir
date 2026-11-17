"builtin.module"() ({
  "func.func"() <{function_type = (f32, index, index) -> (), sym_name = "memref_alloc_store", sym_visibility = "private"}> ({
  ^bb0(%arg9: f32 loc("<stdin>":3:8), %arg10: index loc("<stdin>":3:20), %arg11: index loc("<stdin>":3:35)):
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32> loc("<stdin>":4:10)
    "memref.store"(%arg9, %7, %arg10, %arg11) : (f32, memref<4x8xf32>, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "memref_alloc_load", sym_visibility = "private"}> ({
  ^bb0(%arg7: index loc("<stdin>":9:8), %arg8: index loc("<stdin>":9:22)):
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32> loc("<stdin>":10:10)
    %6 = "memref.load"(%5, %arg7, %arg8) : (memref<4x8xf32>, index, index) -> f32 loc("<stdin>":11:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<2xf32>, memref<4x8xf32>, index, index) -> (), sym_name = "memref_load_store"}> ({
  ^bb0(%arg3: memref<2xf32> loc("<stdin>":15:8), %arg4: memref<4x8xf32> loc("<stdin>":15:30), %arg5: index loc("<stdin>":15:54), %arg6: index loc("<stdin>":15:68)):
    %4 = "memref.load"(%arg3, %arg5) : (memref<2xf32>, index) -> f32 loc("<stdin>":16:10)
    "memref.store"(%4, %arg4, %arg5, %arg6) : (f32, memref<4x8xf32>, index, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "memref_alloc_store_rank0", sym_visibility = "private"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":21:8)):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":22:10)
    "memref.store"(%arg2, %3) : (i32, memref<i32>) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> i32, sym_name = "memref_alloc_load_rank0", sym_visibility = "private"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":27:10)
    %2 = "memref.load"(%1) : (memref<i32>) -> i32 loc("<stdin>":28:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "memref_load_store_rank0"}> ({
  ^bb0(%arg0: memref<i32> loc("<stdin>":32:8), %arg1: memref<i32> loc("<stdin>":32:28)):
    %0 = "memref.load"(%arg0) : (memref<i32>) -> i32 loc("<stdin>":33:10)
    "memref.store"(%0, %arg1) : (i32, memref<i32>) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":1:1)
