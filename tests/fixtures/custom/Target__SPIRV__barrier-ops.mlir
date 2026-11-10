module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @memory_barrier_0() "None" {
      spirv.MemoryBarrier <Device>, <Release|UniformMemory>
      spirv.Return
    }
    spirv.func @memory_barrier_1() "None" {
      spirv.MemoryBarrier <Subgroup>, <AcquireRelease|SubgroupMemory>
      spirv.Return
    }
    spirv.func @control_barrier_0() "None" {
      spirv.ControlBarrier <Device>, <Workgroup>, <Release|UniformMemory>
      spirv.Return
    }
    spirv.func @control_barrier_1() "None" {
      spirv.ControlBarrier <Workgroup>, <Invocation>, <AcquireRelease|UniformMemory>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.1, [Kernel, Addresses, NamedBarrier, Linkage], []> {
    spirv.func @named_barrier(%arg0: i32) "None" {
      %0 = spirv.NamedBarrierInitialize %arg0 : i32 -> !spirv.named_barrier
      spirv.MemoryNamedBarrier %0, <Workgroup>, <AcquireRelease|WorkgroupMemory> : !spirv.named_barrier
      spirv.Return
    }
  }
}

