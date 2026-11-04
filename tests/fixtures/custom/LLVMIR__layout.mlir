module {
  func.func @no_spec() {
    %0 = "test.data_layout_query"() : () -> !llvm.ptr
    %1 = "test.data_layout_query"() : () -> !llvm.ptr<3>
    %2 = "test.data_layout_query"() : () -> !llvm.ptr<5>
    return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<[32, 32, 64]> : vector<3xi64>, !llvm.ptr<5> = dense<64> : vector<3xi64>, !llvm.ptr<4> = dense<[32, 64, 64, 24]> : vector<4xi64>, "dlti.endianness" = "little", "dlti.default_memory_space" = 7 : ui64, "dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 2 : ui64, "dlti.program_memory_space" = 3 : ui64, "dlti.stack_alignment" = 128 : i64, "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 32, 64>, "dlti.function_pointer_alignment" = "#dlti.function_pointer_alignment<32, function_dependent = true>">} {
  func.func @spec() {
    %0 = "test.data_layout_query"() : () -> !llvm.ptr
    %1 = "test.data_layout_query"() : () -> !llvm.ptr<3>
    %2 = "test.data_layout_query"() : () -> !llvm.ptr<5>
    %3 = "test.data_layout_query"() : () -> !llvm.ptr<4>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @no_spec() {
    %0 = "test.data_layout_query"() : () -> !llvm.struct<(i32)>
    %1 = "test.data_layout_query"() : () -> !llvm.struct<(i32, f64)>
    %2 = "test.data_layout_query"() : () -> !llvm.struct<(f64, i32)>
    %3 = "test.data_layout_query"() : () -> !llvm.struct<packed (f64, i32)>
    %4 = "test.data_layout_query"() : () -> !llvm.struct<()>
    return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.struct<()> = dense<32> : vector<2xi64>>} {
  func.func @spec() {
    %0 = "test.data_layout_query"() : () -> !llvm.struct<(i16)>
    %1 = "test.data_layout_query"() : () -> !llvm.struct<(i32, f64)>
    %2 = "test.data_layout_query"() : () -> !llvm.struct<packed (i16, i16)>
    %3 = "test.data_layout_query"() : () -> !llvm.struct<()>
    return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.struct<()> = dense<32> : vector<1xi64>>} {
  func.func @spec_without_preferred() {
    %0 = "test.data_layout_query"() : () -> !llvm.struct<(i16)>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @arrays() {
    %0 = "test.data_layout_query"() : () -> !llvm.array<2 x i32>
    %1 = "test.data_layout_query"() : () -> !llvm.array<0 x f64>
    %2 = "test.data_layout_query"() : () -> !llvm.array<1 x i64>
    return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.struct<()> = dense<64> : vector<1xi64>>} {
  func.func @overaligned() {
    %0 = "test.data_layout_query"() : () -> !llvm.array<2 x struct<(i8)>>
    return
  }
}

// -----
