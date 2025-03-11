

#ifndef __FREERTOS_RISC_V_EXTENSIONS_H__
#define __FREERTOS_RISC_V_EXTENSIONS_H__

#define portasmHAS_SIFIVE_CLINT           1
#define portasmHAS_MTIME                  1
#define portasmADDITIONAL_CONTEXT_SIZE    0 /* Must be even number on 32-bit cores. */

.macro portasmSAVE_ADDITIONAL_REGISTERS
/* No additional registers to save, so this macro does nothing. */
   .endm

   .macro portasmRESTORE_ADDITIONAL_REGISTERS
/* No additional registers to restore, so this macro does nothing. */
   .endm

#endif /* __FREERTOS_RISC_V_EXTENSIONS_H__ */
