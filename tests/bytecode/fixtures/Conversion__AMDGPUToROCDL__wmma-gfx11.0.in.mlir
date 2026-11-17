"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf16>, vector<8xf32>, vector<4xf32>, vector<16xbf16>, vector<8xf16>, vector<8xbf16>, vector<16xi8>, vector<8xi32>, vector<4xi32>, vector<16xui8>, vector<16xi4>, vector<8xi4>) -> (), sym_name = "wmma_to_rocdl"}> ({
  ^bb0(%arg0: vector<16xf16> loc("<stdin>":3:8), %arg1: vector<8xf32> loc("<stdin>":3:31), %arg2: vector<4xf32> loc("<stdin>":3:53), %arg3: vector<16xbf16> loc("<stdin>":3:75), %arg4: vector<8xf16> loc("<stdin>":3:99), %arg5: vector<8xbf16> loc("<stdin>":3:121), %arg6: vector<16xi8> loc("<stdin>":3:144), %arg7: vector<8xi32> loc("<stdin>":3:166), %arg8: vector<4xi32> loc("<stdin>":3:188), %arg9: vector<16xui8> loc("<stdin>":3:210), %arg10: vector<16xi4> loc("<stdin>":3:233), %arg11: vector<8xi4> loc("<stdin>":3:256)):
    %0 = "amdgpu.wmma"(%arg0, %arg0, %arg1) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":4:10)
    %1 = "amdgpu.wmma"(%arg0, %arg0, %arg2) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":5:10)
    %2 = "amdgpu.wmma"(%arg3, %arg3, %arg1) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":6:10)
    %3 = "amdgpu.wmma"(%arg3, %arg3, %arg2) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":7:10)
    %4 = "amdgpu.wmma"(%arg0, %arg0, %arg0) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 1 : i32}> : (vector<16xf16>, vector<16xf16>, vector<16xf16>) -> vector<16xf16> loc("<stdin>":8:10)
    %5 = "amdgpu.wmma"(%arg0, %arg0, %arg4) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":9:10)
    %6 = "amdgpu.wmma"(%arg3, %arg3, %arg3) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 1 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<16xbf16>) -> vector<16xbf16> loc("<stdin>":10:10)
    %7 = "amdgpu.wmma"(%arg3, %arg3, %arg5) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<8xbf16>) -> vector<8xbf16> loc("<stdin>":11:10)
    %8 = "amdgpu.wmma"(%arg6, %arg6, %arg7) <{clamp, k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xi8>, vector<16xi8>, vector<8xi32>) -> vector<8xi32> loc("<stdin>":12:10)
    %9 = "amdgpu.wmma"(%arg9, %arg9, %arg8) <{clamp, k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32, unsignedA, unsignedB}> : (vector<16xui8>, vector<16xui8>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":13:10)
    %10 = "amdgpu.wmma"(%arg10, %arg10, %arg7) <{clamp, k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xi4>, vector<16xi4>, vector<8xi32>) -> vector<8xi32> loc("<stdin>":14:11)
    %11 = "amdgpu.wmma"(%arg11, %arg11, %arg8) <{clamp, k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<8xi4>, vector<8xi4>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":15:11)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
