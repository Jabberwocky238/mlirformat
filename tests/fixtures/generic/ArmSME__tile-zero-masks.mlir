"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "zero_za_b"}> ({
    %0 = "arm_sme.zero"() : () -> vector<[16]x[16]xi8>
    "test.some_use"(%0) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "zero_za_h"}> ({
    %0 = "arm_sme.zero"() : () -> vector<[8]x[8]xi16>
    "test.prevent_zero_merge"() : () -> ()
    %1 = "arm_sme.zero"() : () -> vector<[8]x[8]xf16>
    "test.some_use"(%0) : (vector<[8]x[8]xi16>) -> ()
    "test.some_use"(%1) : (vector<[8]x[8]xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "zero_za_s"}> ({
    %0 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    "test.prevent_zero_merge"() : () -> ()
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    "test.prevent_zero_merge"() : () -> ()
    %2 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    "test.prevent_zero_merge"() : () -> ()
    %3 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "zero_za_d"}> ({
    %0 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %1 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %2 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %3 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %4 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %5 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %6 = "arm_sme.zero"() : () -> vector<[2]x[2]xi64>
    "test.prevent_zero_merge"() : () -> ()
    %7 = "arm_sme.zero"() : () -> vector<[2]x[2]xf64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%1) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%2) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%3) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%4) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%5) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%6) : (vector<[2]x[2]xi64>) -> ()
    "test.some_use"(%7) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "merge_consecutive_tile_zero_ops"}> ({
    %0 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    %2 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    %3 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "merge_consecutive_tile_zero_ops_with_barrier"}> ({
    %0 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    "test.prevent_zero_merge"() : () -> ()
    %2 = "arm_sme.zero"() : () -> vector<[4]x[4]xi32>
    %3 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

