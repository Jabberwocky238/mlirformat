"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi1>) -> ()
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 3>}> : () -> vector<4x4xi1>
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %2 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 2>}> : () -> vector<4x4xi1>
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %3 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 4>}> : () -> vector<4x4xi1>
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %4 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3, 1>}> : () -> vector<4x4xi1>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3, 2>}> : () -> vector<4x4xi1>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %6 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4, 3>}> : () -> vector<4x4xi1>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %7 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4, 4>}> : () -> vector<4x4xi1>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xi1>) -> ()
    %8 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 2, 3>}> : () -> vector<2x3x4xi1>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3x4xi1>) -> ()
    %9 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 2, 3>}> : () -> vector<2x3x4xi1>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3x4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

