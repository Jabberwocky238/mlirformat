"builtin.module"() ({
  "wasmssa.func"() <{functionType = (i64) -> i32, sym_name = "i64_wrap"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i64> loc("<stdin>":3:8)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":4:10)
    %1 = "wasmssa.wrap"(%0) : (i64) -> i32 loc("<stdin>":5:10)
    "wasmssa.return"(%1) : (i32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
