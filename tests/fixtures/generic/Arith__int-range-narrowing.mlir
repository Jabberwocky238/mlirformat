#map = affine_map<() -> (0)>
#map1 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "test_addi_neg"}> ({
    %117 = "test.with_bounds"() <{smax = 1 : index, smin = 0 : index, umax = 1 : index, umin = 0 : index}> : () -> index
    %118 = "test.with_bounds"() <{smax = 0 : index, smin = -1 : index, umax = -1 : index, umin = 0 : index}> : () -> index
    %119 = "arith.addi"(%117, %118) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%119) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "test_addi"}> ({
    %114 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> index
    %115 = "test.with_bounds"() <{smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index}> : () -> index
    %116 = "arith.addi"(%114, %115) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%116) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xindex>, sym_name = "test_addi_vec"}> ({
    %111 = "test.with_bounds"() <{smax = 5 : index, smin = 4 : index, umax = 5 : index, umin = 4 : index}> : () -> vector<4xindex>
    %112 = "test.with_bounds"() <{smax = 7 : index, smin = 6 : index, umax = 7 : index, umin = 6 : index}> : () -> vector<4xindex>
    %113 = "arith.addi"(%111, %112) <{overflowFlags = #arith.overflow<none>}> : (vector<4xindex>, vector<4xindex>) -> vector<4xindex>
    "func.return"(%113) : (vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "test_addi_i64"}> ({
    %108 = "test.with_bounds"() <{smax = 5 : i64, smin = 4 : i64, umax = 5 : i64, umin = 4 : i64}> : () -> i64
    %109 = "test.with_bounds"() <{smax = 7 : i64, smin = 6 : i64, umax = 7 : i64, umin = 6 : i64}> : () -> i64
    %110 = "arith.addi"(%108, %109) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%110) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_cmpi"}> ({
    %105 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %106 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %107 = "arith.cmpi"(%105, %106) <{predicate = 2 : i64}> : (index, index) -> i1
    "func.return"(%107) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_cmpi_si_pred_out_of_signed_bounds"}> ({
    %94 = "test.with_bounds"() <{smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index}> : () -> index
    %95 = "test.with_bounds"() <{smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index}> : () -> index
    %96 = "arith.cmpi"(%95, %94) <{predicate = 2 : i64}> : (index, index) -> i1
    %97 = "test.with_bounds"() <{smax = 2147483648 : index, smin = 0 : index, umax = 2147483648 : index, umin = 0 : index}> : () -> index
    %98 = "test.with_bounds"() <{smax = 0 : index, smin = 0 : index, umax = 0 : index, umin = 0 : index}> : () -> index
    %99 = "arith.cmpi"(%97, %98) <{predicate = 4 : i64}> : (index, index) -> i1
    %100 = "arith.cmpi"(%94, %98) <{predicate = 3 : i64}> : (index, index) -> i1
    %101 = "arith.cmpi"(%97, %98) <{predicate = 5 : i64}> : (index, index) -> i1
    %102 = "arith.andi"(%96, %99) : (i1, i1) -> i1
    %103 = "arith.andi"(%100, %101) : (i1, i1) -> i1
    %104 = "arith.andi"(%102, %103) : (i1, i1) -> i1
    "func.return"(%104) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_cmpi_ui_pred_out_of_signed_bounds"}> ({
    %91 = "test.with_bounds"() <{smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index}> : () -> index
    %92 = "test.with_bounds"() <{smax = 4292870144 : index, smin = 0 : index, umax = 4292870144 : index, umin = 0 : index}> : () -> index
    %93 = "arith.cmpi"(%91, %92) <{predicate = 6 : i64}> : (index, index) -> i1
    "func.return"(%93) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<4xi1>, sym_name = "test_cmpi_vec"}> ({
    %88 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> vector<4xindex>
    %89 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> vector<4xindex>
    %90 = "arith.cmpi"(%88, %89) <{predicate = 2 : i64}> : (vector<4xindex>, vector<4xindex>) -> vector<4xi1>
    "func.return"(%90) : (vector<4xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_add_cmpi"}> ({
    %83 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %84 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %85 = "test.with_bounds"() <{smax = 10 : index, smin = 0 : index, umax = 10 : index, umin = 0 : index}> : () -> index
    %86 = "arith.addi"(%83, %84) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %87 = "arith.cmpi"(%85, %86) <{predicate = 2 : i64}> : (index, index) -> i1
    "func.return"(%87) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "test_add_cmpi_i64"}> ({
    %78 = "test.with_bounds"() <{smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64}> : () -> i64
    %79 = "test.with_bounds"() <{smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64}> : () -> i64
    %80 = "test.with_bounds"() <{smax = 10 : i64, smin = 0 : i64, umax = 10 : i64, umin = 0 : i64}> : () -> i64
    %81 = "arith.addi"(%78, %79) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    %82 = "arith.cmpi"(%80, %81) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "func.return"(%82) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "addi_extui_i8"}> ({
  ^bb0(%arg22: i8, %arg23: i8):
    %75 = "arith.extui"(%arg22) : (i8) -> i32
    %76 = "arith.extui"(%arg23) : (i8) -> i32
    %77 = "arith.addi"(%75, %76) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%77) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "addi_mixed_ext_i8"}> ({
  ^bb0(%arg20: i8, %arg21: i8):
    %72 = "arith.extsi"(%arg20) : (i8) -> i32
    %73 = "arith.extui"(%arg21) : (i8) -> i32
    %74 = "arith.addi"(%72, %73) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%74) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i16, sym_name = "addi_extsi_i16"}> ({
  ^bb0(%arg18: i8, %arg19: i8):
    %69 = "arith.extsi"(%arg18) : (i8) -> i16
    %70 = "arith.extsi"(%arg19) : (i8) -> i16
    %71 = "arith.addi"(%69, %70) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%71) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "subi_extui_i8"}> ({
  ^bb0(%arg16: i8, %arg17: i8):
    %66 = "arith.extui"(%arg16) : (i8) -> i32
    %67 = "arith.extui"(%arg17) : (i8) -> i32
    %68 = "arith.subi"(%66, %67) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%68) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "subi_mixed_ext_i8"}> ({
  ^bb0(%arg14: i8, %arg15: i8):
    %63 = "arith.extsi"(%arg14) : (i8) -> i32
    %64 = "arith.extui"(%arg15) : (i8) -> i32
    %65 = "arith.subi"(%63, %64) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%65) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i64, i64, i64, i64, i64, i64, i64), sym_name = "signed_ops_out_of_narrowed_signed_range"}> ({
    %53 = "test.with_bounds"() <{smax = 4292870144 : i64, smin = 0 : i64, umax = 4292870144 : i64, umin = 0 : i64}> : () -> i64
    %54 = "test.with_bounds"() <{smax = 8 : i64, smin = 1 : i64, umax = 8 : i64, umin = 1 : i64}> : () -> i64
    %55 = "test.with_bounds"() <{smax = 0 : i64, smin = 0 : i64, umax = 0 : i64, umin = 0 : i64}> : () -> i64
    %56 = "arith.divsi"(%53, %54) : (i64, i64) -> i64
    %57 = "arith.ceildivsi"(%53, %54) : (i64, i64) -> i64
    %58 = "arith.floordivsi"(%53, %54) : (i64, i64) -> i64
    %59 = "arith.remsi"(%53, %54) : (i64, i64) -> i64
    %60 = "arith.maxsi"(%53, %55) : (i64, i64) -> i64
    %61 = "arith.minsi"(%53, %55) : (i64, i64) -> i64
    %62 = "arith.shrsi"(%53, %54) : (i64, i64) -> i64
    "func.return"(%56, %57, %58, %59, %60, %61, %62) : (i64, i64, i64, i64, i64, i64, i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i64, i64, i64, i64, i64, i64), sym_name = "unsigned_ops_out_of_narrowed_signed_range"}> ({
    %44 = "test.with_bounds"() <{smax = 4292870144 : i64, smin = 0 : i64, umax = 4292870144 : i64, umin = 0 : i64}> : () -> i64
    %45 = "test.with_bounds"() <{smax = 8 : i64, smin = 1 : i64, umax = 8 : i64, umin = 1 : i64}> : () -> i64
    %46 = "test.with_bounds"() <{smax = 0 : i64, smin = 0 : i64, umax = 0 : i64, umin = 0 : i64}> : () -> i64
    %47 = "arith.divui"(%44, %45) : (i64, i64) -> i64
    %48 = "arith.ceildivui"(%44, %45) : (i64, i64) -> i64
    %49 = "arith.remui"(%44, %45) : (i64, i64) -> i64
    %50 = "arith.maxui"(%44, %46) : (i64, i64) -> i64
    %51 = "arith.minui"(%44, %46) : (i64, i64) -> i64
    %52 = "arith.shrui"(%44, %45) : (i64, i64) -> i64
    "func.return"(%47, %48, %49, %50, %51, %52) : (i64, i64, i64, i64, i64, i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "muli_extui_i8"}> ({
  ^bb0(%arg12: i8, %arg13: i8):
    %41 = "arith.extui"(%arg12) : (i8) -> i32
    %42 = "arith.extui"(%arg13) : (i8) -> i32
    %43 = "arith.muli"(%41, %42) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%43) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i32, sym_name = "muli_extsi_i32"}> ({
  ^bb0(%arg10: i16, %arg11: i16):
    %38 = "arith.extsi"(%arg10) : (i16) -> i32
    %39 = "arith.extsi"(%arg11) : (i16) -> i32
    %40 = "arith.muli"(%38, %39) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%40) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i8, i8) -> i32, sym_name = "muli_mixed_ext_i8"}> ({
  ^bb0(%arg8: i8, %arg9: i8):
    %35 = "arith.extsi"(%arg8) : (i8) -> i32
    %36 = "arith.extui"(%arg9) : (i8) -> i32
    %37 = "arith.muli"(%35, %36) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%37) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> index, sym_name = "i32_overflows_to_index"}> ({
  ^bb0(%arg7: i32):
    %30 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %31 = "arith.constant"() <{value = 4 : index}> : () -> index
    %32 = "arith.maxsi"(%arg7, %30) : (i32, i32) -> i32
    %33 = "arith.index_castui"(%32) : (i32) -> index
    %34 = "arith.muli"(%33, %31) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%34) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "i32_overflows_to_i64"}> ({
  ^bb0(%arg6: i32):
    %25 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %26 = "arith.constant"() <{value = 4 : i64}> : () -> i64
    %27 = "arith.maxsi"(%arg6, %25) : (i32, i32) -> i32
    %28 = "arith.extui"(%27) : (i32) -> i64
    %29 = "arith.muli"(%28, %26) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%29) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "clamp_to_loop_bound_and_id"}> ({
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "arith.constant"() <{value = 16 : index}> : () -> index
    %18 = "arith.constant"() <{value = 64 : index}> : () -> index
    %19 = "test.with_bounds"() <{smax = 63 : index, smin = 0 : index, umax = 63 : index, umin = 0 : index}> : () -> index
    %20 = "test.with_bounds"() <{smax = 112 : index, smin = 16 : index, umax = 112 : index, umin = 16 : index}> : () -> index
    "scf.for"(%17, %20, %18) ({
    ^bb0(%arg5: index):
      %21 = "arith.subi"(%20, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %22 = "arith.minsi"(%21, %18) : (index, index) -> index
      %23 = "arith.subi"(%22, %19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %24 = "arith.cmpi"(%23, %16) <{predicate = 2 : i64}> : (index, index) -> i1
      "scf.if"(%24) ({
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
  "func.func"() <{function_type = (i64) -> (), sym_name = "use_i64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loop_with_iter_arg"}> ({
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 16 : index}> : () -> index
    %11 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    %12 = "test.with_bounds"() <{smax = 1 : index, smin = 0 : index, umax = 1 : index, umin = 0 : index}> : () -> index
    %13 = "test.with_bounds"() <{smax = 0 : index, smin = -1 : index, umax = -1 : index, umin = 0 : index}> : () -> index
    %14 = "scf.for"(%8, %10, %9, %11) ({
    ^bb0(%arg3: index, %arg4: vector<4xf32>):
      %15 = "arith.addi"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "func.call"(%15) <{callee = @use}> : (index) -> ()
      "scf.yield"(%arg4) : (vector<4xf32>) -> ()
    }) : (index, index, index, vector<4xf32>) -> vector<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "narrow_loop_bounds"}> ({
    %1 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 10 : i64}> : () -> i64
    %3 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "test.with_bounds"() <{smax = 0 : i64, smin = 0 : i64, umax = 0 : i64, umin = 0 : i64}> : () -> i64
    %5 = "test.with_bounds"() <{smax = 10 : i64, smin = 10 : i64, umax = 10 : i64, umin = 10 : i64}> : () -> i64
    %6 = "test.with_bounds"() <{smax = 1 : i64, smin = 1 : i64, umax = 1 : i64, umin = 1 : i64}> : () -> i64
    "scf.for"(%4, %5, %6) ({
    ^bb0(%arg2: i64):
      %7 = "arith.addi"(%arg2, %3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "func.call"(%7) <{callee = @use_i64}> : (i64) -> ()
      "scf.yield"() : () -> ()
    }) : (i64, i64, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "use_index", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "affine_for_dynamic_bound"}> ({
  ^bb0(%arg0: index):
    "affine.for"(%arg0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index):
      "func.call"(%arg1) <{callee = @use_index}> : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<2x0xi32>, sym_name = "zero_element_tensor_constant"}> ({
    %0 = "arith.constant"() <{value = dense<> : tensor<2x0xi32>}> : () -> tensor<2x0xi32>
    "func.return"(%0) : (tensor<2x0xi32>) -> ()
  }) : () -> ()
}) : () -> ()

