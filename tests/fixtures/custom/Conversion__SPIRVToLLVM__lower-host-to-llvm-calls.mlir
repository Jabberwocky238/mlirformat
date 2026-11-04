module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_variable_pointers]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 128, 64]>>} {
  spirv.module @__spv__foo Logical GLSL450 requires #spirv.vce<v1.0, [Shader], [SPV_KHR_variable_pointers]> {
    spirv.GlobalVariable @bar_arg_0 bind(0, 0) : !spirv.ptr<!spirv.struct<(!spirv.array<6 x i32, stride=4> [0])>, StorageBuffer>
    spirv.func @bar() "None" attributes {workgroup_attributions = 0 : i64} {
      %bar_arg_0_addr = spirv.mlir.addressof @bar_arg_0 : !spirv.ptr<!spirv.struct<(!spirv.array<6 x i32, stride=4> [0])>, StorageBuffer>
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @bar
    spirv.ExecutionMode @bar "LocalSize", 1, 1, 1
  }
  gpu.module @foo {
    gpu.func @bar(%arg0: memref<6xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<6xi32>
    %c1 = arith.constant 1 : index
    gpu.launch_func  @foo::@bar blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<6xi32>)
    return
  }
}

// -----
module {
  spirv.module @spirv.sym Logical GLSL450 {
    spirv.func @bar() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @bar
    spirv.ExecutionMode @bar "LocalSize", 1, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @bar() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @bar
    spirv.ExecutionMode @bar "LocalSize", 1, 1, 1
  }
}

