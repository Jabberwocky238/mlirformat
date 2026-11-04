module {
  spirv.module Logical OpenCL requires #spirv.vce<v1.0, [Kernel], []> {
    spirv.func @foo() "None" {
      spirv.Return
    }
    spirv.EntryPoint "Kernel" @foo
    spirv.ExecutionMode @foo "LocalSizeHint", 3, 4, 5
  }
}

