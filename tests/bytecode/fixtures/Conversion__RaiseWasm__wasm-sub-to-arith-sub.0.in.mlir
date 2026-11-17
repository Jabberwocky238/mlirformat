"builtin.module"() ({
  "wasmssa.func"() <{functionType = (i32, i32) -> i32, sym_name = "func_1"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i32> loc("<stdin>":3:8), %arg1: !wasmssa<local ref to i32> loc("<stdin>":3:43)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":4:10)
    %1 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":5:10)
    %2 = "wasmssa.sub"(%0, %1) : (i32, i32) -> i32 loc("<stdin>":6:10)
    "wasmssa.return"(%2) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
