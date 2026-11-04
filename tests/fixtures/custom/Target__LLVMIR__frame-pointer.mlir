module {
  llvm.func @frame_pointer_func() attributes {frame_pointer = #llvm.framePointerKind<"non-leaf">} {
    llvm.return
  }
}

