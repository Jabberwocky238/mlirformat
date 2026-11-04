"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_sdot", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg79: vector<[16]xi8>, %arg80: vector<[16]xi8>, %arg81: vector<[4]xi32>):
    %84 = "arm_sve.intr.sdot"(%arg81, %arg79, %arg80) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "llvm.return"(%84) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_smmla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg76: vector<[16]xi8>, %arg77: vector<[16]xi8>, %arg78: vector<[4]xi32>):
    %83 = "arm_sve.intr.smmla"(%arg78, %arg76, %arg77) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "llvm.return"(%83) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_udot", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg73: vector<[16]xi8>, %arg74: vector<[16]xi8>, %arg75: vector<[4]xi32>):
    %82 = "arm_sve.intr.udot"(%arg75, %arg73, %arg74) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "llvm.return"(%82) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_ummla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg70: vector<[16]xi8>, %arg71: vector<[16]xi8>, %arg72: vector<[4]xi32>):
    %81 = "arm_sve.intr.ummla"(%arg72, %arg70, %arg71) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "llvm.return"(%81) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[16]xi8>, vector<[16]xi8>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_usmmla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg67: vector<[16]xi8>, %arg68: vector<[16]xi8>, %arg69: vector<[4]xi32>):
    %80 = "arm_sve.intr.usmmla"(%arg69, %arg67, %arg68) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    "llvm.return"(%80) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[8]xbf16>, vector<[8]xbf16>, vector<[4]xf32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_bfmmla", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg64: vector<[8]xbf16>, %arg65: vector<[8]xbf16>, %arg66: vector<[4]xf32>):
    %79 = "arm_sve.intr.bfmmla"(%arg66, %arg64, %arg65) : (vector<[4]xf32>, vector<[8]xbf16>, vector<[8]xbf16>) -> vector<[4]xf32>
    "llvm.return"(%79) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_arithi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg61: vector<[4]xi32>, %arg62: vector<[4]xi32>, %arg63: vector<[4]xi32>):
    %77 = "llvm.mul"(%arg61, %arg62) <{overflowFlags = 0 : i32}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %78 = "llvm.add"(%77, %arg63) <{overflowFlags = 0 : i32}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    "llvm.return"(%78) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_arithf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg58: vector<[4]xf32>, %arg59: vector<[4]xf32>, %arg60: vector<[4]xf32>):
    %75 = "llvm.fmul"(%arg58, %arg59) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %76 = "llvm.fadd"(%75, %arg60) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    "llvm.return"(%76) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_arithi_masked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg52: vector<[4]xi32>, %arg53: vector<[4]xi32>, %arg54: vector<[4]xi32>, %arg55: vector<[4]xi32>, %arg56: vector<[4]xi32>, %arg57: vector<[4]xi1>):
    %70 = "arm_sve.intr.add"(%arg57, %arg52, %arg53) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %71 = "arm_sve.intr.sub"(%arg57, %70, %arg53) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %72 = "arm_sve.intr.mul"(%arg57, %71, %arg55) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %73 = "arm_sve.intr.sdiv"(%arg57, %72, %arg56) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %74 = "arm_sve.intr.udiv"(%arg57, %73, %arg56) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    "llvm.return"(%74) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xf32> (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_arithf_masked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg46: vector<[4]xf32>, %arg47: vector<[4]xf32>, %arg48: vector<[4]xf32>, %arg49: vector<[4]xf32>, %arg50: vector<[4]xf32>, %arg51: vector<[4]xi1>):
    %66 = "arm_sve.intr.fadd"(%arg51, %arg46, %arg47) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %67 = "arm_sve.intr.fsub"(%arg51, %66, %arg48) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %68 = "arm_sve.intr.fmul"(%arg51, %67, %arg49) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %69 = "arm_sve.intr.fdiv"(%arg51, %68, %arg50) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    "llvm.return"(%69) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi1> (vector<[4]xf32>, vector<[4]xf32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_mask_genf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg44: vector<[4]xf32>, %arg45: vector<[4]xf32>):
    %65 = "llvm.fcmp"(%arg44, %arg45) <{fastmathFlags = #llvm.fastmath<none>, predicate = 1 : i64}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xi1>
    "llvm.return"(%65) : (vector<[4]xi1>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi1> (vector<[4]xi32>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_mask_geni", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg42: vector<[4]xi32>, %arg43: vector<[4]xi32>):
    %64 = "llvm.icmp"(%arg42, %arg43) <{predicate = 9 : i64}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi1>
    "llvm.return"(%64) : (vector<[4]xi1>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<[4]xi32> (vector<[4]xi32>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_abs_diff", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg40: vector<[4]xi32>, %arg41: vector<[4]xi32>):
    %57 = "llvm.sub"(%arg40, %arg40) <{overflowFlags = 0 : i32}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %58 = "llvm.icmp"(%arg40, %arg41) <{predicate = 5 : i64}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi1>
    %59 = "llvm.icmp"(%arg40, %arg41) <{predicate = 2 : i64}> : (vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi1>
    %60 = "arm_sve.intr.sub"(%58, %arg40, %arg41) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %61 = "arm_sve.intr.sub"(%59, %arg41, %arg40) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %62 = "arm_sve.intr.add"(%58, %57, %60) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %63 = "arm_sve.intr.add"(%59, %62, %61) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    "llvm.return"(%63) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i64, i64, i64, ptr, ptr, i64, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "memcopy", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: !llvm.ptr, %arg30: !llvm.ptr, %arg31: i64, %arg32: i64, %arg33: i64, %arg34: !llvm.ptr, %arg35: !llvm.ptr, %arg36: i64, %arg37: i64, %arg38: i64, %arg39: i64):
    %33 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %34 = "llvm.insertvalue"(%33, %arg29) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %35 = "llvm.insertvalue"(%34, %arg30) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %36 = "llvm.insertvalue"(%35, %arg31) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %37 = "llvm.insertvalue"(%36, %arg32) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %38 = "llvm.insertvalue"(%37, %arg33) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %39 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %40 = "llvm.insertvalue"(%39, %arg34) <{position = array<i64: 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %41 = "llvm.insertvalue"(%40, %arg35) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %42 = "llvm.insertvalue"(%41, %arg36) <{position = array<i64: 2>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %43 = "llvm.insertvalue"(%42, %arg37) <{position = array<i64: 3, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %44 = "llvm.insertvalue"(%43, %arg38) <{position = array<i64: 4, 0>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %45 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %46 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %47 = "llvm.intr.vscale"() : () -> i64
    %48 = "llvm.mul"(%47, %46) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%45)[^bb1] : (i64) -> ()
  ^bb1(%49: i64):  // 2 preds: ^bb0, ^bb2
    %50 = "llvm.icmp"(%49, %arg39) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%50)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    %51 = "llvm.extractvalue"(%38) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>) -> !llvm.ptr
    %52 = "llvm.getelementptr"(%51, %49) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %53 = "llvm.load"(%52) <{ordering = 0 : i64}> : (!llvm.ptr) -> vector<[4]xf32>
    %54 = "llvm.extractvalue"(%44) <{position = array<i64: 1>}> : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>) -> !llvm.ptr
    %55 = "llvm.getelementptr"(%54, %49) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%53, %55) <{ordering = 0 : i64}> : (vector<[4]xf32>, !llvm.ptr) -> ()
    %56 = "llvm.add"(%49, %48) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%56)[^bb1] : (i64) -> ()
  ^bb3:  // pred: ^bb1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, sym_name = "get_vector_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %32 = "llvm.intr.vscale"() : () -> i64
    "llvm.return"(%32) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[16]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_convert_from_svbool", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg28: vector<[16]xi1>):
    %28 = "arm_sve.intr.convert.from.svbool"(%arg28) : (vector<[16]xi1>) -> vector<[8]xi1>
    %29 = "arm_sve.intr.convert.from.svbool"(%arg28) : (vector<[16]xi1>) -> vector<[4]xi1>
    %30 = "arm_sve.intr.convert.from.svbool"(%arg28) : (vector<[16]xi1>) -> vector<[2]xi1>
    %31 = "arm_sve.intr.convert.from.svbool"(%arg28) : (vector<[16]xi1>) -> vector<[1]xi1>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[8]xi1>, vector<[4]xi1>, vector<[2]xi1>, vector<[1]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_convert_to_svbool", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: vector<[8]xi1>, %arg25: vector<[4]xi1>, %arg26: vector<[2]xi1>, %arg27: vector<[1]xi1>):
    %24 = "arm_sve.intr.convert.to.svbool"(%arg24) : (vector<[8]xi1>) -> vector<[16]xi1>
    %25 = "arm_sve.intr.convert.to.svbool"(%arg25) : (vector<[4]xi1>) -> vector<[16]xi1>
    %26 = "arm_sve.intr.convert.to.svbool"(%arg26) : (vector<[2]xi1>) -> vector<[16]xi1>
    %27 = "arm_sve.intr.convert.to.svbool"(%arg27) : (vector<[1]xi1>) -> vector<[16]xi1>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[16]xi8>, vector<[8]xi16>, vector<[4]xi32>, vector<[2]xi64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_zip_x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg20: vector<[16]xi8>, %arg21: vector<[8]xi16>, %arg22: vector<[4]xi32>, %arg23: vector<[2]xi64>):
    %20 = "arm_sve.intr.zip.x2"(%arg20, %arg20) : (vector<[16]xi8>, vector<[16]xi8>) -> !llvm.struct<(vector<[16]xi8>, vector<[16]xi8>)>
    %21 = "arm_sve.intr.zip.x2"(%arg21, %arg21) : (vector<[8]xi16>, vector<[8]xi16>) -> !llvm.struct<(vector<[8]xi16>, vector<[8]xi16>)>
    %22 = "arm_sve.intr.zip.x2"(%arg22, %arg22) : (vector<[4]xi32>, vector<[4]xi32>) -> !llvm.struct<(vector<[4]xi32>, vector<[4]xi32>)>
    %23 = "arm_sve.intr.zip.x2"(%arg23, %arg23) : (vector<[2]xi64>, vector<[2]xi64>) -> !llvm.struct<(vector<[2]xi64>, vector<[2]xi64>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[16]xi8>, vector<[8]xi16>, vector<[4]xi32>, vector<[2]xi64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_zip_x4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: vector<[16]xi8>, %arg17: vector<[8]xi16>, %arg18: vector<[4]xi32>, %arg19: vector<[2]xi64>):
    %16 = "arm_sve.intr.zip.x4"(%arg16, %arg16, %arg16, %arg16) : (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>) -> !llvm.struct<(vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>)>
    %17 = "arm_sve.intr.zip.x4"(%arg17, %arg17, %arg17, %arg17) : (vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>) -> !llvm.struct<(vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>)>
    %18 = "arm_sve.intr.zip.x4"(%arg18, %arg18, %arg18, %arg18) : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>) -> !llvm.struct<(vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>)>
    %19 = "arm_sve.intr.zip.x4"(%arg19, %arg19, %arg19, %arg19) : (vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>) -> !llvm.struct<(vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_whilelt", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: i64, %arg15: i64):
    %12 = "arm_sve.intr.whilelt"(%arg14, %arg15) : (i64, i64) -> vector<[2]xi1>
    %13 = "arm_sve.intr.whilelt"(%arg14, %arg15) : (i64, i64) -> vector<[4]xi1>
    %14 = "arm_sve.intr.whilelt"(%arg14, %arg15) : (i64, i64) -> vector<[8]xi1>
    %15 = "arm_sve.intr.whilelt"(%arg14, %arg15) : (i64, i64) -> vector<[16]xi1>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[16]xi1>, vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_psel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: vector<[16]xi1>, %arg9: vector<[2]xi1>, %arg10: vector<[4]xi1>, %arg11: vector<[8]xi1>, %arg12: vector<[16]xi1>, %arg13: i32):
    %8 = "arm_sve.intr.psel"(%arg8, %arg9, %arg13) : (vector<[16]xi1>, vector<[2]xi1>, i32) -> vector<[16]xi1>
    %9 = "arm_sve.intr.psel"(%arg8, %arg10, %arg13) : (vector<[16]xi1>, vector<[4]xi1>, i32) -> vector<[16]xi1>
    %10 = "arm_sve.intr.psel"(%arg8, %arg11, %arg13) : (vector<[16]xi1>, vector<[8]xi1>, i32) -> vector<[16]xi1>
    %11 = "arm_sve.intr.psel"(%arg8, %arg12, %arg13) : (vector<[16]xi1>, vector<[16]xi1>, i32) -> vector<[16]xi1>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[16]xi8>, vector<[8]xi16>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xi32>, vector<[4]xf32>, vector<[2]xi64>, vector<[2]xf64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sve_dupq_lane", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[8]xi16>, %arg2: vector<[8]xf16>, %arg3: vector<[8]xbf16>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xf32>, %arg6: vector<[2]xi64>, %arg7: vector<[2]xf64>):
    %0 = "arm_sve.intr.dupq_lane"(%arg0) <{lane = 0 : i64}> : (vector<[16]xi8>) -> vector<[16]xi8>
    %1 = "arm_sve.intr.dupq_lane"(%arg1) <{lane = 1 : i64}> : (vector<[8]xi16>) -> vector<[8]xi16>
    %2 = "arm_sve.intr.dupq_lane"(%arg2) <{lane = 2 : i64}> : (vector<[8]xf16>) -> vector<[8]xf16>
    %3 = "arm_sve.intr.dupq_lane"(%arg3) <{lane = 3 : i64}> : (vector<[8]xbf16>) -> vector<[8]xbf16>
    %4 = "arm_sve.intr.dupq_lane"(%arg4) <{lane = 4 : i64}> : (vector<[4]xi32>) -> vector<[4]xi32>
    %5 = "arm_sve.intr.dupq_lane"(%arg5) <{lane = 5 : i64}> : (vector<[4]xf32>) -> vector<[4]xf32>
    %6 = "arm_sve.intr.dupq_lane"(%arg6) <{lane = 6 : i64}> : (vector<[2]xi64>) -> vector<[2]xi64>
    %7 = "arm_sve.intr.dupq_lane"(%arg7) <{lane = 7 : i64}> : (vector<[2]xf64>) -> vector<[2]xf64>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

