"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "addi_same_i32"}> ({
  ^bb0(%arg121: i32):
    %79 = "arith.addi"(%arg121, %arg121) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%79) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "addi_same_index"}> ({
  ^bb0(%arg120: index):
    %78 = "arith.addi"(%arg120, %arg120) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%78) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "identity_f64"}> ({
  ^bb0(%arg119: f64):
    "func.return"(%arg119) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>) -> vector<2xi32>, sym_name = "addi_same_vector_i32"}> ({
  ^bb0(%arg118: vector<2xi32>):
    %77 = "arith.addi"(%arg118, %arg118) <{overflowFlags = #arith.overflow<none>}> : (vector<2xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%77) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "identity_scalar"}> ({
  ^bb0(%arg117: i64):
    "func.return"(%arg117) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi64>) -> vector<4xi64>, sym_name = "identity_vector"}> ({
  ^bb0(%arg116: vector<4xi64>):
    "func.return"(%arg116) : (vector<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4xi64>) -> vector<3x4xi64>, sym_name = "identity_vector2d"}> ({
  ^bb0(%arg115: vector<3x4xi64>):
    "func.return"(%arg115) : (vector<3x4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi64>) -> vector<4xi64>, sym_name = "call"}> ({
  ^bb0(%arg114: vector<4xi64>):
    %76 = "func.call"(%arg114) <{callee = @identity_vector}> : (vector<4xi64>) -> vector<4xi64>
    "func.return"(%76) : (vector<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "constant_scalar"}> ({
    %73 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %74 = "arith.constant"() <{value = 4294967296 : i64}> : () -> i64
    %75 = "arith.constant"() <{value = -7 : i64}> : () -> i64
    "func.return"(%73) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<3xi64>, sym_name = "constant_vector"}> ({
    %71 = "arith.constant"() <{value = dense<4294967296> : vector<3xi64>}> : () -> vector<3xi64>
    %72 = "arith.constant"() <{value = dense<[0, 1, -2]> : vector<3xi64>}> : () -> vector<3xi64>
    "func.return"(%71) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "addi_scalar_a_b"}> ({
  ^bb0(%arg112: i64, %arg113: i64):
    %70 = "arith.addi"(%arg112, %arg113) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%70) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi64>, vector<4xi64>) -> vector<4xi64>, sym_name = "addi_vector_a_b"}> ({
  ^bb0(%arg110: vector<4xi64>, %arg111: vector<4xi64>):
    %69 = "arith.addi"(%arg110, %arg111) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    "func.return"(%69) : (vector<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "subi_scalar"}> ({
  ^bb0(%arg108: i64, %arg109: i64):
    %68 = "arith.subi"(%arg108, %arg109) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%68) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi64>, vector<4xi64>) -> vector<4xi64>, sym_name = "subi_vector"}> ({
  ^bb0(%arg106: vector<4xi64>, %arg107: vector<4xi64>):
    %67 = "arith.subi"(%arg106, %arg107) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    "func.return"(%67) : (vector<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_eq_scalar"}> ({
  ^bb0(%arg104: i64, %arg105: i64):
    %66 = "arith.cmpi"(%arg104, %arg105) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%66) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi1>, sym_name = "cmpi_eq_vector"}> ({
  ^bb0(%arg102: vector<3xi64>, %arg103: vector<3xi64>):
    %65 = "arith.cmpi"(%arg102, %arg103) <{predicate = 0 : i64}> : (vector<3xi64>, vector<3xi64>) -> vector<3xi1>
    "func.return"(%65) : (vector<3xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_ne_scalar"}> ({
  ^bb0(%arg100: i64, %arg101: i64):
    %64 = "arith.cmpi"(%arg100, %arg101) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "func.return"(%64) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi1>, sym_name = "cmpi_ne_vector"}> ({
  ^bb0(%arg98: vector<3xi64>, %arg99: vector<3xi64>):
    %63 = "arith.cmpi"(%arg98, %arg99) <{predicate = 1 : i64}> : (vector<3xi64>, vector<3xi64>) -> vector<3xi1>
    "func.return"(%63) : (vector<3xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_sge_scalar"}> ({
  ^bb0(%arg96: i64, %arg97: i64):
    %62 = "arith.cmpi"(%arg96, %arg97) <{predicate = 5 : i64}> : (i64, i64) -> i1
    "func.return"(%62) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi1>, sym_name = "cmpi_sge_vector"}> ({
  ^bb0(%arg94: vector<3xi64>, %arg95: vector<3xi64>):
    %61 = "arith.cmpi"(%arg94, %arg95) <{predicate = 5 : i64}> : (vector<3xi64>, vector<3xi64>) -> vector<3xi1>
    "func.return"(%61) : (vector<3xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_sgt_scalar"}> ({
  ^bb0(%arg92: i64, %arg93: i64):
    %60 = "arith.cmpi"(%arg92, %arg93) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "func.return"(%60) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_sle_scalar"}> ({
  ^bb0(%arg90: i64, %arg91: i64):
    %59 = "arith.cmpi"(%arg90, %arg91) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "func.return"(%59) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_slt_scalar"}> ({
  ^bb0(%arg88: i64, %arg89: i64):
    %58 = "arith.cmpi"(%arg88, %arg89) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "func.return"(%58) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_uge_scalar"}> ({
  ^bb0(%arg86: i64, %arg87: i64):
    %57 = "arith.cmpi"(%arg86, %arg87) <{predicate = 9 : i64}> : (i64, i64) -> i1
    "func.return"(%57) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_ugt_scalar"}> ({
  ^bb0(%arg84: i64, %arg85: i64):
    %56 = "arith.cmpi"(%arg84, %arg85) <{predicate = 8 : i64}> : (i64, i64) -> i1
    "func.return"(%56) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_ule_scalar"}> ({
  ^bb0(%arg82: i64, %arg83: i64):
    %55 = "arith.cmpi"(%arg82, %arg83) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "func.return"(%55) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "cmpi_ult_scalar"}> ({
  ^bb0(%arg80: i64, %arg81: i64):
    %54 = "arith.cmpi"(%arg80, %arg81) <{predicate = 6 : i64}> : (i64, i64) -> i1
    "func.return"(%54) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i64, sym_name = "extsi_scalar"}> ({
  ^bb0(%arg79: i16):
    %53 = "arith.extsi"(%arg79) : (i16) -> i64
    "func.return"(%53) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi16>) -> vector<3xi64>, sym_name = "extsi_vector"}> ({
  ^bb0(%arg78: vector<3xi16>):
    %52 = "arith.extsi"(%arg78) : (vector<3xi16>) -> vector<3xi64>
    "func.return"(%52) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i64, sym_name = "extui_scalar1"}> ({
  ^bb0(%arg77: i16):
    %51 = "arith.extui"(%arg77) : (i16) -> i64
    "func.return"(%51) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i64, sym_name = "extui_scalar2"}> ({
  ^bb0(%arg76: i32):
    %50 = "arith.extui"(%arg76) : (i32) -> i64
    "func.return"(%50) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi16>) -> vector<3xi64>, sym_name = "extui_vector"}> ({
  ^bb0(%arg75: vector<3xi16>):
    %49 = "arith.extui"(%arg75) : (vector<3xi16>) -> vector<3xi64>
    "func.return"(%49) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> index, sym_name = "index_cast_int_to_index_scalar"}> ({
  ^bb0(%arg74: i64):
    %48 = "arith.index_cast"(%arg74) : (i64) -> index
    "func.return"(%48) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>) -> vector<3xindex>, sym_name = "index_cast_int_to_index_vector"}> ({
  ^bb0(%arg73: vector<3xi64>):
    %47 = "arith.index_cast"(%arg73) : (vector<3xi64>) -> vector<3xindex>
    "func.return"(%47) : (vector<3xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> index, sym_name = "index_castui_int_to_index_scalar"}> ({
  ^bb0(%arg72: i64):
    %46 = "arith.index_castui"(%arg72) : (i64) -> index
    "func.return"(%46) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>) -> vector<3xindex>, sym_name = "index_castui_int_to_index_vector"}> ({
  ^bb0(%arg71: vector<3xi64>):
    %45 = "arith.index_castui"(%arg71) : (vector<3xi64>) -> vector<3xindex>
    "func.return"(%45) : (vector<3xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "index_cast_index_to_int_scalar"}> ({
  ^bb0(%arg70: index):
    %44 = "arith.index_cast"(%arg70) : (index) -> i64
    "func.return"(%44) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xindex>) -> vector<3xi64>, sym_name = "index_cast_index_to_int_vector"}> ({
  ^bb0(%arg69: vector<3xindex>):
    %43 = "arith.index_cast"(%arg69) : (vector<3xindex>) -> vector<3xi64>
    "func.return"(%43) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i64, sym_name = "index_castui_index_to_int_scalar"}> ({
  ^bb0(%arg68: index):
    %42 = "arith.index_castui"(%arg68) : (index) -> i64
    "func.return"(%42) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xindex>) -> vector<3xi64>, sym_name = "index_castui_index_to_int_vector"}> ({
  ^bb0(%arg67: vector<3xindex>):
    %41 = "arith.index_castui"(%arg67) : (vector<3xindex>) -> vector<3xi64>
    "func.return"(%41) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i32, sym_name = "trunci_scalar1"}> ({
  ^bb0(%arg66: i64):
    %40 = "arith.trunci"(%arg66) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i32
    "func.return"(%40) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i16, sym_name = "trunci_scalar2"}> ({
  ^bb0(%arg65: i64):
    %39 = "arith.trunci"(%arg65) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i16
    "func.return"(%39) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>) -> vector<3xi16>, sym_name = "trunci_vector"}> ({
  ^bb0(%arg64: vector<3xi64>):
    %38 = "arith.trunci"(%arg64) <{overflowFlags = #arith.overflow<none>}> : (vector<3xi64>) -> vector<3xi16>
    "func.return"(%38) : (vector<3xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "maxui_scalar"}> ({
  ^bb0(%arg62: i64, %arg63: i64):
    %37 = "arith.maxui"(%arg62, %arg63) : (i64, i64) -> i64
    "func.return"(%37) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "maxui_vector"}> ({
  ^bb0(%arg60: vector<3xi64>, %arg61: vector<3xi64>):
    %36 = "arith.maxui"(%arg60, %arg61) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%36) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "maxsi_scalar"}> ({
  ^bb0(%arg58: i64, %arg59: i64):
    %35 = "arith.maxsi"(%arg58, %arg59) : (i64, i64) -> i64
    "func.return"(%35) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "maxsi_vector"}> ({
  ^bb0(%arg56: vector<3xi64>, %arg57: vector<3xi64>):
    %34 = "arith.maxsi"(%arg56, %arg57) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%34) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "minui_scalar"}> ({
  ^bb0(%arg54: i64, %arg55: i64):
    %33 = "arith.minui"(%arg54, %arg55) : (i64, i64) -> i64
    "func.return"(%33) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "minui_vector"}> ({
  ^bb0(%arg52: vector<3xi64>, %arg53: vector<3xi64>):
    %32 = "arith.minui"(%arg52, %arg53) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%32) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "minsi_scalar"}> ({
  ^bb0(%arg50: i64, %arg51: i64):
    %31 = "arith.minsi"(%arg50, %arg51) : (i64, i64) -> i64
    "func.return"(%31) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "minsi_vector"}> ({
  ^bb0(%arg48: vector<3xi64>, %arg49: vector<3xi64>):
    %30 = "arith.minsi"(%arg48, %arg49) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%30) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64, i1) -> i64, sym_name = "select_scalar"}> ({
  ^bb0(%arg45: i64, %arg46: i64, %arg47: i1):
    %29 = "arith.select"(%arg47, %arg45, %arg46) : (i1, i64, i64) -> i64
    "func.return"(%29) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>, i1) -> vector<3xi64>, sym_name = "select_vector_whole"}> ({
  ^bb0(%arg42: vector<3xi64>, %arg43: vector<3xi64>, %arg44: i1):
    %28 = "arith.select"(%arg44, %arg42, %arg43) : (i1, vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%28) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>, vector<3xi1>) -> vector<3xi64>, sym_name = "select_vector_elementwise"}> ({
  ^bb0(%arg39: vector<3xi64>, %arg40: vector<3xi64>, %arg41: vector<3xi1>):
    %27 = "arith.select"(%arg41, %arg39, %arg40) : (vector<3xi1>, vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%27) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "muli_scalar"}> ({
  ^bb0(%arg37: i64, %arg38: i64):
    %26 = "arith.muli"(%arg37, %arg38) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%26) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "muli_vector"}> ({
  ^bb0(%arg35: vector<3xi64>, %arg36: vector<3xi64>):
    %25 = "arith.muli"(%arg35, %arg36) <{overflowFlags = #arith.overflow<none>}> : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%25) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "shli_scalar"}> ({
  ^bb0(%arg33: i64, %arg34: i64):
    %24 = "arith.shli"(%arg33, %arg34) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    "func.return"(%24) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "shli_vector"}> ({
  ^bb0(%arg31: vector<3xi64>, %arg32: vector<3xi64>):
    %23 = "arith.shli"(%arg31, %arg32) <{overflowFlags = #arith.overflow<none>}> : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%23) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "shrui_scalar"}> ({
  ^bb0(%arg29: i64, %arg30: i64):
    %22 = "arith.shrui"(%arg29, %arg30) : (i64, i64) -> i64
    "func.return"(%22) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "shrui_scalar_cst_2"}> ({
  ^bb0(%arg28: i64):
    %20 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %21 = "arith.shrui"(%arg28, %20) : (i64, i64) -> i64
    "func.return"(%21) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "shrui_scalar_cst_36"}> ({
  ^bb0(%arg27: i64):
    %18 = "arith.constant"() <{value = 36 : i64}> : () -> i64
    %19 = "arith.shrui"(%arg27, %18) : (i64, i64) -> i64
    "func.return"(%19) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "shrui_vector"}> ({
  ^bb0(%arg25: vector<3xi64>, %arg26: vector<3xi64>):
    %17 = "arith.shrui"(%arg25, %arg26) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%17) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "shrsi_scalar"}> ({
  ^bb0(%arg23: i64, %arg24: i64):
    %16 = "arith.shrsi"(%arg23, %arg24) : (i64, i64) -> i64
    "func.return"(%16) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "shrsi_vector"}> ({
  ^bb0(%arg21: vector<3xi64>, %arg22: vector<3xi64>):
    %15 = "arith.shrsi"(%arg21, %arg22) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%15) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "andi_scalar_a_b"}> ({
  ^bb0(%arg19: i64, %arg20: i64):
    %14 = "arith.andi"(%arg19, %arg20) : (i64, i64) -> i64
    "func.return"(%14) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "andi_vector_a_b"}> ({
  ^bb0(%arg17: vector<3xi64>, %arg18: vector<3xi64>):
    %13 = "arith.andi"(%arg17, %arg18) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%13) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "ori_scalar_a_b"}> ({
  ^bb0(%arg15: i64, %arg16: i64):
    %12 = "arith.ori"(%arg15, %arg16) : (i64, i64) -> i64
    "func.return"(%12) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "ori_vector_a_b"}> ({
  ^bb0(%arg13: vector<3xi64>, %arg14: vector<3xi64>):
    %11 = "arith.ori"(%arg13, %arg14) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%11) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i64, sym_name = "xori_scalar_a_b"}> ({
  ^bb0(%arg11: i64, %arg12: i64):
    %10 = "arith.xori"(%arg11, %arg12) : (i64, i64) -> i64
    "func.return"(%10) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>, vector<3xi64>) -> vector<3xi64>, sym_name = "xori_vector_a_b"}> ({
  ^bb0(%arg9: vector<3xi64>, %arg10: vector<3xi64>):
    %9 = "arith.xori"(%arg9, %arg10) : (vector<3xi64>, vector<3xi64>) -> vector<3xi64>
    "func.return"(%9) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> f64, sym_name = "uitofp_i64_f64"}> ({
  ^bb0(%arg8: i64):
    %8 = "arith.uitofp"(%arg8) : (i64) -> f64
    "func.return"(%8) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>) -> vector<3xf64>, sym_name = "uitofp_i64_f64_vector"}> ({
  ^bb0(%arg7: vector<3xi64>):
    %7 = "arith.uitofp"(%arg7) : (vector<3xi64>) -> vector<3xf64>
    "func.return"(%7) : (vector<3xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> f16, sym_name = "uitofp_i64_f16"}> ({
  ^bb0(%arg6: i64):
    %6 = "arith.uitofp"(%arg6) : (i64) -> f16
    "func.return"(%6) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> f64, sym_name = "sitofp_i64_f64"}> ({
  ^bb0(%arg5: i64):
    %5 = "arith.sitofp"(%arg5) : (i64) -> f64
    "func.return"(%5) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi64>) -> vector<3xf64>, sym_name = "sitofp_i64_f64_vector"}> ({
  ^bb0(%arg4: vector<3xi64>):
    %4 = "arith.sitofp"(%arg4) : (vector<3xi64>) -> vector<3xf64>
    "func.return"(%4) : (vector<3xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> i64, sym_name = "fptoui_i64_f64"}> ({
  ^bb0(%arg3: f64):
    %3 = "arith.fptoui"(%arg3) : (f64) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf64>) -> vector<3xi64>, sym_name = "fptoui_i64_f64_vector"}> ({
  ^bb0(%arg2: vector<3xf64>):
    %2 = "arith.fptoui"(%arg2) : (vector<3xf64>) -> vector<3xi64>
    "func.return"(%2) : (vector<3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> i64, sym_name = "fptosi_i64_f64"}> ({
  ^bb0(%arg1: f64):
    %1 = "arith.fptosi"(%arg1) : (f64) -> i64
    "func.return"(%1) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf64>) -> vector<3xi64>, sym_name = "fptosi_i64_f64_vector"}> ({
  ^bb0(%arg0: vector<3xf64>):
    %0 = "arith.fptosi"(%arg0) : (vector<3xf64>) -> vector<3xi64>
    "func.return"(%0) : (vector<3xi64>) -> ()
  }) : () -> ()
}) : () -> ()

