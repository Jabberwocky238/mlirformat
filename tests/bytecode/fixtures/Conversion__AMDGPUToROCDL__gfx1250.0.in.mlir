"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp4"}> ({
  ^bb0(%arg8: vector<8xf4E2M1FN> loc("<stdin>":3:8), %arg9: vector<4xf8E8M0FNU> loc("<stdin>":3:35)):
    %12 = "amdgpu.scaled_ext_packed_matrix"(%arg8, %arg9) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf16> loc("<stdin>":4:11)
    %13 = "amdgpu.scaled_ext_packed_matrix"(%arg8, %arg9) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16> loc("<stdin>":5:11)
    %14 = "amdgpu.scaled_ext_packed_matrix"(%arg8, %arg9) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":6:11)
    "func.return"(%12, %13, %14) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp8"}> ({
  ^bb0(%arg6: vector<8xf8E4M3FN> loc("<stdin>":10:8), %arg7: vector<4xf8E8M0FNU> loc("<stdin>":10:35)):
    %9 = "amdgpu.scaled_ext_packed_matrix"(%arg6, %arg7) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf16> loc("<stdin>":11:10)
    %10 = "amdgpu.scaled_ext_packed_matrix"(%arg6, %arg7) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16> loc("<stdin>":12:11)
    %11 = "amdgpu.scaled_ext_packed_matrix"(%arg6, %arg7) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":13:11)
    "func.return"(%9, %10, %11) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_bf8"}> ({
  ^bb0(%arg4: vector<8xf8E5M2> loc("<stdin>":17:8), %arg5: vector<4xf8E8M0FNU> loc("<stdin>":17:33)):
    %6 = "amdgpu.scaled_ext_packed_matrix"(%arg4, %arg5) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf16> loc("<stdin>":18:10)
    %7 = "amdgpu.scaled_ext_packed_matrix"(%arg4, %arg5) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xbf16> loc("<stdin>":19:10)
    %8 = "amdgpu.scaled_ext_packed_matrix"(%arg4, %arg5) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":20:10)
    "func.return"(%6, %7, %8) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_fp6"}> ({
  ^bb0(%arg2: vector<16xf6E2M3FN> loc("<stdin>":24:8), %arg3: vector<4xf8E8M0FNU> loc("<stdin>":24:36)):
    %3 = "amdgpu.scaled_ext_packed_matrix"(%arg2, %arg3) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf16> loc("<stdin>":25:10)
    %4 = "amdgpu.scaled_ext_packed_matrix"(%arg2, %arg3) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16> loc("<stdin>":26:10)
    %5 = "amdgpu.scaled_ext_packed_matrix"(%arg2, %arg3) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf32> loc("<stdin>":27:10)
    "func.return"(%3, %4, %5) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_bf6"}> ({
  ^bb0(%arg0: vector<16xf6E3M2FN> loc("<stdin>":31:8), %arg1: vector<4xf8E8M0FNU> loc("<stdin>":31:36)):
    %0 = "amdgpu.scaled_ext_packed_matrix"(%arg0, %arg1) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf16> loc("<stdin>":32:10)
    %1 = "amdgpu.scaled_ext_packed_matrix"(%arg0, %arg1) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16> loc("<stdin>":33:10)
    %2 = "amdgpu.scaled_ext_packed_matrix"(%arg0, %arg1) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf32> loc("<stdin>":34:10)
    "func.return"(%0, %1, %2) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
