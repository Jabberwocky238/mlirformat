"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16) -> (), sym_name = "bitcount_scalar"}> ({
  ^bb0(%arg57: i16 loc("<stdin>":3:8)):
    %23 = "spirv.BitCount"(%arg57) : (i16) -> i16 loc("<stdin>":4:11)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi32>) -> (), sym_name = "bitcount_vector"}> ({
  ^bb0(%arg56: vector<3xi32> loc("<stdin>":8:8)):
    %22 = "spirv.BitCount"(%arg56) : (vector<3xi32>) -> vector<3xi32> loc("<stdin>":9:11)
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i64) -> (), sym_name = "bitreverse_scalar"}> ({
  ^bb0(%arg55: i64 loc("<stdin>":13:8)):
    %21 = "spirv.BitReverse"(%arg55) : (i64) -> i64 loc("<stdin>":14:11)
    "spirv.Return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>) -> (), sym_name = "bitreverse_vector"}> ({
  ^bb0(%arg54: vector<4xi32> loc("<stdin>":18:8)):
    %20 = "spirv.BitReverse"(%arg54) : (vector<4xi32>) -> vector<4xi32> loc("<stdin>":19:11)
    "spirv.Return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32, i32, i32) -> (), sym_name = "bitfield_insert_scalar_same_bit_width"}> ({
  ^bb0(%arg50: i32 loc("<stdin>":23:8), %arg51: i32 loc("<stdin>":23:21), %arg52: i32 loc("<stdin>":23:34), %arg53: i32 loc("<stdin>":23:47)):
    %19 = "spirv.BitFieldInsert"(%arg50, %arg51, %arg52, %arg53) : (i32, i32, i32, i32) -> i32 loc("<stdin>":24:11)
    "spirv.Return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i64, i64, i8, i8) -> (), sym_name = "bitfield_insert_scalar_smaller_bit_width"}> ({
  ^bb0(%arg46: i64 loc("<stdin>":28:8), %arg47: i64 loc("<stdin>":28:21), %arg48: i8 loc("<stdin>":28:34), %arg49: i8 loc("<stdin>":28:46)):
    %18 = "spirv.BitFieldInsert"(%arg46, %arg47, %arg48, %arg49) : (i64, i64, i8, i8) -> i64 loc("<stdin>":29:11)
    "spirv.Return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i16, i16, i32, i64) -> (), sym_name = "bitfield_insert_scalar_greater_bit_width"}> ({
  ^bb0(%arg42: i16 loc("<stdin>":33:8), %arg43: i16 loc("<stdin>":33:21), %arg44: i32 loc("<stdin>":33:34), %arg45: i64 loc("<stdin>":33:47)):
    %17 = "spirv.BitFieldInsert"(%arg42, %arg43, %arg44, %arg45) : (i16, i16, i32, i64) -> i16 loc("<stdin>":34:11)
    "spirv.Return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi32>, vector<2xi32>, i32, i32) -> (), sym_name = "bitfield_insert_vector"}> ({
  ^bb0(%arg38: vector<2xi32> loc("<stdin>":38:8), %arg39: vector<2xi32> loc("<stdin>":38:31), %arg40: i32 loc("<stdin>":38:54), %arg41: i32 loc("<stdin>":38:67)):
    %16 = "spirv.BitFieldInsert"(%arg38, %arg39, %arg40, %arg41) : (vector<2xi32>, vector<2xi32>, i32, i32) -> vector<2xi32> loc("<stdin>":39:11)
    "spirv.Return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i64, i64, i64) -> (), sym_name = "bitfield_sextract_scalar_same_bit_width"}> ({
  ^bb0(%arg35: i64 loc("<stdin>":43:8), %arg36: i64 loc("<stdin>":43:21), %arg37: i64 loc("<stdin>":43:34)):
    %15 = "spirv.BitFieldSExtract"(%arg35, %arg36, %arg37) : (i64, i64, i64) -> i64 loc("<stdin>":44:11)
    "spirv.Return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i8, i8) -> (), sym_name = "bitfield_sextract_scalar_smaller_bit_width"}> ({
  ^bb0(%arg32: i32 loc("<stdin>":48:8), %arg33: i8 loc("<stdin>":48:21), %arg34: i8 loc("<stdin>":48:33)):
    %14 = "spirv.BitFieldSExtract"(%arg32, %arg33, %arg34) : (i32, i8, i8) -> i32 loc("<stdin>":49:11)
    "spirv.Return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i64, i64) -> (), sym_name = "bitfield_sextract_scalar_greater_bit_width"}> ({
  ^bb0(%arg29: i32 loc("<stdin>":53:8), %arg30: i64 loc("<stdin>":53:21), %arg31: i64 loc("<stdin>":53:34)):
    %13 = "spirv.BitFieldSExtract"(%arg29, %arg30, %arg31) : (i32, i64, i64) -> i32 loc("<stdin>":54:11)
    "spirv.Return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi32>, i32, i32) -> (), sym_name = "bitfield_sextract_vector"}> ({
  ^bb0(%arg26: vector<2xi32> loc("<stdin>":58:8), %arg27: i32 loc("<stdin>":58:31), %arg28: i32 loc("<stdin>":58:44)):
    %12 = "spirv.BitFieldSExtract"(%arg26, %arg27, %arg28) : (vector<2xi32>, i32, i32) -> vector<2xi32> loc("<stdin>":59:11)
    "spirv.Return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32, i32) -> (), sym_name = "bitfield_uextract_scalar_same_bit_width"}> ({
  ^bb0(%arg23: i32 loc("<stdin>":63:8), %arg24: i32 loc("<stdin>":63:21), %arg25: i32 loc("<stdin>":63:34)):
    %11 = "spirv.BitFieldUExtract"(%arg23, %arg24, %arg25) : (i32, i32, i32) -> i32 loc("<stdin>":64:11)
    "spirv.Return"() : () -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i16, i8) -> (), sym_name = "bitfield_uextract_scalar_smaller_bit_width"}> ({
  ^bb0(%arg20: i32 loc("<stdin>":68:8), %arg21: i16 loc("<stdin>":68:21), %arg22: i8 loc("<stdin>":68:34)):
    %10 = "spirv.BitFieldUExtract"(%arg20, %arg21, %arg22) : (i32, i16, i8) -> i32 loc("<stdin>":69:11)
    "spirv.Return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i8, i16, i8) -> (), sym_name = "bitfield_uextract_scalar_greater_bit_width"}> ({
  ^bb0(%arg17: i8 loc("<stdin>":73:8), %arg18: i16 loc("<stdin>":73:20), %arg19: i8 loc("<stdin>":73:33)):
    %9 = "spirv.BitFieldUExtract"(%arg17, %arg18, %arg19) : (i8, i16, i8) -> i8 loc("<stdin>":74:10)
    "spirv.Return"() : () -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi32>, i32, i32) -> (), sym_name = "bitfield_uextract_vector"}> ({
  ^bb0(%arg14: vector<2xi32> loc("<stdin>":78:8), %arg15: i32 loc("<stdin>":78:31), %arg16: i32 loc("<stdin>":78:44)):
    %8 = "spirv.BitFieldUExtract"(%arg14, %arg15, %arg16) : (vector<2xi32>, i32, i32) -> vector<2xi32> loc("<stdin>":79:10)
    "spirv.Return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "bitwise_and_scalar"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":83:8), %arg13: i32 loc("<stdin>":83:21)):
    %7 = "spirv.BitwiseAnd"(%arg12, %arg13) : (i32, i32) -> i32 loc("<stdin>":84:10)
    "spirv.Return"() : () -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi64>, vector<4xi64>) -> (), sym_name = "bitwise_and_vector"}> ({
  ^bb0(%arg10: vector<4xi64> loc("<stdin>":88:8), %arg11: vector<4xi64> loc("<stdin>":88:31)):
    %6 = "spirv.BitwiseAnd"(%arg10, %arg11) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":89:10)
    "spirv.Return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":87:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i64, i64) -> (), sym_name = "bitwise_or_scalar"}> ({
  ^bb0(%arg8: i64 loc("<stdin>":93:8), %arg9: i64 loc("<stdin>":93:20)):
    %5 = "spirv.BitwiseOr"(%arg8, %arg9) : (i64, i64) -> i64 loc("<stdin>":94:10)
    "spirv.Return"() : () -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":92:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xi8>, vector<3xi8>) -> (), sym_name = "bitwise_or_vector"}> ({
  ^bb0(%arg6: vector<3xi8> loc("<stdin>":98:8), %arg7: vector<3xi8> loc("<stdin>":98:29)):
    %4 = "spirv.BitwiseOr"(%arg6, %arg7) : (vector<3xi8>, vector<3xi8>) -> vector<3xi8> loc("<stdin>":99:10)
    "spirv.Return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":97:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "bitwise_xor_scalar"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":103:8), %arg5: i32 loc("<stdin>":103:20)):
    %3 = "spirv.BitwiseXor"(%arg4, %arg5) : (i32, i32) -> i32 loc("<stdin>":104:10)
    "spirv.Return"() : () -> () loc("<stdin>":105:5)
  }) : () -> () loc("<stdin>":102:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi16>, vector<2xi16>) -> (), sym_name = "bitwise_xor_vector"}> ({
  ^bb0(%arg2: vector<2xi16> loc("<stdin>":108:8), %arg3: vector<2xi16> loc("<stdin>":108:30)):
    %2 = "spirv.BitwiseXor"(%arg2, %arg3) : (vector<2xi16>, vector<2xi16>) -> vector<2xi16> loc("<stdin>":109:10)
    "spirv.Return"() : () -> () loc("<stdin>":110:5)
  }) : () -> () loc("<stdin>":107:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32) -> (), sym_name = "not_scalar"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":113:8)):
    %1 = "spirv.Not"(%arg1) : (i32) -> i32 loc("<stdin>":114:10)
    "spirv.Return"() : () -> () loc("<stdin>":115:5)
  }) : () -> () loc("<stdin>":112:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi16>) -> (), sym_name = "not_vector"}> ({
  ^bb0(%arg0: vector<2xi16> loc("<stdin>":118:8)):
    %0 = "spirv.Not"(%arg0) : (vector<2xi16>) -> vector<2xi16> loc("<stdin>":119:10)
    "spirv.Return"() : () -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":117:3)
}) : () -> () loc("<stdin>":1:1)
