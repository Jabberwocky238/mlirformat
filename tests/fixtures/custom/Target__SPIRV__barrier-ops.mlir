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

