"builtin.module"() ({
  "wasmssa.import_global"() <{importName = "from_js", moduleName = "env", sym_name = "global_0", type = i32}> : () -> () loc("<stdin>":2:3)
  "wasmssa.global"() <{sym_name = "global_1", type = i32}> ({
    %3 = "wasmssa.const"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":4:10)
    "wasmssa.return"(%3) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
  "wasmssa.global"() <{isMutable, sym_name = "global_2", type = i32}> ({
    %2 = "wasmssa.const"() <{value = 17 : i32}> : () -> i32 loc("<stdin>":8:10)
    "wasmssa.return"(%2) : (i32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":7:3)
  "wasmssa.global"() <{isMutable, sym_name = "global_3", type = i32}> ({
    %1 = "wasmssa.const"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":12:10)
    "wasmssa.return"(%1) : (i32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":11:3)
  "wasmssa.global"() <{sym_name = "global_4", type = i32}> ({
    %0 = "wasmssa.global_get"() <{global = @global_0}> : () -> i32 loc("<stdin>":16:10)
    "wasmssa.return"(%0) : (i32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
