module {
  spirv.func @pointerUniformConstant(!spirv.ptr<i1, UniformConstant>) "None"
  spirv.GlobalVariable @varUniformConstant : !spirv.ptr<i1, UniformConstant>
  spirv.func @pointerInput(!spirv.ptr<i1, Input>) "None"
  spirv.GlobalVariable @varInput : !spirv.ptr<i1, Input>
  spirv.func @pointerUniform(!spirv.ptr<i1, Uniform>) "None"
  spirv.func @pointerOutput(!spirv.ptr<i1, Output>) "None"
  spirv.GlobalVariable @varOutput : !spirv.ptr<i1, Output>
  spirv.func @pointerWorkgroup(!spirv.ptr<i1, Workgroup>) "None"
  spirv.func @pointerCrossWorkgroup(!spirv.ptr<i1, CrossWorkgroup>) "None"
  spirv.func @pointerPrivate(!spirv.ptr<i1, Private>) "None"
  spirv.GlobalVariable @varPrivate : !spirv.ptr<i1, Private>
  spirv.func @pointerFunction(!spirv.ptr<i1, Function>) "None"
  spirv.func @pointerGeneric(!spirv.ptr<i1, Generic>) "None"
  spirv.func @pointerPushConstant(!spirv.ptr<i1, PushConstant>) "None"
  spirv.func @pointerAtomicCounter(!spirv.ptr<i1, AtomicCounter>) "None"
  spirv.func @pointerImage(!spirv.ptr<i1, Image>) "None"
  spirv.func @pointerStorageBuffer(!spirv.ptr<i1, StorageBuffer>) "None"
  spirv.GlobalVariable @varStorageBuffer : !spirv.ptr<i1, StorageBuffer>
  spirv.func @pointerCallableDataKHR(!spirv.ptr<i1, CallableDataKHR>) "None"
  spirv.func @pointerIncomingCallableDataKHR(!spirv.ptr<i1, IncomingCallableDataKHR>) "None"
  spirv.func @pointerRayPayloadKHR(!spirv.ptr<i1, RayPayloadKHR>) "None"
  spirv.func @pointerHitAttributeKHR(!spirv.ptr<i1, HitAttributeKHR>) "None"
  spirv.func @pointerIncomingRayPayloadKHR(!spirv.ptr<i1, IncomingRayPayloadKHR>) "None"
  spirv.func @pointerShaderRecordBufferKHR(!spirv.ptr<i1, ShaderRecordBufferKHR>) "None"
  spirv.func @pointerPhysicalStorageBuffer(!spirv.ptr<i1, PhysicalStorageBuffer> {spirv.decoration = #spirv.decoration<Aliased>}) "None"
  spirv.func @pointerCodeSectionINTEL(!spirv.ptr<i1, CodeSectionINTEL>) "None"
  spirv.func @pointerDeviceOnlyINTEL(!spirv.ptr<i1, DeviceOnlyINTEL>) "None"
  spirv.func @pointerHostOnlyINTEL(!spirv.ptr<i1, HostOnlyINTEL>) "None"
}

