"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi8>) -> vector<1x1x4xi8>, sym_name = "broadcast_to_shape_cast"}> ({
  ^bb0(%arg0: vector<4xi8> loc("<stdin>":3:8)):
    %0 = "vector.broadcast"(%arg0) : (vector<4xi8>) -> vector<1x1x4xi8> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<1x1x4xi8>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
