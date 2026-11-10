"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "int32_scalar"}> ({
  ^bb0(%arg10: i32, %arg11: i32):
    %5 = "arith.addi"(%arg10, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %6 = "arith.subi"(%arg10, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %7 = "arith.muli"(%arg10, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %8 = "arith.divsi"(%arg10, %arg11) : (i32, i32) -> i32
    %9 = "arith.divui"(%arg10, %arg11) : (i32, i32) -> i32
    %10 = "arith.remui"(%arg10, %arg11) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "int32_scalar_srem"}> ({
  ^bb0(%arg8: i32, %arg9: i32):
    %4 = "arith.remsi"(%arg8, %arg9) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "scalar_ceildivui"}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %3 = "arith.ceildivui"(%arg6, %arg7) : (i32, i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "scalar_ceildivsi"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    %2 = "arith.ceildivsi"(%arg4, %arg5) : (i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "scalar_floordivsi"}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %1 = "arith.floordivsi"(%arg2, %arg3) : (i32, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi32>, sym_name = "vector_ceildivsi"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "arith.ceildivsi"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "bitwise_scalar"}> ({
  ^bb0(%arg10: i32, %arg11: i32):
    %15 = "arith.andi"(%arg10, %arg11) : (i32, i32) -> i32
    %16 = "arith.ori"(%arg10, %arg11) : (i32, i32) -> i32
    %17 = "arith.xori"(%arg10, %arg11) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "bitwise_vector"}> ({
  ^bb0(%arg8: vector<4xi32>, %arg9: vector<4xi32>):
    %12 = "arith.andi"(%arg8, %arg9) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %13 = "arith.ori"(%arg8, %arg9) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %14 = "arith.xori"(%arg8, %arg9) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "logical_scalar"}> ({
  ^bb0(%arg6: i1, %arg7: i1):
    %9 = "arith.andi"(%arg6, %arg7) : (i1, i1) -> i1
    %10 = "arith.ori"(%arg6, %arg7) : (i1, i1) -> i1
    %11 = "arith.xori"(%arg6, %arg7) : (i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "logical_vector"}> ({
  ^bb0(%arg4: vector<4xi1>, %arg5: vector<4xi1>):
    %6 = "arith.andi"(%arg4, %arg5) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    %7 = "arith.ori"(%arg4, %arg5) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    %8 = "arith.xori"(%arg4, %arg5) : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "shift_scalar"}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %3 = "arith.shli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %4 = "arith.shrsi"(%arg2, %arg3) : (i32, i32) -> i32
    %5 = "arith.shrui"(%arg2, %arg3) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "shift_vector"}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "arith.shli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %1 = "arith.shrsi"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %2 = "arith.shrui"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "cmpf"}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %2 = "arith.cmpf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>, vector<1xf32>) -> (), sym_name = "vec1cmpf"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: vector<1xf32>):
    %0 = "arith.cmpf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (vector<1xf32>, vector<1xf32>) -> vector<1xi1>
    %1 = "arith.cmpf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>, predicate = 11 : i64}> : (vector<1xf32>, vector<1xf32>) -> vector<1xi1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "cmpi"}> ({
  ^bb0(%arg16: i32, %arg17: i32):
    %15 = "arith.cmpi"(%arg16, %arg17) <{predicate = 0 : i64}> : (i32, i32) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "indexcmpi"}> ({
  ^bb0(%arg14: index, %arg15: index):
    %14 = "arith.cmpi"(%arg14, %arg15) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xi32>, vector<1xi32>) -> (), sym_name = "vec1cmpi"}> ({
  ^bb0(%arg12: vector<1xi32>, %arg13: vector<1xi32>):
    %12 = "arith.cmpi"(%arg12, %arg13) <{predicate = 6 : i64}> : (vector<1xi32>, vector<1xi32>) -> vector<1xi1>
    %13 = "arith.cmpi"(%arg12, %arg13) <{predicate = 4 : i64}> : (vector<1xi32>, vector<1xi32>) -> vector<1xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "boolcmpi_equality"}> ({
  ^bb0(%arg10: i1, %arg11: i1):
    %10 = "arith.cmpi"(%arg10, %arg11) <{predicate = 0 : i64}> : (i1, i1) -> i1
    %11 = "arith.cmpi"(%arg10, %arg11) <{predicate = 1 : i64}> : (i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "boolcmpi_unsigned"}> ({
  ^bb0(%arg8: i1, %arg9: i1):
    %8 = "arith.cmpi"(%arg8, %arg9) <{predicate = 9 : i64}> : (i1, i1) -> i1
    %9 = "arith.cmpi"(%arg8, %arg9) <{predicate = 6 : i64}> : (i1, i1) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xi1>, vector<1xi1>) -> (), sym_name = "vec1boolcmpi_equality"}> ({
  ^bb0(%arg6: vector<1xi1>, %arg7: vector<1xi1>):
    %6 = "arith.cmpi"(%arg6, %arg7) <{predicate = 0 : i64}> : (vector<1xi1>, vector<1xi1>) -> vector<1xi1>
    %7 = "arith.cmpi"(%arg6, %arg7) <{predicate = 1 : i64}> : (vector<1xi1>, vector<1xi1>) -> vector<1xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xi1>, vector<1xi1>) -> (), sym_name = "vec1boolcmpi_unsigned"}> ({
  ^bb0(%arg4: vector<1xi1>, %arg5: vector<1xi1>):
    %4 = "arith.cmpi"(%arg4, %arg5) <{predicate = 9 : i64}> : (vector<1xi1>, vector<1xi1>) -> vector<1xi1>
    %5 = "arith.cmpi"(%arg4, %arg5) <{predicate = 6 : i64}> : (vector<1xi1>, vector<1xi1>) -> vector<1xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi1>, vector<4xi1>) -> (), sym_name = "vecboolcmpi_equality"}> ({
  ^bb0(%arg2: vector<4xi1>, %arg3: vector<4xi1>):
    %2 = "arith.cmpi"(%arg2, %arg3) <{predicate = 0 : i64}> : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    %3 = "arith.cmpi"(%arg2, %arg3) <{predicate = 1 : i64}> : (vector<4xi1>, vector<4xi1>) -> vector<4xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi1>, vector<3xi1>) -> (), sym_name = "vecboolcmpi_unsigned"}> ({
  ^bb0(%arg0: vector<3xi1>, %arg1: vector<3xi1>):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 9 : i64}> : (vector<3xi1>, vector<3xi1>) -> vector<3xi1>
    %1 = "arith.cmpi"(%arg0, %arg1) <{predicate = 6 : i64}> : (vector<3xi1>, vector<3xi1>) -> vector<3xi1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

