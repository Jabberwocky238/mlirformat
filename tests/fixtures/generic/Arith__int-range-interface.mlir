#map = affine_map<() -> (0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "add_min_max"}> ({
  ^bb0(%arg80: index, %arg81: index):
    %485 = "arith.constant"() <{value = 1 : index}> : () -> index
    %486 = "arith.constant"() <{value = 2 : index}> : () -> index
    %487 = "arith.minsi"(%arg80, %485) : (index, index) -> index
    %488 = "arith.maxsi"(%487, %485) : (index, index) -> index
    %489 = "arith.minui"(%arg81, %486) : (index, index) -> index
    %490 = "arith.maxui"(%489, %486) : (index, index) -> index
    %491 = "arith.addi"(%488, %490) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "func.return"(%491) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i1, sym_name = "add_lower_bound"}> ({
  ^bb0(%arg78: i32, %arg79: i32):
    %477 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %478 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %479 = "arith.maxsi"(%arg78, %477) : (i32, i32) -> i32
    %480 = "arith.maxsi"(%arg79, %477) : (i32, i32) -> i32
    %481 = "arith.addi"(%479, %480) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %482 = "arith.cmpi"(%481, %478) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %483 = "arith.cmpi"(%481, %478) <{predicate = 9 : i64}> : (i32, i32) -> i1
    %484 = "arith.andi"(%482, %483) : (i1, i1) -> i1
    "func.return"(%484) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i1, sym_name = "sub_signed_vs_unsigned"}> ({
  ^bb0(%arg77: i64):
    %468 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %469 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %470 = "arith.constant"() <{value = -5 : i64}> : () -> i64
    %471 = "arith.minsi"(%arg77, %469) : (i64, i64) -> i64
    %472 = "arith.maxsi"(%471, %470) : (i64, i64) -> i64
    %473 = "arith.subi"(%472, %469) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
    %474 = "arith.cmpi"(%473, %468) <{predicate = 3 : i64}> : (i64, i64) -> i1
    %475 = "arith.cmpi"(%473, %468) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %476 = "arith.andi"(%474, %475) : (i1, i1) -> i1
    "func.return"(%476) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "multiply_negatives"}> ({
  ^bb0(%arg75: index, %arg76: index):
    %454 = "arith.constant"() <{value = 2 : index}> : () -> index
    %455 = "arith.constant"() <{value = 3 : index}> : () -> index
    %456 = "arith.constant"() <{value = -1 : index}> : () -> index
    %457 = "arith.constant"() <{value = -2 : index}> : () -> index
    %458 = "arith.constant"() <{value = -4 : index}> : () -> index
    %459 = "arith.constant"() <{value = -12 : index}> : () -> index
    %460 = "arith.maxsi"(%arg75, %454) : (index, index) -> index
    %461 = "arith.minsi"(%460, %455) : (index, index) -> index
    %462 = "arith.minsi"(%arg76, %456) : (index, index) -> index
    %463 = "arith.maxsi"(%462, %458) : (index, index) -> index
    %464 = "arith.muli"(%461, %463) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %465 = "arith.cmpi"(%464, %459) <{predicate = 2 : i64}> : (index, index) -> i1
    %466 = "arith.cmpi"(%456, %464) <{predicate = 2 : i64}> : (index, index) -> i1
    %467 = "arith.ori"(%465, %466) : (i1, i1) -> i1
    "func.return"(%467) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "multiply_unsigned_bounds"}> ({
  ^bb0(%arg73: i16, %arg74: i16):
    %444 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %445 = "arith.constant"() <{value = 4 : i16}> : () -> i16
    %446 = "arith.constant"() <{value = 16383 : i16}> : () -> i16
    %447 = "arith.constant"() <{value = -4 : i16}> : () -> i16
    %448 = "arith.andi"(%arg73, %446) : (i16, i16) -> i16
    %449 = "arith.minui"(%arg74, %445) : (i16, i16) -> i16
    %450 = "arith.muli"(%448, %449) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    %451 = "arith.cmpi"(%450, %444) <{predicate = 9 : i64}> : (i16, i16) -> i1
    %452 = "arith.cmpi"(%450, %447) <{predicate = 7 : i64}> : (i16, i16) -> i1
    %453 = "arith.andi"(%451, %452) : (i1, i1) -> i1
    "func.return"(%453) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "for_loop_with_increasing_arg"}> ({
    %437 = "arith.constant"() <{value = 0 : index}> : () -> index
    %438 = "arith.constant"() <{value = 1 : index}> : () -> index
    %439 = "arith.constant"() <{value = 4 : index}> : () -> index
    %440 = "arith.constant"() <{value = 16 : index}> : () -> index
    %441 = "scf.for"(%437, %439, %438, %437) ({
    ^bb0(%arg71: index, %arg72: index):
      %443 = "arith.addi"(%arg71, %arg72) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%443) : (index) -> ()
    }) : (index, index, index, index) -> index
    %442 = "arith.cmpi"(%441, %440) <{predicate = 7 : i64}> : (index, index) -> i1
    "func.return"(%442) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "for_loop_with_constant_result"}> ({
    %430 = "arith.constant"() <{value = 0 : index}> : () -> index
    %431 = "arith.constant"() <{value = 1 : index}> : () -> index
    %432 = "arith.constant"() <{value = 4 : index}> : () -> index
    %433 = "arith.constant"() <{value = true}> : () -> i1
    %434 = "scf.for"(%430, %432, %431, %433) ({
    ^bb0(%arg69: index, %arg70: i1):
      %435 = "arith.cmpi"(%arg69, %432) <{predicate = 7 : i64}> : (index, index) -> i1
      %436 = "arith.andi"(%435, %arg70) : (i1, i1) -> i1
      "scf.yield"(%436) : (i1) -> ()
    }) : (index, index, index, i1) -> i1
    "func.return"(%434) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "while_false"}> ({
  ^bb0(%arg66: index):
    %424 = "arith.constant"() <{value = 0 : index}> : () -> index
    %425 = "arith.constant"() <{value = 1 : index}> : () -> index
    %426 = "arith.constant"() <{value = 2 : index}> : () -> index
    %427 = "arith.divui"(%arg66, %426) : (index, index) -> index
    %428 = "scf.while"(%427) ({
    ^bb0(%arg68: index):
      %429 = "arith.cmpi"(%arg68, %424) <{predicate = 2 : i64}> : (index, index) -> i1
      "scf.condition"(%429, %arg68) : (i1, index) -> ()
    }, {
    ^bb0(%arg67: index):
      "scf.yield"(%426) : (index) -> ()
    }) : (index) -> index
    "func.return"(%428) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_bounds_positive"}> ({
  ^bb0(%arg65: index):
    %411 = "arith.constant"() <{value = 0 : index}> : () -> index
    %412 = "arith.constant"() <{value = 2 : index}> : () -> index
    %413 = "arith.constant"() <{value = 4 : index}> : () -> index
    %414 = "arith.maxsi"(%arg65, %412) : (index, index) -> index
    %415 = "arith.divsi"(%413, %414) : (index, index) -> index
    %416 = "arith.divui"(%413, %414) : (index, index) -> index
    %417 = "arith.cmpi"(%415, %411) <{predicate = 5 : i64}> : (index, index) -> i1
    %418 = "arith.cmpi"(%415, %412) <{predicate = 3 : i64}> : (index, index) -> i1
    %419 = "arith.cmpi"(%416, %411) <{predicate = 5 : i64}> : (index, index) -> i1
    %420 = "arith.cmpi"(%415, %412) <{predicate = 3 : i64}> : (index, index) -> i1
    %421 = "arith.andi"(%417, %418) : (i1, i1) -> i1
    %422 = "arith.andi"(%421, %419) : (i1, i1) -> i1
    %423 = "arith.andi"(%422, %420) : (i1, i1) -> i1
    "func.return"(%423) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_bounds_negative"}> ({
  ^bb0(%arg64: index):
    %400 = "arith.constant"() <{value = 0 : index}> : () -> index
    %401 = "arith.constant"() <{value = -2 : index}> : () -> index
    %402 = "arith.constant"() <{value = 4 : index}> : () -> index
    %403 = "arith.minsi"(%arg64, %401) : (index, index) -> index
    %404 = "arith.divsi"(%402, %403) : (index, index) -> index
    %405 = "arith.divui"(%402, %403) : (index, index) -> index
    %406 = "arith.cmpi"(%404, %400) <{predicate = 3 : i64}> : (index, index) -> i1
    %407 = "arith.cmpi"(%404, %401) <{predicate = 5 : i64}> : (index, index) -> i1
    %408 = "arith.cmpi"(%405, %400) <{predicate = 0 : i64}> : (index, index) -> i1
    %409 = "arith.andi"(%406, %407) : (i1, i1) -> i1
    %410 = "arith.andi"(%409, %408) : (i1, i1) -> i1
    "func.return"(%410) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_zero_undefined"}> ({
  ^bb0(%arg63: index):
    %394 = "arith.constant"() <{value = 0 : index}> : () -> index
    %395 = "arith.constant"() <{value = 1 : index}> : () -> index
    %396 = "arith.constant"() <{value = 4 : index}> : () -> index
    %397 = "arith.andi"(%arg63, %395) : (index, index) -> index
    %398 = "arith.divui"(%396, %397) : (index, index) -> index
    %399 = "arith.cmpi"(%398, %396) <{predicate = 7 : i64}> : (index, index) -> i1
    "func.return"(%399) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "div_refine_min"}> ({
  ^bb0(%arg62: index):
    %388 = "arith.constant"() <{value = 1 : index}> : () -> index
    %389 = "arith.constant"() <{value = 2 : index}> : () -> index
    %390 = "arith.constant"() <{value = 4 : index}> : () -> index
    %391 = "arith.andi"(%arg62, %389) : (index, index) -> index
    %392 = "arith.divui"(%390, %391) : (index, index) -> index
    %393 = "arith.cmpi"(%392, %388) <{predicate = 9 : i64}> : (index, index) -> i1
    "func.return"(%393) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "ceil_divui"}> ({
  ^bb0(%arg61: index):
    %376 = "arith.constant"() <{value = 0 : index}> : () -> index
    %377 = "arith.constant"() <{value = 1 : index}> : () -> index
    %378 = "arith.constant"() <{value = 3 : index}> : () -> index
    %379 = "arith.constant"() <{value = 4 : index}> : () -> index
    %380 = "arith.minui"(%arg61, %378) : (index, index) -> index
    %381 = "arith.maxui"(%380, %377) : (index, index) -> index
    %382 = "arith.ceildivui"(%381, %379) : (index, index) -> index
    %383 = "arith.cmpi"(%382, %377) <{predicate = 0 : i64}> : (index, index) -> i1
    %384 = "arith.maxui"(%380, %376) : (index, index) -> index
    %385 = "arith.ceildivui"(%384, %379) : (index, index) -> index
    %386 = "arith.cmpi"(%385, %377) <{predicate = 0 : i64}> : (index, index) -> i1
    %387 = "arith.andi"(%383, %386) : (i1, i1) -> i1
    "func.return"(%387) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "ceil_divui_by_zero_issue_131273"}> ({
    %373 = "test.with_bounds"() <{smax = 0 : i32, smin = -1 : i32, umax = 0 : i32, umin = -1 : i32}> : () -> i32
    %374 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %375 = "arith.ceildivui"(%374, %373) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "ceil_divsi"}> ({
  ^bb0(%arg60: index):
    %357 = "arith.constant"() <{value = 0 : index}> : () -> index
    %358 = "arith.constant"() <{value = 1 : index}> : () -> index
    %359 = "arith.constant"() <{value = 3 : index}> : () -> index
    %360 = "arith.constant"() <{value = 4 : index}> : () -> index
    %361 = "arith.constant"() <{value = -4 : index}> : () -> index
    %362 = "arith.minsi"(%arg60, %359) : (index, index) -> index
    %363 = "arith.maxsi"(%362, %358) : (index, index) -> index
    %364 = "arith.ceildivsi"(%363, %360) : (index, index) -> index
    %365 = "arith.cmpi"(%364, %358) <{predicate = 0 : i64}> : (index, index) -> i1
    %366 = "arith.ceildivsi"(%363, %361) : (index, index) -> index
    %367 = "arith.cmpi"(%366, %357) <{predicate = 0 : i64}> : (index, index) -> i1
    %368 = "arith.andi"(%365, %367) : (i1, i1) -> i1
    %369 = "arith.maxsi"(%362, %357) : (index, index) -> index
    %370 = "arith.ceildivsi"(%369, %360) : (index, index) -> index
    %371 = "arith.cmpi"(%370, %358) <{predicate = 0 : i64}> : (index, index) -> i1
    %372 = "arith.andi"(%368, %371) : (i1, i1) -> i1
    "func.return"(%372) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "ceil_divsi_full_range"}> ({
  ^bb0(%arg59: index):
    %355 = "arith.constant"() <{value = 64 : index}> : () -> index
    %356 = "arith.ceildivsi"(%arg59, %355) : (index, index) -> index
    "func.return"(%356) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "ceil_divsi_intmin_bug_115293"}> ({
    %350 = "test.with_bounds"() <{smax = -9223372036854775808 : si64, smin = -9223372036854775808 : si64, umax = 9223372036854775808 : ui64, umin = 9223372036854775808 : ui64}> : () -> i64
    %351 = "test.with_bounds"() <{smax = 1189465982 : si64, smin = 1189465982 : si64, umax = 1189465982 : ui64, umin = 1189465982 : ui64}> : () -> i64
    %352 = "test.with_bounds"() <{smax = 7754212542 : si64, smin = 7754212542 : si64, umax = 7754212542 : ui64, umin = 7754212542 : ui64}> : () -> i64
    %353 = "arith.ceildivsi"(%350, %351) : (i64, i64) -> i64
    %354 = "arith.cmpi"(%353, %352) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%354) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "floor_divsi"}> ({
  ^bb0(%arg58: index):
    %342 = "arith.constant"() <{value = 4 : index}> : () -> index
    %343 = "arith.constant"() <{value = -1 : index}> : () -> index
    %344 = "arith.constant"() <{value = -3 : index}> : () -> index
    %345 = "arith.constant"() <{value = -4 : index}> : () -> index
    %346 = "arith.minsi"(%arg58, %343) : (index, index) -> index
    %347 = "arith.maxsi"(%346, %345) : (index, index) -> index
    %348 = "arith.floordivsi"(%347, %342) : (index, index) -> index
    %349 = "arith.cmpi"(%348, %343) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"(%349) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remui_base"}> ({
  ^bb0(%arg56: index, %arg57: index):
    %336 = "arith.constant"() <{value = 2 : index}> : () -> index
    %337 = "arith.constant"() <{value = 4 : index}> : () -> index
    %338 = "arith.minui"(%arg57, %337) : (index, index) -> index
    %339 = "arith.maxui"(%338, %336) : (index, index) -> index
    %340 = "arith.remui"(%arg56, %339) : (index, index) -> index
    %341 = "arith.cmpi"(%340, %337) <{predicate = 6 : i64}> : (index, index) -> i1
    "func.return"(%341) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remui_base_maybe_zero"}> ({
  ^bb0(%arg54: index, %arg55: index):
    %331 = "arith.constant"() <{value = 4 : index}> : () -> index
    %332 = "arith.constant"() <{value = 5 : index}> : () -> index
    %333 = "arith.minui"(%arg55, %331) : (index, index) -> index
    %334 = "arith.remui"(%arg54, %333) : (index, index) -> index
    %335 = "arith.cmpi"(%334, %332) <{predicate = 6 : i64}> : (index, index) -> i1
    "func.return"(%335) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remsi_base"}> ({
  ^bb0(%arg52: index, %arg53: index):
    %318 = "arith.constant"() <{value = 0 : index}> : () -> index
    %319 = "arith.constant"() <{value = 2 : index}> : () -> index
    %320 = "arith.constant"() <{value = 4 : index}> : () -> index
    %321 = "arith.constant"() <{value = -4 : index}> : () -> index
    %322 = "arith.constant"() <{value = true}> : () -> i1
    %323 = "arith.minsi"(%arg53, %320) : (index, index) -> index
    %324 = "arith.maxsi"(%323, %319) : (index, index) -> index
    %325 = "arith.remsi"(%arg52, %324) : (index, index) -> index
    %326 = "arith.cmpi"(%325, %321) <{predicate = 4 : i64}> : (index, index) -> i1
    %327 = "arith.cmpi"(%325, %320) <{predicate = 2 : i64}> : (index, index) -> i1
    %328 = "arith.cmpi"(%325, %318) <{predicate = 5 : i64}> : (index, index) -> i1
    %329 = "arith.andi"(%326, %327) : (i1, i1) -> i1
    %330 = "arith.andi"(%328, %329) : (i1, i1) -> i1
    "func.return"(%330) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> i1, sym_name = "remsi_positive"}> ({
  ^bb0(%arg50: index, %arg51: index):
    %307 = "arith.constant"() <{value = 0 : index}> : () -> index
    %308 = "arith.constant"() <{value = 2 : index}> : () -> index
    %309 = "arith.constant"() <{value = 4 : index}> : () -> index
    %310 = "arith.constant"() <{value = true}> : () -> i1
    %311 = "arith.minsi"(%arg51, %309) : (index, index) -> index
    %312 = "arith.maxsi"(%311, %308) : (index, index) -> index
    %313 = "arith.maxsi"(%arg50, %307) : (index, index) -> index
    %314 = "arith.remsi"(%313, %312) : (index, index) -> index
    %315 = "arith.cmpi"(%314, %307) <{predicate = 5 : i64}> : (index, index) -> i1
    %316 = "arith.cmpi"(%314, %309) <{predicate = 2 : i64}> : (index, index) -> i1
    %317 = "arith.andi"(%315, %316) : (i1, i1) -> i1
    "func.return"(%317) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remui_restricted"}> ({
  ^bb0(%arg49: index):
    %298 = "arith.constant"() <{value = 2 : index}> : () -> index
    %299 = "arith.constant"() <{value = 3 : index}> : () -> index
    %300 = "arith.constant"() <{value = 4 : index}> : () -> index
    %301 = "arith.minui"(%arg49, %299) : (index, index) -> index
    %302 = "arith.maxui"(%301, %298) : (index, index) -> index
    %303 = "arith.remui"(%302, %300) : (index, index) -> index
    %304 = "arith.cmpi"(%303, %299) <{predicate = 7 : i64}> : (index, index) -> i1
    %305 = "arith.cmpi"(%303, %298) <{predicate = 9 : i64}> : (index, index) -> i1
    %306 = "arith.andi"(%304, %305) : (i1, i1) -> i1
    "func.return"(%306) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remsi_restricted"}> ({
  ^bb0(%arg48: index):
    %289 = "arith.constant"() <{value = 2 : index}> : () -> index
    %290 = "arith.constant"() <{value = 3 : index}> : () -> index
    %291 = "arith.constant"() <{value = -4 : index}> : () -> index
    %292 = "arith.minsi"(%arg48, %290) : (index, index) -> index
    %293 = "arith.maxsi"(%292, %289) : (index, index) -> index
    %294 = "arith.remsi"(%293, %291) : (index, index) -> index
    %295 = "arith.cmpi"(%294, %290) <{predicate = 7 : i64}> : (index, index) -> i1
    %296 = "arith.cmpi"(%294, %289) <{predicate = 9 : i64}> : (index, index) -> i1
    %297 = "arith.andi"(%295, %296) : (i1, i1) -> i1
    "func.return"(%297) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remui_restricted_fails"}> ({
  ^bb0(%arg47: index):
    %281 = "arith.constant"() <{value = 2 : index}> : () -> index
    %282 = "arith.constant"() <{value = 3 : index}> : () -> index
    %283 = "arith.constant"() <{value = 4 : index}> : () -> index
    %284 = "arith.constant"() <{value = 5 : index}> : () -> index
    %285 = "arith.minui"(%arg47, %284) : (index, index) -> index
    %286 = "arith.maxui"(%285, %282) : (index, index) -> index
    %287 = "arith.remui"(%286, %283) : (index, index) -> index
    %288 = "arith.cmpi"(%287, %281) <{predicate = 1 : i64}> : (index, index) -> i1
    "func.return"(%288) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "remsi_restricted_fails"}> ({
  ^bb0(%arg46: index):
    %273 = "arith.constant"() <{value = 2 : index}> : () -> index
    %274 = "arith.constant"() <{value = 3 : index}> : () -> index
    %275 = "arith.constant"() <{value = 5 : index}> : () -> index
    %276 = "arith.constant"() <{value = -4 : index}> : () -> index
    %277 = "arith.minsi"(%arg46, %275) : (index, index) -> index
    %278 = "arith.maxsi"(%277, %274) : (index, index) -> index
    %279 = "arith.remsi"(%278, %276) : (index, index) -> index
    %280 = "arith.cmpi"(%279, %273) <{predicate = 1 : i64}> : (index, index) -> i1
    "func.return"(%280) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "andi"}> ({
  ^bb0(%arg45: index):
    %264 = "arith.constant"() <{value = 2 : index}> : () -> index
    %265 = "arith.constant"() <{value = 5 : index}> : () -> index
    %266 = "arith.constant"() <{value = 7 : index}> : () -> index
    %267 = "arith.minsi"(%arg45, %265) : (index, index) -> index
    %268 = "arith.maxsi"(%267, %264) : (index, index) -> index
    %269 = "arith.andi"(%268, %266) : (index, index) -> index
    %270 = "arith.cmpi"(%269, %265) <{predicate = 8 : i64}> : (index, index) -> i1
    %271 = "arith.cmpi"(%269, %266) <{predicate = 7 : i64}> : (index, index) -> i1
    %272 = "arith.andi"(%270, %271) : (i1, i1) -> i1
    "func.return"(%272) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "andi_doesnt_make_nonnegative"}> ({
  ^bb0(%arg44: index):
    %259 = "arith.constant"() <{value = 0 : index}> : () -> index
    %260 = "arith.constant"() <{value = 1 : index}> : () -> index
    %261 = "arith.addi"(%arg44, %260) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %262 = "arith.andi"(%arg44, %261) : (index, index) -> index
    %263 = "arith.cmpi"(%262, %259) <{predicate = 5 : i64}> : (index, index) -> i1
    "func.return"(%263) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i128, i128) -> i1, sym_name = "ori"}> ({
  ^bb0(%arg42: i128, %arg43: i128):
    %254 = "arith.constant"() <{value = -1 : i128}> : () -> i128
    %255 = "arith.constant"() <{value = 0 : i128}> : () -> i128
    %256 = "arith.minsi"(%arg43, %254) : (i128, i128) -> i128
    %257 = "arith.ori"(%arg42, %256) : (i128, i128) -> i128
    %258 = "arith.cmpi"(%257, %255) <{predicate = 2 : i64}> : (i128, i128) -> i1
    "func.return"(%258) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "xori_issue_82168"}> ({
    %249 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %250 = "arith.constant"() <{value = 2060639849 : i64}> : () -> i64
    %251 = "test.with_bounds"() <{smax = 2060639850 : i64, smin = 2060639849 : i64, umax = 2060639850 : i64, umin = 2060639849 : i64}> : () -> i64
    %252 = "arith.xori"(%251, %250) : (i64, i64) -> i64
    %253 = "arith.cmpi"(%252, %249) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%253) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i1, i1), sym_name = "xori_i1"}> ({
    %244 = "arith.constant"() <{value = true}> : () -> i1
    %245 = "test.with_bounds"() <{smax = false, smin = false, umax = false, umin = false}> : () -> i1
    %246 = "test.with_bounds"() <{smax = true, smin = true, umax = true, umin = true}> : () -> i1
    %247 = "arith.xori"(%245, %244) : (i1, i1) -> i1
    %248 = "arith.xori"(%246, %244) : (i1, i1) -> i1
    "func.return"(%247, %248) : (i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i64) -> i1, sym_name = "xori"}> ({
  ^bb0(%arg40: i64, %arg41: i64):
    %235 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %236 = "arith.constant"() <{value = 7 : i64}> : () -> i64
    %237 = "arith.constant"() <{value = 15 : i64}> : () -> i64
    %238 = "arith.constant"() <{value = true}> : () -> i1
    %239 = "arith.minui"(%arg40, %236) : (i64, i64) -> i64
    %240 = "arith.minui"(%arg41, %237) : (i64, i64) -> i64
    %241 = "arith.xori"(%239, %240) : (i64, i64) -> i64
    %242 = "arith.cmpi"(%241, %237) <{predicate = 3 : i64}> : (i64, i64) -> i1
    %243 = "arith.xori"(%242, %238) : (i1, i1) -> i1
    "func.return"(%243) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "extui"}> ({
  ^bb0(%arg39: i16):
    %232 = "arith.constant"() <{value = 65535 : i32}> : () -> i32
    %233 = "arith.extui"(%arg39) : (i16) -> i32
    %234 = "arith.cmpi"(%233, %232) <{predicate = 7 : i64}> : (i32, i32) -> i1
    "func.return"(%234) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "extsi"}> ({
  ^bb0(%arg38: i16):
    %226 = "arith.constant"() <{value = 32767 : i32}> : () -> i32
    %227 = "arith.constant"() <{value = -32768 : i32}> : () -> i32
    %228 = "arith.extsi"(%arg38) : (i16) -> i32
    %229 = "arith.cmpi"(%228, %226) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %230 = "arith.cmpi"(%228, %227) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %231 = "arith.andi"(%229, %230) : (i1, i1) -> i1
    "func.return"(%231) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i1, sym_name = "trunci"}> ({
  ^bb0(%arg37: i32):
    %214 = "arith.constant"() <{value = -14 : i32}> : () -> i32
    %215 = "arith.constant"() <{value = -14 : i16}> : () -> i16
    %216 = "arith.constant"() <{value = -32768 : i32}> : () -> i32
    %217 = "arith.minsi"(%arg37, %214) : (i32, i32) -> i32
    %218 = "arith.maxsi"(%217, %216) : (i32, i32) -> i32
    %219 = "arith.trunci"(%218) <{overflowFlags = #arith.overflow<none>}> : (i32) -> i16
    %220 = "arith.cmpi"(%219, %215) <{predicate = 3 : i64}> : (i16, i16) -> i1
    %221 = "arith.extsi"(%219) : (i16) -> i32
    %222 = "arith.cmpi"(%221, %214) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %223 = "arith.cmpi"(%221, %216) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %224 = "arith.andi"(%220, %222) : (i1, i1) -> i1
    %225 = "arith.andi"(%224, %223) : (i1, i1) -> i1
    "func.return"(%225) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "index_cast"}> ({
  ^bb0(%arg36: index):
    %209 = "arith.constant"() <{value = -2147483648 : i64}> : () -> i64
    %210 = "arith.index_cast"(%arg36) : (index) -> i32
    %211 = "arith.index_cast"(%210) : (i32) -> index
    %212 = "arith.index_cast"(%209) : (i64) -> index
    %213 = "arith.cmpi"(%211, %212) <{predicate = 5 : i64}> : (index, index) -> i1
    "func.return"(%213) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i1) -> i1, sym_name = "shli"}> ({
  ^bb0(%arg34: i32, %arg35: i1):
    %194 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %195 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %196 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %197 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %198 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %199 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %200 = "arith.maxsi"(%arg34, %198) : (i32, i32) -> i32
    %201 = "arith.minsi"(%200, %194) : (i32, i32) -> i32
    %202 = "arith.select"(%arg35, %194, %195) : (i1, i32, i32) -> i32
    %203 = "arith.shli"(%201, %202) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %204 = "arith.cmpi"(%203, %199) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %205 = "arith.cmpi"(%203, %197) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %206 = "arith.cmpi"(%203, %196) <{predicate = 4 : i64}> : (i32, i32) -> i1
    %207 = "arith.andi"(%204, %205) : (i1, i1) -> i1
    %208 = "arith.andi"(%207, %206) : (i1, i1) -> i1
    "func.return"(%208) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i1, sym_name = "shrui"}> ({
  ^bb0(%arg33: i1):
    %183 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %184 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %185 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %186 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %187 = "arith.select"(%arg33, %183, %184) : (i1, i32, i32) -> i32
    %188 = "arith.shrui"(%186, %187) : (i32, i32) -> i32
    %189 = "arith.cmpi"(%188, %185) <{predicate = 7 : i64}> : (i32, i32) -> i1
    %190 = "arith.cmpi"(%188, %183) <{predicate = 9 : i64}> : (i32, i32) -> i1
    %191 = "arith.cmpi"(%188, %185) <{predicate = 9 : i64}> : (i32, i32) -> i1
    %192 = "arith.andi"(%189, %190) : (i1, i1) -> i1
    %193 = "arith.andi"(%192, %191) : (i1, i1) -> i1
    "func.return"(%193) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i1) -> i1, sym_name = "shrsi"}> ({
  ^bb0(%arg31: i32, %arg32: i1):
    %168 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %169 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %170 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %171 = "arith.constant"() <{value = 32 : i32}> : () -> i32
    %172 = "arith.constant"() <{value = -8 : i32}> : () -> i32
    %173 = "arith.constant"() <{value = -32 : i32}> : () -> i32
    %174 = "arith.maxsi"(%arg31, %173) : (i32, i32) -> i32
    %175 = "arith.minsi"(%174, %171) : (i32, i32) -> i32
    %176 = "arith.select"(%arg32, %168, %169) : (i1, i32, i32) -> i32
    %177 = "arith.shrsi"(%175, %176) : (i32, i32) -> i32
    %178 = "arith.cmpi"(%177, %172) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %179 = "arith.cmpi"(%177, %170) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %180 = "arith.cmpi"(%177, %168) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %181 = "arith.andi"(%178, %179) : (i1, i1) -> i1
    %182 = "arith.andi"(%181, %180) : (i1, i1) -> i1
    "func.return"(%182) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> i1, sym_name = "no_aggressive_eq"}> ({
  ^bb0(%arg30: index):
    %164 = "arith.constant"() <{value = 1 : index}> : () -> index
    %165 = "arith.andi"(%arg30, %164) : (index, index) -> index
    %166 = "arith.minui"(%arg30, %164) : (index, index) -> index
    %167 = "arith.cmpi"(%165, %166) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"(%167) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "select_union"}> ({
  ^bb0(%arg28: index, %arg29: i1):
    %154 = "arith.constant"() <{value = 64 : index}> : () -> index
    %155 = "arith.constant"() <{value = 100 : index}> : () -> index
    %156 = "arith.constant"() <{value = 128 : index}> : () -> index
    %157 = "arith.constant"() <{value = 192 : index}> : () -> index
    %158 = "arith.remui"(%arg28, %154) : (index, index) -> index
    %159 = "arith.addi"(%158, %156) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %160 = "arith.select"(%arg29, %158, %159) : (i1, index, index) -> index
    %161 = "arith.cmpi"(%160, %157) <{predicate = 2 : i64}> : (index, index) -> i1
    %162 = "arith.cmpi"(%155, %160) <{predicate = 1 : i64}> : (index, index) -> i1
    %163 = "arith.andi"(%161, %162) : (i1, i1) -> i1
    "func.return"(%163) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i1, sym_name = "select_undefined_union"}> ({
  ^bb0(%arg27: i1):
    %146 = "arith.constant"() <{value = 32 : index}> : () -> index
    %147 = "arith.constant"() <{value = 64 : index}> : () -> index
    %148 = "test.without_bounds"() : () -> index
    %149 = "arith.select"(%arg27, %148, %147) : (i1, index, index) -> index
    %150 = "arith.cmpi"(%149, %147) <{predicate = 0 : i64}> : (index, index) -> i1
    %151 = "test.without_bounds"() : () -> index
    %152 = "arith.select"(%150, %146, %151) : (i1, index, index) -> index
    %153 = "arith.cmpi"(%152, %146) <{predicate = 0 : i64}> : (index, index) -> i1
    "func.return"(%153) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "if_union"}> ({
  ^bb0(%arg25: index, %arg26: i1):
    %135 = "arith.constant"() <{value = 4 : index}> : () -> index
    %136 = "arith.constant"() <{value = 16 : index}> : () -> index
    %137 = "arith.constant"() <{value = -1 : index}> : () -> index
    %138 = "arith.constant"() <{value = -4 : index}> : () -> index
    %139 = "arith.minui"(%arg25, %135) : (index, index) -> index
    %140 = "scf.if"(%arg26) ({
      %145 = "arith.muli"(%139, %139) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%145) : (index) -> ()
    }, {
      %144 = "arith.muli"(%139, %137) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%144) : (index) -> ()
    }) : (i1) -> index
    %141 = "arith.cmpi"(%140, %136) <{predicate = 3 : i64}> : (index, index) -> i1
    %142 = "arith.cmpi"(%140, %138) <{predicate = 5 : i64}> : (index, index) -> i1
    %143 = "arith.andi"(%141, %142) : (i1, i1) -> i1
    "func.return"(%143) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "branch_union"}> ({
  ^bb0(%arg23: index, %arg24: i1):
    %124 = "arith.constant"() <{value = 4 : index}> : () -> index
    %125 = "arith.constant"() <{value = 16 : index}> : () -> index
    %126 = "arith.constant"() <{value = -1 : index}> : () -> index
    %127 = "arith.constant"() <{value = -4 : index}> : () -> index
    %128 = "arith.minui"(%arg23, %124) : (index, index) -> index
    "cf.cond_br"(%arg24)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %129 = "arith.muli"(%128, %128) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%129)[^bb3] : (index) -> ()
  ^bb2:  // pred: ^bb0
    %130 = "arith.muli"(%128, %126) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%130)[^bb3] : (index) -> ()
  ^bb3(%131: index):  // 2 preds: ^bb1, ^bb2
    %132 = "arith.cmpi"(%131, %125) <{predicate = 3 : i64}> : (index, index) -> i1
    %133 = "arith.cmpi"(%131, %127) <{predicate = 5 : i64}> : (index, index) -> i1
    %134 = "arith.andi"(%132, %133) : (i1, i1) -> i1
    "func.return"(%134) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, i1) -> i1, sym_name = "loop_bound_not_inferred_with_branch"}> ({
  ^bb0(%arg21: index, %arg22: i1):
    %112 = "arith.constant"() <{value = 0 : index}> : () -> index
    %113 = "arith.constant"() <{value = 1 : index}> : () -> index
    %114 = "arith.constant"() <{value = 4 : index}> : () -> index
    %115 = "arith.minui"(%arg21, %114) : (index, index) -> index
    "cf.br"(%112)[^bb2] : (index) -> ()
  ^bb1(%116: index):  // pred: ^bb2
    %117 = "arith.addi"(%116, %113) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%117)[^bb2] : (index) -> ()
  ^bb2(%118: index):  // 2 preds: ^bb0, ^bb1
    %119 = "arith.cmpi"(%118, %114) <{predicate = 6 : i64}> : (index, index) -> i1
    "cf.cond_br"(%119, %118, %118)[^bb1, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, index, index) -> ()
  ^bb3(%120: index):  // pred: ^bb2
    %121 = "arith.cmpi"(%120, %112) <{predicate = 5 : i64}> : (index, index) -> i1
    %122 = "arith.cmpi"(%120, %114) <{predicate = 2 : i64}> : (index, index) -> i1
    %123 = "arith.andi"(%121, %122) : (i1, i1) -> i1
    "func.return"(%123) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>) -> index, sym_name = "truncation_spillover"}> ({
  ^bb0(%arg18: memref<?xi32>):
    %104 = "arith.constant"() <{value = 0 : index}> : () -> index
    %105 = "arith.constant"() <{value = 1 : index}> : () -> index
    %106 = "arith.constant"() <{value = 2 : index}> : () -> index
    %107 = "arith.constant"() <{value = 49 : index}> : () -> index
    %108 = "scf.for"(%104, %106, %105, %104) ({
    ^bb0(%arg19: index, %arg20: index):
      %109 = "arith.divsi"(%arg20, %107) : (index, index) -> index
      %110 = "arith.index_cast"(%109) : (index) -> i32
      "memref.store"(%110, %arg18, %104) : (i32, memref<?xi32>, index) -> ()
      %111 = "arith.addi"(%arg20, %arg19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%111) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"(%108) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "trunc_catches_overflow"}> ({
  ^bb0(%arg17: i16):
    %95 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %96 = "arith.constant"() <{value = 130 : i16}> : () -> i16
    %97 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %98 = "arith.maxui"(%arg17, %95) : (i16, i16) -> i16
    %99 = "arith.minui"(%98, %96) : (i16, i16) -> i16
    %100 = "arith.trunci"(%99) <{overflowFlags = #arith.overflow<none>}> : (i16) -> i8
    %101 = "arith.cmpi"(%100, %97) <{predicate = 5 : i64}> : (i8, i8) -> i1
    %102 = "arith.cmpi"(%100, %97) <{predicate = 9 : i64}> : (i8, i8) -> i1
    %103 = "arith.andi"(%101, %102) : (i1, i1) -> i1
    "func.return"(%103) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "trunc_respects_same_high_half"}> ({
  ^bb0(%arg16: i16):
    %88 = "arith.constant"() <{value = 256 : i16}> : () -> i16
    %89 = "arith.constant"() <{value = 257 : i16}> : () -> i16
    %90 = "arith.constant"() <{value = 2 : i8}> : () -> i8
    %91 = "arith.maxui"(%arg16, %88) : (i16, i16) -> i16
    %92 = "arith.minui"(%91, %89) : (i16, i16) -> i16
    %93 = "arith.trunci"(%92) <{overflowFlags = #arith.overflow<none>}> : (i16) -> i8
    %94 = "arith.cmpi"(%93, %90) <{predicate = 5 : i64}> : (i8, i8) -> i1
    "func.return"(%94) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> i1, sym_name = "trunc_handles_small_signed_ranges"}> ({
  ^bb0(%arg15: i16):
    %78 = "arith.constant"() <{value = -2 : i16}> : () -> i16
    %79 = "arith.constant"() <{value = 2 : i16}> : () -> i16
    %80 = "arith.constant"() <{value = -2 : i8}> : () -> i8
    %81 = "arith.constant"() <{value = 2 : i8}> : () -> i8
    %82 = "arith.maxsi"(%arg15, %78) : (i16, i16) -> i16
    %83 = "arith.minsi"(%82, %79) : (i16, i16) -> i16
    %84 = "arith.trunci"(%83) <{overflowFlags = #arith.overflow<none>}> : (i16) -> i8
    %85 = "arith.cmpi"(%84, %80) <{predicate = 5 : i64}> : (i8, i8) -> i1
    %86 = "arith.cmpi"(%84, %81) <{predicate = 3 : i64}> : (i8, i8) -> i1
    %87 = "arith.andi"(%85, %86) : (i1, i1) -> i1
    "func.return"(%87) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i1, sym_name = "extui_uses_unsigned"}> ({
  ^bb0(%arg14: i32):
    %70 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %71 = "arith.constant"() <{value = 2147483648 : i64}> : () -> i64
    %72 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %73 = "arith.minui"(%arg14, %70) : (i32, i32) -> i32
    %74 = "arith.extui"(%73) : (i32) -> i64
    %75 = "arith.cmpi"(%74, %72) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %76 = "arith.cmpi"(%74, %71) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %77 = "arith.andi"(%75, %76) : (i1, i1) -> i1
    "func.return"(%77) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xindex, 4>) -> (), sym_name = "caller"}> ({
  ^bb0(%arg13: memref<?xindex, 4>):
    "func.call"(%arg13) <{callee = @callee}> : (memref<?xindex, 4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xindex, 4>) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg11: memref<?xindex, 4>):
    %67 = "arith.constant"() <{value = 1 : index}> : () -> index
    %68 = "arith.constant"() <{value = 0 : index}> : () -> index
    %69 = "affine.load"(%arg11) <{map = #map}> : (memref<?xindex, 4>) -> index
    "scf.for"(%68, %69, %67) ({
    ^bb0(%arg12: index):
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_i8_bounds"}> ({
    %63 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %64 = "test.with_bounds"() <{smax = 127 : i8, smin = -128 : i8, umax = -1 : i8, umin = 0 : i8}> : () -> i8
    %65 = "arith.addi"(%64, %63) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %66 = "test.reflect_bounds"(%65) : (i8) -> i8
    "func.return"(%66) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_1"}> ({
    %59 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %60 = "test.with_bounds"() <{smax = 127 : i8, smin = -128 : i8, umax = -1 : i8, umin = 0 : i8}> : () -> i8
    %61 = "arith.addi"(%60, %59) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %62 = "test.reflect_bounds"(%61) : (i8) -> i8
    "func.return"(%62) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_i8_wrap1"}> ({
    %55 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %56 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %57 = "arith.addi"(%56, %55) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %58 = "test.reflect_bounds"(%57) : (i8) -> i8
    "func.return"(%58) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_i8_wrap2"}> ({
    %51 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %52 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %53 = "arith.addi"(%52, %51) <{overflowFlags = #arith.overflow<nuw>}> : (i8, i8) -> i8
    %54 = "test.reflect_bounds"(%53) : (i8) -> i8
    "func.return"(%54) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_add_i8_nowrap"}> ({
    %47 = "arith.constant"() <{value = 1 : i8}> : () -> i8
    %48 = "test.with_bounds"() <{smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8}> : () -> i8
    %49 = "arith.addi"(%48, %47) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %50 = "test.reflect_bounds"(%49) : (i8) -> i8
    "func.return"(%50) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_sub_i8_wrap1"}> ({
    %43 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %44 = "test.with_bounds"() <{smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8}> : () -> i8
    %45 = "arith.subi"(%44, %43) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %46 = "test.reflect_bounds"(%45) : (i8) -> i8
    "func.return"(%46) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_sub_i8_wrap2"}> ({
    %39 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %40 = "test.with_bounds"() <{smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8}> : () -> i8
    %41 = "arith.subi"(%40, %39) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %42 = "test.reflect_bounds"(%41) : (i8) -> i8
    "func.return"(%42) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_sub_i8_nowrap"}> ({
    %35 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %36 = "test.with_bounds"() <{smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8}> : () -> i8
    %37 = "arith.subi"(%36, %35) <{overflowFlags = #arith.overflow<nuw>}> : (i8, i8) -> i8
    %38 = "test.reflect_bounds"(%37) : (i8) -> i8
    "func.return"(%38) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_mul_i8_wrap"}> ({
    %31 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %32 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %33 = "arith.muli"(%32, %31) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %34 = "test.reflect_bounds"(%33) : (i8) -> i8
    "func.return"(%34) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_mul_i8_nowrap"}> ({
    %27 = "arith.constant"() <{value = 10 : i8}> : () -> i8
    %28 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %29 = "arith.muli"(%28, %27) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %30 = "test.reflect_bounds"(%29) : (i8) -> i8
    "func.return"(%30) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_shl_i8_wrap1"}> ({
    %23 = "arith.constant"() <{value = 3 : i8}> : () -> i8
    %24 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %25 = "arith.shli"(%24, %23) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
    %26 = "test.reflect_bounds"(%25) : (i8) -> i8
    "func.return"(%26) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_shl_i8_wrap2"}> ({
    %19 = "arith.constant"() <{value = 3 : i8}> : () -> i8
    %20 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8}> : () -> i8
    %21 = "arith.shli"(%20, %19) <{overflowFlags = #arith.overflow<nuw>}> : (i8, i8) -> i8
    %22 = "test.reflect_bounds"(%21) : (i8) -> i8
    "func.return"(%22) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "test_shl_i8_nowrap"}> ({
    %15 = "arith.constant"() <{value = 3 : i8}> : () -> i8
    %16 = "test.with_bounds"() <{smax = 20 : i8, smin = 10 : i8, umax = 20 : ui8, umin = 10 : i8}> : () -> i8
    %17 = "arith.shli"(%16, %15) <{overflowFlags = #arith.overflow<nsw>}> : (i8, i8) -> i8
    %18 = "test.reflect_bounds"(%17) : (i8) -> i8
    "func.return"(%18) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> index, sym_name = "test_cmpf_propagates"}> ({
  ^bb0(%arg9: f32, %arg10: f32):
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    %11 = "arith.constant"() <{value = 2 : index}> : () -> index
    %12 = "arith.cmpf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>, predicate = 8 : i64}> : (f32, f32) -> i1
    %13 = "arith.select"(%12, %10, %11) : (i1, index, index) -> index
    %14 = "test.reflect_bounds"(%13) : (index) -> index
    "func.return"(%14) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_trip_loop"}> ({
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%8, %8, %8) ({
    ^bb0(%arg8: index):
      %9 = "index.floordivs"(%arg8, %arg8) : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_trip_loop2"}> ({
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = -1 : index}> : () -> index
    "scf.for"(%5, %5, %6) ({
    ^bb0(%arg7: index):
      %7 = "index.floordivs"(%arg7, %arg7) : (index, index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "noninteger_operation_result"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: i1):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "some_fp_op"() : () -> f32
    %2:2 = "scf.for"(%arg0, %arg1, %arg2, %0, %1) ({
    ^bb0(%arg4: index, %arg5: i32, %arg6: f32):
      %4:2 = "some_op"() : () -> (i32, f32)
      "scf.yield"(%4#0, %4#1) : (i32, f32) -> ()
    }) : (index, index, index, i32, f32) -> (i32, f32)
    %3 = "arith.select"(%arg3, %0, %2#0) : (i1, i32, i32) -> i32
    "use"(%3, %2#1) : (i32, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

