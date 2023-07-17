
#define ___opcode_identity32(x) ((unsigned int)(x))

#define __opcode_to_mem_arm(x) ___opcode_identity32(x)

#define __mem_to_opcode_arm(x) __opcode_to_mem_arm(x)