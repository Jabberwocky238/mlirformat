"builtin.module"() ({
  "func.func"() <{function_type = (vector<32xi64>) -> vector<20xi8>, sym_name = "f1"}> ({
  ^bb0(%arg9: vector<32xi64> loc("<stdin>":3:8)):
    %15 = "arith.trunci"(%arg9) <{overflowFlags = #arith.overflow<none>}> : (vector<32xi64>) -> vector<32xi5> loc("<stdin>":4:11)
    %16 = "vector.bitcast"(%15) : (vector<32xi5>) -> vector<20xi8> loc("<stdin>":5:11)
    "func.return"(%16) : (vector<20xi8>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<16xi16>) -> vector<3xi16>, sym_name = "f2"}> ({
  ^bb0(%arg8: vector<16xi16> loc("<stdin>":9:8)):
    %13 = "arith.trunci"(%arg8) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi3> loc("<stdin>":10:11)
    %14 = "vector.bitcast"(%13) : (vector<16xi3>) -> vector<3xi16> loc("<stdin>":11:11)
    "func.return"(%14) : (vector<3xi16>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<16xi16>) -> vector<2xi32>, sym_name = "f3"}> ({
  ^bb0(%arg7: vector<16xi16> loc("<stdin>":15:8)):
    %11 = "arith.trunci"(%arg7) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi4> loc("<stdin>":16:11)
    %12 = "vector.bitcast"(%11) : (vector<16xi4>) -> vector<2xi32> loc("<stdin>":17:11)
    "func.return"(%12) : (vector<2xi32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (vector<16xi16>) -> vector<8xi6>, sym_name = "f4"}> ({
  ^bb0(%arg6: vector<16xi16> loc("<stdin>":21:8)):
    %9 = "arith.trunci"(%arg6) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi3> loc("<stdin>":22:10)
    %10 = "vector.bitcast"(%9) : (vector<16xi3>) -> vector<8xi6> loc("<stdin>":23:11)
    "func.return"(%10) : (vector<8xi6>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (vector<5xi8>) -> vector<8xi16>, sym_name = "f1ext"}> ({
  ^bb0(%arg5: vector<5xi8> loc("<stdin>":27:8)):
    %7 = "vector.bitcast"(%arg5) : (vector<5xi8>) -> vector<8xi5> loc("<stdin>":28:10)
    %8 = "arith.extsi"(%7) : (vector<8xi5>) -> vector<8xi16> loc("<stdin>":29:10)
    "func.return"(%8) : (vector<8xi16>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (vector<5xi8>) -> vector<8xi16>, sym_name = "f2ext"}> ({
  ^bb0(%arg4: vector<5xi8> loc("<stdin>":33:8)):
    %5 = "vector.bitcast"(%arg4) : (vector<5xi8>) -> vector<8xi5> loc("<stdin>":34:10)
    %6 = "arith.extui"(%5) : (vector<8xi5>) -> vector<8xi16> loc("<stdin>":35:10)
    "func.return"(%6) : (vector<8xi16>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<5xi8>) -> vector<8xi17>, sym_name = "f3ext"}> ({
  ^bb0(%arg3: vector<5xi8> loc("<stdin>":39:8)):
    %3 = "vector.bitcast"(%arg3) : (vector<5xi8>) -> vector<8xi5> loc("<stdin>":40:10)
    %4 = "arith.extsi"(%3) : (vector<8xi5>) -> vector<8xi17> loc("<stdin>":41:10)
    "func.return"(%4) : (vector<8xi17>) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (vector<8x16xi4>) -> vector<16x8xi4>, sym_name = "i4_transpose"}> ({
  ^bb0(%arg2: vector<8x16xi4> loc("<stdin>":45:8)):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<8x16xi4>) -> vector<16x8xi4> loc("<stdin>":46:10)
    "func.return"(%2) : (vector<16x8xi4>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (vector<8x16xi7>) -> vector<16x8xi7>, sym_name = "i7_transpose"}> ({
  ^bb0(%arg1: vector<8x16xi7> loc("<stdin>":50:8)):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<8x16xi7>) -> vector<16x8xi7> loc("<stdin>":51:10)
    "func.return"(%1) : (vector<16x8xi7>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":49:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":56:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":57:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.rewrite_narrow_types"() : () -> () loc("<stdin>":59:9)
      }) : (!transform.any_op) -> () loc("<stdin>":58:7)
      "transform.yield"() : () -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":55:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":1:1)
