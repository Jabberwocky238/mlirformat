"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf16>) -> vector<4xf16>, sym_name = "extract_strided_slice_1D"}> ({
  ^bb0(%arg0: vector<8xf16>):
    %0 = "vector.extract_strided_slice"(%arg0) <{offsets = [1], sizes = [4], strides = [1]}> : (vector<8xf16>) -> vector<4xf16>
    "func.return"(%0) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8xf16>) -> vector<1x4xf16>, sym_name = "extract_strided_slice_2D"}> ({
  ^bb0(%arg0: vector<1x8xf16>):
    %0 = "vector.extract_strided_slice"(%arg0) <{offsets = [0, 1], sizes = [1, 4], strides = [1, 1]}> : (vector<1x8xf16>) -> vector<1x4xf16>
    "func.return"(%0) : (vector<1x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

