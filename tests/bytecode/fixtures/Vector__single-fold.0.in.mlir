"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>, f16) -> f16, sym_name = "fold_extract_in_single_pass"}> ({
  ^bb0(%arg0: vector<4xf16> loc("<stdin>":3:8), %arg1: f16 loc("<stdin>":3:30)):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 1>}> : (f16, vector<4xf16>) -> vector<4xf16> loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "vector.extract"(%0, %1) <{static_position = array<i64: -9223372036854775808>}> : (vector<4xf16>, index) -> f16 loc("<stdin>":6:10)
    "func.return"(%2) : (f16) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
