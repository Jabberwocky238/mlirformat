module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage, Addresses, AtomicFloat32AddEXT], [SPV_EXT_shader_atomic_float_add]> {
    spirv.func @test_int_atomics(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 "None" {
      %0 = spirv.AtomicCompareExchangeWeak <Workgroup> <Release> <Acquire> %arg0, %arg1, %arg2 : !spirv.ptr<i32, Workgroup>
      %1 = spirv.AtomicAnd <Device> <None> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %2 = spirv.AtomicIAdd <Workgroup> <Acquire> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %3 = spirv.AtomicIDecrement <Workgroup> <Acquire> %arg0 : !spirv.ptr<i32, Workgroup>
      %4 = spirv.AtomicIIncrement <Device> <Release> %arg0 : !spirv.ptr<i32, Workgroup>
      %5 = spirv.AtomicISub <Workgroup> <Acquire> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %6 = spirv.AtomicOr <Workgroup> <AcquireRelease> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %7 = spirv.AtomicSMax <Subgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %8 = spirv.AtomicSMin <Device> <Release> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %9 = spirv.AtomicUMax <Subgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %10 = spirv.AtomicUMin <Device> <Release> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %11 = spirv.AtomicXor <Workgroup> <AcquireRelease> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      %12 = spirv.AtomicCompareExchange <Workgroup> <Release> <Acquire> %arg0, %arg1, %arg2 : !spirv.ptr<i32, Workgroup>
      %13 = spirv.AtomicExchange <Workgroup> <Release> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
      spirv.ReturnValue %0 : i32
    }
    spirv.func @test_float_atomics(%arg0: !spirv.ptr<f32, Workgroup>, %arg1: f32) -> f32 "None" {
      %0 = spirv.EXT.AtomicFAdd <Workgroup> <Acquire> %arg0, %arg1 : !spirv.ptr<f32, Workgroup>
      spirv.ReturnValue %0 : f32
    }
  }
}

