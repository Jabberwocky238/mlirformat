module attributes {omp.is_target_device = true} {
  llvm.func @foo(i32)
  llvm.func @omp_target_teams_shared_simple(%arg0: i32) attributes {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} {
    omp.teams {
      llvm.call @foo(%arg0) : (i32) -> ()
      omp.terminator
    }
    llvm.return
  }
}

