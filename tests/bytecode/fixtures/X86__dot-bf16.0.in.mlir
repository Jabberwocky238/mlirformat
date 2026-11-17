"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>, sym_name = "avx512bf16_dot_128"}> ({
  ^bb0(%arg6: vector<4xf32> loc("<stdin>":3:8), %arg7: vector<8xbf16> loc("<stdin>":3:30), %arg8: vector<8xbf16> loc("<stdin>":3:53)):
    %2 = "x86.avx512.dot"(%arg6, %arg7, %arg8) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32> loc("<stdin>":4:10)
    "func.return"(%2) : (vector<4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>, sym_name = "avx512bf16_dot_256"}> ({
  ^bb0(%arg3: vector<8xf32> loc("<stdin>":8:8), %arg4: vector<16xbf16> loc("<stdin>":8:30), %arg5: vector<16xbf16> loc("<stdin>":8:54)):
    %1 = "x86.avx512.dot"(%arg3, %arg4, %arg5) : (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32> loc("<stdin>":9:10)
    "func.return"(%1) : (vector<8xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>, sym_name = "avx512bf16_dot_512"}> ({
  ^bb0(%arg0: vector<16xf32> loc("<stdin>":13:8), %arg1: vector<32xbf16> loc("<stdin>":13:31), %arg2: vector<32xbf16> loc("<stdin>":13:55)):
    %0 = "x86.avx512.dot"(%arg0, %arg1, %arg2) : (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32> loc("<stdin>":14:10)
    "func.return"(%0) : (vector<16xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
