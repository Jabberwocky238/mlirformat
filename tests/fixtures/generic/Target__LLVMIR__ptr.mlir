"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<!ptr.ptr<#llvm.address_space<0>> (!ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<3>>)>, linkage = #llvm.linkage<external>, sym_name = "llvm_ptr_address_space", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_ops_with_ptr_values", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg58: !llvm.ptr):
    %53 = "llvm.load"(%arg58) <{ordering = 0 : i64}> : (!llvm.ptr) -> !ptr.ptr<#llvm.address_space<1>>
    "llvm.store"(%53, %arg58) <{ordering = 0 : i64}> : (!ptr.ptr<#llvm.address_space<1>>, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<!ptr.ptr<#llvm.address_space<0>> (!ptr.ptr<#llvm.address_space<0>>, i32)>, linkage = #llvm.linkage<external>, sym_name = "ptr_add", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg56: !ptr.ptr<#llvm.address_space<0>>, %arg57: i32):
    %48 = "ptr.ptr_add"(%arg56, %arg57) <{flags = 0 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, i32) -> !ptr.ptr<#llvm.address_space<0>>
    %49 = "ptr.ptr_add"(%arg56, %arg57) <{flags = 0 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, i32) -> !ptr.ptr<#llvm.address_space<0>>
    %50 = "ptr.ptr_add"(%arg56, %arg57) <{flags = 1 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, i32) -> !ptr.ptr<#llvm.address_space<0>>
    %51 = "ptr.ptr_add"(%arg56, %arg57) <{flags = 2 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, i32) -> !ptr.ptr<#llvm.address_space<0>>
    %52 = "ptr.ptr_add"(%arg56, %arg57) <{flags = 3 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, i32) -> !ptr.ptr<#llvm.address_space<0>>
    "llvm.return"(%48) : (!ptr.ptr<#llvm.address_space<0>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, i32, i32, i32)> (!ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "type_offset", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg55: !ptr.ptr<#llvm.address_space<0>>):
    %39 = "ptr.type_offset"() <{elementType = f64}> : () -> i32
    %40 = "ptr.type_offset"() <{elementType = i8}> : () -> i32
    %41 = "ptr.type_offset"() <{elementType = i16}> : () -> i32
    %42 = "ptr.type_offset"() <{elementType = i32}> : () -> i32
    %43 = "llvm.mlir.poison"() : () -> !llvm.struct<(i32, i32, i32, i32)>
    %44 = "llvm.insertvalue"(%43, %39) <{position = array<i64: 0>}> : (!llvm.struct<(i32, i32, i32, i32)>, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    %45 = "llvm.insertvalue"(%44, %40) <{position = array<i64: 1>}> : (!llvm.struct<(i32, i32, i32, i32)>, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    %46 = "llvm.insertvalue"(%45, %41) <{position = array<i64: 2>}> : (!llvm.struct<(i32, i32, i32, i32)>, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    %47 = "llvm.insertvalue"(%46, %42) <{position = array<i64: 3>}> : (!llvm.struct<(i32, i32, i32, i32)>, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    "llvm.return"(%47) : (!llvm.struct<(i32, i32, i32, i32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (!ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "load_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg54: !ptr.ptr<#llvm.address_space<0>>):
    %32 = "ptr.load"(%arg54) <{alignment = [], invariant = false, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#llvm.address_space<0>>) -> f32
    %33 = "ptr.load"(%arg54) <{alignment = [], invariant = false, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_}> : (!ptr.ptr<#llvm.address_space<0>>) -> f32
    %34 = "ptr.load"(%arg54) <{alignment = [], invariant = false, invariantGroup = false, nontemporal, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#llvm.address_space<0>>) -> f32
    %35 = "ptr.load"(%arg54) <{alignment = [], invariant, invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#llvm.address_space<0>>) -> f32
    %36 = "ptr.load"(%arg54) <{alignment = [], invariant = false, invariantGroup, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (!ptr.ptr<#llvm.address_space<0>>) -> f32
    %37 = "ptr.load"(%arg54) <{alignment = [8], invariant = false, invariantGroup = false, nontemporal = false, ordering = 2 : i32, volatile_ = false}> : (!ptr.ptr<#llvm.address_space<0>>) -> i64
    %38 = "ptr.load"(%arg54) <{alignment = [4], invariant = false, invariantGroup = false, nontemporal, ordering = 3 : i32, syncscope = "workgroup", volatile_}> : (!ptr.ptr<#llvm.address_space<0>>) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (!ptr.ptr<#llvm.address_space<0>>, f32, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "store_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg50: !ptr.ptr<#llvm.address_space<0>>, %arg51: f32, %arg52: i64, %arg53: i32):
    "ptr.store"(%arg51, %arg50) <{alignment = [], invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#llvm.address_space<0>>) -> ()
    "ptr.store"(%arg51, %arg50) <{alignment = [], invariantGroup = false, nontemporal = false, ordering = 0 : i32, volatile_}> : (f32, !ptr.ptr<#llvm.address_space<0>>) -> ()
    "ptr.store"(%arg51, %arg50) <{alignment = [], invariantGroup = false, nontemporal, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#llvm.address_space<0>>) -> ()
    "ptr.store"(%arg51, %arg50) <{alignment = [], invariantGroup, nontemporal = false, ordering = 0 : i32, volatile_ = false}> : (f32, !ptr.ptr<#llvm.address_space<0>>) -> ()
    "ptr.store"(%arg52, %arg50) <{alignment = [8], invariantGroup = false, nontemporal = false, ordering = 2 : i32, volatile_ = false}> : (i64, !ptr.ptr<#llvm.address_space<0>>) -> ()
    "ptr.store"(%arg53, %arg50) <{alignment = [4], invariantGroup = false, nontemporal, ordering = 4 : i32, syncscope = "workgroup", volatile_}> : (i32, !ptr.ptr<#llvm.address_space<0>>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi1>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "gather_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg47: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg48: vector<4xi1>, %arg49: vector<4xf32>):
    %30 = "ptr.gather"(%arg47, %arg48, %arg49) <{alignment = []}> : (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    %31 = "ptr.gather"(%arg47, %arg48, %arg49) <{alignment = [4]}> : (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"(%30) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xi32> (vector<8x!ptr.ptr<#llvm.address_space<0>>>, vector<8xi1>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "gather_ops_i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg44: vector<8x!ptr.ptr<#llvm.address_space<0>>>, %arg45: vector<8xi1>, %arg46: vector<8xi32>):
    %29 = "ptr.gather"(%arg44, %arg45, %arg46) <{alignment = [8]}> : (vector<8x!ptr.ptr<#llvm.address_space<0>>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"(%29) : (vector<8xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xf32> (!ptr.ptr<#llvm.address_space<0>>, vector<4xi1>, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "masked_load_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: !ptr.ptr<#llvm.address_space<0>>, %arg42: vector<4xi1>, %arg43: vector<4xf32>):
    %27 = "ptr.masked_load"(%arg41, %arg42, %arg43) <{alignment = []}> : (!ptr.ptr<#llvm.address_space<0>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    %28 = "ptr.masked_load"(%arg41, %arg42, %arg43) <{alignment = [16]}> : (!ptr.ptr<#llvm.address_space<0>>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"(%27) : (vector<4xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xi64> (!ptr.ptr<#llvm.address_space<0>>, vector<8xi1>, vector<8xi64>)>, linkage = #llvm.linkage<external>, sym_name = "masked_load_ops_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg38: !ptr.ptr<#llvm.address_space<0>>, %arg39: vector<8xi1>, %arg40: vector<8xi64>):
    %26 = "ptr.masked_load"(%arg38, %arg39, %arg40) <{alignment = [8]}> : (!ptr.ptr<#llvm.address_space<0>>, vector<8xi1>, vector<8xi64>) -> vector<8xi64>
    "llvm.return"(%26) : (vector<8xi64>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (!ptr.ptr<#llvm.address_space<0>>, vector<4xf32>, vector<4xi1>)>, linkage = #llvm.linkage<external>, sym_name = "masked_store_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg35: !ptr.ptr<#llvm.address_space<0>>, %arg36: vector<4xf32>, %arg37: vector<4xi1>):
    "ptr.masked_store"(%arg36, %arg35, %arg37) <{alignment = []}> : (vector<4xf32>, !ptr.ptr<#llvm.address_space<0>>, vector<4xi1>) -> ()
    "ptr.masked_store"(%arg36, %arg35, %arg37) <{alignment = [32]}> : (vector<4xf32>, !ptr.ptr<#llvm.address_space<0>>, vector<4xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (!ptr.ptr<#llvm.address_space<0>>, vector<8xi16>, vector<8xi1>)>, linkage = #llvm.linkage<external>, sym_name = "masked_store_ops_i16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: !ptr.ptr<#llvm.address_space<0>>, %arg33: vector<8xi16>, %arg34: vector<8xi1>):
    "ptr.masked_store"(%arg33, %arg32, %arg34) <{alignment = [4]}> : (vector<8xi16>, !ptr.ptr<#llvm.address_space<0>>, vector<8xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi1>)>, linkage = #llvm.linkage<external>, sym_name = "scatter_ops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: vector<4xf32>, %arg30: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg31: vector<4xi1>):
    "ptr.scatter"(%arg29, %arg30, %arg31) <{alignment = []}> : (vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi1>) -> ()
    "ptr.scatter"(%arg29, %arg30, %arg31) <{alignment = [8]}> : (vector<4xf32>, vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi64>, vector<8x!ptr.ptr<#llvm.address_space<0>>>, vector<8xi1>)>, linkage = #llvm.linkage<external>, sym_name = "scatter_ops_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: vector<8xi64>, %arg27: vector<8x!ptr.ptr<#llvm.address_space<0>>>, %arg28: vector<8xi1>):
    "ptr.scatter"(%arg26, %arg27, %arg28) <{alignment = [16]}> : (vector<8xi64>, vector<8x!ptr.ptr<#llvm.address_space<0>>>, vector<8xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (!ptr.ptr<#llvm.address_space<3>>, vector<4x!ptr.ptr<#llvm.address_space<3>>>, vector<4xi1>, vector<4xf64>, vector<4xf64>)>, linkage = #llvm.linkage<external>, sym_name = "mixed_masked_ops_address_spaces", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: !ptr.ptr<#llvm.address_space<3>>, %arg22: vector<4x!ptr.ptr<#llvm.address_space<3>>>, %arg23: vector<4xi1>, %arg24: vector<4xf64>, %arg25: vector<4xf64>):
    %24 = "ptr.gather"(%arg22, %arg23, %arg25) <{alignment = [8]}> : (vector<4x!ptr.ptr<#llvm.address_space<3>>>, vector<4xi1>, vector<4xf64>) -> vector<4xf64>
    "ptr.scatter"(%arg24, %arg22, %arg23) <{alignment = [8]}> : (vector<4xf64>, vector<4x!ptr.ptr<#llvm.address_space<3>>>, vector<4xi1>) -> ()
    %25 = "ptr.masked_load"(%arg21, %arg23, %arg25) <{alignment = [8]}> : (!ptr.ptr<#llvm.address_space<3>>, vector<4xi1>, vector<4xf64>) -> vector<4xf64>
    "ptr.masked_store"(%arg24, %arg21, %arg23) <{alignment = [8]}> : (vector<4xf64>, !ptr.ptr<#llvm.address_space<3>>, vector<4xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4x!ptr.ptr<#llvm.address_space<0>>> (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_add_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg19: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg20: vector<4xi32>):
    %23 = "ptr.ptr_add"(%arg19, %arg20) <{flags = 0 : i32}> : (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4xi32>) -> vector<4x!ptr.ptr<#llvm.address_space<0>>>
    "llvm.return"(%23) : (vector<4x!ptr.ptr<#llvm.address_space<0>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4x!ptr.ptr<#llvm.address_space<0>>> (!ptr.ptr<#llvm.address_space<0>>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_add_scalar_base_vector_offsets", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: !ptr.ptr<#llvm.address_space<0>>, %arg18: vector<4xi32>):
    %22 = "ptr.ptr_add"(%arg17, %arg18) <{flags = 0 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, vector<4xi32>) -> vector<4x!ptr.ptr<#llvm.address_space<0>>>
    "llvm.return"(%22) : (vector<4x!ptr.ptr<#llvm.address_space<0>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4x!ptr.ptr<#llvm.address_space<0>>> (vector<4x!ptr.ptr<#llvm.address_space<0>>>, i32)>, linkage = #llvm.linkage<external>, sym_name = "ptr_add_vector_base_scalar_offset", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg16: i32):
    %21 = "ptr.ptr_add"(%arg15, %arg16) <{flags = 0 : i32}> : (vector<4x!ptr.ptr<#llvm.address_space<0>>>, i32) -> vector<4x!ptr.ptr<#llvm.address_space<0>>>
    "llvm.return"(%21) : (vector<4x!ptr.ptr<#llvm.address_space<0>>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<!ptr.ptr<#nvvm.memory_space<generic>> (!ptr.ptr<#nvvm.memory_space<global>>, !ptr.ptr<#nvvm.memory_space<shared>>, !ptr.ptr<#nvvm.memory_space<constant>>, !ptr.ptr<#nvvm.memory_space<local>>, !ptr.ptr<#nvvm.memory_space<tensor>>, !ptr.ptr<#nvvm.memory_space<shared_cluster>>)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_ptr_address_space", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm_ops_with_ptr_nvvm_values", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: !llvm.ptr):
    %20 = "llvm.load"(%arg14) <{ordering = 0 : i64}> : (!llvm.ptr) -> !ptr.ptr<#nvvm.memory_space<global>>
    "llvm.store"(%20, %arg14) <{ordering = 0 : i64}> : (!ptr.ptr<#nvvm.memory_space<global>>, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)> ()>, linkage = #llvm.linkage<external>, sym_name = "constant_address_op", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %13 = "ptr.constant"() <{value = #ptr.null : !ptr.ptr<#llvm.address_space<0>>}> : () -> !ptr.ptr<#llvm.address_space<0>>
    %14 = "ptr.constant"() <{value = #ptr.address<4096> : !ptr.ptr<#llvm.address_space<1>>}> : () -> !ptr.ptr<#llvm.address_space<1>>
    %15 = "ptr.constant"() <{value = #ptr.address<3735928559> : !ptr.ptr<#llvm.address_space<2>>}> : () -> !ptr.ptr<#llvm.address_space<2>>
    %16 = "llvm.mlir.poison"() : () -> !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>
    %17 = "llvm.insertvalue"(%16, %13) <{position = array<i64: 0>}> : (!llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>, !ptr.ptr<#llvm.address_space<0>>) -> !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>
    %18 = "llvm.insertvalue"(%17, %14) <{position = array<i64: 1>}> : (!llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>, !ptr.ptr<#llvm.address_space<1>>) -> !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>
    %19 = "llvm.insertvalue"(%18, %15) <{position = array<i64: 2>}> : (!llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>, !ptr.ptr<#llvm.address_space<2>>) -> !llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>
    "llvm.return"(%19) : (!llvm.struct<(!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<1>>, !ptr.ptr<#llvm.address_space<2>>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<!ptr.ptr<#llvm.address_space<0>> ()>, linkage = #llvm.linkage<external>, sym_name = "ptr_add_cst", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %10 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %11 = "ptr.constant"() <{value = #ptr.null : !ptr.ptr<#llvm.address_space<0>>}> : () -> !ptr.ptr<#llvm.address_space<0>>
    %12 = "ptr.ptr_add"(%11, %10) <{flags = 0 : i32}> : (!ptr.ptr<#llvm.address_space<0>>, i32) -> !ptr.ptr<#llvm.address_space<0>>
    "llvm.return"(%12) : (!ptr.ptr<#llvm.address_space<0>>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_scalar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: !ptr.ptr<#llvm.address_space<0>>, %arg13: !ptr.ptr<#llvm.address_space<0>>):
    %9 = "ptr.ptr_diff"(%arg12, %arg13) <{flags = 0 : i8}> : (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>) -> i64
    "llvm.return"(%9) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_scalar_i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: !ptr.ptr<#llvm.address_space<0>>, %arg11: !ptr.ptr<#llvm.address_space<0>>):
    %8 = "ptr.ptr_diff"(%arg10, %arg11) <{flags = 0 : i8}> : (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>) -> i32
    "llvm.return"(%8) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi64> (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4x!ptr.ptr<#llvm.address_space<0>>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: vector<4x!ptr.ptr<#llvm.address_space<0>>>, %arg9: vector<4x!ptr.ptr<#llvm.address_space<0>>>):
    %7 = "ptr.ptr_diff"(%arg8, %arg9) <{flags = 0 : i8}> : (vector<4x!ptr.ptr<#llvm.address_space<0>>>, vector<4x!ptr.ptr<#llvm.address_space<0>>>) -> vector<4xi64>
    "llvm.return"(%7) : (vector<4xi64>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8xi32> (vector<8x!ptr.ptr<#llvm.address_space<0>>>, vector<8x!ptr.ptr<#llvm.address_space<0>>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_vector_i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<8x!ptr.ptr<#llvm.address_space<0>>>, %arg7: vector<8x!ptr.ptr<#llvm.address_space<0>>>):
    %6 = "ptr.ptr_diff"(%arg6, %arg7) <{flags = 0 : i8}> : (vector<8x!ptr.ptr<#llvm.address_space<0>>>, vector<8x!ptr.ptr<#llvm.address_space<0>>>) -> vector<8xi32>
    "llvm.return"(%6) : (vector<8xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_with_constants", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "ptr.constant"() <{value = #ptr.address<8192> : !ptr.ptr<#llvm.address_space<0>>}> : () -> !ptr.ptr<#llvm.address_space<0>>
    %4 = "ptr.constant"() <{value = #ptr.address<4096> : !ptr.ptr<#llvm.address_space<0>>}> : () -> !ptr.ptr<#llvm.address_space<0>>
    %5 = "ptr.ptr_diff"(%3, %4) <{flags = 0 : i8}> : (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_with_flags_nsw", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !ptr.ptr<#llvm.address_space<0>>, %arg5: !ptr.ptr<#llvm.address_space<0>>):
    %2 = "ptr.ptr_diff"(%arg4, %arg5) <{flags = 2 : i8}> : (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>) -> i64
    "llvm.return"(%2) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_with_flags_nuw", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !ptr.ptr<#llvm.address_space<0>>, %arg3: !ptr.ptr<#llvm.address_space<0>>):
    %1 = "ptr.ptr_diff"(%arg2, %arg3) <{flags = 1 : i8}> : (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>) -> i64
    "llvm.return"(%1) : (i64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>)>, linkage = #llvm.linkage<external>, sym_name = "ptr_diff_with_flags_nsw_nuw", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !ptr.ptr<#llvm.address_space<0>>, %arg1: !ptr.ptr<#llvm.address_space<0>>):
    %0 = "ptr.ptr_diff"(%arg0, %arg1) <{flags = 3 : i8}> : (!ptr.ptr<#llvm.address_space<0>>, !ptr.ptr<#llvm.address_space<0>>) -> i64
    "llvm.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

