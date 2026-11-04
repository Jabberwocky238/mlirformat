module {
  llvm.func @arm_sve_sdot(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = "arm_sve.intr.sdot"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
  llvm.func @arm_sve_smmla(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = "arm_sve.intr.smmla"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
  llvm.func @arm_sve_udot(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = "arm_sve.intr.udot"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
  llvm.func @arm_sve_ummla(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = "arm_sve.intr.ummla"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
  llvm.func @arm_sve_usmmla(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = "arm_sve.intr.usmmla"(%arg2, %arg0, %arg1) : (vector<[4]xi32>, vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]xi32>
    llvm.return %0 : vector<[4]xi32>
  }
  llvm.func @arm_sve_bfmmla(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>, %arg2: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = arm_sve.intr.bfmmla %arg2, %arg0, %arg1 : vector<[8]xbf16> to vector<[4]xf32>
    llvm.return %0 : vector<[4]xf32>
  }
  llvm.func @arm_sve_arithi(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = llvm.mul %arg0, %arg1 : vector<[4]xi32>
    %1 = llvm.add %0, %arg2 : vector<[4]xi32>
    llvm.return %1 : vector<[4]xi32>
  }
  llvm.func @arm_sve_arithf(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = llvm.fmul %arg0, %arg1 : vector<[4]xf32>
    %1 = llvm.fadd %0, %arg2 : vector<[4]xf32>
    llvm.return %1 : vector<[4]xf32>
  }
  llvm.func @arm_sve_arithi_masked(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>, %arg2: vector<[4]xi32>, %arg3: vector<[4]xi32>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xi1>) -> vector<[4]xi32> {
    %0 = "arm_sve.intr.add"(%arg5, %arg0, %arg1) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %1 = "arm_sve.intr.sub"(%arg5, %0, %arg1) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %2 = "arm_sve.intr.mul"(%arg5, %1, %arg3) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %3 = "arm_sve.intr.sdiv"(%arg5, %2, %arg4) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %4 = "arm_sve.intr.udiv"(%arg5, %3, %arg4) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    llvm.return %4 : vector<[4]xi32>
  }
  llvm.func @arm_sve_arithf_masked(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>, %arg4: vector<[4]xf32>, %arg5: vector<[4]xi1>) -> vector<[4]xf32> {
    %0 = "arm_sve.intr.fadd"(%arg5, %arg0, %arg1) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %1 = "arm_sve.intr.fsub"(%arg5, %0, %arg2) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %2 = "arm_sve.intr.fmul"(%arg5, %1, %arg3) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %3 = "arm_sve.intr.fdiv"(%arg5, %2, %arg4) : (vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    llvm.return %3 : vector<[4]xf32>
  }
  llvm.func @arm_sve_mask_genf(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>) -> vector<[4]xi1> {
    %0 = llvm.fcmp "oeq" %arg0, %arg1 : vector<[4]xf32>
    llvm.return %0 : vector<[4]xi1>
  }
  llvm.func @arm_sve_mask_geni(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>) -> vector<[4]xi1> {
    %0 = llvm.icmp "uge" %arg0, %arg1 : vector<[4]xi32>
    llvm.return %0 : vector<[4]xi1>
  }
  llvm.func @arm_sve_abs_diff(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = llvm.sub %arg0, %arg0 : vector<[4]xi32>
    %1 = llvm.icmp "sge" %arg0, %arg1 : vector<[4]xi32>
    %2 = llvm.icmp "slt" %arg0, %arg1 : vector<[4]xi32>
    %3 = "arm_sve.intr.sub"(%1, %arg0, %arg1) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %4 = "arm_sve.intr.sub"(%2, %arg1, %arg0) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %5 = "arm_sve.intr.add"(%1, %0, %3) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    %6 = "arm_sve.intr.add"(%2, %5, %4) : (vector<[4]xi1>, vector<[4]xi32>, vector<[4]xi32>) -> vector<[4]xi32>
    llvm.return %6 : vector<[4]xi32>
  }
  llvm.func @memcopy(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %7 = llvm.insertvalue %arg5, %6[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %arg6, %7[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg7, %8[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg8, %9[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg9, %10[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.mlir.constant(4 : index) : i64
    %14 = "llvm.intr.vscale"() : () -> i64
    %15 = llvm.mul %14, %13 : i64
    llvm.br ^bb1(%12 : i64)
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb2
    %17 = llvm.icmp "slt" %16, %arg10 : i64
    llvm.cond_br %17, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %18 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.getelementptr %18[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> vector<[4]xf32>
    %21 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.getelementptr %21[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %20, %22 : vector<[4]xf32>, !llvm.ptr
    %23 = llvm.add %16, %15 : i64
    llvm.br ^bb1(%23 : i64)
  ^bb3:  // pred: ^bb1
    llvm.return
  }
  llvm.func @get_vector_scale() -> i64 {
    %0 = "llvm.intr.vscale"() : () -> i64
    llvm.return %0 : i64
  }
  llvm.func @arm_sve_convert_from_svbool(%arg0: vector<[16]xi1>) {
    %0 = "arm_sve.intr.convert.from.svbool"(%arg0) : (vector<[16]xi1>) -> vector<[8]xi1>
    %1 = "arm_sve.intr.convert.from.svbool"(%arg0) : (vector<[16]xi1>) -> vector<[4]xi1>
    %2 = "arm_sve.intr.convert.from.svbool"(%arg0) : (vector<[16]xi1>) -> vector<[2]xi1>
    %3 = "arm_sve.intr.convert.from.svbool"(%arg0) : (vector<[16]xi1>) -> vector<[1]xi1>
    llvm.return
  }
  llvm.func @arm_sve_convert_to_svbool(%arg0: vector<[8]xi1>, %arg1: vector<[4]xi1>, %arg2: vector<[2]xi1>, %arg3: vector<[1]xi1>) {
    %0 = "arm_sve.intr.convert.to.svbool"(%arg0) : (vector<[8]xi1>) -> vector<[16]xi1>
    %1 = "arm_sve.intr.convert.to.svbool"(%arg1) : (vector<[4]xi1>) -> vector<[16]xi1>
    %2 = "arm_sve.intr.convert.to.svbool"(%arg2) : (vector<[2]xi1>) -> vector<[16]xi1>
    %3 = "arm_sve.intr.convert.to.svbool"(%arg3) : (vector<[1]xi1>) -> vector<[16]xi1>
    llvm.return
  }
  llvm.func @arm_sve_zip_x2(%arg0: vector<[16]xi8>, %arg1: vector<[8]xi16>, %arg2: vector<[4]xi32>, %arg3: vector<[2]xi64>) {
    %0 = "arm_sve.intr.zip.x2"(%arg0, %arg0) : (vector<[16]xi8>, vector<[16]xi8>) -> !llvm.struct<(vector<[16]xi8>, vector<[16]xi8>)>
    %1 = "arm_sve.intr.zip.x2"(%arg1, %arg1) : (vector<[8]xi16>, vector<[8]xi16>) -> !llvm.struct<(vector<[8]xi16>, vector<[8]xi16>)>
    %2 = "arm_sve.intr.zip.x2"(%arg2, %arg2) : (vector<[4]xi32>, vector<[4]xi32>) -> !llvm.struct<(vector<[4]xi32>, vector<[4]xi32>)>
    %3 = "arm_sve.intr.zip.x2"(%arg3, %arg3) : (vector<[2]xi64>, vector<[2]xi64>) -> !llvm.struct<(vector<[2]xi64>, vector<[2]xi64>)>
    llvm.return
  }
  llvm.func @arm_sve_zip_x4(%arg0: vector<[16]xi8>, %arg1: vector<[8]xi16>, %arg2: vector<[4]xi32>, %arg3: vector<[2]xi64>) {
    %0 = "arm_sve.intr.zip.x4"(%arg0, %arg0, %arg0, %arg0) : (vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>) -> !llvm.struct<(vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>, vector<[16]xi8>)>
    %1 = "arm_sve.intr.zip.x4"(%arg1, %arg1, %arg1, %arg1) : (vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>) -> !llvm.struct<(vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>, vector<[8]xi16>)>
    %2 = "arm_sve.intr.zip.x4"(%arg2, %arg2, %arg2, %arg2) : (vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>) -> !llvm.struct<(vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>, vector<[4]xi32>)>
    %3 = "arm_sve.intr.zip.x4"(%arg3, %arg3, %arg3, %arg3) : (vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>) -> !llvm.struct<(vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>, vector<[2]xi64>)>
    llvm.return
  }
  llvm.func @arm_sve_whilelt(%arg0: i64, %arg1: i64) {
    %0 = "arm_sve.intr.whilelt"(%arg0, %arg1) : (i64, i64) -> vector<[2]xi1>
    %1 = "arm_sve.intr.whilelt"(%arg0, %arg1) : (i64, i64) -> vector<[4]xi1>
    %2 = "arm_sve.intr.whilelt"(%arg0, %arg1) : (i64, i64) -> vector<[8]xi1>
    %3 = "arm_sve.intr.whilelt"(%arg0, %arg1) : (i64, i64) -> vector<[16]xi1>
    llvm.return
  }
  llvm.func @arm_sve_psel(%arg0: vector<[16]xi1>, %arg1: vector<[2]xi1>, %arg2: vector<[4]xi1>, %arg3: vector<[8]xi1>, %arg4: vector<[16]xi1>, %arg5: i32) {
    %0 = "arm_sve.intr.psel"(%arg0, %arg1, %arg5) : (vector<[16]xi1>, vector<[2]xi1>, i32) -> vector<[16]xi1>
    %1 = "arm_sve.intr.psel"(%arg0, %arg2, %arg5) : (vector<[16]xi1>, vector<[4]xi1>, i32) -> vector<[16]xi1>
    %2 = "arm_sve.intr.psel"(%arg0, %arg3, %arg5) : (vector<[16]xi1>, vector<[8]xi1>, i32) -> vector<[16]xi1>
    %3 = "arm_sve.intr.psel"(%arg0, %arg4, %arg5) : (vector<[16]xi1>, vector<[16]xi1>, i32) -> vector<[16]xi1>
    llvm.return
  }
  llvm.func @arm_sve_dupq_lane(%arg0: vector<[16]xi8>, %arg1: vector<[8]xi16>, %arg2: vector<[8]xf16>, %arg3: vector<[8]xbf16>, %arg4: vector<[4]xi32>, %arg5: vector<[4]xf32>, %arg6: vector<[2]xi64>, %arg7: vector<[2]xf64>) {
    %0 = "arm_sve.intr.dupq_lane"(%arg0) <{lane = 0 : i64}> : (vector<[16]xi8>) -> vector<[16]xi8>
    %1 = "arm_sve.intr.dupq_lane"(%arg1) <{lane = 1 : i64}> : (vector<[8]xi16>) -> vector<[8]xi16>
    %2 = "arm_sve.intr.dupq_lane"(%arg2) <{lane = 2 : i64}> : (vector<[8]xf16>) -> vector<[8]xf16>
    %3 = "arm_sve.intr.dupq_lane"(%arg3) <{lane = 3 : i64}> : (vector<[8]xbf16>) -> vector<[8]xbf16>
    %4 = "arm_sve.intr.dupq_lane"(%arg4) <{lane = 4 : i64}> : (vector<[4]xi32>) -> vector<[4]xi32>
    %5 = "arm_sve.intr.dupq_lane"(%arg5) <{lane = 5 : i64}> : (vector<[4]xf32>) -> vector<[4]xf32>
    %6 = "arm_sve.intr.dupq_lane"(%arg6) <{lane = 6 : i64}> : (vector<[2]xi64>) -> vector<[2]xi64>
    %7 = "arm_sve.intr.dupq_lane"(%arg7) <{lane = 7 : i64}> : (vector<[2]xf64>) -> vector<[2]xf64>
    llvm.return
  }
}

