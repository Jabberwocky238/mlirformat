"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf8E4M3FN>) -> (), sym_name = "cvt_float_e4m3fn_to_f16"}> ({
  ^bb0(%arg0: vector<8xf8E4M3FN> loc("<stdin>":3:8)):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf8E4M3FN>) -> vector<8xf16> loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
