module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {location = 0 : i32} : !spirv.ptr<vector<4xf32>, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {no_perspective} : !spirv.ptr<vector<4xf32>, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {flat} : !spirv.ptr<si32, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]> {
    spirv.GlobalVariable @var1 bind(0, 0) {aliased} : !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>
    spirv.GlobalVariable @var2 bind(0, 0) {aliased} : !spirv.ptr<!spirv.struct<(vector<4xf32> [0])>, StorageBuffer>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]> {
    spirv.GlobalVariable @var bind(0, 0) {non_readable} : !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]> {
    spirv.GlobalVariable @var bind(0, 0) {non_writable} : !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_variable_pointers]> {
    spirv.GlobalVariable @var bind(0, 0) {restrict} : !spirv.ptr<!spirv.struct<(!spirv.array<4 x f32, stride=4> [0])>, StorageBuffer>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {location = 0 : i32, relaxed_precision} : !spirv.ptr<vector<4xf32>, Output>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Tessellation, Linkage], []> {
    spirv.GlobalVariable @var {patch} : !spirv.ptr<vector<4xf32>, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {invariant} : !spirv.ptr<vector<2xf32>, Output>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {coherent} : !spirv.ptr<vector<2xf32>, Output>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var {index = 42 : i32} : !spirv.ptr<vector<2xf32>, Output>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var1 {linkage_attributes = #spirv.linkage_attributes<linkage_name = "outSideGlobalVar1", linkage_type = <Import>>} : !spirv.ptr<f32, Private>
  }
}

// -----
module {
  spirv.module Logical OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage], [SPV_KHR_no_integer_wrap_decoration]> {
    spirv.func @iadd_decorations(%arg0: i32) -> i32 "None" {
      %0 = spirv.IAdd %arg0, %arg0 {no_signed_wrap, no_unsigned_wrap} : i32
      spirv.ReturnValue %0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage], []> {
    spirv.func @fadd_decorations(%arg0: f32) -> f32 "None" {
      %0 = spirv.FAdd %arg0, %arg0 {fp_fast_math_mode = #spirv.fastmath_mode<NotNaN|NotInf|NSZ>} : f32
      spirv.ReturnValue %0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @fmul_decorations(%arg0: f32) -> f32 "None" {
      %0 = spirv.FMul %arg0, %arg0 {no_contraction} : f32
      spirv.ReturnValue %0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage, Float16], []> {
    spirv.func @fp_rounding_mode(%arg0: f32) -> f16 "None" {
      %0 = spirv.FConvert %arg0 {fp_rounding_mode = #spirv.fp_rounding_mode<RTN>} : f32 to f16
      spirv.ReturnValue %0 : f16
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @relaxed_precision_arg(%arg0: !spirv.ptr<f32, Function> {spirv.decoration = #spirv.decoration<RelaxedPrecision>}) "None" attributes {relaxed_precision} {
      spirv.Return
    }
  }
}

