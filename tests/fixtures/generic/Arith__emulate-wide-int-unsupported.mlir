"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> i64, sym_name = "unsupported_result_integer"}> ({
  ^bb0(%arg0: i64):
    %0 = "arith.extsi"(%arg0) : (i64) -> i128
    %1 = "arith.muli"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (i128, i128) -> i128
    %2 = "arith.trunci"(%1) <{overflowFlags = #arith.overflow<none>}> : (i128) -> i64
    "func.return"(%2) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi64>) -> vector<4xi64>, sym_name = "unsupported_result_vector"}> ({
  ^bb0(%arg0: vector<4xi64>):
    %0 = "arith.extsi"(%arg0) : (vector<4xi64>) -> vector<4xi128>
    %1 = "arith.muli"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi128>, vector<4xi128>) -> vector<4xi128>
    %2 = "arith.trunci"(%1) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi128>) -> vector<4xi64>
    "func.return"(%2) : (vector<4xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi64>) -> vector<4xi128>, sym_name = "unsupported_return_type"}> ({
  ^bb0(%arg0: vector<4xi64>):
    %0 = "arith.extsi"(%arg0) : (vector<4xi64>) -> vector<4xi128>
    "func.return"(%0) : (vector<4xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi128>) -> vector<4xi64>, sym_name = "unsupported_argument_type"}> ({
  ^bb0(%arg0: vector<4xi128>):
    %0 = "arith.trunci"(%arg0) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi128>) -> vector<4xi64>
    "func.return"(%0) : (vector<4xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi1>) -> (), sym_name = "unsupported_vector"}> ({
  ^bb0(%arg0: vector<2xi1>):
    %0 = "arith.constant"() <{value = dense<0> : vector<2xi64>}> : () -> vector<2xi64>
    %1 = "vector.mask"(%arg0) ({
      %2 = "vector.multi_reduction"(%0, %0) <{kind = #vector.kind<xor>, reduction_dims = array<i64>}> : (vector<2xi64>, vector<2xi64>) -> vector<2xi64>
      "vector.yield"(%2) : (vector<2xi64>) -> ()
    }) : (vector<2xi1>) -> vector<2xi64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

