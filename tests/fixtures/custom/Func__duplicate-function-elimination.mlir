module {
  func.func @identity(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @also_identity(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @yet_another_identity(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @user(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = call @identity(%arg0) : (tensor<f32>) -> tensor<f32>
    %1 = call @also_identity(%0) : (tensor<f32>) -> tensor<f32>
    %2 = call @yet_another_identity(%1) : (tensor<f32>) -> tensor<f32>
    return %2 : tensor<f32>
  }
}

// -----
module {
  func.func @add_lr(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.addf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @also_add_lr(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.addf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @add_rl(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.addf %arg1, %arg0 : f32
    return %0 : f32
  }
  func.func @also_add_rl(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.addf %arg1, %arg0 : f32
    return %0 : f32
  }
  func.func @user(%arg0: f32, %arg1: f32) -> f32 {
    %0 = call @add_lr(%arg0, %arg1) : (f32, f32) -> f32
    %1 = call @also_add_lr(%arg0, %arg1) : (f32, f32) -> f32
    %2 = call @add_rl(%0, %1) : (f32, f32) -> f32
    %3 = call @also_add_rl(%arg0, %2) : (f32, f32) -> f32
    return %3 : f32
  }
}

// -----
module {
  func.func @ite(%arg0: i1, %arg1: f32, %arg2: f32) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      scf.yield %arg1 : f32
    } else {
      scf.yield %arg2 : f32
    }
    return %0 : f32
  }
  func.func @also_ite(%arg0: i1, %arg1: f32, %arg2: f32) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      scf.yield %arg1 : f32
    } else {
      scf.yield %arg2 : f32
    }
    return %0 : f32
  }
  func.func @reverse_ite(%arg0: i1, %arg1: f32, %arg2: f32) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      scf.yield %arg2 : f32
    } else {
      scf.yield %arg1 : f32
    }
    return %0 : f32
  }
  func.func @user(%arg0: i1, %arg1: f32, %arg2: f32) -> f32 {
    %0 = call @also_ite(%arg0, %arg1, %arg2) : (i1, f32, f32) -> f32
    %1 = call @ite(%arg0, %arg1, %arg2) : (i1, f32, f32) -> f32
    %2 = call @reverse_ite(%arg0, %0, %1) : (i1, f32, f32) -> f32
    return %2 : f32
  }
}

// -----
module {
  func.func @deep_tree(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: f32, %arg5: f32) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      %1 = scf.if %arg1 -> (f32) {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      } else {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    } else {
      %1 = scf.if %arg1 -> (f32) {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      } else {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @also_deep_tree(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: f32, %arg5: f32) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      %1 = scf.if %arg1 -> (f32) {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      } else {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    } else {
      %1 = scf.if %arg1 -> (f32) {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      } else {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @reverse_deep_tree(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: f32, %arg5: f32) -> f32 {
    %0 = scf.if %arg0 -> (f32) {
      %1 = scf.if %arg1 -> (f32) {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      } else {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    } else {
      %1 = scf.if %arg1 -> (f32) {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      } else {
        %2 = scf.if %arg2 -> (f32) {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg5 : f32
          } else {
            scf.yield %arg4 : f32
          }
          scf.yield %3 : f32
        } else {
          %3 = scf.if %arg3 -> (f32) {
            scf.yield %arg4 : f32
          } else {
            scf.yield %arg5 : f32
          }
          scf.yield %3 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @user(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: f32, %arg5: f32) -> (f32, f32, f32) {
    %0 = call @deep_tree(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (i1, i1, i1, i1, f32, f32) -> f32
    %1 = call @also_deep_tree(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (i1, i1, i1, i1, f32, f32) -> f32
    %2 = call @reverse_deep_tree(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (i1, i1, i1, i1, f32, f32) -> f32
    return %0, %1, %2 : f32, f32, f32
  }
}

// -----
module {
  func.func private @func_declaration(i32, i32) -> i32
  func.func private @func_declaration1(i32, i32) -> i32
  func.func @user(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %0 = call @func_declaration(%arg0, %arg1) : (i32, i32) -> i32
    %1 = call @func_declaration1(%arg0, %arg1) : (i32, i32) -> i32
    return %0, %1 : i32, i32
  }
}

// -----
module {
  func.func @identity(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @also_identity(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @yet_another_identity(%arg0: tensor<f32>) -> tensor<f32> {
    return %arg0 : tensor<f32>
  }
  func.func @user(%arg0: tensor<f32>) -> tensor<f32> {
    %f = constant @identity : (tensor<f32>) -> tensor<f32>
    %0 = call_indirect %f(%arg0) : (tensor<f32>) -> tensor<f32>
    %f_0 = constant @also_identity : (tensor<f32>) -> tensor<f32>
    %1 = call_indirect %f_0(%0) : (tensor<f32>) -> tensor<f32>
    %2 = call @yet_another_identity(%1) : (tensor<f32>) -> tensor<f32>
    return %2 : tensor<f32>
  }
}

