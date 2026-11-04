"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_pmevent_mask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.pmevent"() <{maskedEventId = 15000 : i16}> : () -> ()
    "nvvm.pmevent"() <{maskedEventId = 4 : i16}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_pmevent_id", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.pmevent"() <{eventId = 10 : i32}> : () -> ()
    "nvvm.pmevent"() <{eventId = 4 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

