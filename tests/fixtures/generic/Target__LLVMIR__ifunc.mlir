"builtin.module"() ({
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, dso_local, i_func_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, resolver = @resolve_foo, resolver_type = !llvm.ptr, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}, {llvm.noundef}], dso_local, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "call_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "llvm.call"(%arg0, %arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{llvm.noundef}, {llvm.noundef}], callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "foo_fptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @foo}> : () -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, dso_local, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<internal>, sym_name = "resolve_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @foo_1}> : () -> !llvm.ptr
    "llvm.return"(%0) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef}, {llvm.noundef}], function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "foo_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.alias"() <{alias_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver_alias", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.addressof"() <{global_name = @resolver}> : () -> !llvm.ptr
    "llvm.return"(%3) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.mlir.alias"() <{alias_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver_alias_alias", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.addressof"() <{global_name = @resolver_alias}> : () -> !llvm.ptr
    "llvm.return"(%2) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<f32 (i64)>, linkage = #llvm.linkage<external>, resolver = @resolver_alias_alias, resolver_type = !llvm.ptr, sym_name = "ifunc2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> ()
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<f32 (i64)>, linkage = #llvm.linkage<external>, resolver = @resolver_alias, resolver_type = !llvm.ptr, sym_name = "ifunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 333 : i64}> : () -> i64
    %1 = "llvm.inttoptr"(%0) : (i64) -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, dso_local, i_func_type = !llvm.func<f32 (i64)>, linkage = #llvm.linkage<linkonce_odr>, resolver = @resolver, resolver_type = !llvm.ptr, sym_name = "ifunc", unnamed_addr = 0 : i64, visibility_ = 1 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 333 : i64}> : () -> i64
    %1 = "llvm.inttoptr"(%0) : (i64) -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, dso_local, i_func_type = !llvm.func<f32 (i64)>, linkage = #llvm.linkage<private>, resolver = @resolver, resolver_type = !llvm.ptr, sym_name = "ifunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 333 : i64}> : () -> i64
    %1 = "llvm.inttoptr"(%0) : (i64) -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.ifunc"() <{address_space = 0 : i32, i_func_type = !llvm.func<f32 (i64)>, linkage = #llvm.linkage<weak>, resolver = @resolver, resolver_type = !llvm.ptr, sym_name = "ifunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr ()>, linkage = #llvm.linkage<external>, sym_name = "resolver", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 333 : i64}> : () -> i64
    %1 = "llvm.inttoptr"(%0) : (i64) -> !llvm.ptr
    "llvm.return"(%1) : (!llvm.ptr) -> ()
  }) : () -> ()
}) : () -> ()

