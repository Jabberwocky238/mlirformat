"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[1]xi1>) -> vector<[1]xi1>, sym_name = "store_and_reload_sve_predicate_nxv1i1"}> ({
  ^bb0(%arg0: vector<[1]xi1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xi1>>
    "memref.store"(%arg0, %0) : (vector<[1]xi1>, memref<vector<[1]xi1>>) -> ()
    %1 = "memref.load"(%0) : (memref<vector<[1]xi1>>) -> vector<[1]xi1>
    "func.return"(%1) : (vector<[1]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]xi1>) -> vector<[2]xi1>, sym_name = "store_and_reload_sve_predicate_nxv2i1"}> ({
  ^bb0(%arg0: vector<[2]xi1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xi1>>
    "memref.store"(%arg0, %0) : (vector<[2]xi1>, memref<vector<[2]xi1>>) -> ()
    %1 = "memref.load"(%0) : (memref<vector<[2]xi1>>) -> vector<[2]xi1>
    "func.return"(%1) : (vector<[2]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi1>) -> vector<[4]xi1>, sym_name = "store_and_reload_sve_predicate_nxv4i1"}> ({
  ^bb0(%arg0: vector<[4]xi1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xi1>>
    "memref.store"(%arg0, %0) : (vector<[4]xi1>, memref<vector<[4]xi1>>) -> ()
    %1 = "memref.load"(%0) : (memref<vector<[4]xi1>>) -> vector<[4]xi1>
    "func.return"(%1) : (vector<[4]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi1>) -> vector<[8]xi1>, sym_name = "store_and_reload_sve_predicate_nxv8i1"}> ({
  ^bb0(%arg0: vector<[8]xi1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xi1>>
    "memref.store"(%arg0, %0) : (vector<[8]xi1>, memref<vector<[8]xi1>>) -> ()
    %1 = "memref.load"(%0) : (memref<vector<[8]xi1>>) -> vector<[8]xi1>
    "func.return"(%1) : (vector<[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi1>) -> vector<[16]xi1>, sym_name = "store_and_reload_sve_predicate_nxv16i1"}> ({
  ^bb0(%arg0: vector<[16]xi1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xi1>>
    "memref.store"(%arg0, %0) : (vector<[16]xi1>, memref<vector<[16]xi1>>) -> ()
    %1 = "memref.load"(%0) : (memref<vector<[16]xi1>>) -> vector<[16]xi1>
    "func.return"(%1) : (vector<[16]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[7]xi1>) -> vector<[7]xi1>, sym_name = "store_and_reload_unsupported_type"}> ({
  ^bb0(%arg0: vector<[7]xi1>):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[7]xi1>>
    "memref.store"(%arg0, %0) : (vector<[7]xi1>, memref<vector<[7]xi1>>) -> ()
    %1 = "memref.load"(%0) : (memref<vector<[7]xi1>>) -> vector<[7]xi1>
    "func.return"(%1) : (vector<[7]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x[8]xi1>) -> vector<[8]xi1>, sym_name = "store_2d_mask_and_reload_slice"}> ({
  ^bb0(%arg0: vector<3x[8]xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<3x[8]xi1>>
    "memref.store"(%arg0, %1) : (vector<3x[8]xi1>, memref<vector<3x[8]xi1>>) -> ()
    %2 = "vector.type_cast"(%1) : (memref<vector<3x[8]xi1>>) -> memref<3xvector<[8]xi1>>
    %3 = "memref.load"(%2, %0) : (memref<3xvector<[8]xi1>>, index) -> vector<[8]xi1>
    "func.return"(%3) : (vector<[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "set_sve_alloca_alignment"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[32]xi8>>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xi8>>
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xi8>>
    %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xi8>>
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xi8>>
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xi8>>
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[32]xi16>>
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xi16>>
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xi16>>
    %9 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xi16>>
    %10 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xi16>>
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xi16>>
    %12 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[32]xi32>>
    %13 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xi32>>
    %14 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xi32>>
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xi32>>
    %16 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xi32>>
    %17 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xi32>>
    %18 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[32]xi64>>
    %19 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xi64>>
    %20 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xi64>>
    %21 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xi64>>
    %22 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xi64>>
    %23 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xi64>>
    %24 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[32]xf32>>
    %25 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xf32>>
    %26 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xf32>>
    %27 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xf32>>
    %28 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xf32>>
    %29 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xf32>>
    %30 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[32]xf64>>
    %31 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[16]xf64>>
    %32 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[8]xf64>>
    %33 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[4]xf64>>
    %34 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[2]xf64>>
    %35 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<vector<[1]xf64>>
    "prevent.dce"(%0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35) : (memref<vector<[32]xi8>>, memref<vector<[16]xi8>>, memref<vector<[8]xi8>>, memref<vector<[4]xi8>>, memref<vector<[2]xi8>>, memref<vector<[1]xi8>>, memref<vector<[32]xi16>>, memref<vector<[16]xi16>>, memref<vector<[8]xi16>>, memref<vector<[4]xi16>>, memref<vector<[2]xi16>>, memref<vector<[1]xi16>>, memref<vector<[32]xi32>>, memref<vector<[16]xi32>>, memref<vector<[8]xi32>>, memref<vector<[4]xi32>>, memref<vector<[2]xi32>>, memref<vector<[1]xi32>>, memref<vector<[32]xi64>>, memref<vector<[16]xi64>>, memref<vector<[8]xi64>>, memref<vector<[4]xi64>>, memref<vector<[2]xi64>>, memref<vector<[1]xi64>>, memref<vector<[32]xf32>>, memref<vector<[16]xf32>>, memref<vector<[8]xf32>>, memref<vector<[4]xf32>>, memref<vector<[2]xf32>>, memref<vector<[1]xf32>>, memref<vector<[32]xf64>>, memref<vector<[16]xf64>>, memref<vector<[8]xf64>>, memref<vector<[4]xf64>>, memref<vector<[2]xf64>>, memref<vector<[1]xf64>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

