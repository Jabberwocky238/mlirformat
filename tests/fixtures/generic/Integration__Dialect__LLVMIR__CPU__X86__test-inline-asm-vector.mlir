"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> (), sym_name = "function_to_run"}> ({
  ^bb0(%arg2: vector<8xf32>, %arg3: vector<8xf32>):
    %2 = "llvm.inline_asm"(%arg2, %arg3) <{asm_dialect = 1 : i64, asm_string = "vaddps $0, $1, $2", constraints = "=x,x,x", tail_call_kind = #llvm.tailcallkind<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %3 = "llvm.inline_asm"(%arg2, %arg3) <{asm_dialect = 1 : i64, asm_string = "vblendps $0, $1, $2, 0xCC", constraints = "=x,x,x", tail_call_kind = #llvm.tailcallkind<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %4 = "vector.shuffle"(%arg2, %arg3) <{mask = array<i64: 0, 1, 10, 11, 4, 5, 14, 15>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %5 = "llvm.inline_asm"(%arg2, %arg3) <{asm_dialect = 1 : i64, asm_string = "vblendps $0, $1, $2, 0x33", constraints = "=x,x,x", tail_call_kind = #llvm.tailcallkind<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %6 = "vector.shuffle"(%arg2, %arg3) <{mask = array<i64: 8, 9, 2, 3, 12, 13, 6, 7>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> (), sym_name = "entry_point"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: vector<8xf32>):
    "func.call"(%arg0, %arg1) <{callee = @function_to_run}> : (vector<8xf32>, vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry_point_with_all_constants"}> ({
    %0 = "llvm.mlir.constant"() <{value = dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<8xf32>}> : () -> vector<8xf32>
    %1 = "llvm.mlir.constant"() <{value = dense<[8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%0, %1) <{callee = @function_to_run}> : (vector<8xf32>, vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

