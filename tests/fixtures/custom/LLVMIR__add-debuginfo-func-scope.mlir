module {
  llvm.func @func_no_debug() {
    llvm.return
  }
}

// -----
module {
  llvm.func @func_decl_no_debug()
}

// -----
module {
  llvm.func @func_with_debug() {
    llvm.return
  }
}

// -----
module {
  llvm.func @propagate_compile_unit() {
    llvm.return
  }
}

// -----
module @multiple_funcs {
  llvm.func @func0() {
    llvm.return
  }
  llvm.func @func1() {
    llvm.return
  }
}

// -----
module {
  llvm.func @func_inlined() {
    llvm.return
  }
}

// -----
module {
  llvm.func @func_name_with_child()
}

// -----
module {
  llvm.func @func_fusion()
}

// -----
module {
  llvm.func @func_callsiteloc()
}

// -----
module {
  llvm.func @func_cross_file_op() {
    llvm.return
  }
}

