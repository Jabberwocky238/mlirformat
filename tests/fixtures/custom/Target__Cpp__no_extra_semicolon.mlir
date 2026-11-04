module {
  func.func @no_extra_semicolon(%arg0: i1) {
    emitc.if %arg0 {
      include "myheader.h"
      if %arg0 {
      }
      verbatim "return;"
    }
    return
  }
}

