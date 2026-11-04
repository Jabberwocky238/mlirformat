module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (f32)>)
  func.func private @create_clashes_on_conversion(!llvm.struct<"foo", (index)>)
}

// -----
module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (i64)>)
  func.func private @merge_on_conversion(!llvm.struct<"foo", (index)>)
}

// -----
module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (struct<"_Converted.foo">, f32)>)
  func.func private @create_clashes_on_conversion_recursive(!llvm.struct<"foo", (!llvm.struct<"foo">, index)>)
}

// -----
module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (struct<"_Converted.foo">, i64)>)
  func.func private @merge_on_conversion_recursive(!llvm.struct<"foo", (!llvm.struct<"foo">, index)>)
}

// -----
module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", (struct<"_Converted.foo">, i64)>)
  func.func private @create_clashing_pack(!llvm.struct<"foo", packed (!llvm.struct<"foo">, index)>)
}

// -----
module {
  func.func private @clashing_struct_name(!llvm.struct<"_Converted.foo", packed (struct<"_Converted.foo">, i64)>)
  func.func private @merge_on_conversion_pack(!llvm.struct<"foo", packed (!llvm.struct<"foo">, index)>)
}

