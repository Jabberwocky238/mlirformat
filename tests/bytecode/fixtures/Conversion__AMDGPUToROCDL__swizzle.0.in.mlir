"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_swizzle_i32"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":3:8)):
    %4 = "amdgpu.swizzle_bitmode"(%arg4) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%4) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "test_swizzle_f32"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":8:8)):
    %3 = "amdgpu.swizzle_bitmode"(%arg3) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (f32) -> f32 loc("<stdin>":9:10)
    "func.return"(%3) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "test_swizzle_f16"}> ({
  ^bb0(%arg2: f16 loc("<stdin>":13:8)):
    %2 = "amdgpu.swizzle_bitmode"(%arg2) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (f16) -> f16 loc("<stdin>":14:10)
    "func.return"(%2) : (f16) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "test_swizzle_2xi32"}> ({
  ^bb0(%arg1: vector<2xi32> loc("<stdin>":18:8)):
    %1 = "amdgpu.swizzle_bitmode"(%arg1) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (vector<2xi32>) -> vector<2xi32> loc("<stdin>":19:10)
    "func.return"(%1) : (vector<2xi32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf16>, sym_name = "test_swizzle_4xf16"}> ({
  ^bb0(%arg0: vector<4xf16> loc("<stdin>":23:8)):
    %0 = "amdgpu.swizzle_bitmode"(%arg0) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (vector<4xf16>) -> vector<4xf16> loc("<stdin>":24:10)
    "func.return"(%0) : (vector<4xf16>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
