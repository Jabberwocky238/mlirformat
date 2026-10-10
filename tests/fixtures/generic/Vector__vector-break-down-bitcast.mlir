"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf16>) -> vector<4xf32>, sym_name = "bitcast_f16_to_f32"}> ({
  ^bb0(%arg0: vector<8xf16>):
    %0 = "vector.bitcast"(%arg0) : (vector<8xf16>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xi8>) -> vector<4xi32>, sym_name = "bitcast_i8_to_i32"}> ({
  ^bb0(%arg0: vector<16xi8>):
    %0 = "vector.bitcast"(%arg0) : (vector<16xi8>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf16>) -> vector<[4]xf32>, sym_name = "bitcast_scalable_negative"}> ({
  ^bb0(%arg0: vector<[8]xf16>):
    %0 = "vector.bitcast"(%arg0) : (vector<[8]xf16>) -> vector<[4]xf32>
    "func.return"(%0) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

