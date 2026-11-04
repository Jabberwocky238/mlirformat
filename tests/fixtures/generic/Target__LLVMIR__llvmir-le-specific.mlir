"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<5 x f32>, linkage = #llvm.linkage<internal>, sym_name = "dense_resource_tensor_constant", unnamed_addr = 0 : i64, value = dense_resource<dense_resource_test_5xf32> : tensor<5xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = vector<5xf32>, linkage = #llvm.linkage<internal>, sym_name = "dense_resource_vector_constant", unnamed_addr = 0 : i64, value = dense_resource<dense_resource_test_5xf32> : vector<5xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<1 x array<2 x array<2 x f32>>>, linkage = #llvm.linkage<internal>, sym_name = "dense_resource_multidim_tensor_constant", unnamed_addr = 0 : i64, value = dense_resource<dense_resource_test_2x2xf32> : tensor<1x2x2xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<1 x array<2 x vector<2xf32>>>, linkage = #llvm.linkage<internal>, sym_name = "dense_resource_multidim_vector_constant", unnamed_addr = 0 : i64, value = dense_resource<dense_resource_test_2x2xf32> : vector<1x2x2xf32>, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

{-#
  dialect_resources: {
    builtin: {
      dense_resource_test_5xf32: "0x08000000041A503E183382BEFCEEBABE7A3AF0BE0E9DEE3E",
      dense_resource_test_2x2xf32: "0x0800000054A3B53ED6C0B33E55D1A2BDE5D2BB3E"
    }
  }
#-}

