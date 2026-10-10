"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "ceildivi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.ceildivsi"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivi_index"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.ceildivsi"(%arg0, %arg1) : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "floordivi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.floordivsi"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "floordivi_index"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.floordivsi"(%arg0, %arg1) : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi32>, sym_name = "floordivi_vec"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "arith.floordivsi"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "ceildivui"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.ceildivui"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "ceildivui_index"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.ceildivui"(%arg0, %arg1) : (index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "maximumf"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "arith.maximumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> vector<4xf16>, sym_name = "maximumf_vector"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "arith.maximumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    "func.return"(%0) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "maxnumf"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "arith.maxnumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "minimumf"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "arith.minimumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "minnumf"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "arith.minnumf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> bf16, sym_name = "truncf_f32"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.truncf"(%arg0) : (f32) -> bf16
    "func.return"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xbf16>, sym_name = "truncf_vector_f32"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "arith.truncf"(%arg0) : (vector<4xf32>) -> vector<4xbf16>
    "func.return"(%0) : (vector<4xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f8E8M0FNU, sym_name = "truncf_f32_to_f8E8M0FNU"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.truncf"(%arg0) : (f32) -> f8E8M0FNU
    "func.return"(%0) : (f8E8M0FNU) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f8E8M0FNU, sym_name = "truncf_f16_to_f8E8M0FNU"}> ({
  ^bb0(%arg0: f16):
    %0 = "arith.truncf"(%arg0) : (f16) -> f8E8M0FNU
    "func.return"(%0) : (f8E8M0FNU) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf8E8M0FNU>, sym_name = "truncf_vector_f32_to_f8E8M0FNU"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "arith.truncf"(%arg0) : (vector<4xf32>) -> vector<4xf8E8M0FNU>
    "func.return"(%0) : (vector<4xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf8E8M0FNU>, sym_name = "truncf_vector_f16_to_f8E8M0FNU"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "arith.truncf"(%arg0) : (vector<4xf16>) -> vector<4xf8E8M0FNU>
    "func.return"(%0) : (vector<4xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xbf16>) -> vector<4xf8E8M0FNU>, sym_name = "truncf_vector_bf16_to_f8E8M0FNU"}> ({
  ^bb0(%arg0: vector<4xbf16>):
    %0 = "arith.truncf"(%arg0) : (vector<4xbf16>) -> vector<4xf8E8M0FNU>
    "func.return"(%0) : (vector<4xf8E8M0FNU>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f8E8M0FNU) -> f4E2M1FN, sym_name = "scaling_truncf_f32_to_f4E2M1FN"}> ({
  ^bb0(%arg0: f32, %arg1: f8E8M0FNU):
    %0 = "arith.scaling_truncf"(%arg0, %arg1) : (f32, f8E8M0FNU) -> f4E2M1FN
    "func.return"(%0) : (f4E2M1FN) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf8E8M0FNU>) -> vector<4xf6E3M2FN>, sym_name = "scaling_truncf_vector_f16_to_f6E3M2FN"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf8E8M0FNU>):
    %0 = "arith.scaling_truncf"(%arg0, %arg1) : (vector<4xf16>, vector<4xf8E8M0FNU>) -> vector<4xf6E3M2FN>
    "func.return"(%0) : (vector<4xf6E3M2FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> vector<4xf6E3M2FN>, sym_name = "scaling_truncf_propagate_rounding_mode_fast_math"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "arith.scaling_truncf"(%arg0, %arg1) <{fastmath = #arith.fastmath<fast>, roundingmode = 0 : i32}> : (vector<4xf16>, vector<4xf16>) -> vector<4xf6E3M2FN>
    "func.return"(%0) : (vector<4xf6E3M2FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16, f16) -> f4E2M1FN, sym_name = "scaling_truncf_f16_to_f4E2M1FN_using_f16_scales"}> ({
  ^bb0(%arg0: f16, %arg1: f16):
    %0 = "arith.scaling_truncf"(%arg0, %arg1) : (f16, f16) -> f4E2M1FN
    "func.return"(%0) : (f4E2M1FN) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf16>) -> vector<4xf4E2M1FN>, sym_name = "scaling_truncf_vector_f16_to_f4E2M1FN_using_f16_scales"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: vector<4xf16>):
    %0 = "arith.scaling_truncf"(%arg0, %arg1) : (vector<4xf16>, vector<4xf16>) -> vector<4xf4E2M1FN>
    "func.return"(%0) : (vector<4xf4E2M1FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f16, f8E5M2FNUZ) -> f4E2M1FN, sym_name = "invalid_scaling_truncf_to_f4E2M1FN"}> ({
  ^bb0(%arg0: f16, %arg1: f8E5M2FNUZ):
    %0 = "arith.scaling_truncf"(%arg0, %arg1) : (f16, f8E5M2FNUZ) -> f4E2M1FN
    "func.return"(%0) : (f4E2M1FN) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f8E8M0FNU) -> f32, sym_name = "extf_f8E8M0FNU_to_f32"}> ({
  ^bb0(%arg0: f8E8M0FNU):
    %0 = "arith.extf"(%arg0) : (f8E8M0FNU) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f8E8M0FNU) -> f16, sym_name = "extf_f8E8M0FNU_to_f16"}> ({
  ^bb0(%arg0: f8E8M0FNU):
    %0 = "arith.extf"(%arg0) : (f8E8M0FNU) -> f16
    "func.return"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E8M0FNU>) -> vector<4xf32>, sym_name = "extf_vector_f8E8M0FNU_to_f32"}> ({
  ^bb0(%arg0: vector<4xf8E8M0FNU>):
    %0 = "arith.extf"(%arg0) : (vector<4xf8E8M0FNU>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E8M0FNU>) -> vector<4xf16>, sym_name = "extf_vector_f8E8M0FNU_to_f16"}> ({
  ^bb0(%arg0: vector<4xf8E8M0FNU>):
    %0 = "arith.extf"(%arg0) : (vector<4xf8E8M0FNU>) -> vector<4xf16>
    "func.return"(%0) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E8M0FNU>) -> vector<4xbf16>, sym_name = "extf_vector_f8E8M0FNU_to_bf16"}> ({
  ^bb0(%arg0: vector<4xf8E8M0FNU>):
    %0 = "arith.extf"(%arg0) : (vector<4xf8E8M0FNU>) -> vector<4xbf16>
    "func.return"(%0) : (vector<4xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN, f8E8M0FNU) -> f32, sym_name = "scaling_extf_to_f32"}> ({
  ^bb0(%arg0: f4E2M1FN, %arg1: f8E8M0FNU):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (f4E2M1FN, f8E8M0FNU) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN, f16) -> f32, sym_name = "scaling_extf_to_f32_using_f16_scales"}> ({
  ^bb0(%arg0: f4E2M1FN, %arg1: f16):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (f4E2M1FN, f16) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN, f8E5M2FNUZ) -> f32, sym_name = "invalid_scaling_extf_to_f32"}> ({
  ^bb0(%arg0: f4E2M1FN, %arg1: f8E5M2FNUZ):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (f4E2M1FN, f8E5M2FNUZ) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<4xf32>, sym_name = "scaling_extf_vector_to_f32"}> ({
  ^bb0(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (vector<4xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<4xf16>, sym_name = "scaling_extf_vector_to_f16"}> ({
  ^bb0(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (vector<4xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<4xf16>
    "func.return"(%0) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<4xbf16>, sym_name = "scaling_extf_vector_to_bf16"}> ({
  ^bb0(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (vector<4xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<4xbf16>
    "func.return"(%0) : (vector<4xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, vector<4xf16>) -> vector<4xf32>, sym_name = "scaling_extf_vector_to_f32_using_f16_scales"}> ({
  ^bb0(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf16>):
    %0 = "arith.scaling_extf"(%arg0, %arg1) : (vector<4xf4E2M1FN>, vector<4xf16>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, vector<4xf16>) -> vector<4xf32>, sym_name = "scaling_extf_vector_to_f32_using_f16_scales_fastmath"}> ({
  ^bb0(%arg0: vector<4xf4E2M1FN>, %arg1: vector<4xf16>):
    %0 = "arith.scaling_extf"(%arg0, %arg1) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf4E2M1FN>, vector<4xf16>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "maxsi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.maxsi"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "minsi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.minsi"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "maxui"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.maxui"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "minui"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.minui"(%arg0, %arg1) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f4E2M1FN, sym_name = "truncf_f32_to_f4E2M1FN"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.truncf"(%arg0) : (f32) -> f4E2M1FN
    "func.return"(%0) : (f4E2M1FN) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf4E2M1FN>, sym_name = "truncf_vector_f32_to_f4E2M1FN"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "arith.truncf"(%arg0) : (vector<4xf32>) -> vector<4xf4E2M1FN>
    "func.return"(%0) : (vector<4xf4E2M1FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN) -> f32, sym_name = "extf_f4E2M1FN_to_f32"}> ({
  ^bb0(%arg0: f4E2M1FN):
    %0 = "arith.extf"(%arg0) : (f4E2M1FN) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf4E2M1FN>) -> vector<4xf32>, sym_name = "extf_vector_f4E2M1FN_to_f32"}> ({
  ^bb0(%arg0: vector<4xf4E2M1FN>):
    %0 = "arith.extf"(%arg0) : (vector<4xf4E2M1FN>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

