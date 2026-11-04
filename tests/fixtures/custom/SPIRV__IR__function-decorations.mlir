module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @linkage_attr_test_kernel() "DontInline" {
      %cst0_i8 = spirv.Constant 0 : i8
      %cst1_i16 = spirv.Constant 1 : i16
      %cst0_i32 = spirv.Constant 0 : i32
      spirv.FunctionCall @outside.func.with.linkage(%cst0_i8) : (i8) -> ()
      spirv.Return
    }
    spirv.func @outside.func.with.linkage(i8) "Pure" attributes {linkage_attributes = #spirv.linkage_attributes<linkage_name = "outside.func", linkage_type = <Import>>}
    spirv.func @inside.func() "Pure" {
      spirv.Return
    }
  }
}

// -----
module {
  spirv.func @arg_decoration_pointer(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer> {spirv.decoration = #spirv.decoration<Aliased>}) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @arg_decoration_pointer(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer> {spirv.decoration = #spirv.decoration<Restrict>}) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @arg_decoration_pointer(%arg0: !spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic> {spirv.decoration = #spirv.decoration<AliasedPointer>}) "None" {
    spirv.Return
  }
}

// -----
module {
  spirv.func @arg_decoration_pointer(%arg0: !spirv.ptr<!spirv.ptr<i32, PhysicalStorageBuffer>, Generic> {spirv.decoration = #spirv.decoration<RestrictPointer>}) "None" {
    spirv.Return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
