module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      %0 = spirv.FAdd %arg0, %arg0 : f32
      spirv.ReturnValue %0 : f32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      %0 = spirv.ISub %arg0, %arg0 : i32
      spirv.ReturnValue %0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
    spirv.func @bar(%arg0: f32) -> f32 "None" {
      %0 = spirv.FunctionCall @foo(%arg0) : (f32) -> f32
      spirv.ReturnValue %0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @bar(%arg0: f32) -> f32 "None" {
      %0 = spirv.FunctionCall @foo(%arg0) : (f32) -> f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
    spirv.EntryPoint "GLCompute" @foo
    spirv.ExecutionMode @foo "ContractionOff"
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
    spirv.EntryPoint "GLCompute" @foo
    spirv.ExecutionMode @foo "ContractionOff"
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
    spirv.EntryPoint "GLCompute" @foo
    spirv.ExecutionMode @foo "ContractionOff"
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @bar() -> f32 "None" {
      %foo_addr = spirv.mlir.addressof @foo : !spirv.ptr<f32, Input>
      %0 = spirv.Load "Input" %foo_addr : f32
      spirv.ReturnValue %0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @bar() -> f32 "None" {
      %foo_addr = spirv.mlir.addressof @foo : !spirv.ptr<f32, Input>
      %0 = spirv.Load "Input" %foo_addr : f32
      spirv.ReturnValue %0 : f32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @foo = -5 : i32
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @foo = -5 : i32
    spirv.func @bar() -> i32 "None" {
      %0 = spirv.mlir.referenceof @foo : i32
      spirv.ReturnValue %0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @foo = -5 : i32
    spirv.func @bar() -> i32 "None" {
      %0 = spirv.mlir.referenceof @foo : i32
      spirv.ReturnValue %0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar = -5 : i32
    spirv.SpecConstantComposite @foo (@bar, @bar) : !spirv.array<2 x i32>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar = -5 : i32
    spirv.SpecConstantComposite @foo (@bar, @bar) : !spirv.array<2 x i32>
    spirv.func @baz() -> i32 "None" {
      %0 = spirv.mlir.referenceof @foo : !spirv.array<2 x i32>
      %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.array<2 x i32>
      spirv.ReturnValue %1 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar = -5 : i32
    spirv.SpecConstantComposite @foo (@bar, @bar) : !spirv.array<2 x i32>
    spirv.func @baz() -> i32 "None" {
      %0 = spirv.mlir.referenceof @foo : !spirv.array<2 x i32>
      %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.array<2 x i32>
      spirv.ReturnValue %1 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar = -5 : i32
    spirv.SpecConstantComposite @foo (@bar, @bar) : !spirv.array<2 x i32>
    spirv.func @baz() -> i32 "None" {
      %0 = spirv.mlir.referenceof @foo : !spirv.array<2 x i32>
      %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.array<2 x i32>
      spirv.ReturnValue %1 : i32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
    spirv.func @bar(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(2, 0) : !spirv.ptr<f32, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo built_in("GlobalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo built_in("LocalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @foo = -5 : i32
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @foo = -5 : i32
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar = -5 : i32
    spirv.SpecConstantComposite @foo (@bar, @bar) : !spirv.array<2 x i32>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar = -5 : i32
    spirv.SpecConstantComposite @foo (@bar, @bar) : !spirv.array<2 x i32>
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
  }
}

