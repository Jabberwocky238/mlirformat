"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xi1>, sym_name = "genbool_1d"}> ({
    %4 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    "func.return"(%4) : (vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4x4xi1>, sym_name = "genbool_2d"}> ({
    %3 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 2>}> : () -> vector<4x4xi1>
    "func.return"(%3) : (vector<4x4xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<2x3x4xi1>, sym_name = "genbool_3d"}> ({
    %2 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 1, 3>}> : () -> vector<2x3x4xi1>
    "func.return"(%2) : (vector<2x3x4xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<8xi1>, sym_name = "genbool_1d_var_but_constant"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.create_mask"(%0) : (index) -> vector<8xi1>
    "func.return"(%1) : (vector<8xi1>) -> ()
  }) : () -> ()
}) : () -> ()

