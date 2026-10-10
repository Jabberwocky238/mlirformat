"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "test_addi_neg"}> ({
    %76 = "test.with_bounds"() <{smax = 1 : index, smin = 0 : index, umax = 1 : index, umin = 0 : index}> : () -> index
    %77 = "test.with_bounds"() <{smax = 0 : index, smin = -1 : index, umax = -1 : index, umin = 0 : index}> : () -> index
    %78 = "arith.addi"(%76, %77) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%78) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "test_addi"}> ({
    %73 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> index
    %74 = "test.with_bounds"() <{smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index}> : () -> index
    %75 = "arith.addi"(%73, %74) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%75) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "test_addi_vec"}> ({
    %70 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<4xindex>
    %71 = "test.with_bounds"() <{smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index}> : () -> vector<4xindex>
    %72 = "arith.addi"(%70, %71) <{overflowFlags = #arith.overflow<none>}> : (vector<4xindex>, vector<4xindex>) -> vector<4xindex>
    "func.return"(%72) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "test_addi_i64"}> ({
    %67 = "test.with_bounds"() <{smax = 5 : i64, smin = 4 : i64, umax = 5 : i64, umin = 4 : i64}> : () -> i64
    %68 = "test.with_bounds"() <{smax = 7 : i64, smin = 6 : i64, umax = 7 : i64, umin = 6 : i64}> : () -> i64
    %69 = "arith.addi"(%67, %68) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%69) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_cmpi"}> ({
    %64 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %65 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %66 = "arith.cmpi"(%64, %65) <{predicate = 2 : i64}> : (index, index) -> i1
    "func.return"(%66) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xi1>, sym_name = "test_cmpi_vec"}> ({
    %61 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> vector<4xindex>
    %62 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> vector<4xindex>
    %63 = "arith.cmpi"(%61, %62) <{predicate = 2 : i64}> : (vector<4xindex>, vector<4xindex>) -> vector<4xi1>
    "func.return"(%63) : (vector<4xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_add_cmpi"}> ({
    %56 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %57 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %58 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %59 = "arith.addi"(%56, %57) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %60 = "arith.cmpi"(%58, %59) <{predicate = 2 : i64}> : (index, index) -> i1
    "func.return"(%60) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_add_cmpi_i64"}> ({
    %51 = "test.with_bounds"() <{smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64}> : () -> i64
    %52 = "test.with_bounds"() <{smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64}> : () -> i64
    %53 = "test.with_bounds"() <{smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64}> : () -> i64
    %54 = "arith.addi"(%51, %52) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    %55 = "arith.cmpi"(%53, %54) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "func.return"(%55) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "addi_extui_i8"}> ({
  ^bb0(%arg19: i8, %arg20: i8):
    %48 = "arith.extui"(%arg19) : (i8) -> i32
    %49 = "arith.extui"(%arg20) : (i8) -> i32
    %50 = "arith.addi"(%48, %49) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%50) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "addi_mixed_ext_i8"}> ({
  ^bb0(%arg17: i8, %arg18: i8):
    %45 = "arith.extsi"(%arg17) : (i8) -> i32
    %46 = "arith.extui"(%arg18) : (i8) -> i32
    %47 = "arith.addi"(%45, %46) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%47) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i16, sym_name = "addi_extsi_i16"}> ({
  ^bb0(%arg15: i8, %arg16: i8):
    %42 = "arith.extsi"(%arg15) : (i8) -> i16
    %43 = "arith.extsi"(%arg16) : (i8) -> i16
    %44 = "arith.addi"(%42, %43) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%44) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "subi_extui_i8"}> ({
  ^bb0(%arg13: i8, %arg14: i8):
    %39 = "arith.extui"(%arg13) : (i8) -> i32
    %40 = "arith.extui"(%arg14) : (i8) -> i32
    %41 = "arith.subi"(%39, %40) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%41) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "subi_mixed_ext_i8"}> ({
  ^bb0(%arg11: i8, %arg12: i8):
    %36 = "arith.extsi"(%arg11) : (i8) -> i32
    %37 = "arith.extui"(%arg12) : (i8) -> i32
    %38 = "arith.subi"(%36, %37) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%38) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "muli_extui_i8"}> ({
  ^bb0(%arg9: i8, %arg10: i8):
    %33 = "arith.extui"(%arg9) : (i8) -> i32
    %34 = "arith.extui"(%arg10) : (i8) -> i32
    %35 = "arith.muli"(%33, %34) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%35) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i32, sym_name = "muli_extsi_i32"}> ({
  ^bb0(%arg7: i16, %arg8: i16):
    %30 = "arith.extsi"(%arg7) : (i16) -> i32
    %31 = "arith.extsi"(%arg8) : (i16) -> i32
    %32 = "arith.muli"(%30, %31) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%32) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "muli_mixed_ext_i8"}> ({
  ^bb0(%arg5: i8, %arg6: i8):
    %27 = "arith.extsi"(%arg5) : (i8) -> i32
    %28 = "arith.extui"(%arg6) : (i8) -> i32
    %29 = "arith.muli"(%27, %28) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%29) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "i32_overflows_to_index"}> ({
  ^bb0(%arg4: i32):
    %22 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %23 = "arith.constant"() <{value = 4 : index}> : () -> index
    %24 = "arith.maxsi"(%arg4, %22) : (i32, i32) -> i32
    %25 = "arith.index_castui"(%24) : (i32) -> index
    %26 = "arith.muli"(%25, %23) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%26) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "i32_overflows_to_i64"}> ({
  ^bb0(%arg3: i32):
    %17 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %18 = "arith.constant"() <{value = 4 : i64}> : () -> i64
    %19 = "arith.maxsi"(%arg3, %17) : (i32, i32) -> i32
    %20 = "arith.extui"(%19) : (i32) -> i64
    %21 = "arith.muli"(%20, %18) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%21) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "clamp_to_loop_bound_and_id"}> ({
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 16 : index}> : () -> index
    %10 = "arith.constant"() <{value = 64 : index}> : () -> index
    %11 = "test.with_bounds"() <{smax = 63 : index, smin = 0 : index, umax = 63 : index, umin = 0 : index}> : () -> index
    %12 = "test.with_bounds"() <{smax = 112 : index, smin = 16 : index, umax = 112 : index, umin = 16 : index}> : () -> index
    "scf.for"(%9, %12, %10) ({
    ^bb0(%arg2: index):
      %13 = "arith.subi"(%12, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "arith.minsi"(%13, %10) : (index, index) -> index
      %15 = "arith.subi"(%14, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "arith.cmpi"(%15, %8) <{predicate = 2 : i64}> : (index, index) -> i1
      "scf.if"(%16) ({
        "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "sideeffect"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "use", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_with_iter_arg"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %4 = "test.with_bounds"() <{smax = 1 : index, smin = 0 : index, umax = 1 : index, umin = 0 : index}> : () -> index
    %5 = "test.with_bounds"() <{smax = 0 : index, smin = -1 : index, umax = -1 : index, umin = 0 : index}> : () -> index
    %6 = "scf.for"(%0, %2, %1, %3) ({
    ^bb0(%arg0: index, %arg1: vector<4xf32>):
      %7 = "arith.addi"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "func.call"(%7) <{callee = @use}> : (index) -> ()
      "scf.yield"(%arg1) : (vector<4xf32>) -> ()
    }) : (index, index, index, vector<4xf32>) -> vector<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

