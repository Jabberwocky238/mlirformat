"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, i64) -> vector<[8]xf32>, sym_name = "cos"}> ({
  ^bb0(%arg0: vector<[8]xf32>, %arg1: i64):
    %0 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%0) : (vector<[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[32]xf32>, i64) -> vector<[32]xf32>, sym_name = "cos_req_legalization"}> ({
  ^bb0(%arg0: vector<[32]xf32>, %arg1: i64):
    %0 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[32]xf32>) -> vector<[32]xf32>
    "func.return"(%0) : (vector<[32]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, i64) -> vector<8xf32>, sym_name = "cos_fixed"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: i64):
    %0 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, i64) -> vector<[8]xf32>, sym_name = "sin"}> ({
  ^bb0(%arg0: vector<[8]xf32>, %arg1: i64):
    %0 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%0) : (vector<[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[32]xf32>, i64) -> vector<[32]xf32>, sym_name = "sin_req_legalization"}> ({
  ^bb0(%arg0: vector<[32]xf32>, %arg1: i64):
    %0 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[32]xf32>) -> vector<[32]xf32>
    "func.return"(%0) : (vector<[32]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, i64) -> vector<8xf32>, sym_name = "sin_fixed"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: i64):
    %0 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, i64) -> vector<[8]xf32>, sym_name = "tan"}> ({
  ^bb0(%arg0: vector<[8]xf32>, %arg1: i64):
    %0 = "math.tan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%0) : (vector<[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[32]xf32>, i64) -> vector<[32]xf32>, sym_name = "tan_req_legalization"}> ({
  ^bb0(%arg0: vector<[32]xf32>, %arg1: i64):
    %0 = "math.tan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[32]xf32>) -> vector<[32]xf32>
    "func.return"(%0) : (vector<[32]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, i64) -> vector<8xf32>, sym_name = "tan_fixed"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: i64):
    %0 = "math.tan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, i64) -> vector<[8]xf32>, sym_name = "log"}> ({
  ^bb0(%arg0: vector<[8]xf32>, %arg1: i64):
    %0 = "math.log"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%0) : (vector<[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[32]xf32>, i64) -> vector<[32]xf32>, sym_name = "log_req_legalization"}> ({
  ^bb0(%arg0: vector<[32]xf32>, %arg1: i64):
    %0 = "math.log"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[32]xf32>) -> vector<[32]xf32>
    "func.return"(%0) : (vector<[32]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, i64) -> vector<8xf32>, sym_name = "log_fixed"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: i64):
    %0 = "math.log"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "no_vector_type"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

