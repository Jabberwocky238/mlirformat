"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xi5>) -> (), sym_name = "print_as_i1_16xi5"}> ({
  ^bb0(%arg15: vector<16xi5>):
    %30 = "vector.bitcast"(%arg15) : (vector<16xi5>) -> vector<80xi1>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<80xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<10xi8>) -> (), sym_name = "print_as_i1_10xi8"}> ({
  ^bb0(%arg14: vector<10xi8>):
    %29 = "vector.bitcast"(%arg14) : (vector<10xi8>) -> vector<80xi1>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<80xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi16>) -> (), sym_name = "f"}> ({
  ^bb0(%arg13: vector<16xi16>):
    %27 = "arith.trunci"(%arg13) <{overflowFlags = #arith.overflow<none>}> : (vector<16xi16>) -> vector<16xi5>
    "func.call"(%27) <{callee = @print_as_i1_16xi5}> : (vector<16xi5>) -> ()
    %28 = "vector.bitcast"(%27) : (vector<16xi5>) -> vector<10xi8>
    "func.call"(%28) <{callee = @print_as_i1_10xi8}> : (vector<10xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi3>) -> (), sym_name = "print_as_i1_8xi3"}> ({
  ^bb0(%arg12: vector<8xi3>):
    %26 = "vector.bitcast"(%arg12) : (vector<8xi3>) -> vector<24xi1>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<24xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi8>) -> (), sym_name = "print_as_i1_3xi8"}> ({
  ^bb0(%arg11: vector<3xi8>):
    %25 = "vector.bitcast"(%arg11) : (vector<3xi8>) -> vector<24xi1>
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<24xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> (), sym_name = "f2"}> ({
  ^bb0(%arg10: vector<8xi32>):
    %23 = "arith.trunci"(%arg10) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>) -> vector<8xi3>
    "func.call"(%23) <{callee = @print_as_i1_8xi3}> : (vector<8xi3>) -> ()
    %24 = "vector.bitcast"(%23) : (vector<8xi3>) -> vector<3xi8>
    "func.call"(%24) <{callee = @print_as_i1_3xi8}> : (vector<3xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi24>) -> (), sym_name = "print_as_i1_2xi24"}> ({
  ^bb0(%arg9: vector<2xi24>):
    %22 = "vector.bitcast"(%arg9) : (vector<2xi24>) -> vector<48xi1>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<48xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi16>) -> (), sym_name = "print_as_i1_3xi16"}> ({
  ^bb0(%arg8: vector<3xi16>):
    %21 = "vector.bitcast"(%arg8) : (vector<3xi16>) -> vector<48xi1>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<48xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi48>) -> (), sym_name = "f3"}> ({
  ^bb0(%arg7: vector<2xi48>):
    %19 = "arith.trunci"(%arg7) <{overflowFlags = #arith.overflow<none>}> : (vector<2xi48>) -> vector<2xi24>
    "func.call"(%19) <{callee = @print_as_i1_2xi24}> : (vector<2xi24>) -> ()
    %20 = "vector.bitcast"(%19) : (vector<2xi24>) -> vector<3xi16>
    "func.call"(%20) <{callee = @print_as_i1_3xi16}> : (vector<3xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi5>) -> (), sym_name = "print_as_i1_8xi5"}> ({
  ^bb0(%arg6: vector<8xi5>):
    %18 = "vector.bitcast"(%arg6) : (vector<8xi5>) -> vector<40xi1>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<40xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi16>) -> (), sym_name = "print_as_i1_8xi16"}> ({
  ^bb0(%arg5: vector<8xi16>):
    %17 = "vector.bitcast"(%arg5) : (vector<8xi16>) -> vector<128xi1>
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<128xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5xi8>) -> (), sym_name = "fext"}> ({
  ^bb0(%arg4: vector<5xi8>):
    %15 = "vector.bitcast"(%arg4) : (vector<5xi8>) -> vector<8xi5>
    "func.call"(%15) <{callee = @print_as_i1_8xi5}> : (vector<8xi5>) -> ()
    %16 = "arith.extui"(%15) : (vector<8xi5>) -> vector<8xi16>
    "func.call"(%16) <{callee = @print_as_i1_8xi16}> : (vector<8xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi4>, vector<6xi4>) -> vector<6xi4>, sym_name = "fcst_maskedload"}> ({
  ^bb0(%arg2: memref<?xi4>, %arg3: vector<6xi4>):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3>}> : () -> vector<6xi1>
    %14 = "vector.maskedload"(%arg2, %12, %13, %arg3) : (memref<?xi4>, index, vector<6xi1>, vector<6xi4>) -> vector<6xi4>
    "func.return"(%14) : (vector<6xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = dense<[-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16]> : vector<16xi16>}> : () -> vector<16xi16>
    "func.call"(%1) <{callee = @f}> : (vector<16xi16>) -> ()
    %2 = "arith.constant"() <{value = dense<[65535, 65534, 65533, 65532, 65531, 65530, 65529, 65528]> : vector<8xi32>}> : () -> vector<8xi32>
    "func.call"(%2) <{callee = @f2}> : (vector<8xi32>) -> ()
    %3 = "arith.constant"() <{value = dense<[-13994362404865, -4271950758]> : vector<2xi48>}> : () -> vector<2xi48>
    "func.call"(%3) <{callee = @f3}> : (vector<2xi48>) -> ()
    %4 = "arith.constant"() <{value = dense<[-17, -18, -19, -20, -21]> : vector<5xi8>}> : () -> vector<5xi8>
    "func.call"(%4) <{callee = @fext}> : (vector<5xi8>) -> ()
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "arith.constant"() <{value = 6 : index}> : () -> index
    %8 = "memref.alloc"(%7) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi4>
    "scf.for"(%5, %7, %6) ({
    ^bb0(%arg1: index):
      %11 = "arith.index_cast"(%arg1) : (index) -> i4
      "memref.store"(%11, %8, %arg1) : (i4, memref<?xi4>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "arith.constant"() <{value = dense<[7, -8, -7, -6, -5, -4]> : vector<6xi4>}> : () -> vector<6xi4>
    %10 = "func.call"(%8, %9) <{callee = @fcst_maskedload}> : (memref<?xi4>, vector<6xi4>) -> vector<6xi4>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<6xi4>) -> ()
    "memref.dealloc"(%8) : (memref<?xi4>) -> ()
    "func.return"() : () -> ()
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

