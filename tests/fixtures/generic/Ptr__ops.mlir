"builtin.module"() ({
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space>, sym_name = "ptr_add_type_offset"}> ({
  ^bb0(%arg61: !ptr.ptr<#ptr.generic_space>):
    %66 = "ptr.type_offset"() <{elementType = f32}> : () -> index
    %67 = "ptr.ptr_add"(%arg61, %66) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space>
    %68 = "ptr.ptr_add"(%arg61, %66) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space>
    %69 = "ptr.ptr_add"(%arg61, %66) <{flags = 1 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space>
    %70 = "ptr.ptr_add"(%arg61, %66) <{flags = 2 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space>
    %71 = "ptr.ptr_add"(%arg61, %66) <{flags = 3 : i32}> : (!ptr.ptr<#ptr.generic_space>, index) -> !ptr.ptr<#ptr.generic_space>
    "func.return"(%67) : (!ptr.ptr<#ptr.generic_space>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space>, sym_name = "cast_ops"}> ({
  ^bb0(%arg60: memref<f32, #ptr.generic_space>):
    %62 = "ptr.to_ptr"(%arg60) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space>
    %63 = "ptr.get_metadata"(%arg60) : (memref<f32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>
    %64 = "ptr.from_ptr"(%62, %63) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space>
    %65 = "ptr.from_ptr"(%62) : (!ptr.ptr<#ptr.generic_space>) -> memref<f32, #ptr.generic_space>
    "func.return"(%64) : (memref<f32, #ptr.generic_space>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>) -> (f32, f32, f32, f32, f32, i64, i32), sym_name = "load_ops"}> ({
  ^bb0(%arg59: !ptr.ptr<#ptr.generic_space>):
    %55 = "ptr.load"(%arg59) <{alignment = [], invariant = false, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#ptr.generic_space>) -> f32
    %56 = "ptr.load"(%arg59) <{alignment = [], invariant = false, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_}> : (!ptr.ptr<#ptr.generic_space>) -> f32
    %57 = "ptr.load"(%arg59) <{alignment = [], invariant = false, invariantGroup = false, nontemporal, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#ptr.generic_space>) -> f32
    %58 = "ptr.load"(%arg59) <{alignment = [], invariant, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#ptr.generic_space>) -> f32
    %59 = "ptr.load"(%arg59) <{alignment = [], invariant = false, invariantGroup, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#ptr.generic_space>) -> f32
    %60 = "ptr.load"(%arg59) <{alignment = [8], invariant = false, invariantGroup = false, nontemporal = false, ordering = 2 : i32, volatile_ = false}> : (!ptr.ptr<#ptr.generic_space>) -> i64
    %61 = "ptr.load"(%arg59) <{alignment = [4], invariant = false, invariantGroup = false, nontemporal, ordering = 3 : i32, syncscope = "workgroup", volatile_}> : (!ptr.ptr<#ptr.generic_space>) -> i32
    "func.return"(%55, %56, %57, %58, %59, %60, %61) : (f32, f32, f32, f32, f32, i64, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, f32, i64, i32) -> (), sym_name = "store_ops"}> ({
  ^bb0(%arg55: !ptr.ptr<#ptr.generic_space>, %arg56: f32, %arg57: i64, %arg58: i32):
    "ptr.store"(%arg56, %arg55) <{alignment = [], invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#ptr.generic_space>) -> ()
    "ptr.store"(%arg56, %arg55) <{alignment = [], invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_}> : (f32, !ptr.ptr<#ptr.generic_space>) -> ()
    "ptr.store"(%arg56, %arg55) <{alignment = [], invariantGroup = false, nontemporal, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#ptr.generic_space>) -> ()
    "ptr.store"(%arg56, %arg55) <{alignment = [], invariantGroup, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#ptr.generic_space>) -> ()
    "ptr.store"(%arg57, %arg55) <{alignment = [8], invariantGroup = false, nontemporal = false, ordering = 2 : i32, volatile_ = false}> : (i64, !ptr.ptr<#ptr.generic_space>) -> ()
    "ptr.store"(%arg58, %arg55) <{alignment = [4], invariantGroup = false, nontemporal, ordering = 4 : i32, syncscope = "workgroup", volatile_}> : (i32, !ptr.ptr<#ptr.generic_space>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#llvm.address_space<1>>) -> (f32, i32), sym_name = "llvm_load"}> ({
  ^bb0(%arg54: !ptr.ptr<#llvm.address_space<1>>):
    %53 = "ptr.load"(%arg54) <{alignment = [], invariant = false, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#llvm.address_space<1>>) -> f32
    %54 = "ptr.load"(%arg54) <{alignment = [4], invariant = false, invariantGroup = false, nontemporal = false, ordering = 3 : i32, volatile_}> : (!ptr.ptr<#llvm.address_space<1>>) -> i32
    "func.return"(%53, %54) : (f32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#llvm.address_space<2>>, f32, i64) -> (), sym_name = "llvm_store"}> ({
  ^bb0(%arg51: !ptr.ptr<#llvm.address_space<2>>, %arg52: f32, %arg53: i64):
    "ptr.store"(%arg52, %arg51) <{alignment = [], invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#llvm.address_space<2>>) -> ()
    "ptr.store"(%arg53, %arg51) <{alignment = [8], invariantGroup = false, nontemporal = false, ordering = 4 : i32, volatile_ = false}> : (i64, !ptr.ptr<#llvm.address_space<2>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "gather_ops"}> ({
  ^bb0(%arg48: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg49: vector<4xi1>, %arg50: vector<4xf32>):
    %51 = "ptr.gather"(%arg48, %arg49, %arg50) <{alignment = []}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    %52 = "ptr.gather"(%arg48, %arg49, %arg50) <{alignment = [8]}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%51) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi1>, tensor<8xi32>) -> tensor<8xi32>, sym_name = "gather_ops_tensor"}> ({
  ^bb0(%arg45: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg46: tensor<8xi1>, %arg47: tensor<8xi32>):
    %49 = "ptr.gather"(%arg45, %arg46, %arg47) <{alignment = []}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi1>, tensor<8xi32>) -> tensor<8xi32>
    %50 = "ptr.gather"(%arg45, %arg46, %arg47) <{alignment = [4]}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi1>, tensor<8xi32>) -> tensor<8xi32>
    "func.return"(%49) : (tensor<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xi1>) -> (), sym_name = "scatter_ops"}> ({
  ^bb0(%arg42: vector<4xf32>, %arg43: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg44: vector<4xi1>):
    "ptr.scatter"(%arg42, %arg43, %arg44) <{alignment = []}> : (vector<4xf32>, vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xi1>) -> ()
    "ptr.scatter"(%arg42, %arg43, %arg44) <{alignment = [16]}> : (vector<4xf32>, vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi64>, tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi1>) -> (), sym_name = "scatter_ops_tensor"}> ({
  ^bb0(%arg39: tensor<8xi64>, %arg40: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg41: tensor<8xi1>):
    "ptr.scatter"(%arg39, %arg40, %arg41) <{alignment = []}> : (tensor<8xi64>, tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi1>) -> ()
    "ptr.scatter"(%arg39, %arg40, %arg41) <{alignment = [8]}> : (tensor<8xi64>, tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "masked_load_ops"}> ({
  ^bb0(%arg36: !ptr.ptr<#ptr.generic_space>, %arg37: vector<4xi1>, %arg38: vector<4xf32>):
    %47 = "ptr.masked_load"(%arg36, %arg37, %arg38) <{alignment = []}> : (!ptr.ptr<#ptr.generic_space>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    %48 = "ptr.masked_load"(%arg36, %arg37, %arg38) <{alignment = [16]}> : (!ptr.ptr<#ptr.generic_space>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%47) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, tensor<8xi1>, tensor<8xi32>) -> tensor<8xi32>, sym_name = "masked_load_ops_tensor"}> ({
  ^bb0(%arg33: !ptr.ptr<#ptr.generic_space>, %arg34: tensor<8xi1>, %arg35: tensor<8xi32>):
    %45 = "ptr.masked_load"(%arg33, %arg34, %arg35) <{alignment = []}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi1>, tensor<8xi32>) -> tensor<8xi32>
    %46 = "ptr.masked_load"(%arg33, %arg34, %arg35) <{alignment = [4]}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi1>, tensor<8xi32>) -> tensor<8xi32>
    "func.return"(%45) : (tensor<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, !ptr.ptr<#ptr.generic_space>, vector<4xi1>) -> (), sym_name = "masked_store_ops"}> ({
  ^bb0(%arg30: vector<4xf32>, %arg31: !ptr.ptr<#ptr.generic_space>, %arg32: vector<4xi1>):
    "ptr.masked_store"(%arg30, %arg31, %arg32) <{alignment = []}> : (vector<4xf32>, !ptr.ptr<#ptr.generic_space>, vector<4xi1>) -> ()
    "ptr.masked_store"(%arg30, %arg31, %arg32) <{alignment = [32]}> : (vector<4xf32>, !ptr.ptr<#ptr.generic_space>, vector<4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8xi64>, !ptr.ptr<#ptr.generic_space>, tensor<8xi1>) -> (), sym_name = "masked_store_ops_tensor"}> ({
  ^bb0(%arg27: tensor<8xi64>, %arg28: !ptr.ptr<#ptr.generic_space>, %arg29: tensor<8xi1>):
    "ptr.masked_store"(%arg27, %arg28, %arg29) <{alignment = []}> : (tensor<8xi64>, !ptr.ptr<#ptr.generic_space>, tensor<8xi1>) -> ()
    "ptr.masked_store"(%arg27, %arg28, %arg29) <{alignment = [8]}> : (tensor<8xi64>, !ptr.ptr<#ptr.generic_space>, tensor<8xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#llvm.address_space<3>>, vector<4x!ptr.ptr<#llvm.address_space<3>>>, vector<4xi1>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "llvm_masked_ops"}> ({
  ^bb0(%arg22: !ptr.ptr<#llvm.address_space<3>>, %arg23: vector<4x!ptr.ptr<#llvm.address_space<3>>>, %arg24: vector<4xi1>, %arg25: vector<4xf32>, %arg26: vector<4xf32>):
    %43 = "ptr.gather"(%arg23, %arg24, %arg26) <{alignment = [4]}> : (vector<4x!ptr.ptr<#llvm.address_space<3>>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "ptr.scatter"(%arg25, %arg23, %arg24) <{alignment = [4]}> : (vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<3>>>, vector<4xi1>) -> ()
    %44 = "ptr.masked_load"(%arg22, %arg24, %arg26) <{alignment = [4]}> : (!ptr.ptr<#llvm.address_space<3>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "ptr.masked_store"(%arg25, %arg22, %arg24) <{alignment = [4]}> : (vector<4xf32>, !ptr.ptr<#llvm.address_space<3>>, vector<4xi1>) -> ()
    "func.return"(%43) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_vector"}> ({
  ^bb0(%arg20: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg21: vector<4xindex>):
    %38 = "ptr.ptr_add"(%arg20, %arg21) <{flags = 0 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %39 = "ptr.ptr_add"(%arg20, %arg21) <{flags = 0 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %40 = "ptr.ptr_add"(%arg20, %arg21) <{flags = 1 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %41 = "ptr.ptr_add"(%arg20, %arg21) <{flags = 2 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %42 = "ptr.ptr_add"(%arg20, %arg21) <{flags = 3 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%38) : (vector<4x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_tensor"}> ({
  ^bb0(%arg18: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg19: tensor<8xi64>):
    %37 = "ptr.ptr_add"(%arg18, %arg19) <{flags = 0 : i32}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%37) : (tensor<8x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8xindex>) -> tensor<4x8x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_tensor_2d"}> ({
  ^bb0(%arg16: tensor<4x8x!ptr.ptr<#ptr.generic_space>>, %arg17: tensor<4x8xindex>):
    %35 = "ptr.ptr_add"(%arg16, %arg17) <{flags = 0 : i32}> : (tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8xindex>) -> tensor<4x8x!ptr.ptr<#ptr.generic_space>>
    %36 = "ptr.ptr_add"(%arg16, %arg17) <{flags = 2 : i32}> : (tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8xindex>) -> tensor<4x8x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%35) : (tensor<4x8x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_scalar_base_vector_offsets"}> ({
  ^bb0(%arg14: !ptr.ptr<#ptr.generic_space>, %arg15: vector<4xindex>):
    %30 = "ptr.ptr_add"(%arg14, %arg15) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %31 = "ptr.ptr_add"(%arg14, %arg15) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %32 = "ptr.ptr_add"(%arg14, %arg15) <{flags = 1 : i32}> : (!ptr.ptr<#ptr.generic_space>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %33 = "ptr.ptr_add"(%arg14, %arg15) <{flags = 2 : i32}> : (!ptr.ptr<#ptr.generic_space>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %34 = "ptr.ptr_add"(%arg14, %arg15) <{flags = 3 : i32}> : (!ptr.ptr<#ptr.generic_space>, vector<4xindex>) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%30) : (vector<4x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_scalar_base_tensor_offsets"}> ({
  ^bb0(%arg12: !ptr.ptr<#ptr.generic_space>, %arg13: tensor<8xi64>):
    %25 = "ptr.ptr_add"(%arg12, %arg13) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %26 = "ptr.ptr_add"(%arg12, %arg13) <{flags = 0 : i32}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %27 = "ptr.ptr_add"(%arg12, %arg13) <{flags = 1 : i32}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %28 = "ptr.ptr_add"(%arg12, %arg13) <{flags = 2 : i32}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %29 = "ptr.ptr_add"(%arg12, %arg13) <{flags = 3 : i32}> : (!ptr.ptr<#ptr.generic_space>, tensor<8xi64>) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%25) : (tensor<8x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x!ptr.ptr<#ptr.generic_space>>, index) -> vector<4x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_vector_base_scalar_offset"}> ({
  ^bb0(%arg10: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg11: index):
    %20 = "ptr.ptr_add"(%arg10, %arg11) <{flags = 0 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, index) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %21 = "ptr.ptr_add"(%arg10, %arg11) <{flags = 0 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, index) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %22 = "ptr.ptr_add"(%arg10, %arg11) <{flags = 1 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, index) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %23 = "ptr.ptr_add"(%arg10, %arg11) <{flags = 2 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, index) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    %24 = "ptr.ptr_add"(%arg10, %arg11) <{flags = 3 : i32}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, index) -> vector<4x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%20) : (vector<4x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x!ptr.ptr<#ptr.generic_space>>, i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>>, sym_name = "ptr_add_tensor_base_scalar_offset"}> ({
  ^bb0(%arg8: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg9: i64):
    %15 = "ptr.ptr_add"(%arg8, %arg9) <{flags = 0 : i32}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %16 = "ptr.ptr_add"(%arg8, %arg9) <{flags = 0 : i32}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %17 = "ptr.ptr_add"(%arg8, %arg9) <{flags = 1 : i32}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %18 = "ptr.ptr_add"(%arg8, %arg9) <{flags = 2 : i32}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    %19 = "ptr.ptr_add"(%arg8, %arg9) <{flags = 3 : i32}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, i64) -> tensor<8x!ptr.ptr<#ptr.generic_space>>
    "func.return"(%15) : (tensor<8x!ptr.ptr<#ptr.generic_space>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>), sym_name = "constant_null_ops"}> ({
    %13 = "ptr.constant"() <{value = #ptr.null : !ptr.ptr<#ptr.generic_space>}> : () -> !ptr.ptr<#ptr.generic_space>
    %14 = "ptr.constant"() <{value = #ptr.null : !ptr.ptr<#llvm.address_space<1>>}> : () -> !ptr.ptr<#llvm.address_space<1>>
    "func.return"(%13, %14) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<3>>), sym_name = "constant_address_ops"}> ({
    %10 = "ptr.constant"() <{value = #ptr.address<0> : !ptr.ptr<#ptr.generic_space>}> : () -> !ptr.ptr<#ptr.generic_space>
    %11 = "ptr.constant"() <{value = #ptr.address<4096> : !ptr.ptr<#llvm.address_space<1>>}> : () -> !ptr.ptr<#llvm.address_space<1>>
    %12 = "ptr.constant"() <{value = #ptr.address<3735928559> : !ptr.ptr<#llvm.address_space<3>>}> : () -> !ptr.ptr<#llvm.address_space<3>>
    "func.return"(%10, %11, %12) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<3>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<0>>), sym_name = "constant_large_address_ops"}> ({
    %8 = "ptr.constant"() <{value = #ptr.address<4294967295> : !ptr.ptr<#ptr.generic_space>}> : () -> !ptr.ptr<#ptr.generic_space>
    %9 = "ptr.constant"() <{value = #ptr.address<1311768467463790320> : !ptr.ptr<#llvm.address_space<0>>}> : () -> !ptr.ptr<#llvm.address_space<0>>
    "func.return"(%8, %9) : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#llvm.address_space<0>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) -> (i64, index, i32), sym_name = "ptr_diff_scalar_ops"}> ({
  ^bb0(%arg6: !ptr.ptr<#ptr.generic_space>, %arg7: !ptr.ptr<#ptr.generic_space>):
    %5 = "ptr.ptr_diff"(%arg6, %arg7) <{flags = 0 : i8}> : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) -> i64
    %6 = "ptr.ptr_diff"(%arg6, %arg7) <{flags = 0 : i8}> : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) -> index
    %7 = "ptr.ptr_diff"(%arg6, %arg7) <{flags = 1 : i8}> : (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) -> i32
    "func.return"(%5, %6, %7) : (i64, index, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4x!ptr.ptr<#ptr.generic_space>>) -> (vector<4xi64>, vector<4xindex>), sym_name = "ptr_diff_vector_ops"}> ({
  ^bb0(%arg4: vector<4x!ptr.ptr<#ptr.generic_space>>, %arg5: vector<4x!ptr.ptr<#ptr.generic_space>>):
    %3 = "ptr.ptr_diff"(%arg4, %arg5) <{flags = 0 : i8}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4x!ptr.ptr<#ptr.generic_space>>) -> vector<4xi64>
    %4 = "ptr.ptr_diff"(%arg4, %arg5) <{flags = 0 : i8}> : (vector<4x!ptr.ptr<#ptr.generic_space>>, vector<4x!ptr.ptr<#ptr.generic_space>>) -> vector<4xindex>
    "func.return"(%3, %4) : (vector<4xi64>, vector<4xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8x!ptr.ptr<#ptr.generic_space>>) -> (tensor<8xi64>, tensor<8xi32>), sym_name = "ptr_diff_tensor_ops"}> ({
  ^bb0(%arg2: tensor<8x!ptr.ptr<#ptr.generic_space>>, %arg3: tensor<8x!ptr.ptr<#ptr.generic_space>>):
    %1 = "ptr.ptr_diff"(%arg2, %arg3) <{flags = 2 : i8}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8x!ptr.ptr<#ptr.generic_space>>) -> tensor<8xi64>
    %2 = "ptr.ptr_diff"(%arg2, %arg3) <{flags = 3 : i8}> : (tensor<8x!ptr.ptr<#ptr.generic_space>>, tensor<8x!ptr.ptr<#ptr.generic_space>>) -> tensor<8xi32>
    "func.return"(%1, %2) : (tensor<8xi64>, tensor<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8x!ptr.ptr<#ptr.generic_space>>) -> tensor<4x8xi64>, sym_name = "ptr_diff_tensor_2d_ops"}> ({
  ^bb0(%arg0: tensor<4x8x!ptr.ptr<#ptr.generic_space>>, %arg1: tensor<4x8x!ptr.ptr<#ptr.generic_space>>):
    %0 = "ptr.ptr_diff"(%arg0, %arg1) <{flags = 0 : i8}> : (tensor<4x8x!ptr.ptr<#ptr.generic_space>>, tensor<4x8x!ptr.ptr<#ptr.generic_space>>) -> tensor<4x8xi64>
    "func.return"(%0) : (tensor<4x8xi64>) -> ()
  }) : () -> ()
}) : () -> ()

