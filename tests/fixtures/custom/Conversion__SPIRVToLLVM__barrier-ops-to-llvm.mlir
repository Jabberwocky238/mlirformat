module {
  spirv.func @control_barrier() "None" {
    spirv.ControlBarrier <Workgroup>, <Workgroup>, <WorkgroupMemory|CrossWorkgroupMemory>
    spirv.ControlBarrier <Workgroup>, <Workgroup>, <WorkgroupMemory>
    spirv.Return
  }
}

// -----
module {
  spirv.func @split_barrier() "None" {
    spirv.INTEL.ControlBarrierArrive <Workgroup> <Workgroup> <WorkgroupMemory|CrossWorkgroupMemory>
    spirv.INTEL.ControlBarrierWait <Workgroup> <Workgroup> <WorkgroupMemory>
    spirv.Return
  }
}

