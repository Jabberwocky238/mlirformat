"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "primitive"}> ({
    %54 = "some.op"() : () -> !llvm.void
    %55 = "some.op"() : () -> !llvm.ppc_fp128
    %56 = "some.op"() : () -> !llvm.token
    %57 = "some.op"() : () -> !llvm.label
    %58 = "some.op"() : () -> !llvm.metadata
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func"}> ({
    %47 = "some.op"() : () -> !llvm.func<void ()>
    %48 = "some.op"() : () -> !llvm.func<void (i32)>
    %49 = "some.op"() : () -> !llvm.func<i32 ()>
    %50 = "some.op"() : () -> !llvm.func<i32 (f16, bf16, f32, f64)>
    %51 = "some.op"() : () -> !llvm.func<i32 (i32, i32)>
    %52 = "some.op"() : () -> !llvm.func<void (...)>
    %53 = "some.op"() : () -> !llvm.func<void (i32, i32, ...)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "integer"}> ({
    %40 = "some.op"() : () -> i1
    %41 = "some.op"() : () -> i8
    %42 = "some.op"() : () -> i16
    %43 = "some.op"() : () -> i32
    %44 = "some.op"() : () -> i64
    %45 = "some.op"() : () -> i57
    %46 = "some.op"() : () -> i129
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "ptr"}> ({
    %36 = "some.op"() : () -> !llvm.ptr
    %37 = "some.op"() : () -> !llvm.ptr
    %38 = "some.op"() : () -> !llvm.ptr<42>
    %39 = "some.op"() : () -> !llvm.ptr<9>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "vec"}> ({
    %30 = "some.op"() : () -> vector<4xi32>
    %31 = "some.op"() : () -> vector<4xf32>
    %32 = "some.op"() : () -> vector<[4]xi32>
    %33 = "some.op"() : () -> vector<[8]xf16>
    %34 = "some.op"() : () -> vector<4x!llvm.ptr>
    %35 = "some.op"() : () -> vector<4x!llvm.ppc_fp128>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "array"}> ({
    %24 = "some.op"() : () -> !llvm.array<10 x i32>
    %25 = "some.op"() : () -> !llvm.array<8 x f32>
    %26 = "some.op"() : () -> !llvm.array<10 x ptr<4>>
    %27 = "some.op"() : () -> !llvm.array<10 x array<4 x f32>>
    %28 = "some.op"() : () -> !llvm.array<10 x array<4 x vector<8xf32>>>
    %29 = "some.op"() : () -> !llvm.array<10 x array<4 x vector<[8]xf32>>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "literal_struct"}> ({
    %11 = "some.op"() : () -> !llvm.struct<()>
    %12 = "some.op"() : () -> !llvm.struct<(i32)>
    %13 = "some.op"() : () -> !llvm.struct<(f32, i32)>
    %14 = "some.op"() : () -> !llvm.struct<(struct<(i32)>)>
    %15 = "some.op"() : () -> !llvm.struct<(i32, struct<(i32)>, f32)>
    %16 = "some.op"() : () -> !llvm.struct<packed ()>
    %17 = "some.op"() : () -> !llvm.struct<packed (i32)>
    %18 = "some.op"() : () -> !llvm.struct<packed (f32, i32)>
    %19 = "some.op"() : () -> !llvm.struct<packed (f32, i32)>
    %20 = "some.op"() : () -> !llvm.struct<packed (struct<(i32)>)>
    %21 = "some.op"() : () -> !llvm.struct<packed (i32, struct<(i32, i1)>, f32)>
    %22 = "some.op"() : () -> !llvm.struct<(struct<packed (i32)>)>
    %23 = "some.op"() : () -> !llvm.struct<packed (struct<(i32)>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "identified_struct"}> ({
    %1 = "some.op"() : () -> !llvm.struct<"empty", ()>
    %2 = "some.op"() : () -> !llvm.struct<"opaque", opaque>
    %3 = "some.op"() : () -> !llvm.struct<"long", (i32, struct<(i32, i1)>, f32, ptr)>
    %4 = "some.op"() : () -> !llvm.struct<"unpacked", (i32)>
    %5 = "some.op"() : () -> !llvm.struct<"packed", packed (i32)>
    %6 = "some.op"() : () -> !llvm.struct<"name with spaces and !^$@$#", packed (i32)>
    %7 = "some.op"() : () -> !llvm.struct<"outer", (struct<"nested", ()>)>
    %8 = "some.op"() : () -> !llvm.struct<"referring-another", (ptr)>
    %9 = "some.op"() : () -> !llvm.struct<"struct-of-arrays", (array<10 x i32>)>
    %10 = "some.op"() : () -> !llvm.array<10 x struct<"array-of-structs", (i32)>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "verbose"}> ({
    %0 = "some.op"() : () -> !llvm.struct<(i64, struct<(f32)>)>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "aliases", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "some.op"() : () -> !llvm.struct<(i32, f32, struct<(i64)>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "ext_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "some.op"() : () -> !llvm.target<"target1", i32, 1>
    %1 = "some.op"() : () -> !llvm.target<"target2">
    %2 = "some.op"() : () -> !llvm.target<"target3", i32, i64, f64>
    %3 = "some.op"() : () -> !llvm.target<"target4", 1, 0, 42>
    %4 = "some.op"() : () -> !llvm.target<"target5", i32, f64, 0, 5>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

