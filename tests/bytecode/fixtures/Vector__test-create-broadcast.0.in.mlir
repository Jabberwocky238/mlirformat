"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<1x2xf32>, sym_name = "foo"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8)):
    %0 = "test_create_broadcast"(%arg0) {broadcast_dims = array<i64: 0, 1>} : (f32) -> vector<1x2xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<1x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
