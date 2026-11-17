"builtin.module"() ({
  "wasmssa.global"() <{isMutable, sym_name = "global_i32", type = i32}> ({
    %4 = "wasmssa.const"() <{value = 66560 : i32}> : () -> i32 loc("<stdin>":3:10)
    "wasmssa.return"(%4) : (i32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.global"() <{isMutable, sym_name = "global_i64", type = i64}> ({
    %3 = "wasmssa.const"() <{value = 37017 : i64}> : () -> i64 loc("<stdin>":7:10)
    "wasmssa.return"(%3) : (i64) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "wasmssa.global"() <{isMutable, sym_name = "global_f32", type = f32}> ({
    %2 = "wasmssa.const"() <{value = 1.250000e-01 : f32}> : () -> f32 loc("<stdin>":11:10)
    "wasmssa.return"(%2) : (f32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "wasmssa.global"() <{isMutable, sym_name = "global_f64", type = f64}> ({
    %1 = "wasmssa.const"() <{value = 3.140000e+00 : f64}> : () -> f64 loc("<stdin>":15:10)
    "wasmssa.return"(%1) : (f64) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
  "wasmssa.global"() <{isMutable, sym_name = "global_user0", type = i32}> ({
    %0 = "wasmssa.global_get"() <{global = @global_top_define}> : () -> i32 loc("<stdin>":19:10)
    "wasmssa.return"(%0) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "wasmssa.import_global"() <{importName = "extern_global_var", moduleName = "module", sym_name = "global_top_define", type = i32}> : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
