"builtin.module"() ({
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "convert_i32_u_to_f32"}> ({
    %14 = "wasmssa.const"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":3:11)
    %15 = "wasmssa.convert_u"(%14) : (i32) -> f32 loc("<stdin>":4:11)
    "wasmssa.return"(%15) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "convert_i32_s_to_f32"}> ({
    %12 = "wasmssa.const"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":8:11)
    %13 = "wasmssa.convert_s"(%12) : (i32) -> f32 loc("<stdin>":9:11)
    "wasmssa.return"(%13) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "convert_i64_u_to_f32"}> ({
    %10 = "wasmssa.const"() <{value = 17 : i64}> : () -> i64 loc("<stdin>":13:11)
    %11 = "wasmssa.convert_u"(%10) : (i64) -> f32 loc("<stdin>":14:11)
    "wasmssa.return"(%11) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "convert_i64s_to_f32"}> ({
    %8 = "wasmssa.const"() <{value = 10 : i64}> : () -> i64 loc("<stdin>":18:10)
    %9 = "wasmssa.convert_s"(%8) : (i64) -> f32 loc("<stdin>":19:10)
    "wasmssa.return"(%9) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "wasmssa.func"() <{functionType = () -> f64, sym_name = "convert_i32_u_to_f64"}> ({
    %6 = "wasmssa.const"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":23:10)
    %7 = "wasmssa.convert_u"(%6) : (i32) -> f64 loc("<stdin>":24:10)
    "wasmssa.return"(%7) : (f64) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "wasmssa.func"() <{functionType = () -> f64, sym_name = "convert_i32_s_to_f64"}> ({
    %4 = "wasmssa.const"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":28:10)
    %5 = "wasmssa.convert_s"(%4) : (i32) -> f64 loc("<stdin>":29:10)
    "wasmssa.return"(%5) : (f64) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "wasmssa.func"() <{functionType = () -> f64, sym_name = "convert_i64_u_to_f64"}> ({
    %2 = "wasmssa.const"() <{value = 17 : i64}> : () -> i64 loc("<stdin>":33:10)
    %3 = "wasmssa.convert_u"(%2) : (i64) -> f64 loc("<stdin>":34:10)
    "wasmssa.return"(%3) : (f64) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "wasmssa.func"() <{functionType = () -> f64, sym_name = "convert_i64s_to_f64"}> ({
    %0 = "wasmssa.const"() <{value = 10 : i64}> : () -> i64 loc("<stdin>":38:10)
    %1 = "wasmssa.convert_s"(%0) : (i64) -> f64 loc("<stdin>":39:10)
    "wasmssa.return"(%1) : (f64) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
