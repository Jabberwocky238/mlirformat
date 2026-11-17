"builtin.module"() ({
  "wasmssa.func"() <{exported, functionType = (i32) -> i32, sym_name = "callee"}> ({
  ^bb0(%arg1: !wasmssa<local ref to i32> loc("<stdin>":3:8)):
    %3 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":4:10)
    "wasmssa.return"(%3) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{exported, functionType = (i32) -> i32, sym_name = "caller"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i32> loc("<stdin>":8:8)):
    %1 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":9:10)
    %2 = "wasmssa.call"(%1) <{callee = @callee}> : (i32) -> i32 loc("<stdin>":10:10)
    "wasmssa.return"(%2) : (i32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":7:3)
  "wasmssa.import_func"() <{importName = "foo", moduleName = "my_module", sym_name = "func_0", type = () -> i32}> {sym_visibility = "nested"} : () -> () loc("<stdin>":13:3)
  "wasmssa.func"() <{exported, functionType = () -> i32, sym_name = "user_of_func0"}> ({
    %0 = "wasmssa.call"() <{callee = @func_0}> : () -> i32 loc("<stdin>":15:10)
    "wasmssa.return"(%0) : (i32) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
