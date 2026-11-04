#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain, description = "The first scope">
#alias_scope1 = #llvm.alias_scope<id = distinct[2]<>, domain = #alias_scope_domain>
#alias_scope2 = #llvm.alias_scope<id = distinct[3]<>, domain = #alias_scope_domain>
module {
  llvm.func @foo(!llvm.ptr)
  llvm.func @alias_scopes(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.intr.experimental.noalias.scope.decl #alias_scope
    llvm.store %0, %arg0 {alias_scopes = [#alias_scope], noalias_scopes = [#alias_scope1, #alias_scope2]} : i32, !llvm.ptr
    %1 = llvm.load %arg0 {alias_scopes = [#alias_scope1], noalias_scopes = [#alias_scope, #alias_scope2]} : !llvm.ptr -> i32
    %2 = llvm.atomicrmw add %arg0, %0 monotonic {alias_scopes = [#alias_scope2], noalias_scopes = [#alias_scope, #alias_scope1]} : !llvm.ptr, i32
    %3 = llvm.cmpxchg %arg0, %1, %2 acq_rel monotonic {alias_scopes = [#alias_scope2]} : !llvm.ptr, i32
    %4 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memcpy"(%arg0, %arg0, %0) <{alias_scopes = [#alias_scope2], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memset"(%arg0, %4, %0) <{isVolatile = false, noalias_scopes = [#alias_scope2]}> : (!llvm.ptr, i8, i32) -> ()
    llvm.call @foo(%arg0) {alias_scopes = [#alias_scope2]} : (!llvm.ptr) -> ()
    llvm.call @foo(%arg0) {noalias_scopes = [#alias_scope2]} : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain>
module {
  llvm.func @noalias_intr_only() {
    llvm.intr.experimental.noalias.scope.decl #alias_scope
    llvm.return
  }
}

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>>
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain>
module {
  llvm.func @self_reference() {
    llvm.intr.experimental.noalias.scope.decl #alias_scope
    llvm.return
  }
}

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = "domain1", description = "The domain">
#alias_scope = #llvm.alias_scope<id = "scope1", domain = #alias_scope_domain, description = "The first scope">
#alias_scope1 = #llvm.alias_scope<id = "scope2", domain = #alias_scope_domain>
#alias_scope2 = #llvm.alias_scope<id = "scope3", domain = #alias_scope_domain>
module {
  llvm.func @foo(!llvm.ptr)
  llvm.func @alias_scopes(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.intr.experimental.noalias.scope.decl #alias_scope
    llvm.store %0, %arg0 {alias_scopes = [#alias_scope], noalias_scopes = [#alias_scope1, #alias_scope2]} : i32, !llvm.ptr
    %1 = llvm.load %arg0 {alias_scopes = [#alias_scope1], noalias_scopes = [#alias_scope, #alias_scope2]} : !llvm.ptr -> i32
    %2 = llvm.atomicrmw add %arg0, %0 monotonic {alias_scopes = [#alias_scope2], noalias_scopes = [#alias_scope, #alias_scope1]} : !llvm.ptr, i32
    %3 = llvm.cmpxchg %arg0, %1, %2 acq_rel monotonic {alias_scopes = [#alias_scope2]} : !llvm.ptr, i32
    %4 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memcpy"(%arg0, %arg0, %0) <{alias_scopes = [#alias_scope2], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memset"(%arg0, %4, %0) <{isVolatile = false, noalias_scopes = [#alias_scope2]}> : (!llvm.ptr, i8, i32) -> ()
    llvm.call @foo(%arg0) {alias_scopes = [#alias_scope2]} : (!llvm.ptr) -> ()
    llvm.call @foo(%arg0) {noalias_scopes = [#alias_scope2]} : (!llvm.ptr) -> ()
    llvm.return
  }
}

