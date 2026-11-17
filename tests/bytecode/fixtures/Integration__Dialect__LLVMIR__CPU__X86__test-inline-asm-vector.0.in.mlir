"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> (), sym_name = "function_to_run"}> ({
  ^bb0(%arg2: vector<8xf32> loc("<stdin>":3:8), %arg3: vector<8xf32> loc("<stdin>":3:30)):
    %2 = "llvm.inline_asm"(%arg2, %arg3) <{asm_dialect = 1 : i64, asm_string = "vaddps $0, $1, $2", constraints = "=x,x,x", tail_call_kind = #llvm.tailcallkind<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":4:10)
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":5:5)
    %3 = "llvm.inline_asm"(%arg2, %arg3) <{asm_dialect = 1 : i64, asm_string = "vblendps $0, $1, $2, 0xCC", constraints = "=x,x,x", tail_call_kind = #llvm.tailcallkind<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":6:10)
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":7:5)
    %4 = "vector.shuffle"(%arg2, %arg3) <{mask = array<i64: 0, 1, 10, 11, 4, 5, 14, 15>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":8:10)
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":9:5)
    %5 = "llvm.inline_asm"(%arg2, %arg3) <{asm_dialect = 1 : i64, asm_string = "vblendps $0, $1, $2, 0x33", constraints = "=x,x,x", tail_call_kind = #llvm.tailcallkind<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":10:10)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":11:5)
    %6 = "vector.shuffle"(%arg2, %arg3) <{mask = array<i64: 8, 9, 2, 3, 12, 13, 6, 7>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":12:10)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> (), sym_name = "entry_point"}> ({
  ^bb0(%arg0: vector<8xf32> loc("<stdin>":17:8), %arg1: vector<8xf32> loc("<stdin>":17:30)):
    "func.call"(%arg0, %arg1) <{callee = @function_to_run}> : (vector<8xf32>, vector<8xf32>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry_point_with_all_constants"}> ({
    %0 = "llvm.mlir.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<8xf32>}> : () -> vector<8xf32> loc("<stdin>":22:10)
    %1 = "llvm.mlir.constant"() <{value = dense<[8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01]> : vector<8xf32>}> : () -> vector<8xf32> loc("<stdin>":23:10)
    "func.call"(%0, %1) <{callee = @function_to_run}> : (vector<8xf32>, vector<8xf32>) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":1:1)
