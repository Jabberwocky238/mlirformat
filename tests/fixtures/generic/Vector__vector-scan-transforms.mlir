"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi32>, vector<i32>) -> (vector<2xi32>, vector<i32>), sym_name = "scan1d_inc"}> ({
  ^bb0(%arg0: vector<2xi32>, %arg1: vector<i32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<2xi32>, vector<i32>) -> (vector<2xi32>, vector<i32>)
    "func.return"(%0#0, %0#1) : (vector<2xi32>, vector<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xi32>, vector<i32>) -> (vector<[2]xi32>, vector<i32>), sym_name = "scan1d_inc_scalable"}> ({
  ^bb0(%arg0: vector<[2]xi32>, %arg1: vector<i32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<[2]xi32>, vector<i32>) -> (vector<[2]xi32>, vector<i32>)
    "func.return"(%0#0, %0#1) : (vector<[2]xi32>, vector<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi32>, vector<i32>) -> (vector<2xi32>, vector<i32>), sym_name = "scan1d_exc"}> ({
  ^bb0(%arg0: vector<2xi32>, %arg1: vector<i32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = false, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<2xi32>, vector<i32>) -> (vector<2xi32>, vector<i32>)
    "func.return"(%0#0, %0#1) : (vector<2xi32>, vector<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xi32>, vector<i32>) -> (vector<[2]xi32>, vector<i32>), sym_name = "scan1d_exc_scalable"}> ({
  ^bb0(%arg0: vector<[2]xi32>, %arg1: vector<i32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = false, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<[2]xi32>, vector<i32>) -> (vector<[2]xi32>, vector<i32>)
    "func.return"(%0#0, %0#1) : (vector<[2]xi32>, vector<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi32>, vector<3xi32>) -> (vector<2x3xi32>, vector<3xi32>), sym_name = "scan2d_mul_dim0"}> ({
  ^bb0(%arg0: vector<2x3xi32>, %arg1: vector<3xi32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<mul>, reduction_dim = 0 : i64}> : (vector<2x3xi32>, vector<3xi32>) -> (vector<2x3xi32>, vector<3xi32>)
    "func.return"(%0#0, %0#1) : (vector<2x3xi32>, vector<3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[3]xi32>, vector<[3]xi32>) -> (vector<2x[3]xi32>, vector<[3]xi32>), sym_name = "scan2d_mul_dim0_scalable"}> ({
  ^bb0(%arg0: vector<2x[3]xi32>, %arg1: vector<[3]xi32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<mul>, reduction_dim = 0 : i64}> : (vector<2x[3]xi32>, vector<[3]xi32>) -> (vector<2x[3]xi32>, vector<[3]xi32>)
    "func.return"(%0#0, %0#1) : (vector<2x[3]xi32>, vector<[3]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xi32>, vector<2xi32>) -> (vector<2x3xi32>, vector<2xi32>), sym_name = "scan2d_mul_dim1"}> ({
  ^bb0(%arg0: vector<2x3xi32>, %arg1: vector<2xi32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<mul>, reduction_dim = 1 : i64}> : (vector<2x3xi32>, vector<2xi32>) -> (vector<2x3xi32>, vector<2xi32>)
    "func.return"(%0#0, %0#1) : (vector<2x3xi32>, vector<2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x3xi32>, vector<[2]xi32>) -> (vector<[2]x3xi32>, vector<[2]xi32>), sym_name = "scan2d_mul_dim1_scalable"}> ({
  ^bb0(%arg0: vector<[2]x3xi32>, %arg1: vector<[2]xi32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = true, kind = #vector.kind<mul>, reduction_dim = 1 : i64}> : (vector<[2]x3xi32>, vector<[2]xi32>) -> (vector<[2]x3xi32>, vector<[2]xi32>)
    "func.return"(%0#0, %0#1) : (vector<[2]x3xi32>, vector<[2]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2x3xf32>, vector<4x3xf32>) -> (vector<4x2x3xf32>, vector<4x3xf32>), sym_name = "scan3d_mul_dim1"}> ({
  ^bb0(%arg0: vector<4x2x3xf32>, %arg1: vector<4x3xf32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = false, kind = #vector.kind<mul>, reduction_dim = 1 : i64}> : (vector<4x2x3xf32>, vector<4x3xf32>) -> (vector<4x2x3xf32>, vector<4x3xf32>)
    "func.return"(%0#0, %0#1) : (vector<4x2x3xf32>, vector<4x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2x[3]xf32>, vector<4x[3]xf32>) -> (vector<4x2x[3]xf32>, vector<4x[3]xf32>), sym_name = "scan3d_mul_dim1_scalable"}> ({
  ^bb0(%arg0: vector<4x2x[3]xf32>, %arg1: vector<4x[3]xf32>):
    %0:2 = "vector.scan"(%arg0, %arg1) <{inclusive = false, kind = #vector.kind<mul>, reduction_dim = 1 : i64}> : (vector<4x2x[3]xf32>, vector<4x[3]xf32>) -> (vector<4x2x[3]xf32>, vector<4x[3]xf32>)
    "func.return"(%0#0, %0#1) : (vector<4x2x[3]xf32>, vector<4x[3]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

