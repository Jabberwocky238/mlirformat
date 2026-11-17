"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "unsupported_trivial_forwarding"}> ({
  ^bb0(%arg0: vector<8xf32> loc("<stdin>":3:8)):
    %0:8 = "vector.to_elements"(%arg0) : (vector<8xf32>) -> (f32, f32, f32, f32, f32, f32, f32, f32) loc("<stdin>":4:12)
    %1 = "vector.from_elements"(%0#0, %0#1, %0#2, %0#3, %0#4, %0#5, %0#6, %0#7) : (f32, f32, f32, f32, f32, f32, f32, f32) -> vector<8xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (vector<8xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
