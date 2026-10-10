"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memref_i32"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi32, 1>
    %3 = "memref.load"(%2, %0) : (memref<4xi32, 1>, index) -> i32
    "memref.store"(%1, %2, %0) : (i32, memref<4xi32, 1>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memref_f32"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32, 1>
    %3 = "memref.load"(%2, %0) : (memref<4xf32, 1>, index) -> f32
    "memref.store"(%1, %2, %0) : (f32, memref<4xf32, 1>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloc_load_store_i64"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi64, 1>
    %3 = "memref.load"(%2, %0) : (memref<4xi64, 1>, index) -> i64
    "memref.store"(%1, %2, %0) : (i64, memref<4xi64, 1>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloc_load_store_i64_nontemporal"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi64, 1>
    %3 = "memref.load"(%2, %0) <{nontemporal = true}> : (memref<4xi64, 1>, index) -> i64
    "memref.store"(%1, %2, %0) <{nontemporal = true}> : (i64, memref<4xi64, 1>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloc_i128"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi128, 1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xi128, 1>) -> (), sym_name = "load_i128"}> ({
  ^bb0(%arg0: memref<4xi128, 1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.load"(%arg0, %0) : (memref<4xi128, 1>, index) -> i128
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i128, memref<4xi128, 1>) -> (), sym_name = "store_i128"}> ({
  ^bb0(%arg0: i128, %arg1: memref<4xi128, 1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "memref.store"(%arg0, %arg1, %0) : (i128, memref<4xi128, 1>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

