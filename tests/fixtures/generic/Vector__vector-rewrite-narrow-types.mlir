"builtin.module"() ({
  "func.func"() <{function_type = (vector<32xi64>) -> vector<20xi8>, sym_name = "f1"}> ({
  ^bb0(%arg9: vector<32xi64>):
    %15 = "arith.trunci"(%arg9) <{overflowFlags = #arith.overflow<none>}> : (vector<32xi64>) -> vector<32xi5>
    %16 = "vector.bitcast"(%15) : (vector<32xi5>) -> vector<20xi8>
    "func.return"(%16) : (vector<20xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi16>) -> vector<3xi16>, sym_name = "f2"}> ({
  ^bb0(%arg8: vector<16xi16>):
    %13 = "arith.trunci"(%arg8) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi3>
    %14 = "vector.bitcast"(%13) : (vector<16xi3>) -> vector<3xi16>
    "func.return"(%14) : (vector<3xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi16>) -> vector<2xi32>, sym_name = "f3"}> ({
  ^bb0(%arg7: vector<16xi16>):
    %11 = "arith.trunci"(%arg7) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi4>
    %12 = "vector.bitcast"(%11) : (vector<16xi4>) -> vector<2xi32>
    "func.return"(%12) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi16>) -> vector<8xi6>, sym_name = "f4"}> ({
  ^bb0(%arg6: vector<16xi16>):
    %9 = "arith.trunci"(%arg6) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi3>
    %10 = "vector.bitcast"(%9) : (vector<16xi3>) -> vector<8xi6>
    "func.return"(%10) : (vector<8xi6>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5xi8>) -> vector<8xi16>, sym_name = "f1ext"}> ({
  ^bb0(%arg5: vector<5xi8>):
    %7 = "vector.bitcast"(%arg5) : (vector<5xi8>) -> vector<8xi5>
    %8 = "arith.extsi"(%7) : (vector<8xi5>) -> vector<8xi16>
    "func.return"(%8) : (vector<8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5xi8>) -> vector<8xi16>, sym_name = "f2ext"}> ({
  ^bb0(%arg4: vector<5xi8>):
    %5 = "vector.bitcast"(%arg4) : (vector<5xi8>) -> vector<8xi5>
    %6 = "arith.extui"(%5) : (vector<8xi5>) -> vector<8xi16>
    "func.return"(%6) : (vector<8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5xi8>) -> vector<8xi17>, sym_name = "f3ext"}> ({
  ^bb0(%arg3: vector<5xi8>):
    %3 = "vector.bitcast"(%arg3) : (vector<5xi8>) -> vector<8xi5>
    %4 = "arith.extsi"(%3) : (vector<8xi5>) -> vector<8xi17>
    "func.return"(%4) : (vector<8xi17>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x16xi4>) -> vector<16x8xi4>, sym_name = "i4_transpose"}> ({
  ^bb0(%arg2: vector<8x16xi4>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<8x16xi4>) -> vector<16x8xi4>
    "func.return"(%2) : (vector<16x8xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x16xi7>) -> vector<16x8xi7>, sym_name = "i7_transpose"}> ({
  ^bb0(%arg1: vector<8x16xi7>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<8x16xi7>) -> vector<16x8xi7>
    "func.return"(%1) : (vector<16x8xi7>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.rewrite_narrow_types"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

