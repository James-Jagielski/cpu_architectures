`ifndef MEMMAP_H
`define MEMMAP_H
`define INST_L_WORDS 1024
`define DATA_L_WORDS 1024
`define MMU_DECODER_SIZE 4

// Use the top 4-bits of the address space to decode to different memory
// banks. This allows for simple (low delay) comb. logic to decide which
// memory subsystem the address applies to (see mmu.sv).
typedef enum logic [3:0] {
  MMU_BANK_INST = 4'b0000, 
  MMU_BANK_MMRS = 4'b0001, 
  MMU_BANK_VRAM = 4'b0010, 
  MMU_BANK_DATA = 4'b0011,
  MMU_BANK_DECODER_SIZE /* Adding this at the end of the enum makes sizing busses easier. */
} mmu_bank_t;


// Memory Mapped Registers
typedef enum logic [3:0]  {
  MMR_INDEX_LEDS,          // offset: 0x00
  MMR_INDEX_GPIO_MODE,     // offset: 0x04
  MMR_INDEX_GPIO_STATE,    // offset: 0x08
  MMR_INDEX_TIMER_1kHz,    // offset: 0x0c
  MMR_INDEX_TIMER_10kHz,   // offset: 0x10
  MMR_MAX_INDEX
} mmr_index_t;


function logic [31:0] mmr_address_from_index(mmr_index_t index);
  mmr_address_from_index = {MMU_BANK_MMRS, 22'b0, index, 2'b0};
endfunction

// Based on risc-v funct3[1:0] - do not change!
typedef enum logic [1:0] {
  MEM_ACCESS_WORD=2'b10, // 32 bits
  MEM_ACCESS_HALF=2'b01, // 16 bits
  MEM_ACCESS_BYTE=2'b00, //  8 bits
  MEM_ACCESS_INVALID=2'b11
} mem_access_t;

typedef enum logic [1:0] {
  MEM_EXCEPTION_INDEX_MISALIGNED = 0,
  MEM_EXCEPTION_INDEX_OUT_OF_RANGE = 1,
  MEM_EXCEPTION_INDEX_BANK_ERROR = 2
} mem_exception_index_t;

typedef enum logic [2:0] {
  MEM_EXCEPTION_NONE              = 0,
  MEM_EXCEPTION_MASK_MISALIGNED   = 1 << MEM_EXCEPTION_INDEX_MISALIGNED,
  MEM_EXCEPTION_MASK_OUT_OF_RANGE = 1 << MEM_EXCEPTION_INDEX_OUT_OF_RANGE,
  MEM_EXCEPTION_MASK_BANK_ERROR   = 1 << MEM_EXCEPTION_INDEX_BANK_ERROR
} mem_exception_mask_t;

interface memory_interface;
  logic i_ready, i_valid, o_ready, o_valid, wr_ena;
  logic [31:0] addr, rd_data, wr_data;
  // main interface
  modport main (
    input  o_ready, o_valid, rd_data,
    output i_ready, i_valid, wr_ena, addr, wr_data
  );
  // secondary interface
  modport secondary (
    output o_ready, o_valid, rd_data,
    input  i_ready, i_valid, wr_ena, addr, wr_data
  );
endinterface : memory_interface

`endif // MEMMAP_H
