"builtin.module"() ({
  "func.func"() <{function_type = (bf16) -> bf16, sym_name = "basic_expansion"}> ({
  ^bb0(%arg0: bf16):
    %0 = "arith.constant"() <{value = 1.000000e+00 : bf16}> : () -> bf16
    %1 = "arith.addf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
    "func.return"(%1) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (bf16, bf16, bf16) -> i1, sym_name = "chained"}> ({
  ^bb0(%arg0: bf16, %arg1: bf16, %arg2: bf16):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
    %1 = "arith.mulf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
    %2 = "arith.cmpf"(%0, %1) <{fastmath = #arith.fastmath<none>, predicate = 5 : i64}> : (bf16, bf16) -> i1
    "func.return"(%2) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf8E4M3FNUZ>, memref<4xf8E4M3FNUZ>) -> (), sym_name = "memops"}> ({
  ^bb0(%arg0: memref<4xf8E4M3FNUZ>, %arg1: memref<4xf8E4M3FNUZ>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.load"(%arg0, %0) : (memref<4xf8E4M3FNUZ>, index) -> f8E4M3FNUZ
    "memref.store"(%2, %arg1, %0) : (f8E4M3FNUZ, memref<4xf8E4M3FNUZ>, index) -> ()
    %3 = "memref.load"(%arg0, %1) : (memref<4xf8E4M3FNUZ>, index) -> f8E4M3FNUZ
    %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FNUZ, f8E4M3FNUZ) -> f8E4M3FNUZ
    "memref.store"(%4, %arg1, %1) : (f8E4M3FNUZ, memref<4xf8E4M3FNUZ>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> vector<4xf32>, sym_name = "vectors"}> ({
  ^bb0(%arg0: vector<4xf8E4M3FNUZ>):
    %0 = "arith.mulf"(%arg0, %arg0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FNUZ>, vector<4xf8E4M3FNUZ>) -> vector<4xf8E4M3FNUZ>
    %1 = "arith.extf"(%0) : (vector<4xf8E4M3FNUZ>) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "no_expansion"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.addf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, bf16, bf16) -> bf16, sym_name = "no_promote_select"}> ({
  ^bb0(%arg0: i1, %arg1: bf16, %arg2: bf16):
    %0 = "arith.select"(%arg0, %arg1, %arg2) : (i1, bf16, bf16) -> bf16
    "func.return"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

