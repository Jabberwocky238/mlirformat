module {
  func.func @primitive() {
    %0 = "some.op"() : () -> !llvm.void
    %1 = "some.op"() : () -> !llvm.ppc_fp128
    %2 = "some.op"() : () -> !llvm.token
    %3 = "some.op"() : () -> !llvm.label
    %4 = "some.op"() : () -> !llvm.metadata
    return
  }
  func.func @func() {
    %0 = "some.op"() : () -> !llvm.func<void ()>
    %1 = "some.op"() : () -> !llvm.func<void (i32)>
    %2 = "some.op"() : () -> !llvm.func<i32 ()>
    %3 = "some.op"() : () -> !llvm.func<i32 (f16, bf16, f32, f64)>
    %4 = "some.op"() : () -> !llvm.func<i32 (i32, i32)>
    %5 = "some.op"() : () -> !llvm.func<void (...)>
    %6 = "some.op"() : () -> !llvm.func<void (i32, i32, ...)>
    return
  }
  func.func @integer() {
    %0 = "some.op"() : () -> i1
    %1 = "some.op"() : () -> i8
    %2 = "some.op"() : () -> i16
    %3 = "some.op"() : () -> i32
    %4 = "some.op"() : () -> i64
    %5 = "some.op"() : () -> i57
    %6 = "some.op"() : () -> i129
    return
  }
  func.func @ptr() {
    %0 = "some.op"() : () -> !llvm.ptr
    %1 = "some.op"() : () -> !llvm.ptr
    %2 = "some.op"() : () -> !llvm.ptr<42>
    %3 = "some.op"() : () -> !llvm.ptr<9>
    return
  }
  func.func @vec() {
    %0 = "some.op"() : () -> vector<4xi32>
    %1 = "some.op"() : () -> vector<4xf32>
    %2 = "some.op"() : () -> vector<[4]xi32>
    %3 = "some.op"() : () -> vector<[8]xf16>
    %4 = "some.op"() : () -> vector<4x!llvm.ptr>
    %5 = "some.op"() : () -> vector<4x!llvm.ppc_fp128>
    return
  }
  func.func @array() {
    %0 = "some.op"() : () -> !llvm.array<10 x i32>
    %1 = "some.op"() : () -> !llvm.array<8 x f32>
    %2 = "some.op"() : () -> !llvm.array<10 x ptr<4>>
    %3 = "some.op"() : () -> !llvm.array<10 x array<4 x f32>>
    %4 = "some.op"() : () -> !llvm.array<10 x array<4 x vector<8xf32>>>
    %5 = "some.op"() : () -> !llvm.array<10 x array<4 x vector<[8]xf32>>>
    return
  }
  func.func @literal_struct() {
    %0 = "some.op"() : () -> !llvm.struct<()>
    %1 = "some.op"() : () -> !llvm.struct<(i32)>
    %2 = "some.op"() : () -> !llvm.struct<(f32, i32)>
    %3 = "some.op"() : () -> !llvm.struct<(struct<(i32)>)>
    %4 = "some.op"() : () -> !llvm.struct<(i32, struct<(i32)>, f32)>
    %5 = "some.op"() : () -> !llvm.struct<packed ()>
    %6 = "some.op"() : () -> !llvm.struct<packed (i32)>
    %7 = "some.op"() : () -> !llvm.struct<packed (f32, i32)>
    %8 = "some.op"() : () -> !llvm.struct<packed (f32, i32)>
    %9 = "some.op"() : () -> !llvm.struct<packed (struct<(i32)>)>
    %10 = "some.op"() : () -> !llvm.struct<packed (i32, struct<(i32, i1)>, f32)>
    %11 = "some.op"() : () -> !llvm.struct<(struct<packed (i32)>)>
    %12 = "some.op"() : () -> !llvm.struct<packed (struct<(i32)>)>
    return
  }
  func.func @identified_struct() {
    %0 = "some.op"() : () -> !llvm.struct<"empty", ()>
    %1 = "some.op"() : () -> !llvm.struct<"opaque", opaque>
    %2 = "some.op"() : () -> !llvm.struct<"long", (i32, struct<(i32, i1)>, f32, ptr)>
    %3 = "some.op"() : () -> !llvm.struct<"unpacked", (i32)>
    %4 = "some.op"() : () -> !llvm.struct<"packed", packed (i32)>
    %5 = "some.op"() : () -> !llvm.struct<"name with spaces and !^$@$#", packed (i32)>
    %6 = "some.op"() : () -> !llvm.struct<"outer", (struct<"nested", ()>)>
    %7 = "some.op"() : () -> !llvm.struct<"referring-another", (ptr)>
    %8 = "some.op"() : () -> !llvm.struct<"struct-of-arrays", (array<10 x i32>)>
    %9 = "some.op"() : () -> !llvm.array<10 x struct<"array-of-structs", (i32)>>
    return
  }
  func.func @verbose() {
    %0 = "some.op"() : () -> !llvm.struct<(i64, struct<(f32)>)>
    return
  }
}

// -----
module {
  llvm.func @aliases() {
    %0 = "some.op"() : () -> !llvm.struct<(i32, f32, struct<(i64)>)>
    llvm.return
  }
}

// -----
module {
  llvm.func @ext_target() {
    %0 = "some.op"() : () -> !llvm.target<"target1", i32, 1>
    %1 = "some.op"() : () -> !llvm.target<"target2">
    %2 = "some.op"() : () -> !llvm.target<"target3", i32, i64, f64>
    %3 = "some.op"() : () -> !llvm.target<"target4", 1, 0, 42>
    %4 = "some.op"() : () -> !llvm.target<"target5", i32, f64, 0, 5>
    llvm.return
  }
}

