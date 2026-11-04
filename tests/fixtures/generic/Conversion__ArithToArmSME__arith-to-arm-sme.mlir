"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_i8"}> ({
    %0 = "arith.constant"() <{value = dense<0> : vector<[16]x[16]xi8>}> : () -> vector<[16]x[16]xi8>
    "prevent.dce"(%0) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_i16"}> ({
    %0 = "arith.constant"() <{value = dense<0> : vector<[8]x[8]xi16>}> : () -> vector<[8]x[8]xi16>
    "prevent.dce"(%0) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_i32"}> ({
    %0 = "arith.constant"() <{value = dense<0> : vector<[4]x[4]xi32>}> : () -> vector<[4]x[4]xi32>
    "prevent.dce"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_i64"}> ({
    %0 = "arith.constant"() <{value = dense<0> : vector<[2]x[2]xi64>}> : () -> vector<[2]x[2]xi64>
    "prevent.dce"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_f16"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xf16>}> : () -> vector<[8]x[8]xf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_bf16"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xbf16>}> : () -> vector<[8]x[8]xbf16>
    "prevent.dce"(%0) : (vector<[8]x[8]xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_f32"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[4]x[4]xf32>}> : () -> vector<[4]x[4]xf32>
    "prevent.dce"(%0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_zero_f64"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[2]x[2]xf64>}> : () -> vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_nonzero_i8"}> ({
    %0 = "arith.constant"() <{value = dense<2> : vector<[16]x[16]xi8>}> : () -> vector<[16]x[16]xi8>
    "prevent.dce"(%0) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constant_dense_2d_nonzero_f64"}> ({
    %0 = "arith.constant"() <{value = dense<2.000000e+00> : vector<[2]x[2]xf64>}> : () -> vector<[2]x[2]xf64>
    "prevent.dce"(%0) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

