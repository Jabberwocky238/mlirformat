"builtin.module"() ({
  "func.func"() <{function_type = (i64, i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>, sym_name = "wgmma_f32_f16_f16"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":4:8), %arg1: i64 loc("<stdin>":4:20)):
    %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> loc("<stdin>":5:10)
    %1 = "nvvm.wgmma.mma_async"(%0, %arg0, %arg1) <{layoutA = #nvvm.mma_layout<col>, layoutB = #nvvm.mma_layout<col>, scaleA = #nvvm.wgmma_scale_in<neg>, scaleB = #nvvm.wgmma_scale_in<neg>, scaleD = #nvvm.wgmma_scale_out<zero>, shape = #nvvm.shape<m = 64, n = 32, k = 16>, typeA = #nvvm.wgmma_type<f16>, typeB = #nvvm.wgmma_type<f16>, typeD = #nvvm.wgmma_type<f32>}> : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>, i64, i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":7:10)
    %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":8:10)
    %4 = "arith.addi"(%arg1, %2) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":9:10)
    %5 = "nvvm.wgmma.mma_async"(%1, %3, %4) <{layoutA = #nvvm.mma_layout<col>, layoutB = #nvvm.mma_layout<col>, scaleA = #nvvm.wgmma_scale_in<neg>, scaleB = #nvvm.wgmma_scale_in<neg>, scaleD = #nvvm.wgmma_scale_out<zero>, shape = #nvvm.shape<m = 64, n = 32, k = 16>, typeA = #nvvm.wgmma_type<f16>, typeB = #nvvm.wgmma_type<f16>, typeD = #nvvm.wgmma_type<f32>}> : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>, i64, i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> loc("<stdin>":10:10)
    "func.return"(%5) : (!llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
