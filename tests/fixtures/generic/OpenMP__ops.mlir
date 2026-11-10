"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "omp_barrier"}> ({
    "omp.barrier"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_master"}> ({
    "omp.master"() ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_masked"}> ({
  ^bb0(%arg661: i32):
    "omp.masked"(%arg661) ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.masked"() ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_taskwait"}> ({
    "omp.taskwait"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_taskyield"}> ({
    "omp.taskyield"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "omp_flush"}> ({
  ^bb0(%arg660: memref<i32>):
    "omp.flush"() : () -> ()
    "omp.flush"(%arg660) : (memref<i32>) -> ()
    "omp.flush"(%arg660, %arg660) : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_terminator"}> ({
    "omp.terminator"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i1, i32, index) -> (), sym_name = "omp_parallel"}> ({
  ^bb0(%arg654: memref<i32>, %arg655: i1, %arg656: i32, %arg657: index):
    "omp.parallel"(%arg654, %arg654, %arg655, %arg656) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0>, proc_bind_kind = #omp<procbindkind spread>}> ({
      "omp.parallel"(%arg654, %arg654, %arg656) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : (memref<i32>, memref<i32>, i32) -> ()
      "omp.barrier"() : () -> ()
      "omp.parallel"(%arg654, %arg654, %arg655) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : (memref<i32>, memref<i32>, i1) -> ()
      "omp.parallel"(%arg655, %arg656) <{operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : (i1, i32) -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>, i1, i32) -> ()
    "omp.parallel"(%arg654, %arg654) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%arg657, %arg657, %arg657) ({
          ^bb0(%arg659: index):
            "omp.yield"() : () -> ()
          }) : (index, index, index) -> ()
        }) {omp.composite} : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.composite} : () -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%arg657, %arg657, %arg657) ({
            ^bb0(%arg658: index):
              "omp.yield"() : () -> ()
            }) : (index, index, index) -> ()
          }) {omp.composite} : () -> ()
        }) {omp.composite} : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.composite} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i1, i32, si32) -> (), sym_name = "omp_parallel_pretty"}> ({
  ^bb0(%arg650: memref<i32>, %arg651: i1, %arg652: i32, %arg653: si32):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.parallel"(%arg652) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    %300 = "arith.constant"() <{value = 2 : index}> : () -> index
    "omp.parallel"(%300) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (index) -> ()
    %301 = "arith.constant"() <{value = 4 : i64}> : () -> i64
    "omp.parallel"(%301) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i64) -> ()
    "omp.parallel"(%301, %301) <{operandSegmentSizes = array<i32: 0, 0, 0, 2, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i64, i64) -> ()
    %302 = "arith.constant"() <{value = 8 : i16}> : () -> i16
    "omp.parallel"(%arg652, %301, %302) <{operandSegmentSizes = array<i32: 0, 0, 0, 3, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i64, i16) -> ()
    "omp.parallel"(%arg650, %arg650) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.parallel"(%arg651) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : (i1) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.parallel"(%arg651, %arg652) <{operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0>, proc_bind_kind = #omp<procbindkind close>}> ({
      "omp.terminator"() : () -> ()
    }) : (i1, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_loop_nest"}> ({
  ^bb0(%arg642: index, %arg643: index, %arg644: index):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg642, %arg643, %arg644) ({
      ^bb0(%arg649: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg642, %arg643, %arg644) <{loop_inclusive}> ({
      ^bb0(%arg648: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg642, %arg642, %arg643, %arg643, %arg644, %arg644) ({
      ^bb0(%arg646: index, %arg647: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg642, %arg643, %arg644) ({
      ^bb0(%arg645: index):
        "test.op1"(%arg642) : (index) -> ()
        "test.op2"() : () -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_loop_nest_pretty"}> ({
  ^bb0(%arg634: index, %arg635: index, %arg636: index):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg634, %arg635, %arg636) ({
      ^bb0(%arg641: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg634, %arg635, %arg636) <{loop_inclusive}> ({
      ^bb0(%arg640: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg634, %arg634, %arg635, %arg635, %arg636, %arg636) ({
      ^bb0(%arg638: index, %arg639: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index, index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg634, %arg635, %arg636) ({
      ^bb0(%arg637: index):
        "test.op1"(%arg634) : (index) -> ()
        "test.op2"() : () -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<?xi32>, memref<?xi32>) -> (), sym_name = "omp_loop_nest_pretty_multi_block"}> ({
  ^bb0(%arg626: index, %arg627: index, %arg628: index, %arg629: memref<?xi32>, %arg630: memref<?xi32>):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg626, %arg627, %arg628) ({
      ^bb0(%arg633: index):
        %298 = "test.payload"(%arg633) : (index) -> i32
        "cf.br"(%298)[^bb1] : (i32) -> ()
      ^bb1(%299: i32):  // pred: ^bb0
        "memref.store"(%299, %arg629, %arg633) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg626, %arg627, %arg628) ({
      ^bb0(%arg632: index):
        %294 = "test.condition"(%arg632) : (index) -> i1
        %295 = "test.payload"(%arg632) : (index) -> i32
        "cf.cond_br"(%294, %295, %295)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i32) -> ()
      ^bb1(%296: i32):  // pred: ^bb0
        "memref.store"(%296, %arg629, %arg632) : (i32, memref<?xi32>, index) -> ()
        "cf.br"()[^bb3] : () -> ()
      ^bb2(%297: i32):  // pred: ^bb0
        "memref.store"(%297, %arg630, %arg632) : (i32, memref<?xi32>, index) -> ()
        "cf.br"()[^bb3] : () -> ()
      ^bb3:  // 2 preds: ^bb1, ^bb2
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg626, %arg627, %arg628) ({
      ^bb0(%arg631: index):
        %290 = "test.condition"(%arg631) : (index) -> i1
        %291 = "test.payload"(%arg631) : (index) -> i32
        "cf.cond_br"(%290, %291, %291)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i32) -> ()
      ^bb1(%292: i32):  // pred: ^bb0
        "memref.store"(%292, %arg629, %arg631) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      ^bb2(%293: i32):  // pred: ^bb0
        "memref.store"(%293, %arg630, %arg631) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i64, i64, i64, memref<?xi32>, memref<?xi64>) -> (), sym_name = "omp_loop_nest_pretty_non_index"}> ({
  ^bb0(%arg616: i32, %arg617: i32, %arg618: i32, %arg619: i64, %arg620: i64, %arg621: i64, %arg622: memref<?xi32>, %arg623: memref<?xi64>):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg616, %arg617, %arg618) ({
      ^bb0(%arg625: i32):
        %288 = "test.payload"(%arg625) : (i32) -> index
        "cf.br"(%288)[^bb1] : (index) -> ()
      ^bb1(%289: index):  // pred: ^bb0
        "memref.store"(%arg625, %arg622, %289) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg619, %arg620, %arg621) ({
      ^bb0(%arg624: i64):
        %286 = "test.payload"(%arg624) : (i64) -> index
        "cf.br"(%286)[^bb1] : (index) -> ()
      ^bb1(%287: index):  // pred: ^bb0
        "memref.store"(%arg624, %arg623, %287) : (i64, memref<?xi64>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, memref<?xi32>) -> (), sym_name = "omp_loop_nest_pretty_multiple"}> ({
  ^bb0(%arg607: i32, %arg608: i32, %arg609: i32, %arg610: i32, %arg611: i32, %arg612: i32, %arg613: memref<?xi32>):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg607, %arg610, %arg608, %arg611, %arg609, %arg612) ({
      ^bb0(%arg614: i32, %arg615: i32):
        %284 = "test.payload"(%arg614) : (i32) -> index
        %285 = "test.payload"(%arg615) : (i32) -> index
        "memref.store"(%arg614, %arg613, %284) : (i32, memref<?xi32>, index) -> ()
        "memref.store"(%arg615, %arg613, %285) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32, i32, i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, memref<?xi32>) -> (), sym_name = "omp_loop_nest_pretty_multiple_collapse"}> ({
  ^bb0(%arg598: i32, %arg599: i32, %arg600: i32, %arg601: i32, %arg602: i32, %arg603: i32, %arg604: memref<?xi32>):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg598, %arg601, %arg599, %arg602, %arg600, %arg603) <{collapse_num_loops = 2 : i64}> ({
      ^bb0(%arg605: i32, %arg606: i32):
        %282 = "test.payload"(%arg605) : (i32) -> index
        %283 = "test.payload"(%arg606) : (i32) -> index
        "memref.store"(%arg605, %arg604, %282) : (i32, memref<?xi32>, index) -> ()
        "memref.store"(%arg606, %arg604, %283) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32, i32, i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, memref<?xi32>) -> (), sym_name = "omp_loop_nest_pretty_multiple_tiles"}> ({
  ^bb0(%arg589: i32, %arg590: i32, %arg591: i32, %arg592: i32, %arg593: i32, %arg594: i32, %arg595: memref<?xi32>):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg589, %arg592, %arg590, %arg593, %arg591, %arg594) <{tile_sizes = array<i64: 5, 10>}> ({
      ^bb0(%arg596: i32, %arg597: i32):
        %280 = "test.payload"(%arg596) : (i32) -> index
        %281 = "test.payload"(%arg597) : (i32) -> index
        "memref.store"(%arg596, %arg595, %280) : (i32, memref<?xi32>, index) -> ()
        "memref.store"(%arg597, %arg595, %281) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32, i32, i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, i32, i32, memref<?xi32>) -> (), sym_name = "omp_loop_nest_pretty_multiple_collapse_tiles"}> ({
  ^bb0(%arg580: i32, %arg581: i32, %arg582: i32, %arg583: i32, %arg584: i32, %arg585: i32, %arg586: memref<?xi32>):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg580, %arg583, %arg581, %arg584, %arg582, %arg585) <{collapse_num_loops = 2 : i64, tile_sizes = array<i64: 5, 10>}> ({
      ^bb0(%arg587: i32, %arg588: i32):
        %278 = "test.payload"(%arg587) : (i32) -> index
        %279 = "test.payload"(%arg588) : (i32) -> index
        "memref.store"(%arg587, %arg586, %278) : (i32, memref<?xi32>, index) -> ()
        "memref.store"(%arg588, %arg586, %279) : (i32, memref<?xi32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32, i32, i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, i32, i32) -> (), sym_name = "omp_wsloop"}> ({
  ^bb0(%arg568: index, %arg569: index, %arg570: index, %arg571: memref<i32>, %arg572: i32, %arg573: i32):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 1 : i64}> ({
      "omp.loop_nest"(%arg568, %arg569, %arg570) ({
      ^bb0(%arg579: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"(%arg571, %arg572) <{linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg568, %arg569, %arg570) ({
      ^bb0(%arg578: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32) -> ()
    "omp.wsloop"(%arg571, %arg571, %arg572, %arg572) <{linear_var_types = [i32, i32], operandSegmentSizes = array<i32: 0, 0, 2, 2, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg568, %arg569, %arg570) ({
      ^bb0(%arg577: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i32>, i32, i32) -> ()
    "omp.wsloop"(%arg571, %arg572, %arg573) <{linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 1>, ordered = 2 : i64, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg568, %arg569, %arg570) ({
      ^bb0(%arg576: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32, i32) -> ()
    "omp.wsloop"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind auto>}> ({
      "omp.loop_nest"(%arg568, %arg569, %arg570) ({
      ^bb0(%arg575: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%arg568, %arg569, %arg570) ({
        ^bb0(%arg574: index):
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) {omp.composite} : () -> ()
    }) {omp.composite} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, i32, i32, i16) -> (), sym_name = "omp_wsloop_pretty"}> ({
  ^bb0(%arg549: index, %arg550: index, %arg551: index, %arg552: memref<i32>, %arg553: i32, %arg554: i32, %arg555: i16):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 2 : i64}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg567: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"(%arg552, %arg553) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg566: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32) -> ()
    "omp.wsloop"(%arg552, %arg552, %arg553, %arg553) <{linear_modifiers = [#omp<linear_modifier(val)>, #omp<linear_modifier(val)>], linear_var_types = [i32, i32], operandSegmentSizes = array<i32: 0, 0, 2, 2, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg565: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i32>, i32, i32) -> ()
    "omp.wsloop"(%arg552, %arg553, %arg554) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 1>, ordered = 2 : i64, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg564: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32, i32) -> ()
    "omp.wsloop"(%arg552, %arg553, %arg554) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 1>, ordered = 2 : i64, schedule_kind = #omp<schedulekind dynamic>, schedule_mod = #omp<sched_mod nonmonotonic>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg563: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32, i32) -> ()
    "omp.wsloop"(%arg552, %arg553, %arg555) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 1>, ordered = 2 : i64, schedule_kind = #omp<schedulekind dynamic>, schedule_mod = #omp<sched_mod monotonic>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg562: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32, i16) -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg561: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg560: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg559: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>, order_mod = #omp<order_mod reproducible>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg558: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>, order_mod = #omp<order_mod unconstrained>}> ({
      "omp.loop_nest"(%arg549, %arg550, %arg551) ({
      ^bb0(%arg557: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%arg549, %arg550, %arg551) ({
        ^bb0(%arg556: index):
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) {omp.composite} : () -> ()
    }) {omp.composite} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_simd"}> ({
  ^bb0(%arg545: index, %arg546: index, %arg547: index):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg545, %arg546, %arg547) ({
      ^bb0(%arg548: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i32>) -> (), sym_name = "omp_simd_aligned_list"}> ({
  ^bb0(%arg539: index, %arg540: index, %arg541: index, %arg542: memref<i32>, %arg543: memref<i32>):
    "omp.simd"(%arg542, %arg543) <{alignments = [32, 128], operandSegmentSizes = array<i32: 2, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg539, %arg540, %arg541) ({
      ^bb0(%arg544: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i32>) -> (), sym_name = "omp_simd_aligned_single"}> ({
  ^bb0(%arg533: index, %arg534: index, %arg535: index, %arg536: memref<i32>, %arg537: memref<i32>):
    "omp.simd"(%arg536) <{alignments = [32], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg533, %arg534, %arg535) ({
      ^bb0(%arg538: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i64>) -> (), sym_name = "omp_simd_nontemporal_list"}> ({
  ^bb0(%arg527: index, %arg528: index, %arg529: index, %arg530: memref<i32>, %arg531: memref<i64>):
    "omp.simd"(%arg530, %arg531) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>}> ({
      "omp.loop_nest"(%arg527, %arg528, %arg529) ({
      ^bb0(%arg532: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i64>) -> (), sym_name = "omp_simd_nontemporal_single"}> ({
  ^bb0(%arg521: index, %arg522: index, %arg523: index, %arg524: memref<i32>, %arg525: memref<i64>):
    "omp.simd"(%arg524) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>}> ({
      "omp.loop_nest"(%arg521, %arg522, %arg523) ({
      ^bb0(%arg526: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_simd_pretty"}> ({
  ^bb0(%arg517: index, %arg518: index, %arg519: index):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg517, %arg518, %arg519) ({
      ^bb0(%arg520: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i32>) -> (), sym_name = "omp_simd_pretty_aligned"}> ({
  ^bb0(%arg511: index, %arg512: index, %arg513: index, %arg514: memref<i32>, %arg515: memref<i32>):
    "omp.simd"(%arg514, %arg515) <{alignments = [32, 128], operandSegmentSizes = array<i32: 2, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg511, %arg512, %arg513) ({
      ^bb0(%arg516: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "omp_simd_pretty_if"}> ({
  ^bb0(%arg506: index, %arg507: index, %arg508: index, %arg509: i1):
    "omp.simd"(%arg509) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg506, %arg507, %arg508) ({
      ^bb0(%arg510: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i32>) -> (), sym_name = "omp_simd_pretty_nontemporal"}> ({
  ^bb0(%arg500: index, %arg501: index, %arg502: index, %arg503: memref<i32>, %arg504: memref<i32>):
    "omp.simd"(%arg503, %arg504) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0, 0>}> ({
      "omp.loop_nest"(%arg500, %arg501, %arg502) ({
      ^bb0(%arg505: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_simd_pretty_order"}> ({
  ^bb0(%arg494: index, %arg495: index, %arg496: index):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>}> ({
      "omp.loop_nest"(%arg494, %arg495, %arg496) ({
      ^bb0(%arg499: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>, order_mod = #omp<order_mod reproducible>}> ({
      "omp.loop_nest"(%arg494, %arg495, %arg496) ({
      ^bb0(%arg498: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>, order_mod = #omp<order_mod unconstrained>}> ({
      "omp.loop_nest"(%arg494, %arg495, %arg496) ({
      ^bb0(%arg497: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, i32) -> (), sym_name = "omp_simd_linear_val"}> ({
  ^bb0(%arg488: index, %arg489: index, %arg490: index, %arg491: memref<i32>, %arg492: i32):
    "omp.simd"(%arg491, %arg492) <{linear_modifiers = [#omp<linear_modifier(val)>], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg488, %arg489, %arg490) ({
      ^bb0(%arg493: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<i32>, memref<i32>, i32, i32) -> (), sym_name = "omp_simd_linear_val_multiple"}> ({
  ^bb0(%arg480: index, %arg481: index, %arg482: index, %arg483: memref<i32>, %arg484: memref<i32>, %arg485: i32, %arg486: i32):
    "omp.simd"(%arg483, %arg484, %arg485, %arg486) <{linear_modifiers = [#omp<linear_modifier(val)>, #omp<linear_modifier(val)>], linear_var_types = [i32, i32], operandSegmentSizes = array<i32: 0, 0, 2, 2, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg480, %arg481, %arg482) ({
      ^bb0(%arg487: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<i32>, memref<i32>, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_simd_pretty_simdlen"}> ({
  ^bb0(%arg476: index, %arg477: index, %arg478: index):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, simdlen = 2 : i64}> ({
      "omp.loop_nest"(%arg476, %arg477, %arg478) ({
      ^bb0(%arg479: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_simd_pretty_safelen"}> ({
  ^bb0(%arg472: index, %arg473: index, %arg474: index):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, safelen = 2 : i64}> ({
      "omp.loop_nest"(%arg472, %arg473, %arg474) ({
      ^bb0(%arg475: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>, i32) -> (), sym_name = "omp_distribute"}> ({
  ^bb0(%arg460: i32, %arg461: memref<i32>, %arg462: i32):
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg471: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg470: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.distribute"() <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg469: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.distribute"(%arg460) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg468: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32) -> ()
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>, order = #omp<orderkind concurrent>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg467: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>, order = #omp<orderkind concurrent>, order_mod = #omp<order_mod reproducible>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg466: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>, order = #omp<orderkind concurrent>, order_mod = #omp<order_mod unconstrained>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg465: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.distribute"(%arg461, %arg461) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>}> ({
      "omp.loop_nest"(%arg462, %arg462, %arg462) ({
      ^bb0(%arg464: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%arg462, %arg462, %arg462) ({
        ^bb0(%arg463: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) {omp.composite} : () -> ()
    }) {omp.composite} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, si32, i32, memref<i32>, memref<?xi32>, memref<?xi32>, memref<?xi32>, i32) -> (), sym_name = "omp_target"}> ({
  ^bb0(%arg443: i1, %arg444: si32, %arg445: i32, %arg446: memref<i32>, %arg447: memref<?xi32>, %arg448: memref<?xi32>, %arg449: memref<?xi32>, %arg450: i32):
    "omp.target"(%arg444, %arg443, %arg445) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (si32, i1, i32) -> ()
    %273 = "omp.map.info"(%arg447) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %274 = "omp.map.info"(%arg448) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %275 = "omp.map.info"(%arg449) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target"(%273, %arg446, %274, %275) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 2, 0, 0, 0>}> ({
    ^bb0(%arg457: memref<?xi32>, %arg458: memref<?xi32>, %arg459: memref<?xi32>):
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>, memref<i32>, memref<?xi32>, memref<?xi32>) -> ()
    %276 = "omp.map.info"(%arg448) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %277 = "omp.map.info"(%arg449) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target"(%276, %277) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg455: memref<?xi32>, %arg456: memref<?xi32>):
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>, memref<?xi32>) -> ()
    "omp.target"() <{kernel_type = #omp<kernel_type(bare)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "omp.target"(%arg450) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg453: i32):
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%arg453, %arg453, %arg453) ({
          ^bb0(%arg454: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    "omp.target"(%arg450) <{kernel_type = #omp<kernel_type(spmd_no_loop)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg451: i32):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%arg451, %arg451, %arg451) ({
              ^bb0(%arg452: i32):
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, si32, memref<i32>, memref<?xi32>, memref<?xi32>, memref<?xi32>) -> (), sym_name = "omp_target_data"}> ({
  ^bb0(%arg435: i1, %arg436: si32, %arg437: memref<i32>, %arg438: memref<?xi32>, %arg439: memref<?xi32>, %arg440: memref<?xi32>):
    %264 = "omp.map.info"(%arg439) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target_data"(%arg436, %arg435, %264) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0>}> ({
    }) : (si32, i1, memref<?xi32>) -> ()
    %265 = "omp.map.info"(%arg439) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|close|present>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %266 = "omp.map.info"(%arg438) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags return_param>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %267 = "omp.map.info"(%arg437) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags return_param>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<i32>}> : (memref<i32>) -> memref<i32>
    "omp.target_data"(%265, %266, %267) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 1, 1>}> ({
    ^bb0(%arg441: memref<?xi32>, %arg442: memref<i32>):
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>, memref<?xi32>, memref<i32>) -> ()
    %268 = "omp.map.info"(%arg439) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %269 = "omp.map.info"(%arg440) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target_data"(%268, %269) <{operandSegmentSizes = array<i32: 0, 0, 2, 0, 0, 0>}> ({
    }) : (memref<?xi32>, memref<?xi32>) -> ()
    %270 = "omp.map.info"(%arg439) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target_enter_data"(%arg436, %arg435, %270) <{nowait, operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0>}> : (si32, i1, memref<?xi32>) -> ()
    %271 = "omp.map.info"(%arg440) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target_exit_data"(%arg436, %arg435, %271) <{nowait, operandSegmentSizes = array<i32: 0, 0, 1, 1, 1, 0>}> : (si32, i1, memref<?xi32>) -> ()
    %272 = "omp.map.info"(%arg439) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|ompx_hold>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target_data"(%272) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, si32, i32) -> (), sym_name = "omp_target_pretty"}> ({
  ^bb0(%arg432: i1, %arg433: si32, %arg434: i32):
    "omp.target"(%arg433, %arg432) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (si32, i1) -> ()
    "omp.target"(%arg433, %arg432, %arg434) <{kernel_type = #omp<kernel_type(generic)>, nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (si32, i1, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg431: f32):
    %263 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%263) : (f32) -> ()
  }, {
  ^bb0(%arg429: f32, %arg430: f32):
    %262 = "arith.addf"(%arg429, %arg430) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%262) : (f32) -> ()
  }, {
  ^bb0(%arg427: !llvm.ptr, %arg428: !llvm.ptr):
    %260 = "llvm.load"(%arg428) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %261 = "llvm.atomicrmw"(%arg427, %260) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  ^bb0(%arg426: f32):
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
  "omp.declare_mapper"() <{sym_name = "my_mapper", type = !llvm.struct<"my_type", (i32)>}> ({
  ^bb0(%arg425: !llvm.ptr):
    %259 = "omp.map.info"(%arg425) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<"my_type", (i32)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.declare_mapper.info"(%259) <{operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
  }) : () -> ()
  "omp.declare_mapper"() <{sym_name = "my_mapper_iterated", type = !llvm.struct<"my_iter_type", (i32)>}> ({
  ^bb0(%arg423: !llvm.ptr):
    %254 = "arith.constant"() <{value = 0 : index}> : () -> index
    %255 = "arith.constant"() <{value = 4 : index}> : () -> index
    %256 = "arith.constant"() <{value = 1 : index}> : () -> index
    %257 = "omp.iterator"(%254, %255, %256) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg424: index):
      %258 = "omp.map.info"(%arg423) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<"my_iter_type", (i32)>}> : (!llvm.ptr) -> !llvm.ptr
      "omp.yield"(%258) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.declare_mapper.info"(%257) <{operandSegmentSizes = array<i32: 0, 1>}> : (!omp.iterated<!llvm.ptr>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "wsloop_reduction"}> ({
  ^bb0(%arg418: index, %arg419: index, %arg420: index):
    %249 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %250 = "llvm.alloca"(%249) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.wsloop"(%250) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg421: !llvm.ptr):
      "omp.loop_nest"(%arg418, %arg419, %arg420) ({
      ^bb0(%arg422: index):
        %251 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %252 = "llvm.load"(%arg421) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %253 = "llvm.fadd"(%252, %251) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "llvm.store"(%253, %arg421) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "wsloop_inscan_reduction"}> ({
  ^bb0(%arg411: index, %arg412: index, %arg413: index):
    %247 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %248 = "llvm.alloca"(%247) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.wsloop"(%248) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(inscan)>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg416: !llvm.ptr):
      "omp.loop_nest"(%arg411, %arg412, %arg413) ({
      ^bb0(%arg417: index):
        "omp.scan"(%arg416) <{operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (!llvm.ptr) -> ()
    "omp.wsloop"(%248) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(inscan)>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg414: !llvm.ptr):
      "omp.loop_nest"(%arg411, %arg412, %arg413) ({
      ^bb0(%arg415: index):
        "omp.scan"(%arg414) <{operandSegmentSizes = array<i32: 0, 1>}> : (!llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "wsloop_reduction_byref"}> ({
  ^bb0(%arg406: index, %arg407: index, %arg408: index):
    %242 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %243 = "llvm.alloca"(%242) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.wsloop"(%243) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg409: !llvm.ptr):
      "omp.loop_nest"(%arg406, %arg407, %arg408) ({
      ^bb0(%arg410: index):
        %244 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %245 = "llvm.load"(%arg409) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %246 = "llvm.fadd"(%245, %244) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "llvm.store"(%246, %arg409) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_reduction"}> ({
    %237 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %238 = "llvm.alloca"(%237) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"(%238) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg405: !llvm.ptr):
      %239 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %240 = "llvm.load"(%arg405) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %241 = "llvm.fadd"(%239, %240) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "llvm.store"(%241, %arg405) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_reduction_byref"}> ({
    %232 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %233 = "llvm.alloca"(%232) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"(%233) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: true>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg404: !llvm.ptr):
      %234 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %235 = "llvm.load"(%arg404) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %236 = "llvm.fadd"(%234, %235) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "llvm.store"(%236, %arg404) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "parallel_wsloop_reduction"}> ({
  ^bb0(%arg399: index, %arg400: index, %arg401: index):
    %227 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %228 = "llvm.alloca"(%227) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%228) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
      ^bb0(%arg402: !llvm.ptr):
        "omp.loop_nest"(%arg399, %arg400, %arg401) ({
        ^bb0(%arg403: index):
          %229 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %230 = "llvm.load"(%arg402) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %231 = "llvm.fadd"(%229, %230) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i1, i32, memref<i32>, i64, i16, i32) -> (), sym_name = "omp_teams"}> ({
  ^bb0(%arg389: i32, %arg390: i32, %arg391: i1, %arg392: i32, %arg393: memref<i32>, %arg394: i64, %arg395: i16, %arg396: i32):
    "omp.target"() <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %226 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.teams"(%arg389, %arg390) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "omp.teams"(%arg390) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.teams"(%arg389, %arg390, %arg390) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i32, i32) -> ()
    "omp.teams"(%arg389, %arg394, %arg395) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 3, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i64, i16) -> ()
    "omp.teams"(%arg391) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "omp.teams"(%arg392) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.teams"(%arg389, %arg390) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "omp.teams"(%arg389, %arg394, %arg395) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 3>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32, i64, i16) -> ()
    %222 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %223 = "llvm.alloca"(%222) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.teams"(%223) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg398: !llvm.ptr):
      %225 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.teams"(%223) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg397: !llvm.ptr):
      %224 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.teams"(%arg393, %arg393) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.teams"(%arg396) <{dyn_groupprivate_access_group = #omp<access_group_modifier(cgroup)>, dyn_groupprivate_fallback = #omp<fallback_modifier(null)>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sections_reduction"}> ({
    %218 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %219 = "llvm.alloca"(%218) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.sections"(%219) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg386: !llvm.ptr):
      "omp.section"() ({
      ^bb0(%arg388: !llvm.ptr):
        %221 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
      ^bb0(%arg387: !llvm.ptr):
        %220 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sections_reduction_byref"}> ({
    %214 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %215 = "llvm.alloca"(%214) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.sections"(%215) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: true>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg383: !llvm.ptr):
      "omp.section"() ({
      ^bb0(%arg385: !llvm.ptr):
        %217 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
      ^bb0(%arg384: !llvm.ptr):
        %216 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add2_f32", type = f32}> ({
  }, {
  ^bb0(%arg382: f32):
    %213 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%213) : (f32) -> ()
  }, {
  ^bb0(%arg380: f32, %arg381: f32):
    %212 = "arith.addf"(%arg380, %arg381) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%212) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "wsloop_reduction2"}> ({
  ^bb0(%arg375: index, %arg376: index, %arg377: index):
    %207 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    "omp.wsloop"(%207) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add2_f32]}> ({
    ^bb0(%arg378: memref<1xf32>):
      "omp.loop_nest"(%arg375, %arg376, %arg377) ({
      ^bb0(%arg379: index):
        %208 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %209 = "arith.constant"() <{value = 0 : index}> : () -> index
        %210 = "memref.load"(%arg378, %209) : (memref<1xf32>, index) -> f32
        %211 = "llvm.fadd"(%208, %210) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "memref.store"(%211, %arg378, %209) : (f32, memref<1xf32>, index) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (memref<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_reduction2"}> ({
    %202 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    "omp.parallel"(%202) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add2_f32]}> ({
    ^bb0(%arg374: memref<1xf32>):
      %203 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %204 = "arith.constant"() <{value = 0 : index}> : () -> index
      %205 = "memref.load"(%arg374, %204) : (memref<1xf32>, index) -> f32
      %206 = "llvm.fadd"(%203, %205) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%206, %arg374, %204) : (f32, memref<1xf32>, index) -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "parallel_wsloop_reduction2"}> ({
  ^bb0(%arg369: index, %arg370: index, %arg371: index):
    %197 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %198 = "llvm.alloca"(%197) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%198) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add2_f32]}> ({
      ^bb0(%arg372: !llvm.ptr):
        "omp.loop_nest"(%arg369, %arg370, %arg371) ({
        ^bb0(%arg373: index):
          %199 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %200 = "llvm.load"(%arg372) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %201 = "llvm.fadd"(%199, %200) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sections_reduction2"}> ({
    %194 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    "omp.sections"(%194) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add2_f32]}> ({
    ^bb0(%arg366: memref<1xf32>):
      "omp.section"() ({
      ^bb0(%arg368: !llvm.ptr):
        %196 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
      ^bb0(%arg367: !llvm.ptr):
        %195 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "omp.critical.declare"() <{hint = 1 : i64, sym_name = "mutex1"}> : () -> ()
  "omp.critical.declare"() <{hint = 2 : i64, sym_name = "mutex2"}> : () -> ()
  "omp.critical.declare"() <{hint = 4 : i64, sym_name = "mutex3"}> : () -> ()
  "omp.critical.declare"() <{hint = 8 : i64, sym_name = "mutex4"}> : () -> ()
  "omp.critical.declare"() <{hint = 5 : i64, sym_name = "mutex5"}> : () -> ()
  "omp.critical.declare"() <{hint = 6 : i64, sym_name = "mutex6"}> : () -> ()
  "omp.critical.declare"() <{hint = 9 : i64, sym_name = "mutex7"}> : () -> ()
  "omp.critical.declare"() <{hint = 10 : i64, sym_name = "mutex8"}> : () -> ()
  "omp.critical.declare"() <{hint = 0 : i64, sym_name = "mutex9"}> : () -> ()
  "omp.critical.declare"() <{sym_name = "mutex10"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_critical"}> ({
    "omp.critical"() ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex1}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i64, i64, i64, i64) -> (), sym_name = "omp_ordered"}> ({
  ^bb0(%arg356: i32, %arg357: i32, %arg358: i32, %arg359: i64, %arg360: i64, %arg361: i64, %arg362: i64):
    "omp.ordered.region"() ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64}> ({
      "omp.loop_nest"(%arg356, %arg357, %arg358) ({
      ^bb0(%arg365: i32):
        "omp.ordered.region"() ({
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 1 : i64}> ({
      "omp.loop_nest"(%arg356, %arg357, %arg358) ({
      ^bb0(%arg364: i32):
        "omp.ordered"(%arg359) <{doacross_depend_type = #omp<clause_depend(dependsink)>, doacross_num_loops = 1 : i64}> : (i64) -> ()
        "omp.ordered"(%arg359) <{doacross_depend_type = #omp<clause_depend(dependsource)>, doacross_num_loops = 1 : i64}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 2 : i64}> ({
      "omp.loop_nest"(%arg356, %arg357, %arg358) ({
      ^bb0(%arg363: i32):
        "omp.ordered"(%arg359, %arg360, %arg361, %arg362) <{doacross_depend_type = #omp<clause_depend(dependsink)>, doacross_num_loops = 2 : i64}> : (i64, i64, i64, i64) -> ()
        "omp.ordered"(%arg359, %arg360) <{doacross_depend_type = #omp<clause_depend(dependsource)>, doacross_num_loops = 2 : i64}> : (i64, i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "omp_atomic_read"}> ({
  ^bb0(%arg354: memref<i32>, %arg355: memref<i32>):
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32, memory_order = #omp<memoryorderkind seq_cst>}> : (memref<i32>, memref<i32>) -> ()
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32, memory_order = #omp<memoryorderkind acquire>}> : (memref<i32>, memref<i32>) -> ()
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32, memory_order = #omp<memoryorderkind relaxed>}> : (memref<i32>, memref<i32>) -> ()
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32, hint = 6 : i64}> : (memref<i32>, memref<i32>) -> ()
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32, hint = 10 : i64, memory_order = #omp<memoryorderkind seq_cst>}> : (memref<i32>, memref<i32>) -> ()
    "omp.atomic.read"(%arg355, %arg354) <{element_type = i32, hint = 0 : i64, memory_order = #omp<memoryorderkind seq_cst>}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i32) -> (), sym_name = "omp_atomic_write"}> ({
  ^bb0(%arg352: memref<i32>, %arg353: i32):
    "omp.atomic.write"(%arg352, %arg353) : (memref<i32>, i32) -> ()
    "omp.atomic.write"(%arg352, %arg353) <{memory_order = #omp<memoryorderkind seq_cst>}> : (memref<i32>, i32) -> ()
    "omp.atomic.write"(%arg352, %arg353) <{memory_order = #omp<memoryorderkind release>}> : (memref<i32>, i32) -> ()
    "omp.atomic.write"(%arg352, %arg353) <{memory_order = #omp<memoryorderkind relaxed>}> : (memref<i32>, i32) -> ()
    "omp.atomic.write"(%arg352, %arg353) <{hint = 9 : i64}> : (memref<i32>, i32) -> ()
    "omp.atomic.write"(%arg352, %arg353) <{hint = 0 : i64}> : (memref<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i32, memref<i1>, i1) -> (), sym_name = "omp_atomic_update"}> ({
  ^bb0(%arg327: memref<i32>, %arg328: i32, %arg329: memref<i1>, %arg330: i1):
    "omp.atomic.update"(%arg327) ({
    ^bb0(%arg351: i32):
      %193 = "llvm.add"(%arg351, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%193) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg329) ({
    ^bb0(%arg350: i1):
      %192 = "llvm.and"(%arg350, %arg330) : (i1, i1) -> i1
      "omp.yield"(%192) : (i1) -> ()
    }) : (memref<i1>) -> ()
    "omp.atomic.update"(%arg327) ({
    ^bb0(%arg349: i32):
      %191 = "llvm.shl"(%arg349, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%191) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) ({
    ^bb0(%arg348: i32):
      %190 = "llvm.intr.smax"(%arg348, %arg328) : (i32, i32) -> i32
      "omp.yield"(%190) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg329) ({
    ^bb0(%arg347: i1):
      %189 = "llvm.icmp"(%arg347, %arg330) <{predicate = 0 : i64}> : (i1, i1) -> i1
      "omp.yield"(%189) : (i1) -> ()
    }) : (memref<i1>) -> ()
    "omp.atomic.update"(%arg327) ({
    ^bb0(%arg346: i32):
      "omp.yield"(%arg346) : (i32) -> ()
    }) : (memref<i32>) -> ()
    %175 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "omp.atomic.update"(%arg327) ({
    ^bb0(%arg345: i32):
      "omp.yield"(%175) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 0 : i64}> ({
    ^bb0(%arg344: i32):
      %188 = "llvm.add"(%arg344, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%188) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 1 : i64}> ({
    ^bb0(%arg343: i32):
      %187 = "llvm.add"(%arg343, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%187) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 2 : i64}> ({
    ^bb0(%arg342: i32):
      %186 = "llvm.add"(%arg342, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%186) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 4 : i64}> ({
    ^bb0(%arg341: i32):
      %185 = "llvm.add"(%arg341, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%185) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 8 : i64}> ({
    ^bb0(%arg340: i32):
      %184 = "llvm.add"(%arg340, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%184) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 5 : i64}> ({
    ^bb0(%arg339: i32):
      %183 = "llvm.add"(%arg339, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%183) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 6 : i64}> ({
    ^bb0(%arg338: i32):
      %182 = "llvm.add"(%arg338, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%182) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 9 : i64}> ({
    ^bb0(%arg337: i32):
      %181 = "llvm.add"(%arg337, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%181) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 10 : i64}> ({
    ^bb0(%arg336: i32):
      %180 = "llvm.add"(%arg336, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%180) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{memory_order = #omp<memoryorderkind seq_cst>}> ({
    ^bb0(%arg335: i32):
      %179 = "llvm.add"(%arg335, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%179) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{memory_order = #omp<memoryorderkind release>}> ({
    ^bb0(%arg334: i32):
      %178 = "llvm.add"(%arg334, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%178) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{memory_order = #omp<memoryorderkind relaxed>}> ({
    ^bb0(%arg333: i32):
      %177 = "llvm.add"(%arg333, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%177) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{hint = 9 : i64, memory_order = #omp<memoryorderkind seq_cst>}> ({
    ^bb0(%arg332: i32):
      %176 = "llvm.add"(%arg332, %arg328) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%176) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.update"(%arg327) <{atomic_control = #omp.atomic_control<ignore_denormal_mode = true, fine_grained_memory = true, remote_memory = true>}> ({
    ^bb0(%arg331: i32):
      "omp.yield"(%175) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i32) -> (), sym_name = "omp_atomic_capture"}> ({
  ^bb0(%arg307: memref<i32>, %arg308: memref<i32>, %arg309: i32):
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg326: i32):
        %174 = "llvm.add"(%arg326, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%174) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg325: i32):
        %173 = "llvm.add"(%arg325, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%173) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.atomic.write"(%arg308, %arg309) : (memref<i32>, i32) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 0 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg324: i32):
        %172 = "llvm.add"(%arg324, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%172) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 1 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg323: i32):
        %171 = "llvm.add"(%arg323, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%171) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 2 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg322: i32):
        %170 = "llvm.add"(%arg322, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%170) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 4 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg321: i32):
        %169 = "llvm.add"(%arg321, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%169) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 8 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg320: i32):
        %168 = "llvm.add"(%arg320, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%168) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 5 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg319: i32):
        %167 = "llvm.add"(%arg319, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%167) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 6 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg318: i32):
        %166 = "llvm.add"(%arg318, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%166) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 9 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg317: i32):
        %165 = "llvm.add"(%arg317, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%165) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 10 : i64}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg316: i32):
        %164 = "llvm.add"(%arg316, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%164) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind seq_cst>}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg315: i32):
        %163 = "llvm.add"(%arg315, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%163) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind acq_rel>}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg314: i32):
        %162 = "llvm.add"(%arg314, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%162) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind acquire>}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg313: i32):
        %161 = "llvm.add"(%arg313, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%161) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind release>}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg312: i32):
        %160 = "llvm.add"(%arg312, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%160) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind relaxed>}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg311: i32):
        %159 = "llvm.add"(%arg311, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%159) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{hint = 10 : i64, memory_order = #omp<memoryorderkind seq_cst>}> ({
      "omp.atomic.update"(%arg308) ({
      ^bb0(%arg310: i32):
        %158 = "llvm.add"(%arg310, %arg309) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%158) : (i32) -> ()
      }) : (memref<i32>) -> ()
      "omp.atomic.read"(%arg308, %arg307) <{element_type = i32}> : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i32, i32) -> (), sym_name = "omp_atomic_compare"}> ({
  ^bb0(%arg301: memref<i32>, %arg302: i32, %arg303: i32):
    "omp.atomic.compare"(%arg301) ({
    ^bb0(%arg306: i32):
      %156 = "arith.cmpi"(%arg306, %arg302) <{predicate = 0 : i64}> : (i32, i32) -> i1
      %157 = "arith.select"(%156, %arg303, %arg306) : (i1, i32, i32) -> i32
      "omp.yield"(%157) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.compare"(%arg301) <{weak}> ({
    ^bb0(%arg305: i32):
      %154 = "arith.cmpi"(%arg305, %arg302) <{predicate = 0 : i64}> : (i32, i32) -> i1
      %155 = "arith.select"(%154, %arg303, %arg305) : (i1, i32, i32) -> i32
      "omp.yield"(%155) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "omp.atomic.compare"(%arg301) <{memory_order = #omp<memoryorderkind seq_cst>, weak}> ({
    ^bb0(%arg304: i32):
      %152 = "arith.cmpi"(%arg304, %arg302) <{predicate = 0 : i64}> : (i32, i32) -> i1
      %153 = "arith.select"(%152, %arg303, %arg304) : (i1, i32, i32) -> i32
      "omp.yield"(%153) : (i32) -> ()
    }) : (memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>, memref<i32>, !llvm.ptr) -> (), sym_name = "omp_sectionsop"}> ({
  ^bb0(%arg295: memref<i32>, %arg296: memref<i32>, %arg297: memref<i32>, %arg298: !llvm.ptr):
    "omp.sections"(%arg295, %arg295) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.sections"(%arg298) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg300: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.sections"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.sections"(%arg298) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg299: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.sections"(%arg295, %arg295) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.sections"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        %149 = "test.payload"() : () -> i32
        %150 = "test.payload"() : () -> i32
        %151 = "test.payload"(%149, %150) : (i32, i32) -> i32
      }) : () -> ()
      "omp.section"() ({
        %148 = "test.payload"(%arg298) : (!llvm.ptr) -> i32
      }) : () -> ()
      "omp.section"() ({
        "test.payload"(%arg298) : (!llvm.ptr) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_single"}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "test.payload"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_single_nowait"}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "test.payload"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "omp_single_allocate"}> ({
  ^bb0(%arg294: memref<i32>):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"(%arg294, %arg294) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>}> ({
        "test.payload"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "omp_single_allocate_nowait"}> ({
  ^bb0(%arg293: memref<i32>):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"(%arg293, %arg293) <{nowait, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> ({
        "test.payload"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_single_multiple_blocks"}> ({
    "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "cf.br"()[^bb1] : () -> ()
    ^bb1:  // pred: ^bb0
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "copy_i32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "omp_single_copyprivate"}> ({
  ^bb0(%arg292: memref<i32>):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"(%arg292) <{copyprivate_syms = [@copy_i32], operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
        "test.payload"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : (memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i64, i32, memref<i32>, !llvm.ptr) -> (), sym_name = "omp_task"}> ({
  ^bb0(%arg281: i1, %arg282: i64, %arg283: i32, %arg284: memref<i32>, %arg285: !llvm.ptr):
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.task"(%arg281) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "omp.task"(%arg281) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, untied}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %145 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %146 = "llvm.alloca"(%145) <{elem_type = f32}> : (i32) -> !llvm.ptr
    %147 = "llvm.alloca"(%145) <{elem_type = f32}> : (i32) -> !llvm.ptr
    "omp.task"(%146, %147) <{in_reduction_byref = array<i1: false, false>, in_reduction_syms = [@add_f32, @add_f32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg290: !llvm.ptr, %arg291: !llvm.ptr):
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.task"(%146, %147) <{in_reduction_byref = array<i1: true, false>, in_reduction_syms = [@add_f32, @add_f32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg288: !llvm.ptr, %arg289: !llvm.ptr):
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.task"(%arg283) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.task"(%arg284, %arg284) <{operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "omp.task"(%arg285) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.task"(%arg284, %arg284, %arg281, %arg281, %146, %147, %arg283) <{in_reduction_byref = array<i1: false, true>, in_reduction_syms = [@add_f32, @add_f32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 1, 1, 2, 1, 0, 0>, untied}> ({
    ^bb0(%arg286: !llvm.ptr, %arg287: !llvm.ptr):
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>, i1, i1, !llvm.ptr, !llvm.ptr, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "omp_task_depend"}> ({
  ^bb0(%arg279: memref<i32>, %arg280: memref<i32>):
    "omp.task"(%arg279, %arg280, %arg279) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>, #omp<clause_task_depend(taskdependin)>, #omp<clause_task_depend(taskdependinout)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_task_depend_iterated"}> ({
  ^bb0(%arg274: index, %arg275: index, %arg276: index, %arg277: !llvm.ptr):
    %144 = "omp.iterator"(%arg274, %arg275, %arg276) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg278: index):
      "omp.yield"(%arg277) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.task"(%144) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, !llvm.ptr, memref<i32>) -> (), sym_name = "omp_task_depend_iterated_mixed"}> ({
  ^bb0(%arg268: index, %arg269: index, %arg270: index, %arg271: !llvm.ptr, %arg272: memref<i32>):
    %143 = "omp.iterator"(%arg268, %arg269, %arg270) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg273: index):
      "omp.yield"(%arg271) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.task"(%arg272, %143) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, !omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "omp_target_depend"}> ({
  ^bb0(%arg266: memref<i32>, %arg267: memref<i32>):
    "omp.target"(%arg266, %arg267, %arg266) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>, #omp<clause_task_depend(taskdependin)>, #omp<clause_task_depend(taskdependinout)>], kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64) -> (), sym_name = "omp_target_dyn_groupprivate"}> ({
  ^bb0(%arg264: i32, %arg265: i64):
    "omp.target"(%arg264) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.target"(%arg265) <{dyn_groupprivate_access_group = #omp<access_group_modifier(cgroup)>, kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i64) -> ()
    "omp.target"(%arg264) <{dyn_groupprivate_access_group = #omp<access_group_modifier(cgroup)>, dyn_groupprivate_fallback = #omp<fallback_modifier(abort)>, kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.target"(%arg264) <{dyn_groupprivate_access_group = #omp<access_group_modifier(cgroup)>, dyn_groupprivate_fallback = #omp<fallback_modifier(null)>, kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.target"(%arg265) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_threadprivate"}> ({
    %137 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %138 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %139 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %140 = "llvm.mlir.addressof"() <{global_name = @_QFsubEx}> : () -> !llvm.ptr
    %141 = "omp.threadprivate"(%140) : (!llvm.ptr) -> !llvm.ptr
    "llvm.store"(%137, %141) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %142 = "omp.threadprivate"(%140) : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%138, %142) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.store"(%139, %141) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFsubEx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancel_parallel"}> ({
  ^bb0(%arg263: i1):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancel"(%arg263) <{cancel_directive = #omp<cancellationconstructtype parallel>}> : (i1) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_cancel_wsloop"}> ({
  ^bb0(%arg259: index, %arg260: index, %arg261: index):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg259, %arg260, %arg261) ({
      ^bb0(%arg262: index):
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_cancel_sections"}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_cancel_taskgroup"}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_taskloop_cancel_taskgroup"}> ({
  ^bb0(%arg255: index, %arg256: index, %arg257: index):
    "omp.taskloop.context"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg255, %arg256, %arg257) ({
        ^bb0(%arg258: index):
          "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancel_parallel_nested"}> ({
  ^bb0(%arg254: i1):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "scf.if"(%arg254) ({
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "omp_cancel_wsloop_nested"}> ({
  ^bb0(%arg249: index, %arg250: index, %arg251: index, %arg252: i1):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg249, %arg250, %arg251) ({
      ^bb0(%arg253: index):
        "scf.if"(%arg252) ({
          "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancel_sections_nested"}> ({
  ^bb0(%arg248: i1):
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "scf.if"(%arg248) ({
          "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancel_taskgroup_nested"}> ({
  ^bb0(%arg247: i1):
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "scf.if"(%arg247) ({
          "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_cancellationpoint_parallel"}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
      "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_cancellationpoint_wsloop"}> ({
  ^bb0(%arg243: index, %arg244: index, %arg245: index):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg243, %arg244, %arg245) ({
      ^bb0(%arg246: index):
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> ()
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_cancellationpoint_sections"}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> ()
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_cancellationpoint_taskgroup"}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancellationpoint_parallel_nested"}> ({
  ^bb0(%arg242: i1):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "scf.if"(%arg242) ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "omp_cancellationpoint_wsloop_nested"}> ({
  ^bb0(%arg237: index, %arg238: index, %arg239: index, %arg240: i1):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg237, %arg238, %arg239) ({
      ^bb0(%arg241: index):
        "scf.if"(%arg240) ({
          "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancellationpoint_sections_nested"}> ({
  ^bb0(%arg236: i1):
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "scf.if"(%arg236) ({
          "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_cancellationpoint_taskgroup_nested"}> ({
  ^bb0(%arg235: i1):
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "scf.if"(%arg235) ({
          "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_taskgroup_no_tasks"}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "test.foo"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_taskgroup_multiple_tasks"}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "test.foo"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "test.foo"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_taskgroup_clauses"}> ({
    %135 = "test.memref"() : () -> memref<i32>
    %136 = "test.f32"() : () -> !llvm.ptr
    "omp.taskgroup"(%135, %135, %136) <{operandSegmentSizes = array<i32: 1, 1, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@add_f32]}> ({
    ^bb0(%arg234: !llvm.ptr):
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "test.foo"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "test.foo"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "omp_taskloop"}> ({
  ^bb0(%arg185: i32, %arg186: i32, %arg187: i32):
    "omp.taskloop.context"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg187) ({
        ^bb0(%arg233: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    %126 = "test.bool"() : () -> i1
    "omp.taskloop.context"(%126) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg231: i32, %arg232: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i1) -> ()
    "omp.taskloop.context"(%126) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg229: i32, %arg230: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i1) -> ()
    "omp.taskloop.context"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, untied}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg227: i32, %arg228: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "omp.taskloop.context"() <{mergeable, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg225: i32, %arg226: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    %127 = "test.f32"() : () -> !llvm.ptr
    %128 = "test.f32"() : () -> !llvm.ptr
    "omp.taskloop.context"(%127, %128) <{in_reduction_byref = array<i1: false, false>, in_reduction_syms = [@add_f32, @add_f32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0, 0, 0, 0>}> ({
    ^bb0(%arg221: !llvm.ptr, %arg222: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg223: i32, %arg224: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.taskloop.context"(%127, %128) <{in_reduction_byref = array<i1: true, false>, in_reduction_syms = [@add_f32, @add_f32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0, 0, 0, 0>}> ({
    ^bb0(%arg217: !llvm.ptr, %arg218: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg219: i32, %arg220: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.taskloop.context"(%127, %128) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: true, false>, reduction_syms = [@add_f32, @add_f32]}> ({
    ^bb0(%arg213: !llvm.ptr, %arg214: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg215: i32, %arg216: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.taskloop.context"(%127, %128) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: true, true>, reduction_syms = [@add_f32, @add_f32]}> ({
    ^bb0(%arg209: !llvm.ptr, %arg210: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg211: i32, %arg212: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.taskloop.context"(%127, %128) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_f32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg205: !llvm.ptr, %arg206: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg207: i32, %arg208: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    %129 = "test.i32"() : () -> i32
    "omp.taskloop.context"(%129) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg203: i32, %arg204: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    %130 = "test.memref"() : () -> memref<i32>
    "omp.taskloop.context"(%130, %130) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg201: i32, %arg202: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (memref<i32>, memref<i32>) -> ()
    %131 = "test.i64"() : () -> i64
    "omp.taskloop.context"(%131) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg199: i32, %arg200: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i64) -> ()
    "omp.taskloop.context"(%131) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg197: i32, %arg198: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i64) -> ()
    "omp.taskloop.context"(%131) <{grainsize_mod = #omp<grainsizetype strict>, operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg195: i32, %arg196: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i64) -> ()
    "omp.taskloop.context"(%131) <{num_tasks_mod = #omp<numtaskstype strict>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg193: i32, %arg194: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i64) -> ()
    "omp.taskloop.context"() <{nogroup, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
        ^bb0(%arg191: i32, %arg192: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "omp.taskloop.context"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.wrapper"() ({
        "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%arg185, %arg186, %arg186, %arg185, %arg187, %arg187) ({
          ^bb0(%arg189: i32, %arg190: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32, i32, i32, i32) -> ()
        }) {omp.composite} : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "omp.taskloop.context"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %132 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %133 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %134 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%132, %133, %134) ({
        ^bb0(%arg188: i32):
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_requires_one"}> ({
    "func.return"() : () -> ()
  }) {omp.requires = #omp<clause_requires reverse_offload>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_requires_multiple"}> ({
    "func.return"() : () -> ()
  }) {omp.requires = #omp<clause_requires unified_address|dynamic_allocators>} : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "opaque_pointers_atomic_rwu"}> ({
  ^bb0(%arg182: !llvm.ptr, %arg183: !llvm.ptr):
    "omp.atomic.read"(%arg183, %arg182) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    %125 = "llvm.load"(%arg183) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "omp.atomic.write"(%arg182, %125) : (!llvm.ptr, i32) -> ()
    "omp.atomic.update"(%arg183) ({
    ^bb0(%arg184: i32):
      "omp.yield"(%arg184) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "opaque_pointers_reduction", type = f32}> ({
  }, {
  ^bb0(%arg181: f32):
    %124 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%124) : (f32) -> ()
  }, {
  ^bb0(%arg179: f32, %arg180: f32):
    %123 = "arith.addf"(%arg179, %arg180) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%123) : (f32) -> ()
  }, {
  ^bb0(%arg177: !llvm.ptr, %arg178: !llvm.ptr):
    %121 = "llvm.load"(%arg178) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %122 = "llvm.atomicrmw"(%arg177, %121) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "alloc_reduction", type = !llvm.ptr}> ({
  ^bb0(%arg176: !llvm.ptr):
    %119 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %120 = "llvm.alloca"(%119) <{elem_type = f32}> : (i32) -> !llvm.ptr
    "omp.yield"(%120) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg174: !llvm.ptr, %arg175: !llvm.ptr):
    %118 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "llvm.store"(%118, %arg175) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg175) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg172: !llvm.ptr, %arg173: !llvm.ptr):
    %115 = "llvm.load"(%arg172) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %116 = "llvm.load"(%arg173) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %117 = "arith.addf"(%115, %116) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "llvm.store"(%117, %arg172) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg172) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "omp_targets_with_map_bounds"}> ({
  ^bb0(%arg168: !llvm.ptr, %arg169: !llvm.ptr):
    %101 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %102 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %103 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %104 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %105 = "omp.map.bounds"(%102, %101, %103, %104) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
    %106 = "omp.map.info"(%arg168, %105) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %107 = "llvm.mlir.constant"() <{value = 9 : index}> : () -> i64
    %108 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %109 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %110 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %111 = "omp.map.bounds"(%108, %107, %109, %110) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
    %112 = "omp.map.info"(%arg169, %111) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags storage>, mapper_id = @my_mapper, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target"(%106, %112) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg170: !llvm.ptr, %arg171: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.target_data"(%106, %112) <{operandSegmentSizes = array<i32: 0, 0, 2, 0, 0, 0>}> ({
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    %113 = "omp.map.info"(%arg168, %105) <{map_capture_type = #omp<variable_capture_kind(VLAType)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target_enter_data"(%113) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>}> : (!llvm.ptr) -> ()
    %114 = "omp.map.info"(%arg169, %111) <{map_capture_type = #omp<variable_capture_kind(This)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target_exit_data"(%114) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>}> : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, si32, memref<?xi32>, memref<?xi32>) -> (), sym_name = "omp_target_update_data"}> ({
  ^bb0(%arg164: i1, %arg165: si32, %arg166: memref<?xi32>, %arg167: memref<?xi32>):
    %99 = "omp.map.info"(%arg166) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %100 = "omp.map.info"(%arg167) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|present>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target_update"(%arg165, %arg164, %99, %100) <{nowait, operandSegmentSizes = array<i32: 0, 0, 1, 1, 2, 0>}> : (si32, i1, memref<?xi32>, memref<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "omp_targets_is_allocatable"}> ({
  ^bb0(%arg160: !llvm.ptr, %arg161: !llvm.ptr):
    %97 = "omp.map.info"(%arg160) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %98 = "omp.map.info"(%arg161, %97) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], name = "", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target"(%97, %98) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg162: !llvm.ptr, %arg163: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, memref<?xi32>, memref<?xi32>) -> (), sym_name = "omp_target_enter_update_exit_data_depend"}> ({
  ^bb0(%arg154: memref<?xi32>, %arg155: memref<?xi32>, %arg156: memref<?xi32>):
    %93 = "omp.map.info"(%arg154) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %94 = "omp.map.info"(%arg155) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %95 = "omp.map.info"(%arg156) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.task"(%arg154) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
      "test.foo"(%arg154) : (memref<?xi32>) -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>) -> ()
    "omp.target_enter_data"(%arg154, %93, %95) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], nowait, operandSegmentSizes = array<i32: 1, 0, 0, 0, 2, 0>}> : (memref<?xi32>, memref<?xi32>, memref<?xi32>) -> ()
    "omp.target"(%94) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg159: memref<?xi32>):
      "test.foo"(%arg159) : (memref<?xi32>) -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>) -> ()
    "omp.task"(%arg154) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
      "test.bar"(%arg154, %arg155) : (memref<?xi32>, memref<?xi32>) -> ()
    }) : (memref<?xi32>) -> ()
    "omp.target_update"(%arg154, %93) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], nowait, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 0>}> : (memref<?xi32>, memref<?xi32>) -> ()
    %96 = "omp.map.info"(%arg156) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target"(%arg156, %93, %96) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependout)>], kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg157: memref<?xi32>, %arg158: memref<?xi32>):
      "test.foobar"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>, memref<?xi32>, memref<?xi32>) -> ()
    "omp.target_exit_data"(%arg156, %95) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 0>}> : (memref<?xi32>, memref<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> (), sym_name = "omp_map_with_members"}> ({
  ^bb0(%arg148: !llvm.ptr, %arg149: !llvm.ptr, %arg150: !llvm.ptr, %arg151: !llvm.ptr, %arg152: !llvm.ptr, %arg153: !llvm.ptr):
    %87 = "omp.map.info"(%arg148) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %88 = "omp.map.info"(%arg149) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    %89 = "omp.map.info"(%arg150, %87, %88) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, members_index = [[0], [1]], name = "", operandSegmentSizes = array<i32: 1, 0, 2, 0>, partial_map = true, var_ptr_type = !llvm.struct<(i32, f32)>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target_enter_data"(%87, %88, %89) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 3, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %90 = "omp.map.info"(%arg151) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %91 = "omp.map.info"(%arg152) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    %92 = "omp.map.info"(%arg153, %90, %91) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, members_index = [[1, 0], [1, 1]], name = "", operandSegmentSizes = array<i32: 1, 0, 2, 0>, partial_map = true, var_ptr_type = !llvm.struct<(i32, struct<(i32, f32)>)>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.target_exit_data"(%90, %91, %92) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 3, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "parallel_op_privatizers"}> ({
  ^bb0(%arg144: !llvm.ptr, %arg145: !llvm.ptr):
    "omp.parallel"(%arg144, %arg145) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0>, private_syms = [@x.privatizer, @y.privatizer]}> ({
    ^bb0(%arg146: !llvm.ptr, %arg147: !llvm.ptr):
      %85 = "llvm.load"(%arg146) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %86 = "llvm.load"(%arg147) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "parallel_op_privatizers_barrier"}> ({
  ^bb0(%arg140: !llvm.ptr, %arg141: !llvm.ptr):
    "omp.parallel"(%arg140, %arg141) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 0>, private_needs_barrier, private_syms = [@x.privatizer, @y.privatizer]}> ({
    ^bb0(%arg142: !llvm.ptr, %arg143: !llvm.ptr):
      %83 = "llvm.load"(%arg142) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %84 = "llvm.load"(%arg143) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "a.privatizer", type = !llvm.ptr}> ({
  ^bb0(%arg138: !llvm.ptr, %arg139: !llvm.ptr):
    "omp.yield"(%arg138) : (!llvm.ptr) -> ()
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "x.privatizer", type = !llvm.ptr}> ({
  ^bb0(%arg136: !llvm.ptr, %arg137: !llvm.ptr):
    "omp.yield"(%arg136) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg135: !llvm.ptr):
    "omp.yield"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "y.privatizer", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg133: !llvm.ptr, %arg134: !llvm.ptr):
    "omp.yield"(%arg133) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg132: !llvm.ptr):
    "omp.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> (), sym_name = "parallel_op_reduction_and_private"}> ({
  ^bb0(%arg124: !llvm.ptr, %arg125: !llvm.ptr, %arg126: !llvm.ptr, %arg127: !llvm.ptr):
    "omp.parallel"(%arg124, %arg125, %arg126, %arg127) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 2, 2>, private_syms = [@x.privatizer, @y.privatizer], reduction_byref = array<i1: false, false>, reduction_syms = [@add_f32, @add_f32]}> ({
    ^bb0(%arg128: !llvm.ptr, %arg129: !llvm.ptr, %arg130: !llvm.ptr, %arg131: !llvm.ptr):
      %79 = "llvm.load"(%arg128) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %80 = "llvm.load"(%arg129) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %81 = "llvm.load"(%arg130) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %82 = "llvm.load"(%arg131) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, memref<?xi32>, !llvm.ptr) -> (), sym_name = "omp_target_private"}> ({
  ^bb0(%arg117: memref<?xi32>, %arg118: memref<?xi32>, %arg119: !llvm.ptr):
    %77 = "omp.map.info"(%arg117) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %78 = "omp.map.info"(%arg118) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target"(%arg119) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_maps = array<i64: -1>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg123: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.target"(%77, %78, %arg119) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0>, private_maps = array<i64: -1>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg120: memref<?xi32>, %arg121: memref<?xi32>, %arg122: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>, memref<?xi32>, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, memref<?xi32>, !llvm.ptr) -> (), sym_name = "omp_target_private_with_map_idx"}> ({
  ^bb0(%arg111: memref<?xi32>, %arg112: memref<?xi32>, %arg113: !llvm.ptr):
    %75 = "omp.map.info"(%arg111) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %76 = "omp.map.info"(%arg112) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "omp.target"(%75, %76, %arg113) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0>, private_maps = array<i64: 1>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg114: memref<?xi32>, %arg115: memref<?xi32>, %arg116: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (memref<?xi32>, memref<?xi32>, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_target_host_eval"}> ({
  ^bb0(%arg100: i32):
    "omp.target"(%arg100) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg110: i32):
      "omp.teams"(%arg110, %arg110) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
        "omp.terminator"() : () -> ()
      }) : (i32, i32) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.target"(%arg100) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg108: i32):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"(%arg108) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%arg108, %arg108, %arg108) ({
              ^bb0(%arg109: i32):
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : (i32) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    "omp.target"(%arg100) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg106: i32):
      "omp.parallel"(%arg106) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
        "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%arg106, %arg106, %arg106) ({
          ^bb0(%arg107: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i32) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    "omp.target"(%arg100) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg105: i32):
      "omp.parallel"(%arg105) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.target"(%arg100) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg103: i32):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%arg103, %arg103, %arg103) ({
          ^bb0(%arg104: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    "omp.target"(%arg100) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg101: i32):
      "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
          "omp.loop_nest"(%arg101, %arg101, %arg101) ({
          ^bb0(%arg102: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "omp_loop"}> ({
  ^bb0(%arg93: index, %arg94: index, %arg95: index):
    "omp.loop"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "omp.loop_nest"(%arg93, %arg94, %arg95) ({
      ^bb0(%arg99: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.loop"() <{bind_kind = #omp<bindkind teams>, operandSegmentSizes = array<i32: 0, 0>}> ({
      "omp.loop_nest"(%arg93, %arg94, %arg95) ({
      ^bb0(%arg98: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.loop"() <{bind_kind = #omp<bindkind parallel>, operandSegmentSizes = array<i32: 0, 0>}> ({
      "omp.loop_nest"(%arg93, %arg94, %arg95) ({
      ^bb0(%arg97: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "omp.loop"() <{bind_kind = #omp<bindkind thread>, operandSegmentSizes = array<i32: 0, 0>}> ({
      "omp.loop_nest"(%arg93, %arg94, %arg95) ({
      ^bb0(%arg96: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_workshare"}> ({
    "omp.workshare"() ({
      "test.payload"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_workshare_nowait"}> ({
    "omp.workshare"() <{nowait}> ({
      "test.payload"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_workshare_multiple_blocks"}> ({
    "omp.workshare"() ({
      "cf.br"()[^bb1] : () -> ()
    ^bb1:  // pred: ^bb0
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "omp_workshare_loop_wrapper"}> ({
  ^bb0(%arg91: index):
    "omp.workshare"() ({
      "omp.workshare.loop_wrapper"() ({
        "omp.loop_nest"(%arg91, %arg91, %arg91) ({
        ^bb0(%arg92: index):
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "omp_workshare_loop_wrapper_attrs"}> ({
  ^bb0(%arg89: index):
    "omp.workshare"() ({
      "omp.workshare.loop_wrapper"() ({
        "omp.loop_nest"(%arg89, %arg89, %arg89) ({
        ^bb0(%arg90: index):
          "omp.yield"() : () -> ()
        }) : (index, index, index) -> ()
      }) {attr_in_dict} : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "omp_init_allocator"}> ({
  ^bb0(%arg88: i64):
    "func.return"(%arg88) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "omp_allocate_dir"}> ({
  ^bb0(%arg86: memref<i32>, %arg87: memref<i32>):
    "omp.allocate_dir"(%arg86) <{operandSegmentSizes = array<i32: 1, 0>}> : (memref<i32>) -> ()
    "omp.allocate_dir"(%arg86, %arg87) <{operandSegmentSizes = array<i32: 2, 0>}> : (memref<i32>, memref<i32>) -> ()
    "omp.allocate_dir"(%arg86) <{align = 2 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (memref<i32>) -> ()
    %70 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "omp.allocate_dir"(%arg86, %70) <{operandSegmentSizes = array<i32: 1, 1>}> : (memref<i32>, i64) -> ()
    %71 = "arith.constant"() <{value = 7 : i64}> : () -> i64
    "omp.allocate_dir"(%arg86, %71) <{align = 4 : i64, operandSegmentSizes = array<i32: 1, 1>}> : (memref<i32>, i64) -> ()
    %72 = "arith.constant"() <{value = 6 : i64}> : () -> i64
    "omp.allocate_dir"(%arg86, %arg87, %72) <{align = 8 : i64, operandSegmentSizes = array<i32: 2, 1>}> : (memref<i32>, memref<i32>, i64) -> ()
    %73 = "arith.constant"() <{value = 9 : i64}> : () -> i64
    %74 = "func.call"(%73) <{callee = @omp_init_allocator}> : (i64) -> i64
    "omp.allocate_dir"(%arg86, %74) <{operandSegmentSizes = array<i32: 1, 1>}> : (memref<i32>, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (), sym_name = "omp_allocate_free"}> ({
  ^bb0(%arg84: memref<i32>, %arg85: memref<i32>):
    "omp.allocate_free"(%arg84) <{operandSegmentSizes = array<i32: 1, 0>}> : (memref<i32>) -> ()
    %68 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "omp.allocate_free"(%arg84, %68) <{operandSegmentSizes = array<i32: 1, 1>}> : (memref<i32>, i64) -> ()
    %69 = "arith.constant"() <{value = 6 : i64}> : () -> i64
    "omp.allocate_free"(%arg84, %arg85, %69) <{operandSegmentSizes = array<i32: 2, 1>}> : (memref<i32>, memref<i32>, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_workdistribute"}> ({
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.workdistribute"() ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>) -> (), sym_name = "omp_target_map_clause_type_test"}> ({
  ^bb0(%arg83: memref<?xi32>):
    %49 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags none>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %50 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %51 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %52 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %53 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %54 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags del>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %55 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags return_param>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %56 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags priv>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %57 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags literal>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %58 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags implicit>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %59 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags close>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %60 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags present>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %61 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags ompx_hold>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %62 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %63 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach_always>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %64 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach_never>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %65 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags attach_auto>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %66 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags ref_ptr>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    %67 = "omp.map.info"(%arg83) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags ref_ptee>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = tensor<?xi32>}> : (memref<?xi32>) -> memref<?xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_declare_simd"}> ({
    "omp.declare_simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_declare_simd_simdlen"}> ({
    "omp.declare_simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>, simdlen = 8 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64, memref<i32>, memref<i32>) -> (), sym_name = "omp_declare_simd_aligned"}> ({
  ^bb0(%arg79: f64, %arg80: f64, %arg81: memref<i32>, %arg82: memref<i32>):
    "omp.declare_simd"(%arg81, %arg82) <{alignments = [32, 128], operandSegmentSizes = array<i32: 2, 0, 0, 0>}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64, memref<i32>, memref<i32>) -> (), sym_name = "omp_declare_simd_aligned_list_generic"}> ({
  ^bb0(%arg75: f64, %arg76: f64, %arg77: memref<i32>, %arg78: memref<i32>):
    "omp.declare_simd"(%arg77, %arg78) <{alignments = [32, 128], operandSegmentSizes = array<i32: 2, 0, 0, 0>}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64, i32, i32) -> (), sym_name = "omp_declare_simd_linear"}> ({
  ^bb0(%arg71: f64, %arg72: f64, %arg73: i32, %arg74: i32):
    "omp.declare_simd"(%arg73, %arg74) <{linear_modifiers = [unit], operandSegmentSizes = array<i32: 0, 1, 1, 0>}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_declare_simd_linear_val"}> ({
  ^bb0(%arg69: i32, %arg70: i32):
    "omp.declare_simd"(%arg69, %arg70) <{linear_modifiers = [#omp<linear_modifier(val)>], operandSegmentSizes = array<i32: 0, 1, 1, 0>}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i32) -> (), sym_name = "omp_declare_simd_linear_ref"}> ({
  ^bb0(%arg67: memref<i32>, %arg68: i32):
    "omp.declare_simd"(%arg67, %arg68) <{linear_modifiers = [#omp<linear_modifier(ref)>], operandSegmentSizes = array<i32: 0, 1, 1, 0>}> : (memref<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32>, i32) -> (), sym_name = "omp_declare_simd_linear_uval"}> ({
  ^bb0(%arg65: memref<i32>, %arg66: i32):
    "omp.declare_simd"(%arg65, %arg66) <{linear_modifiers = [#omp<linear_modifier(uval)>], operandSegmentSizes = array<i32: 0, 1, 1, 0>}> : (memref<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>, memref<i32>, i32, i32, i32) -> (), sym_name = "omp_declare_simd_linear_mixed_modifiers"}> ({
  ^bb0(%arg59: i32, %arg60: memref<i32>, %arg61: memref<i32>, %arg62: i32, %arg63: i32, %arg64: i32):
    "omp.declare_simd"(%arg59, %arg60, %arg61, %arg62, %arg63, %arg64) <{linear_modifiers = [#omp<linear_modifier(val)>, #omp<linear_modifier(ref)>, #omp<linear_modifier(uval)>], operandSegmentSizes = array<i32: 0, 3, 3, 0>}> : (i32, memref<i32>, memref<i32>, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>, i32, i32, i32, i32) -> (), sym_name = "omp_declare_simd_linear_mixed_with_non_modifiers"}> ({
  ^bb0(%arg53: i32, %arg54: memref<i32>, %arg55: i32, %arg56: i32, %arg57: i32, %arg58: i32):
    "omp.declare_simd"(%arg53, %arg54, %arg55, %arg56, %arg57, %arg58) <{linear_modifiers = [#omp<linear_modifier(val)>, unit, #omp<linear_modifier(ref)>], operandSegmentSizes = array<i32: 0, 3, 3, 0>}> : (i32, memref<i32>, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64, memref<i32>, memref<i32>) -> (), sym_name = "omp_declare_simd_uniform"}> ({
  ^bb0(%arg49: f64, %arg50: f64, %arg51: memref<i32>, %arg52: memref<i32>):
    "omp.declare_simd"(%arg51, %arg52) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>}> : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_declare_simd_inbranch"}> ({
    "omp.declare_simd"() <{inbranch, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_declare_simd_notinbranch"}> ({
    "omp.declare_simd"() <{notinbranch, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64, memref<i32>, memref<i32>, i32, i32) -> (), sym_name = "omp_declare_simd_multiple_clauses"}> ({
  ^bb0(%arg43: f64, %arg44: f64, %arg45: memref<i32>, %arg46: memref<i32>, %arg47: i32, %arg48: i32):
    "omp.declare_simd"(%arg45, %arg46, %arg45, %arg46) <{alignments = [32, 128], notinbranch, operandSegmentSizes = array<i32: 2, 0, 0, 2>, simdlen = 8 : i64}> : (memref<i32>, memref<i32>, memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64, f64, memref<i32>, memref<i32>, i32, i32) -> (), sym_name = "omp_declare_simd_all_clauses"}> ({
  ^bb0(%arg37: f64, %arg38: f64, %arg39: memref<i32>, %arg40: memref<i32>, %arg41: i32, %arg42: i32):
    "omp.declare_simd"(%arg39, %arg40, %arg41, %arg42, %arg39, %arg40) <{alignments = [32, 128], inbranch, linear_modifiers = [unit], operandSegmentSizes = array<i32: 2, 1, 1, 2>, simdlen = 8 : i64}> : (memref<i32>, memref<i32>, i32, i32, memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "task_affinity_single"}> ({
  ^bb0(%arg36: !llvm.ptr):
    %47 = "llvm.mlir.constant"() <{value = 400 : i64}> : () -> i64
    %48 = "omp.affinity_entry"(%arg36, %47) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
    "omp.task"(%48) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "task_affinity_multi"}> ({
  ^bb0(%arg34: !llvm.ptr, %arg35: !llvm.ptr):
    %43 = "llvm.mlir.constant"() <{value = 400 : i64}> : () -> i64
    %44 = "omp.affinity_entry"(%arg34, %43) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
    %45 = "llvm.mlir.constant"() <{value = 800 : i64}> : () -> i64
    %46 = "omp.affinity_entry"(%arg35, %45) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
    "omp.task"(%44, %46) <{operandSegmentSizes = array<i32: 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.affinity_entry_ty<!llvm.ptr, i64>, !omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.struct<(ptr, i64)>) -> (), sym_name = "omp_iterator"}> ({
  ^bb0(%arg32: !llvm.struct<(ptr, i64)>):
    %39 = "arith.constant"() <{value = 1 : index}> : () -> index
    %40 = "arith.constant"() <{value = 4 : index}> : () -> index
    %41 = "arith.constant"() <{value = 1 : index}> : () -> index
    %42 = "omp.iterator"(%39, %40, %41) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg33: index):
      "omp.yield"(%arg32) : (!llvm.struct<(ptr, i64)>) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.struct<(ptr, i64)>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "omp_iterator_explicit_yield"}> ({
  ^bb0(%arg30: index):
    %35 = "arith.constant"() <{value = 0 : index}> : () -> index
    %36 = "arith.constant"() <{value = 4 : index}> : () -> index
    %37 = "arith.constant"() <{value = 1 : index}> : () -> index
    %38 = "omp.iterator"(%35, %36, %37) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg31: index):
      "omp.yield"(%arg30) : (index) -> ()
    }) : (index, index, index) -> !omp.iterated<index>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.struct<(ptr, i64)>) -> (), sym_name = "omp_iterator_2d"}> ({
  ^bb0(%arg27: !llvm.struct<(ptr, i64)>):
    %28 = "arith.constant"() <{value = 1 : index}> : () -> index
    %29 = "arith.constant"() <{value = 4 : index}> : () -> index
    %30 = "arith.constant"() <{value = 1 : index}> : () -> index
    %31 = "arith.constant"() <{value = 2 : index}> : () -> index
    %32 = "arith.constant"() <{value = 10 : index}> : () -> index
    %33 = "arith.constant"() <{value = 2 : index}> : () -> index
    %34 = "omp.iterator"(%28, %31, %29, %32, %30, %33) <{operandSegmentSizes = array<i32: 2, 2, 2>}> ({
    ^bb0(%arg28: index, %arg29: index):
      "omp.yield"(%arg27) : (!llvm.struct<(ptr, i64)>) -> ()
    }) : (index, index, index, index, index, index) -> !omp.iterated<!llvm.struct<(ptr, i64)>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.struct<(ptr, i64)>) -> (), sym_name = "omp_iterator_negative_step"}> ({
  ^bb0(%arg25: !llvm.struct<(ptr, i64)>):
    %24 = "arith.constant"() <{value = 4 : index}> : () -> index
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "arith.constant"() <{value = -1 : index}> : () -> index
    %27 = "omp.iterator"(%24, %25, %26) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg26: index):
      "omp.yield"(%arg25) : (!llvm.struct<(ptr, i64)>) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.struct<(ptr, i64)>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, !llvm.ptr, i64) -> (), sym_name = "omp_task_affinity_iterator_1d"}> ({
  ^bb0(%arg19: index, %arg20: index, %arg21: index, %arg22: !llvm.ptr, %arg23: i64):
    %22 = "omp.iterator"(%arg19, %arg20, %arg21) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg24: index):
      %23 = "omp.affinity_entry"(%arg22, %arg23) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
      "omp.yield"(%23) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
    }) : (index, index, index) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
    "omp.task"(%22) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, index, index, index, !llvm.ptr, !llvm.ptr, i64, i64) -> (), sym_name = "omp_task_affinity_iterator_2d"}> ({
  ^bb0(%arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64):
    %16 = "omp.iterator"(%arg7, %arg10, %arg8, %arg11, %arg9, %arg12) <{operandSegmentSizes = array<i32: 2, 2, 2>}> ({
    ^bb0(%arg17: index, %arg18: index):
      %17 = "arith.addi"(%arg17, %arg7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %18 = "arith.addi"(%arg18, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %19 = "arith.cmpi"(%17, %18) <{predicate = 6 : i64}> : (index, index) -> i1
      %20 = "omp.affinity_entry"(%arg13, %arg15) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
      %21 = "omp.affinity_entry"(%arg14, %arg16) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
      "omp.yield"(%21) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
    }) : (index, index, index, index, index, index) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
    "omp.task"(%16) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, index, index, i32) -> (), sym_name = "omp_target_allocmem"}> ({
  ^bb0(%arg3: i32, %arg4: index, %arg5: index, %arg6: i32):
    %11 = "omp.target_allocmem"(%arg3) <{in_type = i64, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64
    %12 = "omp.target_allocmem"(%arg3) <{bindc_name = "bindc", in_type = vector<16x16xf32>, operandSegmentSizes = array<i32: 1, 0, 0>, uniq_name = "uniq"}> : (i32) -> i64
    %13 = "omp.target_allocmem"(%arg3, %arg4, %arg5, %arg6) <{in_type = !llvm.ptr, operandSegmentSizes = array<i32: 1, 3, 0>}> : (i32, index, index, i32) -> i64
    %14 = "omp.target_allocmem"(%arg3, %arg4, %arg5) <{in_type = !llvm.ptr, operandSegmentSizes = array<i32: 1, 0, 2>}> : (i32, index, index) -> i64
    %15 = "omp.target_allocmem"(%arg3, %arg4, %arg5, %arg6, %arg4, %arg5) <{in_type = !llvm.ptr, operandSegmentSizes = array<i32: 1, 3, 2>}> : (i32, index, index, i32, index, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_target_freemem"}> ({
  ^bb0(%arg2: i32):
    %10 = "omp.target_allocmem"(%arg2) <{in_type = i64, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64
    "omp.target_freemem"(%arg2, %10) : (i32, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_alloc_shared_mem"}> ({
  ^bb0(%arg1: i32):
    %7 = "omp.alloc_shared_mem"(%arg1) <{mem_elem_type = i64}> : (i32) -> !llvm.ptr
    %8 = "omp.alloc_shared_mem"(%arg1) <{mem_elem_type = vector<16x16xf32>}> : (i32) -> !llvm.ptr
    %9 = "omp.alloc_shared_mem"(%arg1) <{mem_alignment = 16 : i64, mem_elem_type = !llvm.ptr}> : (i32) -> !llvm.ptr
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "omp_free_shared_mem"}> ({
  ^bb0(%arg0: i64):
    %5 = "omp.alloc_shared_mem"(%arg0) <{mem_elem_type = f32}> : (i64) -> !llvm.ptr
    "omp.free_shared_mem"(%arg0, %5) <{mem_elem_type = f32}> : (i64, !llvm.ptr) -> ()
    %6 = "omp.alloc_shared_mem"(%arg0) <{mem_alignment = 32 : i64, mem_elem_type = f32}> : (i64) -> !llvm.ptr
    "omp.free_shared_mem"(%arg0, %6) <{mem_alignment = 32 : i64, mem_elem_type = f32}> : (i64, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_groupprivate_device_type"}> ({
    %0 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %1 = "omp.groupprivate"() <{sym_name = @gp}> : () -> !llvm.ptr
    %2 = "omp.groupprivate"() <{device_type = #omp<device_type(any)>, sym_name = @any}> : () -> !llvm.ptr
    "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %3 = "omp.groupprivate"() <{device_type = #omp<device_type(host)>, sym_name = @host}> : () -> !llvm.ptr
    "llvm.store"(%0, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %4 = "omp.groupprivate"() <{device_type = #omp<device_type(nohost)>, sym_name = @nohost}> : () -> !llvm.ptr
    "llvm.store"(%0, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "gp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "any", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_target_update_map_iterated"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr):
    %0 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "omp.iterator"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg4: index):
      %2 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.yield"(%2) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.target_update"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1>}> : (!llvm.ptr, !omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_target_enter_data_map_iterated"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr):
    %0 = "omp.iterator"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg4: index):
      %1 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.yield"(%1) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.target_enter_data"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>}> : (!omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_target_exit_data_map_iterated"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr):
    %0 = "omp.iterator"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg4: index):
      %1 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.yield"(%1) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.target_exit_data"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>}> : (!omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_target_data_map_iterated"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr):
    %0 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "omp.iterator"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg4: index):
      %2 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.yield"(%2) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.target_data"(%0, %1) <{operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0>}> ({
    }) : (!llvm.ptr, !omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, !llvm.ptr) -> (), sym_name = "omp_target_map_iterated"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr):
    %0 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "omp.iterator"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg5: index):
      %2 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.yield"(%2) : (!llvm.ptr) -> ()
    }) : (index, index, index) -> !omp.iterated<!llvm.ptr>
    "omp.target"(%0, %1) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0>}> ({
    ^bb0(%arg4: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !omp.iterated<!llvm.ptr>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

