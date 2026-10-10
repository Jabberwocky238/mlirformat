module {
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func fastcc @cconv_fastcc()
  llvm.func @cconv_ccc()
  llvm.func tailcc @cconv_tailcc()
  llvm.func cc_10 @cconv_ghccc()
  llvm.func @test_ccs() {
    llvm.call fastcc @cconv_fastcc() : () -> ()
    llvm.call @cconv_ccc() : () -> ()
    llvm.call @cconv_ccc() : () -> ()
    llvm.call tailcc @cconv_tailcc() : () -> ()
    llvm.call cc_10 @cconv_ghccc() : () -> ()
    llvm.return
  }
  llvm.func @test_ccs_invoke() attributes {personality = @__gxx_personality_v0} {
    llvm.invoke fastcc @cconv_fastcc() to ^bb1 unwind ^bb6 : () -> ()
  ^bb1:  // pred: ^bb0
    llvm.invoke @cconv_ccc() to ^bb2 unwind ^bb6 : () -> ()
  ^bb2:  // pred: ^bb1
    llvm.invoke @cconv_ccc() to ^bb3 unwind ^bb6 : () -> ()
  ^bb3:  // pred: ^bb2
    llvm.invoke tailcc @cconv_tailcc() to ^bb4 unwind ^bb6 : () -> ()
  ^bb4:  // pred: ^bb3
    llvm.invoke cc_10 @cconv_ghccc() to ^bb5 unwind ^bb6 : () -> ()
  ^bb5:  // pred: ^bb4
    llvm.return
  ^bb6:  // 5 preds: ^bb0, ^bb1, ^bb2, ^bb3, ^bb4
    %0 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  }
}

