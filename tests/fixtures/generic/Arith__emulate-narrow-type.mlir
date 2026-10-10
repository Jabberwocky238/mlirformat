"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "identity_f32"}> ({
  ^bb0(%arg5: f32):
    "func.return"(%arg5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "identity_i32"}> ({
  ^bb0(%arg4: vector<2xi32>):
    "func.return"(%arg4) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i4) -> i4, sym_name = "identity_scalar"}> ({
  ^bb0(%arg3: i4):
    "func.return"(%arg3) : (i4) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi4>) -> vector<4xi4>, sym_name = "identity_vector"}> ({
  ^bb0(%arg2: vector<4xi4>):
    "func.return"(%arg2) : (vector<4xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4xi4>) -> vector<3x4xi4>, sym_name = "identity_vector2d"}> ({
  ^bb0(%arg1: vector<3x4xi4>):
    "func.return"(%arg1) : (vector<3x4xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi4>) -> vector<4xi4>, sym_name = "call"}> ({
  ^bb0(%arg0: vector<4xi4>):
    %0 = "func.call"(%arg0) <{callee = @identity_vector}> : (vector<4xi4>) -> vector<4xi4>
    "func.return"(%0) : (vector<4xi4>) -> ()
  }) : () -> ()
}) : () -> ()

