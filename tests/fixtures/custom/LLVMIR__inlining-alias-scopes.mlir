#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "foo">
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain, description = "foo load">
#alias_scope1 = #llvm.alias_scope<id = distinct[2]<>, domain = #alias_scope_domain, description = "foo store">
module {
  llvm.func @foo(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(5 : i64) : i64
    llvm.intr.experimental.noalias.scope.decl #alias_scope
    %1 = llvm.load %arg1 {alias_scopes = [#alias_scope], alignment = 4 : i64, noalias_scopes = [#alias_scope1]} : !llvm.ptr -> f32
    "test.one_region_op"() ({
      %2 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %1, %2 {alias_scopes = [#alias_scope1], alignment = 4 : i64, noalias_scopes = [#alias_scope]} : f32, !llvm.ptr
      "test.terminator"() : () -> ()
    }) : () -> ()
    llvm.return
  }
  llvm.func @clone_alias_scopes(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    llvm.call @foo(%arg0, %arg1) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "hello2">
#alias_scope_domain1 = #llvm.alias_scope_domain<id = distinct[1]<>, description = "hello">
#alias_scope = #llvm.alias_scope<id = distinct[2]<>, domain = #alias_scope_domain, description = "hello2: %a">
#alias_scope1 = #llvm.alias_scope<id = distinct[3]<>, domain = #alias_scope_domain, description = "hello2: %b">
#alias_scope2 = #llvm.alias_scope<id = distinct[4]<>, domain = #alias_scope_domain1, description = "hello: %a">
module {
  llvm.func @callee_with_metadata(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %0 = llvm.mlir.constant(5 : i64) : i64
    %1 = llvm.mlir.constant(8 : i64) : i64
    %2 = llvm.mlir.constant(7 : i64) : i64
    %3 = llvm.load %arg2 {alignment = 4 : i64, noalias_scopes = [#alias_scope, #alias_scope1]} : !llvm.ptr -> f32
    %4 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %3, %4 {alias_scopes = [#alias_scope], alignment = 4 : i64, noalias_scopes = [#alias_scope1]} : f32, !llvm.ptr
    %5 = llvm.getelementptr inbounds %arg1[%1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %3, %5 {alias_scopes = [#alias_scope1], alignment = 4 : i64, noalias_scopes = [#alias_scope]} : f32, !llvm.ptr
    "test.one_region_op"() ({
      %6 = llvm.load %arg2 {alignment = 4 : i64} : !llvm.ptr -> f32
      %7 = llvm.getelementptr inbounds %arg0[%2] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %6, %7 {alignment = 4 : i64} : f32, !llvm.ptr
      "test.terminator"() : () -> ()
    }) : () -> ()
    llvm.return
  }
  llvm.func @callee_without_metadata(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %0 = llvm.mlir.constant(5 : i64) : i64
    %1 = llvm.mlir.constant(8 : i64) : i64
    %2 = llvm.mlir.constant(7 : i64) : i64
    %3 = llvm.load %arg2 {alignment = 4 : i64} : !llvm.ptr -> f32
    %4 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %3, %4 {alignment = 4 : i64} : f32, !llvm.ptr
    %5 = llvm.getelementptr inbounds %arg1[%1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %3, %5 {alignment = 4 : i64} : f32, !llvm.ptr
    "test.one_region_op"() ({
      %6 = llvm.load %arg2 {alignment = 4 : i64} : !llvm.ptr -> f32
      %7 = llvm.getelementptr inbounds %arg0[%2] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %6, %7 {alignment = 4 : i64} : f32, !llvm.ptr
      "test.terminator"() : () -> ()
    }) : () -> ()
    llvm.return
  }
  llvm.func @caller(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %0 = llvm.load %arg2 {alias_scopes = [#alias_scope2], alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.call @callee_with_metadata(%arg0, %arg1, %0) {noalias_scopes = [#alias_scope2]} : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @callee_with_metadata(%arg1, %arg1, %arg0) {alias_scopes = [#alias_scope2]} : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @callee_without_metadata(%arg0, %arg1, %0) {noalias_scopes = [#alias_scope2]} : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @callee_without_metadata(%arg1, %arg1, %arg0) {alias_scopes = [#alias_scope2]} : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i64
    %1 = llvm.load %arg1 {alignment = 4 : i64} : !llvm.ptr -> f32
    %2 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %1, %2 {alignment = 4 : i64} : f32, !llvm.ptr
    llvm.return
  }
  llvm.func @bar(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @foo(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(5 : i64) : i64
    %1 = llvm.load %arg0 {alignment = 4 : i64} : !llvm.ptr -> f32
    %2 = llvm.getelementptr inbounds %arg1[%0] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %1, %2 {alignment = 4 : i64} : f32, !llvm.ptr
    llvm.return
  }
  llvm.func @missing_noalias_on_one_ptr(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @foo(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @might_return_arg_derived(!llvm.ptr) -> !llvm.ptr
  llvm.func @foo(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    %1 = llvm.call @might_return_arg_derived(%arg0) : (!llvm.ptr) -> !llvm.ptr
    llvm.store %0, %1 : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @bar(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @foo(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @random() -> i1
  llvm.func @block_arg(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    %1 = llvm.call @random() : () -> i1
    llvm.cond_br %1, ^bb1(%arg0 : !llvm.ptr), ^bb1(%arg1 : !llvm.ptr)
  ^bb1(%2: !llvm.ptr):  // 2 preds: ^bb0, ^bb0
    llvm.store %0, %2 : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @bar(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @block_arg(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @random() -> i1
  llvm.func @region_branch(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    %1 = test.region_if %arg0: !llvm.ptr -> !llvm.ptr then {
    ^bb0(%arg2: !llvm.ptr):
      test.region_if_yield %arg0 : !llvm.ptr
    } else {
    ^bb0(%arg2: !llvm.ptr):
      test.region_if_yield %arg0 : !llvm.ptr
    } join {
    ^bb0(%arg2: !llvm.ptr):
      llvm.store %0, %arg2 : i32, !llvm.ptr
      test.region_if_yield %arg0 : !llvm.ptr
    }
    llvm.return
  }
  llvm.func @region_branch_inlining(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @region_branch(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @missing_region_branch(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    "test.one_region_op"() ({
    ^bb0(%arg2: !llvm.ptr):
      llvm.store %0, %arg2 : i32, !llvm.ptr
      "test.terminator"() : () -> ()
    }) : () -> ()
    llvm.return
  }
  llvm.func @missing_region_branch_inlining(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @missing_region_branch(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @random() -> i1
  llvm.func @block_arg(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x i32 : (i64) -> !llvm.ptr
    %3 = llvm.call @random() : () -> i1
    llvm.cond_br %3, ^bb1(%arg0 : !llvm.ptr), ^bb1(%2 : !llvm.ptr)
  ^bb1(%4: !llvm.ptr):  // 2 preds: ^bb0, ^bb0
    llvm.store %0, %4 : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @bar(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @block_arg(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @unknown() -> !llvm.ptr
  llvm.func @random() -> i1
  llvm.func @unknown_object(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    %1 = llvm.call @random() : () -> i1
    %2 = llvm.call @unknown() : () -> !llvm.ptr
    llvm.cond_br %1, ^bb1(%arg0 : !llvm.ptr), ^bb1(%2 : !llvm.ptr)
  ^bb1(%3: !llvm.ptr):  // 2 preds: ^bb0, ^bb0
    llvm.store %0, %3 : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @bar(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @unknown_object(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @supported_operations(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr {llvm.noalias}) {
    %0 = llvm.mlir.constant(5 : i64) : i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    %1 = llvm.load %arg1 : !llvm.ptr -> i32
    "llvm.intr.memcpy"(%arg0, %arg1, %1) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memmove"(%arg0, %arg1, %1) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy.inline"(%arg0, %arg1) <{isVolatile = false, len = 4 : i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    %2 = llvm.trunc %0 : i32 to i8
    "llvm.intr.memset"(%arg0, %2, %1) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    %3 = llvm.cmpxchg %arg0, %0, %1 seq_cst seq_cst : !llvm.ptr, i32
    %4 = llvm.atomicrmw add %arg0, %0 seq_cst : !llvm.ptr, i32
    llvm.return
  }
  llvm.func @bar(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @supported_operations(%arg0, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(i32)
  llvm.func @region(%arg0: !llvm.ptr {llvm.noalias}) {
    "test.one_region_op"() ({
      %0 = llvm.load %arg0 : !llvm.ptr -> i32
      llvm.call @foo(%0) : (i32) -> ()
      "test.terminator"() : () -> ()
    }) : () -> ()
    llvm.return
  }
  llvm.func @noalias_with_region(%arg0: !llvm.ptr) {
    llvm.call @region(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(i32)
  llvm.func @func(%arg0: !llvm.ptr {llvm.noalias}, %arg1: !llvm.ptr) {
    %0 = llvm.load %arg1 : !llvm.ptr -> i1
    %1 = llvm.getelementptr inbounds %arg0[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %2 = llvm.select %0, %arg0, %1 : i1, !llvm.ptr
    %3 = llvm.load %2 : !llvm.ptr -> i32
    llvm.call @foo(%3) : (i32) -> ()
    llvm.return
  }
  llvm.func @selects(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    llvm.call @func(%arg0, %arg1) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(i32)
  llvm.func @func(%arg0: i1, %arg1: !llvm.ptr {llvm.noalias}, %arg2: !llvm.ptr) {
    %0 = llvm.select %arg0, %arg1, %arg2 : i1, !llvm.ptr
    %1 = llvm.load %0 : !llvm.ptr -> i32
    llvm.call @foo(%1) : (i32) -> ()
    llvm.return
  }
  llvm.func @multi_ptr_select(%arg0: i1, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    llvm.call @func(%arg0, %arg1, %arg2) : (i1, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

