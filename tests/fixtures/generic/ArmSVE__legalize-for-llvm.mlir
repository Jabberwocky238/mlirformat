"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_sdot"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>):
    %0 = "arm_sve.sdot"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "func.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_smmla"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>):
    %0 = "arm_sve.smmla"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "func.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_udot"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>):
    %0 = "arm_sve.udot"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "func.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_ummla"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>):
    %0 = "arm_sve.ummla"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "func.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_usmmla"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>):
    %0 = "arm_sve.usmmla"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "func.return"(%0) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi1>) -> vector<[4]xi32>, sym_name = "arm_sve_arithi_masked"}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi32>, %arg3: vector<[4]xi32>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xi1>):
    %0 = "arm_sve.masked.addi"(%arg5, %arg0, %arg1) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %1 = "arm_sve.masked.subi"(%arg5, %0, %arg2) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %2 = "arm_sve.masked.muli"(%arg5, %1, %arg3) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %3 = "arm_sve.masked.divi_signed"(%arg5, %2, %arg4) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %4 = "arm_sve.masked.divi_unsigned"(%arg5, %3, %arg4) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    "func.return"(%4) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xi1>) -> vector<[4]xf32>, sym_name = "arm_sve_arithf_masked"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>, %arg4: vector<[4]xf32>, %arg5: vector<[4]xi1>):
    %0 = "arm_sve.masked.addf"(%arg5, %arg0, %arg1) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %1 = "arm_sve.masked.subf"(%arg5, %0, %arg2) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %2 = "arm_sve.masked.mulf"(%arg5, %1, %arg3) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %3 = "arm_sve.masked.divf"(%arg5, %2, %arg4) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    "func.return"(%3) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>, sym_name = "arm_sve_abs_diff"}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>):
    %0 = "arith.subi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %1 = "arith.cmpi"(%arg0, %arg1) <{predicate = 5 : i64}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi1>
    %2 = "arith.cmpi"(%arg0, %arg1) <{predicate = 2 : i64}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi1>
    %3 = "arm_sve.masked.subi"(%1, %arg0, %arg1) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %4 = "arm_sve.masked.subi"(%2, %arg1, %arg0) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %5 = "arm_sve.masked.addi"(%1, %0, %3) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %6 = "arm_sve.masked.addi"(%2, %5, %4) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    "func.return"(%6) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "get_vector_scale"}> ({
    %0 = "vector.vscale"() : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi1>) -> vector<[16]xi1>, sym_name = "convert_1d_mask_to_svbool"}> ({
  ^bb0(%arg0: vector<[4]xi1>):
    %0 = "arm_sve.convert_to_svbool"(%arg0) : (vector<[4]xi1>) -> vector<[16]xi1>
    "func.return"(%0) : (vector<[16]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi1>) -> vector<[2]xi1>, sym_name = "convert_1d_mask_from_svbool"}> ({
  ^bb0(%arg0: vector<[16]xi1>):
    %0 = "arm_sve.convert_from_svbool"(%arg0) : (vector<[16]xi1>) -> vector<[2]xi1>
    "func.return"(%0) : (vector<[2]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[8]xi1>) -> vector<2x[16]xi1>, sym_name = "convert_2d_mask_to_svbool"}> ({
  ^bb0(%arg0: vector<2x[8]xi1>):
    %0 = "arm_sve.convert_to_svbool"(%arg0) : (vector<2x[8]xi1>) -> vector<2x[16]xi1>
    "func.return"(%0) : (vector<2x[16]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x[16]xi1>) -> vector<3x[1]xi1>, sym_name = "convert_2d_mask_from_svbool"}> ({
  ^bb0(%arg0: vector<3x[16]xi1>):
    %0 = "arm_sve.convert_from_svbool"(%arg0) : (vector<3x[16]xi1>) -> vector<3x[1]xi1>
    "func.return"(%0) : (vector<3x[1]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (vector<[8]xi16>, vector<[8]xi16>), sym_name = "arm_sve_zip_x2"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0:2 = "arm_sve.zip.x2"(%arg0, %arg1) : (vector<[8]xi16>, vector<[8]xi16>) -> (vector<[8]xi16>, vector<[8]xi16>)
    "func.return"(%0#0, %0#1) : (vector<[8]xi16>, vector<[8]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>) -> (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>), sym_name = "arm_sve_zip_x4"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[16]xi8>, %arg3: vector<[16]xi8>):
    %0:4 = "arm_sve.zip.x4"(%arg0, %arg1, %arg2, %arg3) : (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>) -> (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>)
    "func.return"(%0#0, %0#1, %0#2, %0#3) : (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>), sym_name = "arm_sve_predicate_sized_create_masks"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.create_mask"(%arg0) : (index) -> vector<[2]xi1>
    %1 = "vector.create_mask"(%arg0) : (index) -> vector<[4]xi1>
    %2 = "vector.create_mask"(%arg0) : (index) -> vector<[8]xi1>
    %3 = "vector.create_mask"(%arg0) : (index) -> vector<[16]xi1>
    "func.return"(%0, %1, %2, %3) : (vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (vector<[1]xi1>, vector<[7]xi1>, vector<[32]xi1>), sym_name = "arm_sve_unsupported_create_masks"}> ({
  ^bb0(%arg0: index):
    %0 = "vector.create_mask"(%arg0) : (index) -> vector<[1]xi1>
    %1 = "vector.create_mask"(%arg0) : (index) -> vector<[7]xi1>
    %2 = "vector.create_mask"(%arg0) : (index) -> vector<[32]xi1>
    "func.return"(%0, %1, %2) : (vector<[1]xi1>, vector<[7]xi1>, vector<[32]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi1>, vector<[4]xi1>, index) -> vector<[4]xi1>, sym_name = "arm_sve_psel_matching_predicate_types"}> ({
  ^bb0(%arg0: vector<[4]xi1>, %arg1: vector<[4]xi1>, %arg2: index):
    %0 = "arm_sve.psel"(%arg0, %arg1, %arg2) : (vector<[4]xi1>, vector<[4]xi1>, index) -> vector<[4]xi1>
    "func.return"(%0) : (vector<[4]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi1>, vector<[16]xi1>, index) -> vector<[8]xi1>, sym_name = "arm_sve_psel_mixed_predicate_types"}> ({
  ^bb0(%arg0: vector<[8]xi1>, %arg1: vector<[16]xi1>, %arg2: index):
    %0 = "arm_sve.psel"(%arg0, %arg1, %arg2) : (vector<[8]xi1>, vector<[16]xi1>, index) -> vector<[8]xi1>
    "func.return"(%0) : (vector<[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[8]xi16>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xi32>, vector<[4]xf32>, vector<[2]xi64>, vector<[2]xf64>) -> (vector<[16]xi8>, vector<[8]xi16>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xi32>, vector<[4]xf32>, vector<[2]xi64>, vector<[2]xf64>), sym_name = "arm_sve_dupq_lane"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[8]xi16>, %arg2: vector<[8]xf16>, %arg3: vector<[8]xbf16>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xf32>, %arg6: vector<[2]xi64>, %arg7: vector<[2]xf64>):
    %0 = "arm_sve.dupq_lane"(%arg0) <{lane = 0 : i64}> : (vector<[16]xi8>) -> vector<[16]xi8>
    %1 = "arm_sve.dupq_lane"(%arg1) <{lane = 1 : i64}> : (vector<[8]xi16>) -> vector<[8]xi16>
    %2 = "arm_sve.dupq_lane"(%arg2) <{lane = 2 : i64}> : (vector<[8]xf16>) -> vector<[8]xf16>
    %3 = "arm_sve.dupq_lane"(%arg3) <{lane = 3 : i64}> : (vector<[8]xbf16>) -> vector<[8]xbf16>
    %4 = "arm_sve.dupq_lane"(%arg4) <{lane = 4 : i64}> : (vector<[4]xi32>) -> vector<[4]xi32>
    %5 = "arm_sve.dupq_lane"(%arg5) <{lane = 5 : i64}> : (vector<[4]xf32>) -> vector<[4]xf32>
    %6 = "arm_sve.dupq_lane"(%arg6) <{lane = 6 : i64}> : (vector<[2]xi64>) -> vector<[2]xi64>
    %7 = "arm_sve.dupq_lane"(%arg7) <{lane = 7 : i64}> : (vector<[2]xf64>) -> vector<[2]xf64>
    "func.return"(%0, %1, %2, %3, %4, %5, %6, %7) : (vector<[16]xi8>, vector<[8]xi16>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xi32>, vector<[4]xf32>, vector<[2]xi64>, vector<[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

