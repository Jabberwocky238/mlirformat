module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.endianness" = "big", "dlti.alloca_memory_space" = 4 : ui32, "dlti.stack_alignment" = 128 : i32, "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.function_pointer_alignment" = #dlti.function_pointer_alignment<32, function_dependent = true>, index = 64 : i64, i64 = dense<[64, 128]> : vector<2xi64>, f80 = dense<[128, 256]> : vector<2xi64>, !llvm.ptr = dense<[32, 64, 128]> : vector<3xi64>, !llvm.ptr<1> = dense<[32, 32, 32, 16]> : vector<4xi64>>} {
  llvm.func @foo() {
    llvm.return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.endianness" = "little", "dlti.alloca_memory_space" = 0 : ui32, "dlti.stack_alignment" = 0 : i32, "dlti.function_pointer_alignment" = #dlti.function_pointer_alignment<64, function_dependent = false>>} {
  llvm.func @bar() {
    llvm.return
  }
}

