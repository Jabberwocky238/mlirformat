"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "identity_f32"}> ({
  ^bb0(%arg5: f32 loc("<stdin>":3:8)):
    "func.return"(%arg5) : (f32) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "identity_i32"}> ({
  ^bb0(%arg4: vector<2xi32> loc("<stdin>":7:8)):
    "func.return"(%arg4) : (vector<2xi32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (i4) -> i4, sym_name = "identity_scalar"}> ({
  ^bb0(%arg3: i4 loc("<stdin>":11:8)):
    "func.return"(%arg3) : (i4) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (vector<4xi4>) -> vector<4xi4>, sym_name = "identity_vector"}> ({
  ^bb0(%arg2: vector<4xi4> loc("<stdin>":15:8)):
    "func.return"(%arg2) : (vector<4xi4>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (vector<3x4xi4>) -> vector<3x4xi4>, sym_name = "identity_vector2d"}> ({
  ^bb0(%arg1: vector<3x4xi4> loc("<stdin>":19:8)):
    "func.return"(%arg1) : (vector<3x4xi4>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (vector<4xi4>) -> vector<4xi4>, sym_name = "call"}> ({
  ^bb0(%arg0: vector<4xi4> loc("<stdin>":23:8)):
    %0 = "func.call"(%arg0) <{callee = @identity_vector}> : (vector<4xi4>) -> vector<4xi4> loc("<stdin>":24:10)
    "func.return"(%0) : (vector<4xi4>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
