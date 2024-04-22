OUTPUT_ARCH(riscv)  /* 设置目标平台 */
ENTRY(_start)       /* 设置入口 */
BASE_ADDRESS = 0X80200000;  /* 定义常量 */

SECTIONS
{
    . = BASE_ADDRESS;  /*调整接下来的段放在哪里*/
    skernel = .;

    stext = .;
    .text : {
        *(.text.entry)   /* 表明entry在代码段的最前面(最低位) */
        *(.text .text.*)
    }

    . = ALIGN(4K);
    etext = .;
    srodata = .;
    .rodata : {
        *(.rodata .rodata.*)
    }

    . = ALIGN(4K);
    erodata = .;
    sdata = .;
    .data : {
        *(.data .data.*)
    }

    . = ALIGN(4K);
    edata = .;
    .bss : {
        *(.bss.stack)
        sbss = .;
        *(.bss .bss.*)
    }

    . = ALIGN(4K);
    ebss = .;
    ekernel = .;

    /DISCARD/ : {
        *(.eh_frame)
    }
}