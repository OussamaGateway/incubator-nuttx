/****************************************************************************
 * arch/risc-v/src/common/riscv_macros.S
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 ****************************************************************************/

.file "riscv_macros.S"

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

#include <arch/arch.h>
#include <arch/irq.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/****************************************************************************
 * Name: save_ctx
 *
 * Parameter:
 *   in - Pointer to where the save is performed (e.g. sp)
 *
 * Description:
 *   Save the common context registers (i.e. work / temp / etc).
 *
 ****************************************************************************/

.macro save_ctx in

  REGSTORE   x1,  REG_X1(\in)    /* ra */
#ifdef RISCV_SAVE_GP
  REGSTORE   x3,  REG_X3(\in)    /* gp */
#endif
  REGSTORE   x4,  REG_X4(\in)    /* tp */
  REGSTORE   x5,  REG_X5(\in)    /* t0 */
  REGSTORE   x6,  REG_X6(\in)    /* t1 */
  REGSTORE   x7,  REG_X7(\in)    /* t2 */
  REGSTORE   x8,  REG_X8(\in)    /* s0 */
  REGSTORE   x9,  REG_X9(\in)    /* s1 */
  REGSTORE   x10, REG_X10(\in)   /* a0 */
  REGSTORE   x11, REG_X11(\in)   /* a1 */
  REGSTORE   x12, REG_X12(\in)   /* a2 */
  REGSTORE   x13, REG_X13(\in)   /* a3 */
  REGSTORE   x14, REG_X14(\in)   /* a4 */
  REGSTORE   x15, REG_X15(\in)   /* a5 */
  REGSTORE   x16, REG_X16(\in)   /* a6 */
  REGSTORE   x17, REG_X17(\in)   /* a7 */
  REGSTORE   x18, REG_X18(\in)   /* s2 */
  REGSTORE   x19, REG_X19(\in)   /* s3 */
  REGSTORE   x20, REG_X20(\in)   /* s4 */
  REGSTORE   x21, REG_X21(\in)   /* s5 */
  REGSTORE   x22, REG_X22(\in)   /* s6 */
  REGSTORE   x23, REG_X23(\in)   /* s7 */
  REGSTORE   x24, REG_X24(\in)   /* s8 */
  REGSTORE   x25, REG_X25(\in)   /* s9 */
  REGSTORE   x26, REG_X26(\in)   /* s10 */
  REGSTORE   x27, REG_X27(\in)   /* s11 */
  REGSTORE   x28, REG_X28(\in)   /* t3 */
  REGSTORE   x29, REG_X29(\in)   /* t4 */
  REGSTORE   x30, REG_X30(\in)   /* t5 */
  REGSTORE   x31, REG_X31(\in)   /* t6 */

.endm

/****************************************************************************
 * Name: load_ctx
 *
 * Parameter:
 *   out - Pointer to where the load is performed (e.g. sp)
 *
 * Description:
 *   Load the common context registers (i.e. work / temp / etc).
 *
 ****************************************************************************/

.macro load_ctx out

  REGLOAD    x1,  REG_X1(\out)   /* ra */
#ifdef RISCV_SAVE_GP
  REGLOAD    x3,  REG_X3(\out)   /* gp */
#endif
  REGLOAD    x4,  REG_X4(\out)   /* tp */
  REGLOAD    x5,  REG_X5(\out)   /* t0 */
  REGLOAD    x6,  REG_X6(\out)   /* t1 */
  REGLOAD    x7,  REG_X7(\out)   /* t2 */
  REGLOAD    x8,  REG_X8(\out)   /* s0 */
  REGLOAD    x9,  REG_X9(\out)   /* s1 */
  REGLOAD    x10, REG_X10(\out)  /* a0 */
  REGLOAD    x11, REG_X11(\out)  /* a1 */
  REGLOAD    x12, REG_X12(\out)  /* a2 */
  REGLOAD    x13, REG_X13(\out)  /* a3 */
  REGLOAD    x14, REG_X14(\out)  /* a4 */
  REGLOAD    x15, REG_X15(\out)  /* a5 */
  REGLOAD    x16, REG_X16(\out)  /* a6 */
  REGLOAD    x17, REG_X17(\out)  /* a7 */
  REGLOAD    x18, REG_X18(\out)  /* s2 */
  REGLOAD    x19, REG_X19(\out)  /* s3 */
  REGLOAD    x20, REG_X20(\out)  /* s4 */
  REGLOAD    x21, REG_X21(\out)  /* s5 */
  REGLOAD    x22, REG_X22(\out)  /* s6 */
  REGLOAD    x23, REG_X23(\out)  /* s7 */
  REGLOAD    x24, REG_X24(\out)  /* s8 */
  REGLOAD    x25, REG_X25(\out)  /* s9 */
  REGLOAD    x26, REG_X26(\out)  /* s10 */
  REGLOAD    x27, REG_X27(\out)  /* s11 */
  REGLOAD    x28, REG_X28(\out)  /* t3 */
  REGLOAD    x29, REG_X29(\out)  /* t4 */
  REGLOAD    x30, REG_X30(\out)  /* t5 */
  REGLOAD    x31, REG_X31(\out)  /* t6 */

.endm
