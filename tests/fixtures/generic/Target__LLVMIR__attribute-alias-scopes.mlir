#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain, description = "The first scope">
#alias_scope1 = #llvm.alias_scope<id = distinct[2]<>, domain = #alias_scope_domain>
#alias_scope2 = #llvm.alias_scope<id = distinct[3]<>, domain = #alias_scope_domain>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "alias_scopes", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.intr.experimental.noalias.scope.decl"() <{scope = #alias_scope}> : () -> ()
    "llvm.store"(%0, %arg0) <{alias_scopes = [#alias_scope], noalias_scopes = [#alias_scope1, #alias_scope2], ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %1 = "llvm.load"(%arg0) <{alias_scopes = [#alias_scope1], noalias_scopes = [#alias_scope, #alias_scope2], ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %2 = "llvm.atomicrmw"(%arg0, %0) <{alias_scopes = [#alias_scope2], bin_op = 1 : i64, noalias_scopes = [#alias_scope, #alias_scope1], ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %3 = "llvm.cmpxchg"(%arg0, %1, %2) <{alias_scopes = [#alias_scope2], failure_ordering = 2 : i64, success_ordering = 6 : i64}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    %4 = "llvm.mlir.constant"() <{value = 42 : i8}> : () -> i8
    "llvm.intr.memcpy"(%arg0, %arg0, %0) <{alias_scopes = [#alias_scope2], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memset"(%arg0, %4, %0) <{isVolatile = false, noalias_scopes = [#alias_scope2]}> : (!llvm.ptr, i8, i32) -> ()
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, alias_scopes = [#alias_scope2], callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, noalias_scopes = [#alias_scope2], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "noalias_intr_only", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.intr.experimental.noalias.scope.decl"() <{scope = #alias_scope}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>>
#alias_scope = #llvm.alias_scope<id = distinct[1]<>, domain = #alias_scope_domain>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "self_reference", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.intr.experimental.noalias.scope.decl"() <{scope = #alias_scope}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#alias_scope_domain = #llvm.alias_scope_domain<id = "domain1", description = "The domain">
#alias_scope = #llvm.alias_scope<id = "scope1", domain = #alias_scope_domain, description = "The first scope">
#alias_scope1 = #llvm.alias_scope<id = "scope2", domain = #alias_scope_domain>
#alias_scope2 = #llvm.alias_scope<id = "scope3", domain = #alias_scope_domain>
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "alias_scopes", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.intr.experimental.noalias.scope.decl"() <{scope = #alias_scope}> : () -> ()
    "llvm.store"(%0, %arg0) <{alias_scopes = [#alias_scope], noalias_scopes = [#alias_scope1, #alias_scope2], ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %1 = "llvm.load"(%arg0) <{alias_scopes = [#alias_scope1], noalias_scopes = [#alias_scope, #alias_scope2], ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %2 = "llvm.atomicrmw"(%arg0, %0) <{alias_scopes = [#alias_scope2], bin_op = 1 : i64, noalias_scopes = [#alias_scope, #alias_scope1], ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    %3 = "llvm.cmpxchg"(%arg0, %1, %2) <{alias_scopes = [#alias_scope2], failure_ordering = 2 : i64, success_ordering = 6 : i64}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    %4 = "llvm.mlir.constant"() <{value = 42 : i8}> : () -> i8
    "llvm.intr.memcpy"(%arg0, %arg0, %0) <{alias_scopes = [#alias_scope2], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memset"(%arg0, %4, %0) <{isVolatile = false, noalias_scopes = [#alias_scope2]}> : (!llvm.ptr, i8, i32) -> ()
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, alias_scopes = [#alias_scope2], callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, noalias_scopes = [#alias_scope2], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

