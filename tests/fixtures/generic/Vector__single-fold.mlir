"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, f16) -> f16, sym_name = "fold_extract_in_single_pass"}> ({
  ^bb0(%arg0: vector<4xf16>, %arg1: f16):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 1>}> : (f16, vector<4xf16>) -> vector<4xf16>
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "vector.extract"(%0, %1) <{static_position = array<i64: -9223372036854775808>}> : (vector<4xf16>, index) -> f16
    "func.return"(%2) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<2xf16>, sym_name = "fold_insert_in_single_pass"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2xf16>}> : () -> vector<2xf16>
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2.500000e+00 : f16}> : () -> f16
    %3 = "vector.insert"(%2, %0, %1) <{static_position = array<i64: -9223372036854775808>}> : (f16, vector<2xf16>, index) -> vector<2xf16>
    "func.return"(%3) : (vector<2xf16>) -> ()
  }) : () -> ()
}) : () -> ()

