"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> f32, sym_name = "extract"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 1>}> : (vector<2xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>) -> f32, sym_name = "extract_size1_vector"}> ({
  ^bb0(%arg0: vector<1xf32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 0>}> : (vector<1xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, f32) -> vector<4xf32>, sym_name = "insert"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: f32):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 2>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xindex>, index) -> vector<4xindex>, sym_name = "insert_index_vector"}> ({
  ^bb0(%arg0: vector<4xindex>, %arg1: index):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 2>}> : (index, vector<4xindex>) -> vector<4xindex>
    "func.return"(%0) : (vector<4xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, f32) -> vector<1xf32>, sym_name = "insert_size1_vector"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: f32):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0>}> : (f32, vector<1xf32>) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, vector<3xf32>) -> vector<3xf32>, sym_name = "insert_size1_vector"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: vector<3xf32>):
    %0 = "vector.insert_strided_slice"(%arg0, %arg1) <{offsets = [2], strides = [1]}> : (vector<1xf32>, vector<3xf32>) -> vector<3xf32>
    "func.return"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "fma"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>):
    %0 = "vector.fma"(%arg0, %arg1, %arg2) : (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, vector<1xf32>, vector<1xf32>) -> vector<1xf32>, sym_name = "fma_size1_vector"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: vector<1xf32>, %arg2: vector<1xf32>):
    %0 = "vector.fma"(%arg0, %arg1, %arg2) : (vector<1xf32>, vector<1xf32>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "splat"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1xf32>, sym_name = "splat_size1_vector"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "scalar_broadcast"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1xf32>, sym_name = "scalar_broadcast_size1_vector"}> ({
  ^bb0(%arg0: f32):
    %0 = "vector.broadcast"(%arg0) : (f32) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, vector<1xf32>) -> vector<4xf32>, sym_name = "shuffle"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: vector<1xf32>):
    %0 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 0, 1, 1, 0>}> : (vector<1xf32>, vector<1xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, vector<3xf32>) -> vector<4xf32>, sym_name = "shuffle"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: vector<3xf32>):
    %0 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 3, 2, 5, 1>}> : (vector<3xf32>, vector<3xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xi32>, vector<3xi32>) -> vector<3xi32>, sym_name = "shuffle"}> ({
  ^bb0(%arg0: vector<1xi32>, %arg1: vector<3xi32>):
    %0 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 0, 2, 3>}> : (vector<1xi32>, vector<3xi32>) -> vector<3xi32>
    "func.return"(%0) : (vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xi32>, vector<1xi32>) -> vector<2xi32>, sym_name = "shuffle"}> ({
  ^bb0(%arg0: vector<1xi32>, %arg1: vector<1xi32>):
    %0 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 0, 1>}> : (vector<1xi32>, vector<1xi32>) -> vector<2xi32>
    "func.return"(%0) : (vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<2xf32>) -> vector<4xf32>, sym_name = "interleave"}> ({
  ^bb0(%arg0: vector<2xf32>, %arg1: vector<2xf32>):
    %0 = "vector.interleave"(%arg0, %arg1) : (vector<2xf32>, vector<2xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, vector<1xf32>) -> vector<2xf32>, sym_name = "interleave_size1"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: vector<1xf32>):
    %0 = "vector.interleave"(%arg0, %arg1) : (vector<1xf32>, vector<1xf32>) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>) -> i32, sym_name = "reduction_add"}> ({
  ^bb0(%arg0: vector<4xi32>):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>) -> f32, sym_name = "reduction_addf_one_elem"}> ({
  ^bb0(%arg0: vector<1xf32>):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, f32) -> f32, sym_name = "reduction_addf_one_elem_acc"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: f32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, f32) -> f32, sym_name = "reduction_mul"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: f32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<3xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, f32) -> f32, sym_name = "reduction_maximumf"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: f32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<3xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, f32) -> f32, sym_name = "reduction_minimumf"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: f32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<3xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, f32) -> f32, sym_name = "reduction_minnumf"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: f32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<3xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf32>, f32) -> f32, sym_name = "reduction_maxnumf"}> ({
  ^bb0(%arg0: vector<3xf32>, %arg1: f32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<3xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, i32) -> i32, sym_name = "reduction_maxsi"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: i32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<3xi32>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, i32) -> i32, sym_name = "reduction_minsi"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: i32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<3xi32>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, i32) -> i32, sym_name = "reduction_maxui"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: i32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxui>}> : (vector<3xi32>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi32>, i32) -> i32, sym_name = "reduction_minui"}> ({
  ^bb0(%arg0: vector<3xi32>, %arg1: i32):
    %0 = "vector.reduction"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minui>}> : (vector<3xi32>, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2xf32>, sym_name = "shape_cast_same_type"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<2xf32>) -> vector<2xf32>
    "func.return"(%arg0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> vector<1xf32>, sym_name = "shape_cast_size1_vector"}> ({
  ^bb0(%arg0: vector<f32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<f32>) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

