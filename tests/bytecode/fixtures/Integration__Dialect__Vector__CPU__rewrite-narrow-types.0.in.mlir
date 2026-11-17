"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xi5>) -> (), sym_name = "print_as_i1_16xi5"}> ({
  ^bb0(%arg15: vector<16xi5> loc("<stdin>":3:8)):
    %30 = "vector.bitcast"(%arg15) : (vector<16xi5>) -> vector<80xi1> loc("<stdin>":4:11)
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<80xi1>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<10xi8>) -> (), sym_name = "print_as_i1_10xi8"}> ({
  ^bb0(%arg14: vector<10xi8> loc("<stdin>":9:8)):
    %29 = "vector.bitcast"(%arg14) : (vector<10xi8>) -> vector<80xi1> loc("<stdin>":10:11)
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<80xi1>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<16xi16>) -> (), sym_name = "f"}> ({
  ^bb0(%arg13: vector<16xi16> loc("<stdin>":15:8)):
    %27 = "arith.trunci"(%arg13) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi5> loc("<stdin>":16:11)
    "func.call"(%27) <{callee = @print_as_i1_16xi5}> : (vector<16xi5>) -> () loc("<stdin>":17:5)
    %28 = "vector.bitcast"(%27) : (vector<16xi5>) -> vector<10xi8> loc("<stdin>":18:11)
    "func.call"(%28) <{callee = @print_as_i1_10xi8}> : (vector<10xi8>) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (vector<8xi3>) -> (), sym_name = "print_as_i1_8xi3"}> ({
  ^bb0(%arg12: vector<8xi3> loc("<stdin>":23:8)):
    %26 = "vector.bitcast"(%arg12) : (vector<8xi3>) -> vector<24xi1> loc("<stdin>":24:11)
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<24xi1>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<3xi8>) -> (), sym_name = "print_as_i1_3xi8"}> ({
  ^bb0(%arg11: vector<3xi8> loc("<stdin>":29:8)):
    %25 = "vector.bitcast"(%arg11) : (vector<3xi8>) -> vector<24xi1> loc("<stdin>":30:11)
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<24xi1>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (vector<8xi32>) -> (), sym_name = "f2"}> ({
  ^bb0(%arg10: vector<8xi32> loc("<stdin>":35:8)):
    %23 = "arith.trunci"(%arg10) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>) -> vector<8xi3> loc("<stdin>":36:11)
    "func.call"(%23) <{callee = @print_as_i1_8xi3}> : (vector<8xi3>) -> () loc("<stdin>":37:5)
    %24 = "vector.bitcast"(%23) : (vector<8xi3>) -> vector<3xi8> loc("<stdin>":38:11)
    "func.call"(%24) <{callee = @print_as_i1_3xi8}> : (vector<3xi8>) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (vector<2xi24>) -> (), sym_name = "print_as_i1_2xi24"}> ({
  ^bb0(%arg9: vector<2xi24> loc("<stdin>":43:8)):
    %22 = "vector.bitcast"(%arg9) : (vector<2xi24>) -> vector<48xi1> loc("<stdin>":44:11)
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<48xi1>) -> () loc("<stdin>":45:5)
    "func.return"() : () -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<3xi16>) -> (), sym_name = "print_as_i1_3xi16"}> ({
  ^bb0(%arg8: vector<3xi16> loc("<stdin>":49:8)):
    %21 = "vector.bitcast"(%arg8) : (vector<3xi16>) -> vector<48xi1> loc("<stdin>":50:11)
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<48xi1>) -> () loc("<stdin>":51:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (vector<2xi48>) -> (), sym_name = "f3"}> ({
  ^bb0(%arg7: vector<2xi48> loc("<stdin>":55:8)):
    %19 = "arith.trunci"(%arg7) <{overflowFlags = #arith.overflow<none>}> : (vector<2xi48>) -> vector<2xi24> loc("<stdin>":56:11)
    "func.call"(%19) <{callee = @print_as_i1_2xi24}> : (vector<2xi24>) -> () loc("<stdin>":57:5)
    %20 = "vector.bitcast"(%19) : (vector<2xi24>) -> vector<3xi16> loc("<stdin>":58:11)
    "func.call"(%20) <{callee = @print_as_i1_3xi16}> : (vector<3xi16>) -> () loc("<stdin>":59:5)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":54:3)
  "func.func"() <{function_type = (vector<8xi5>) -> (), sym_name = "print_as_i1_8xi5"}> ({
  ^bb0(%arg6: vector<8xi5> loc("<stdin>":63:8)):
    %18 = "vector.bitcast"(%arg6) : (vector<8xi5>) -> vector<40xi1> loc("<stdin>":64:11)
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<40xi1>) -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (vector<8xi16>) -> (), sym_name = "print_as_i1_8xi16"}> ({
  ^bb0(%arg5: vector<8xi16> loc("<stdin>":69:8)):
    %17 = "vector.bitcast"(%arg5) : (vector<8xi16>) -> vector<128xi1> loc("<stdin>":70:11)
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<128xi1>) -> () loc("<stdin>":71:5)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (vector<5xi8>) -> (), sym_name = "fext"}> ({
  ^bb0(%arg4: vector<5xi8> loc("<stdin>":75:8)):
    %15 = "vector.bitcast"(%arg4) : (vector<5xi8>) -> vector<8xi5> loc("<stdin>":76:11)
    "func.call"(%15) <{callee = @print_as_i1_8xi5}> : (vector<8xi5>) -> () loc("<stdin>":77:5)
    %16 = "arith.extui"(%15) : (vector<8xi5>) -> vector<8xi16> loc("<stdin>":78:11)
    "func.call"(%16) <{callee = @print_as_i1_8xi16}> : (vector<8xi16>) -> () loc("<stdin>":79:5)
    "func.return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = (memref<?xi4>, vector<6xi4>) -> vector<6xi4>, sym_name = "fcst_maskedload"}> ({
  ^bb0(%arg2: memref<?xi4> loc("<stdin>":83:8), %arg3: vector<6xi4> loc("<stdin>":83:29)):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":84:11)
    %13 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3>}> : () -> vector<6xi1> loc("<stdin>":85:11)
    %14 = "vector.maskedload"(%arg2, %12, %13, %arg3) : (memref<?xi4>, index, vector<6xi1>, vector<6xi4>) -> vector<6xi4> loc("<stdin>":86:11)
    "func.return"(%14) : (vector<6xi4>) -> () loc("<stdin>":87:5)
  }) : () -> () loc("<stdin>":82:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = dense<[-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16]> : vector<16xi16>}> : () -> vector<16xi16> loc("<stdin>":90:10)
    "func.call"(%1) <{callee = @f}> : (vector<16xi16>) -> () loc("<stdin>":91:5)
    %2 = "arith.constant"() <{value = dense<[65535, 65534, 65533, 65532, 65531, 65530, 65529, 65528]> : vector<8xi32>}> : () -> vector<8xi32> loc("<stdin>":92:10)
    "func.call"(%2) <{callee = @f2}> : (vector<8xi32>) -> () loc("<stdin>":93:5)
    %3 = "arith.constant"() <{value = dense<[-13994362404865, -4271950758]> : vector<2xi48>}> : () -> vector<2xi48> loc("<stdin>":94:10)
    "func.call"(%3) <{callee = @f3}> : (vector<2xi48>) -> () loc("<stdin>":95:5)
    %4 = "arith.constant"() <{value = dense<[-17, -18, -19, -20, -21]> : vector<5xi8>}> : () -> vector<5xi8> loc("<stdin>":96:10)
    "func.call"(%4) <{callee = @fext}> : (vector<5xi8>) -> () loc("<stdin>":97:5)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":98:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":99:10)
    %7 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":100:10)
    %8 = "memref.alloc"(%7) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi4> loc("<stdin>":101:10)
    "scf.for"(%5, %7, %6) ({
    ^bb0(%arg1: index loc("<stdin>":103:10)):
      %11 = "arith.index_cast"(%arg1) : (index) -> i4 loc("<stdin>":104:13)
      "memref.store"(%11, %8, %arg1) : (i4, memref<?xi4>, index) -> () loc("<stdin>":105:7)
      "scf.yield"() : () -> () loc("<stdin>":106:7)
    }) : (index, index, index) -> () loc("<stdin>":102:5)
    %9 = "arith.constant"() <{value = dense<[7, -8, -7, -6, -5, -4]> : vector<6xi4>}> : () -> vector<6xi4> loc("<stdin>":108:10)
    %10 = "func.call"(%8, %9) <{callee = @fcst_maskedload}> : (memref<?xi4>, vector<6xi4>) -> vector<6xi4> loc("<stdin>":109:11)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<6xi4>) -> () loc("<stdin>":110:5)
    "memref.dealloc"(%8) : (memref<?xi4>) -> () loc("<stdin>":111:5)
    "func.return"() : () -> () loc("<stdin>":112:5)
  }) : () -> () loc("<stdin>":89:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":116:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":117:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.rewrite_narrow_types"() : () -> () loc("<stdin>":119:9)
      }) : (!transform.any_op) -> () loc("<stdin>":118:7)
      "transform.yield"() : () -> () loc("<stdin>":121:7)
    }) : () -> () loc("<stdin>":115:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":114:3)
}) : () -> () loc("<stdin>":1:1)
