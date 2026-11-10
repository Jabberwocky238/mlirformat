module {
  llvm.func @my_kernel() {
    llvm.return
  }
  llvm.named_metadata "foo.version" [#llvm.md_node<#llvm.md_const<1 : i32>, #llvm.md_const<0 : i32>, #llvm.md_const<0 : i32>>]
  llvm.named_metadata "foo.language_version" [#llvm.md_node<#llvm.md_string<"Bar">, #llvm.md_const<1 : i32>, #llvm.md_const<2 : i32>, #llvm.md_const<3 : i32>>]
  llvm.named_metadata "foo.kernel" [#llvm.md_node<#llvm.md_func<@my_kernel>, #llvm.md_node<>, #llvm.md_node<#llvm.md_node<#llvm.md_const<0 : i32>, #llvm.md_string<"foo.buffer">, #llvm.md_string<"foo.idx">, #llvm.md_const<0 : i32>, #llvm.md_const<1 : i32>, #llvm.md_string<"foo.read">, #llvm.md_string<"foo.address_space">, #llvm.md_const<1 : i32>, #llvm.md_string<"foo.size">, #llvm.md_const<4 : i32>, #llvm.md_string<"foo.align_size">, #llvm.md_const<4 : i32>>>>]
}

