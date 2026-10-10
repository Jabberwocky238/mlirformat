module {
  llvm.func @zext_basic() -> i64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.zext %0 : i32 to i64
    llvm.return %1 : i64
  }
  llvm.func @zext_neg() -> i64 {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = llvm.zext %0 : i32 to i64
    llvm.return %1 : i64
  }
}

// -----
module {
  llvm.func @shl_basic() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.shl %0, %1 : i32
    llvm.return %2 : i32
  }
  llvm.func @shl_multiple() -> i32 {
    %0 = llvm.mlir.constant(45 : i32) : i32
    %1 = llvm.mlir.constant(7 : i32) : i32
    %2 = llvm.shl %0, %1 : i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @or_basic() -> i32 {
    %0 = llvm.mlir.constant(5 : i32) : i32
    %1 = llvm.mlir.constant(9 : i32) : i32
    %2 = llvm.or %0, %1 : i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @addressof() {
    %0 = llvm.mlir.addressof @foo : !llvm.ptr
    %1 = llvm.mlir.addressof @foo : !llvm.ptr
    llvm.call @bar(%0, %1) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.mlir.global external constant @foo() {addr_space = 0 : i32} : i32
  llvm.func @bar(!llvm.ptr, !llvm.ptr)
}

// -----
module {
  llvm.func @addressof_select(%arg0: i1) -> !llvm.ptr {
    %0 = llvm.mlir.addressof @foo : !llvm.ptr
    %1 = llvm.mlir.addressof @foo : !llvm.ptr
    %2 = arith.select %arg0, %0, %1 : !llvm.ptr
    llvm.return %2 : !llvm.ptr
  }
  llvm.mlir.global external constant @foo() {addr_space = 0 : i32} : i32
  llvm.func @bar(!llvm.ptr, !llvm.ptr)
}

// -----
module {
  llvm.func @addressof_blocks(%arg0: i1) -> !llvm.ptr {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = llvm.mlir.addressof @foo : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  ^bb2:  // pred: ^bb0
    %1 = llvm.mlir.addressof @foo : !llvm.ptr
    llvm.return %1 : !llvm.ptr
  }
  llvm.mlir.global external constant @foo() {addr_space = 0 : i32} : i32
}

// -----
module {
  llvm.func @undef() {
    %0 = llvm.mlir.undef : i32
    %1 = llvm.mlir.undef : i32
    llvm.call @foo(%0, %1) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @foo(i32, i32)
}

// -----
module {
  llvm.func @poison() {
    %0 = llvm.mlir.poison : i32
    %1 = llvm.mlir.poison : i32
    llvm.call @foo(%0, %1) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @foo(i32, i32)
}

// -----
module {
  llvm.func @foo(!llvm.ptr, !llvm.ptr)
  llvm.func @null_pointer() {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.zero : !llvm.ptr
    llvm.call @foo(%0, %1) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @zero_integer() -> i64 {
    %0 = llvm.mlir.zero : i32
    %1 = llvm.zext %0 : i32 to i64
    llvm.return %1 : i64
  }
}

// -----
module {
  llvm.func @null_pointer_select(%arg0: i1) -> !llvm.ptr {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.zero : !llvm.ptr
    %2 = arith.select %arg0, %0, %1 : !llvm.ptr
    llvm.return %2 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @malloc(i64) -> !llvm.ptr
  func.func @insert_op(%arg0: index, %arg1: memref<13x13xi64>, %arg2: index) {
    %cst = arith.constant dense<1526248407> : vector<1xi64>
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = vector.insert %0, %cst [0] : i64 into vector<1xi64>
    vector.print %1 : vector<1xi64>
    return
  }
}

// -----
module {
  llvm.func @dso_local_equivalent_select(%arg0: i1) -> !llvm.ptr {
    %0 = llvm.dso_local_equivalent @yay : !llvm.ptr
    %1 = llvm.dso_local_equivalent @yay : !llvm.ptr
    %2 = arith.select %arg0, %0, %1 : !llvm.ptr
    llvm.return %2 : !llvm.ptr
  }
  llvm.func @yay()
}

// -----
module {
  llvm.func @blockaddress_select(%arg0: i1) -> !llvm.ptr {
    %0 = llvm.blockaddress <function = @blockaddress_select, tag = <id = 1>> : !llvm.ptr
    %1 = llvm.blockaddress <function = @blockaddress_select, tag = <id = 1>> : !llvm.ptr
    %2 = arith.select %arg0, %0, %1 : !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 1>
    llvm.return %1 : !llvm.ptr
  }
}

