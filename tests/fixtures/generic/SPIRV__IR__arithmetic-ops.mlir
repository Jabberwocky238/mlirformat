"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "fadd_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FAdd"(%arg0, %arg0) : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "fdiv_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FDiv"(%arg0, %arg0) : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "fmod_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FMod"(%arg0, %arg0) : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "fmul_scalar"}> ({
  ^bb0(%arg1: f32):
    %1 = "spirv.FMul"(%arg1, %arg1) : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "fmul_vector"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "spirv.FMul"(%arg0, %arg0) : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "fnegate_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FNegate"(%arg0) : (f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "frem_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FRem"(%arg0, %arg0) : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "fsub_scalar"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.FSub"(%arg0, %arg0) : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "iadd_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.IAdd"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "imul_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.IMul"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "isub_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.ISub"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> !spirv.struct<(i32, i32)>, sym_name = "iadd_carry_scalar"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.IAddCarry"(%arg1, %arg1) : (i32, i32) -> !spirv.struct<(i32, i32)>
    "func.return"(%1) : (!spirv.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "iadd_carry_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.IAddCarry"(%arg0, %arg0) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    "func.return"(%0) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> !spirv.struct<(i32, i32)>, sym_name = "isub_borrow_scalar"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.ISubBorrow"(%arg1, %arg1) : (i32, i32) -> !spirv.struct<(i32, i32)>
    "func.return"(%1) : (!spirv.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "isub_borrow_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.ISubBorrow"(%arg0, %arg0) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    "func.return"(%0) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> f32, sym_name = "dot"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: vector<4xf32>):
    %0 = "spirv.Dot"(%arg0, %arg1) : (vector<4xf32>, vector<4xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xbf16>, vector<4xbf16>) -> bf16, sym_name = "dot_bf16"}> ({
  ^bb0(%arg0: vector<4xbf16>, %arg1: vector<4xbf16>):
    %0 = "spirv.Dot"(%arg0, %arg1) : (vector<4xbf16>, vector<4xbf16>) -> bf16
    "func.return"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> !spirv.struct<(i32, i32)>, sym_name = "smul_extended_scalar"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.SMulExtended"(%arg1, %arg1) : (i32, i32) -> !spirv.struct<(i32, i32)>
    "func.return"(%1) : (!spirv.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "smul_extended_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.SMulExtended"(%arg0, %arg0) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    "func.return"(%0) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> !spirv.struct<(i32, i32)>, sym_name = "umul_extended_scalar"}> ({
  ^bb0(%arg1: i32):
    %1 = "spirv.UMulExtended"(%arg1, %arg1) : (i32, i32) -> !spirv.struct<(i32, i32)>
    "func.return"(%1) : (!spirv.struct<(i32, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>, sym_name = "umul_extended_vector"}> ({
  ^bb0(%arg0: vector<3xi32>):
    %0 = "spirv.UMulExtended"(%arg0, %arg0) : (vector<3xi32>, vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    "func.return"(%0) : (!spirv.struct<(vector<3xi32>, vector<3xi32>)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "sdiv_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.SDiv"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "smod_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.SMod"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "snegate_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.SNegate"(%arg0) : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "srem_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.SRem"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "udiv_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.UDiv"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "umod_scalar"}> ({
  ^bb0(%arg0: i32):
    %0 = "spirv.UMod"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, f32) -> vector<4xf32>, sym_name = "vector_times_scalar"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: f32):
    %0 = "spirv.VectorTimesScalar"(%arg0, %arg1) : (vector<4xf32>, f32) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
