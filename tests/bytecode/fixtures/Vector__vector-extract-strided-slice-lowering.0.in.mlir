"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf16>) -> vector<4xf16>, sym_name = "extract_strided_slice_1D"}> ({
  ^bb0(%arg0: vector<8xf16> loc("<stdin>":3:8)):
    %0 = "vector.extract_strided_slice"(%arg0) <{offsets = [1], sizes = [4], strides = [1]}> : (vector<8xf16>) -> vector<4xf16> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<4xf16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
