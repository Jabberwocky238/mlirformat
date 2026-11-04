module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @__builtin_var_WorkgroupSize__ built_in("WorkgroupSize") : !spirv.ptr<vector<3xi32>, Input>
    spirv.GlobalVariable @__builtin_var_NumWorkgroups__ built_in("NumWorkgroups") : !spirv.ptr<vector<3xi32>, Input>
    spirv.GlobalVariable @__builtin_var_LocalInvocationId__ built_in("LocalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
    spirv.GlobalVariable @__builtin_var_WorkgroupId__ built_in("WorkgroupId") : !spirv.ptr<vector<3xi32>, Input>
    spirv.func @load_store_kernel(%arg0: !spirv.ptr<!spirv.struct<(!spirv.array<12 x !spirv.array<4 x f32>>)>, StorageBuffer> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 0)>}, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x !spirv.array<4 x f32>>)>, StorageBuffer> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 1)>}, %arg2: !spirv.ptr<!spirv.struct<(!spirv.array<12 x !spirv.array<4 x f32>>)>, StorageBuffer> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 2)>}, %arg3: i32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 3), StorageBuffer>}, %arg4: i32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 4), StorageBuffer>}, %arg5: i32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 5), StorageBuffer>}, %arg6: i32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 6), StorageBuffer>}) "None" attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      %__builtin_var_WorkgroupId___addr = spirv.mlir.addressof @__builtin_var_WorkgroupId__ : !spirv.ptr<vector<3xi32>, Input>
      %0 = spirv.Load "Input" %__builtin_var_WorkgroupId___addr : vector<3xi32>
      %1 = spirv.CompositeExtract %0[0 : i32] : vector<3xi32>
      %__builtin_var_WorkgroupId___addr_0 = spirv.mlir.addressof @__builtin_var_WorkgroupId__ : !spirv.ptr<vector<3xi32>, Input>
      %2 = spirv.Load "Input" %__builtin_var_WorkgroupId___addr_0 : vector<3xi32>
      %3 = spirv.CompositeExtract %2[1 : i32] : vector<3xi32>
      %__builtin_var_WorkgroupId___addr_1 = spirv.mlir.addressof @__builtin_var_WorkgroupId__ : !spirv.ptr<vector<3xi32>, Input>
      %4 = spirv.Load "Input" %__builtin_var_WorkgroupId___addr_1 : vector<3xi32>
      %5 = spirv.CompositeExtract %4[2 : i32] : vector<3xi32>
      %__builtin_var_LocalInvocationId___addr = spirv.mlir.addressof @__builtin_var_LocalInvocationId__ : !spirv.ptr<vector<3xi32>, Input>
      %6 = spirv.Load "Input" %__builtin_var_LocalInvocationId___addr : vector<3xi32>
      %7 = spirv.CompositeExtract %6[0 : i32] : vector<3xi32>
      %__builtin_var_LocalInvocationId___addr_2 = spirv.mlir.addressof @__builtin_var_LocalInvocationId__ : !spirv.ptr<vector<3xi32>, Input>
      %8 = spirv.Load "Input" %__builtin_var_LocalInvocationId___addr_2 : vector<3xi32>
      %9 = spirv.CompositeExtract %8[1 : i32] : vector<3xi32>
      %__builtin_var_LocalInvocationId___addr_3 = spirv.mlir.addressof @__builtin_var_LocalInvocationId__ : !spirv.ptr<vector<3xi32>, Input>
      %10 = spirv.Load "Input" %__builtin_var_LocalInvocationId___addr_3 : vector<3xi32>
      %11 = spirv.CompositeExtract %10[2 : i32] : vector<3xi32>
      %__builtin_var_NumWorkgroups___addr = spirv.mlir.addressof @__builtin_var_NumWorkgroups__ : !spirv.ptr<vector<3xi32>, Input>
      %12 = spirv.Load "Input" %__builtin_var_NumWorkgroups___addr : vector<3xi32>
      %13 = spirv.CompositeExtract %12[0 : i32] : vector<3xi32>
      %__builtin_var_NumWorkgroups___addr_4 = spirv.mlir.addressof @__builtin_var_NumWorkgroups__ : !spirv.ptr<vector<3xi32>, Input>
      %14 = spirv.Load "Input" %__builtin_var_NumWorkgroups___addr_4 : vector<3xi32>
      %15 = spirv.CompositeExtract %14[1 : i32] : vector<3xi32>
      %__builtin_var_NumWorkgroups___addr_5 = spirv.mlir.addressof @__builtin_var_NumWorkgroups__ : !spirv.ptr<vector<3xi32>, Input>
      %16 = spirv.Load "Input" %__builtin_var_NumWorkgroups___addr_5 : vector<3xi32>
      %17 = spirv.CompositeExtract %16[2 : i32] : vector<3xi32>
      %__builtin_var_WorkgroupSize___addr = spirv.mlir.addressof @__builtin_var_WorkgroupSize__ : !spirv.ptr<vector<3xi32>, Input>
      %18 = spirv.Load "Input" %__builtin_var_WorkgroupSize___addr : vector<3xi32>
      %19 = spirv.CompositeExtract %18[0 : i32] : vector<3xi32>
      %__builtin_var_WorkgroupSize___addr_6 = spirv.mlir.addressof @__builtin_var_WorkgroupSize__ : !spirv.ptr<vector<3xi32>, Input>
      %20 = spirv.Load "Input" %__builtin_var_WorkgroupSize___addr_6 : vector<3xi32>
      %21 = spirv.CompositeExtract %20[1 : i32] : vector<3xi32>
      %__builtin_var_WorkgroupSize___addr_7 = spirv.mlir.addressof @__builtin_var_WorkgroupSize__ : !spirv.ptr<vector<3xi32>, Input>
      %22 = spirv.Load "Input" %__builtin_var_WorkgroupSize___addr_7 : vector<3xi32>
      %23 = spirv.CompositeExtract %22[2 : i32] : vector<3xi32>
      %24 = spirv.IAdd %arg3, %1 : i32
      %25 = spirv.IAdd %arg4, %7 : i32
      %cst0_i32 = spirv.Constant 0 : i32
      %26 = spirv.AccessChain %arg0[%cst0_i32, %24, %25] : !spirv.ptr<!spirv.struct<(!spirv.array<12 x !spirv.array<4 x f32>>)>, StorageBuffer>, i32, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %27 = spirv.Load "StorageBuffer" %26 : f32
      %28 = spirv.AccessChain %arg1[%cst0_i32, %24, %25] : !spirv.ptr<!spirv.struct<(!spirv.array<12 x !spirv.array<4 x f32>>)>, StorageBuffer>, i32, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      %29 = spirv.Load "StorageBuffer" %28 : f32
      %30 = spirv.FAdd %27, %29 : f32
      %31 = spirv.AccessChain %arg2[%cst0_i32, %24, %25] : !spirv.ptr<!spirv.struct<(!spirv.array<12 x !spirv.array<4 x f32>>)>, StorageBuffer>, i32, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      spirv.Store "StorageBuffer" %31, %30 : f32
      spirv.Return
    }
  }
}

