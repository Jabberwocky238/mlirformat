module {
  llvm.func @foo()
  llvm.func @omp_teams_simple() {
    omp.teams {
      llvm.call @foo() : () -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @omp_teams_func_attrs() attributes {target_cpu = "x86-64", target_features = #llvm.target_features<["+mmx", "+sse"]>} {
    omp.teams {
      llvm.call @foo() : () -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(i32)
  llvm.func @omp_teams_shared_simple(%arg0: i32) {
    omp.teams {
      llvm.call @foo(%arg0) : (i32) -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @my_alloca_fn() -> !llvm.ptr
  llvm.func @foo(i32, f32, !llvm.ptr, f128, !llvm.ptr, i32)
  llvm.func @bar()
  llvm.func @omp_teams_branching_shared(%arg0: i1, %arg1: i32, %arg2: f32, %arg3: !llvm.ptr, %arg4: f128) {
    %0 = llvm.call @my_alloca_fn() : () -> !llvm.ptr
    %1 = llvm.load %0 : !llvm.ptr -> i32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    omp.teams {
      llvm.cond_br %arg0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      llvm.call @foo(%arg1, %arg2, %arg3, %arg4, %0, %1) : (i32, f32, !llvm.ptr, f128, !llvm.ptr, i32) -> ()
      llvm.br ^bb3
    ^bb2:  // pred: ^bb0
      llvm.br ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      omp.terminator
    }
    llvm.call @bar() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @beforeTeams()
  llvm.func @duringTeams()
  llvm.func @afterTeams()
  llvm.func @omp_teams_thread_limit(%arg0: i32) {
    llvm.call @beforeTeams() : () -> ()
    omp.teams thread_limit(%arg0 : i32) {
      llvm.call @duringTeams() : () -> ()
      omp.terminator
    }
    llvm.call @afterTeams() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @beforeTeams()
  llvm.func @duringTeams()
  llvm.func @afterTeams()
  llvm.func @omp_teams_num_teams_upper(%arg0: i32) {
    llvm.call @beforeTeams() : () -> ()
    omp.teams num_teams( to %arg0 : i32) {
      llvm.call @duringTeams() : () -> ()
      omp.terminator
    }
    llvm.call @afterTeams() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @beforeTeams()
  llvm.func @duringTeams()
  llvm.func @afterTeams()
  llvm.func @omp_teams_num_teams_lower_and_upper(%arg0: i32, %arg1: i32) {
    llvm.call @beforeTeams() : () -> ()
    omp.teams num_teams(%arg0 : i32 to %arg1 : i32) {
      llvm.call @duringTeams() : () -> ()
      omp.terminator
    }
    llvm.call @afterTeams() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @beforeTeams()
  llvm.func @duringTeams()
  llvm.func @afterTeams()
  llvm.func @omp_teams_num_teams_and_thread_limit(%arg0: i32, %arg1: i32, %arg2: i32) {
    llvm.call @beforeTeams() : () -> ()
    omp.teams num_teams(%arg0 : i32 to %arg1 : i32) thread_limit(%arg2 : i32) {
      llvm.call @duringTeams() : () -> ()
      omp.terminator
    }
    llvm.call @afterTeams() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @beforeTeams()
  llvm.func @duringTeams()
  llvm.func @afterTeams()
  llvm.func @teams_if(%arg0: i1) {
    llvm.call @beforeTeams() : () -> ()
    omp.teams if(%arg0) {
      llvm.call @duringTeams() : () -> ()
      omp.terminator
    }
    llvm.call @afterTeams() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @beforeTeams()
  llvm.func @duringTeams()
  llvm.func @afterTeams()
  llvm.func @teams_if_with_num_teams(%arg0: i1, %arg1: i32, %arg2: i32, %arg3: i32) {
    llvm.call @beforeTeams() : () -> ()
    omp.teams if(%arg0) num_teams(%arg1 : i32 to %arg2 : i32) thread_limit(%arg3 : i32) {
      llvm.call @duringTeams() : () -> ()
      omp.terminator
    }
    llvm.call @afterTeams() : () -> ()
    llvm.return
  }
}

