"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "sdot_scalar_i32"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":3:8), %arg9: i32 loc("<stdin>":3:20)):
    %4 = "spirv.SDot"(%arg8, %arg9) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%4) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> i64, sym_name = "sdot_scalar_i64"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":8:8), %arg7: i32 loc("<stdin>":8:20)):
    %3 = "spirv.SDot"(%arg6, %arg7) <{format = #spirv.packed_vector_format<PackedVectorFormat4x8Bit>}> : (i32, i32) -> i64 loc("<stdin>":9:10)
    "func.return"(%3) : (i64) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "sdot_vector_4xi8"}> ({
  ^bb0(%arg4: vector<4xi8> loc("<stdin>":13:8), %arg5: vector<4xi8> loc("<stdin>":13:29)):
    %2 = "spirv.SDot"(%arg4, %arg5) : (vector<4xi8>, vector<4xi8>) -> i32 loc("<stdin>":14:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<4xi16>, vector<4xi16>) -> i64, sym_name = "sdot_vector_4xi16"}> ({
  ^bb0(%arg2: vector<4xi16> loc("<stdin>":18:8), %arg3: vector<4xi16> loc("<stdin>":18:30)):
    %1 = "spirv.SDot"(%arg2, %arg3) : (vector<4xi16>, vector<4xi16>) -> i64 loc("<stdin>":19:10)
    "func.return"(%1) : (i64) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<8xi8>, vector<8xi8>) -> i64, sym_name = "sdot_vector_8xi8"}> ({
  ^bb0(%arg0: vector<8xi8> loc("<stdin>":23:8), %arg1: vector<8xi8> loc("<stdin>":23:29)):
    %0 = "spirv.SDot"(%arg0, %arg1) : (vector<8xi8>, vector<8xi8>) -> i64 loc("<stdin>":24:10)
    "func.return"(%0) : (i64) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
