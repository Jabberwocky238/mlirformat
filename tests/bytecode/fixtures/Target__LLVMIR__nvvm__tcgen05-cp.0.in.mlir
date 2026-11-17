"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_tcgen05_cp_128x256b", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr<6> loc("<stdin>":3:8), %arg9: i64 loc("<stdin>":3:29)):
    "nvvm.tcgen05.cp"(%arg8, %arg9) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":4:5)
    "nvvm.tcgen05.cp"(%arg8, %arg9) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":5:5)
    "nvvm.tcgen05.cp"(%arg8, %arg9) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":6:5)
    "nvvm.tcgen05.cp"(%arg8, %arg9) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_tcgen05_cp_4x256b", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr<6> loc("<stdin>":11:8), %arg7: i64 loc("<stdin>":11:29)):
    "nvvm.tcgen05.cp"(%arg6, %arg7) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":12:5)
    "nvvm.tcgen05.cp"(%arg6, %arg7) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":13:5)
    "nvvm.tcgen05.cp"(%arg6, %arg7) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":14:5)
    "nvvm.tcgen05.cp"(%arg6, %arg7) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_4x256b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":15:5)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_tcgen05_cp_128x128b", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<6> loc("<stdin>":19:8), %arg5: i64 loc("<stdin>":19:29)):
    "nvvm.tcgen05.cp"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":20:5)
    "nvvm.tcgen05.cp"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":21:5)
    "nvvm.tcgen05.cp"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":22:5)
    "nvvm.tcgen05.cp"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<none>, shape = #nvvm.tcgen05_cp_shape<shape_128x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":23:5)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_tcgen05_cp_64x128b", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<6> loc("<stdin>":27:8), %arg3: i64 loc("<stdin>":27:29)):
    "nvvm.tcgen05.cp"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<warpx2_02_13>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":28:5)
    "nvvm.tcgen05.cp"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx2_02_13>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":29:5)
    "nvvm.tcgen05.cp"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<warpx2_02_13>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":30:5)
    "nvvm.tcgen05.cp"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx2_01_23>, shape = #nvvm.tcgen05_cp_shape<shape_64x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":31:5)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i64)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_tcgen05_cp_32x128b", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<6> loc("<stdin>":35:8), %arg1: i64 loc("<stdin>":35:29)):
    "nvvm.tcgen05.cp"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":36:5)
    "nvvm.tcgen05.cp"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":37:5)
    "nvvm.tcgen05.cp"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_2>, multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b4x16_p64>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":38:5)
    "nvvm.tcgen05.cp"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_1>, multicast = #nvvm.tcgen05_cp_multicast<warpx4>, shape = #nvvm.tcgen05_cp_shape<shape_32x128b>, srcFormat = #nvvm.tcgen05_cp_src_fmt<b6x16_p32>}> : (!llvm.ptr<6>, i64) -> () loc("<stdin>":39:5)
    "llvm.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":34:3)
}) : () -> () loc("<stdin>":1:1)
