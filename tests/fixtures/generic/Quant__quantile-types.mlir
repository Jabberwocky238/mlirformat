"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui4:f16, {-1.000000e+00,-8.667000e-01,-7.333000e-01,-6.000000e-01,-4.667000e-01,-3.333000e-01,-2.000000e-01,-0.066699999999999995,0.066699999999999995,2.000000e-01,3.333000e-01,4.667000e-01,6.000000e-01,7.333000e-01,8.667000e-01,1.000000e+00}>) -> (), sym_name = "quantile_ui4_f16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<si8:f32, {-1.000000e+00,-5.000000e-01,0.000000e+00,5.000000e-01,1.000000e+00}, <-2:2>>) -> (), sym_name = "quantile_si8_f32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<i8:f32, {-1.000000e+00,0.000000e+00,1.000000e+00}, <-1:1>>) -> (), sym_name = "quantile_i8_f32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<f8E4M3FN:f32, {-1.000000e+00,0.000000e+00,1.000000e+00}, <-1:1>>) -> (), sym_name = "quantile_f8_f32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui4:bf16, {-1.000000e+00,-8.667000e-01,-7.333000e-01,-6.000000e-01,-4.667000e-01,-3.333000e-01,-2.000000e-01,-0.066699999999999995,0.066699999999999995,2.000000e-01,3.333000e-01,4.667000e-01,6.000000e-01,7.333000e-01,8.667000e-01,1.000000e+00}>) -> (), sym_name = "quantile_ui4_bf16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.quantile<ui4:f16, {-1.000000e+00,-8.667000e-01,-7.333000e-01,-6.000000e-01,-4.667000e-01,-3.333000e-01,-2.000000e-01,-0.066699999999999995,0.066699999999999995,2.000000e-01,3.333000e-01,4.667000e-01,6.000000e-01,7.333000e-01,8.667000e-01,1.000000e+00}>, sym_name = "quantile_as_return", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui4:f16, {-1.000000e+00,-0.69619280099868774,-0.52507305145263672,-0.39491748809814453,-0.28444138169288635,-0.18477343022823334,-0.091050036251544952,0.000000e+00,0.07958029955625534,0.16093020141124725,0.24611230194568634,0.33791524171829224,0.44070982933044434,0.56261700391769409,0.72295683622360229,1.000000e+00}>) -> (), sym_name = "nf4_16_values", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui4:f16, {-1.000000e+00,-7.500000e-01,-5.000000e-01,-2.500000e-01,0.000000e+00,2.500000e-01,5.000000e-01,1.000000e+00}, <0:7>>) -> (), sym_name = "quantile_with_range", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<si8:f32, {-1.000000e+00,0.000000e+00,1.000000e+00}, <-1:1>>) -> (), sym_name = "quantile_signed_range", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<si4:f32, {-2.000000e+00,-1.875000e+00,-1.750000e+00,-1.625000e+00,-1.500000e+00,-1.375000e+00,-1.250000e+00,-1.125000e+00,-1.000000e+00,-8.750000e-01,-7.500000e-01,-6.250000e-01,-5.000000e-01,-3.750000e-01,-2.500000e-01,-1.250000e-01}>) -> (), sym_name = "quantile_negatives", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui1:f16, {-1.000000e+00,1.000000e+00}>) -> (), sym_name = "quantile_ui1_f16", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui4:f16, {1.000000e+00,7.500000e-01,5.000000e-01,2.500000e-01,0.000000e+00,-2.500000e-01,-5.000000e-01,-1.000000e+00}, <0:7>>) -> (), sym_name = "quantile_descending", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!quant.quantile<ui4:f16, {0.000000e+00,-5.000000e-01,1.000000e+00,-2.500000e-01,7.500000e-01,-1.000000e+00,5.000000e-01,2.500000e-01}, <0:7>>) -> (), sym_name = "quantile_random_order", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

