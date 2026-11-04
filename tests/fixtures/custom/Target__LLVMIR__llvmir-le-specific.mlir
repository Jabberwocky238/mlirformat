module {
  llvm.mlir.global internal constant @dense_resource_tensor_constant(dense_resource<dense_resource_test_5xf32> : tensor<5xf32>) {addr_space = 0 : i32} : !llvm.array<5 x f32>
  llvm.mlir.global internal constant @dense_resource_vector_constant(dense_resource<dense_resource_test_5xf32> : vector<5xf32>) {addr_space = 0 : i32} : vector<5xf32>
  llvm.mlir.global internal constant @dense_resource_multidim_tensor_constant(dense_resource<dense_resource_test_2x2xf32> : tensor<1x2x2xf32>) {addr_space = 0 : i32} : !llvm.array<1 x array<2 x array<2 x f32>>>
  llvm.mlir.global internal constant @dense_resource_multidim_vector_constant(dense_resource<dense_resource_test_2x2xf32> : vector<1x2x2xf32>) {addr_space = 0 : i32} : !llvm.array<1 x array<2 x vector<2xf32>>>
}

{-#
  dialect_resources: {
    builtin: {
      dense_resource_test_5xf32: "0x08000000041A503E183382BEFCEEBABE7A3AF0BE0E9DEE3E",
      dense_resource_test_2x2xf32: "0x0800000054A3B53ED6C0B33E55D1A2BDE5D2BB3E"
    }
  }
#-}

