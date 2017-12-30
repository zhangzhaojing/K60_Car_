///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:53
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\19071_000\Desktop\K60_Car\lib\LPLD\HW\HW_FLASH.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWE122.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\LPLD\HW\HW_FLASH.c -D
//        LPLD_K60 -D USE_K60DZ10 -lCN
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List -lB
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List -o
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\Obj
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\app\ -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\common\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\class\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\peripheral\
//        -Ol -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\Include\" -D ARM_MATH_CM4)
//    Locale       =  C
//    List file    =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\HW_FLASH.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC LPLD_Flash_ByteProgram
        PUBLIC LPLD_Flash_Init
        PUBLIC LPLD_Flash_SectorErase

// C:\Users\19071_000\Desktop\K60_Car\lib\LPLD\HW\HW_FLASH.c
//    1 /**
//    2  * @file HW_FLASH.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief FTFL�ײ�ģ����غ���
//    6  *
//    7  * ���Ľ���:�������޸�
//    8  *
//    9  * ��Ȩ����:�����������µ��Ӽ������޹�˾
//   10  * http://www.lpld.cn
//   11  * mail:support@lpld.cn
//   12  *
//   13  * @par
//   14  * ����������������[LPLD]������ά������������ʹ���߿���Դ���롣
//   15  * �����߿���������ʹ�û��Դ���롣�����μ�����ע��Ӧ���Ա�����
//   16  * ���ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߡ�
//   17  * ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾����
//   18  * �������²���������ʹ�ñ��������������κ��¹ʡ��������λ���ز���Ӱ�졣
//   19  * ����������������͡�˵��������ľ���ԭ�������ܡ�ʵ�ַ�����
//   20  * ������������[LPLD]��Ȩ�������߲��ý�������������ҵ��Ʒ��
//   21  */
//   22 #include "common.h"
//   23 #include "HW_FLASH.h"
//   24 
//   25 /*
//   26  * LPLD_Flash_Init
//   27  * Flashģ���ʼ��
//   28  * 
//   29  * ����:
//   30  *    ��
//   31  *
//   32  * ���:
//   33  *    ��
//   34  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   35 void LPLD_Flash_Init(void)
//   36 {
//   37 #if defined(CPU_MK60DZ10) || defined(CPU_MK60D10) 
//   38   //���Flash���ʴ���
//   39   if (FTFL->FSTAT & FTFL_FSTAT_ACCERR_MASK)
LPLD_Flash_Init:
        LDR.N    R0,??DataTable2  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??LPLD_Flash_Init_0
//   40   {
//   41     FTFL->FSTAT |= FTFL_FSTAT_ACCERR_MASK;       //��������־
        LDR.N    R0,??DataTable2  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2  ;; 0x40020000
        STRB     R0,[R1, #+0]
        B.N      ??LPLD_Flash_Init_1
//   42   }
//   43   //��鱣������
//   44   else if (FTFL->FSTAT & FTFL_FSTAT_FPVIOL_MASK)
??LPLD_Flash_Init_0:
        LDR.N    R0,??DataTable2  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??LPLD_Flash_Init_2
//   45   {
//   46     FTFL->FSTAT |= FTFL_FSTAT_FPVIOL_MASK;
        LDR.N    R0,??DataTable2  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable2  ;; 0x40020000
        STRB     R0,[R1, #+0]
        B.N      ??LPLD_Flash_Init_1
//   47   }
//   48   //������ͻ����
//   49   else if (FTFL->FSTAT & FTFL_FSTAT_RDCOLERR_MASK)
??LPLD_Flash_Init_2:
        LDR.N    R0,??DataTable2  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??LPLD_Flash_Init_1
//   50   {
//   51     FTFL->FSTAT |= FTFL_FSTAT_RDCOLERR_MASK;
        LDR.N    R0,??DataTable2  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable2  ;; 0x40020000
        STRB     R0,[R1, #+0]
//   52   }
//   53   
//   54   //����Flashģ������ݻ���
//   55   FMC->PFB0CR &= ~FMC_PFB0CR_B0DCE_MASK;
??LPLD_Flash_Init_1:
        LDR.N    R0,??DataTable2_1  ;; 0x4001f004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10
        LDR.N    R1,??DataTable2_1  ;; 0x4001f004
        STR      R0,[R1, #+0]
//   56   FMC->PFB1CR &= ~FMC_PFB1CR_B1DCE_MASK;
        LDR.N    R0,??DataTable2_2  ;; 0x4001f008
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10
        LDR.N    R1,??DataTable2_2  ;; 0x4001f008
        STR      R0,[R1, #+0]
//   57 #elif defined(CPU_MK60F12) || defined(CPU_MK60F15)  
//   58   //���Flash���ʴ���
//   59   if (FTFE->FSTAT & FTFE_FSTAT_ACCERR_MASK)
//   60   {
//   61     FTFE->FSTAT |= FTFE_FSTAT_ACCERR_MASK;//��������־
//   62   }
//   63   //��鱣������
//   64   else if (FTFE->FSTAT & FTFE_FSTAT_FPVIOL_MASK)
//   65   {
//   66     FTFE->FSTAT |= FTFE_FSTAT_FPVIOL_MASK;
//   67   }
//   68   else if (FTFE->FSTAT & FTFE_FSTAT_RDCOLERR_MASK)
//   69   {
//   70   //������ͻ����
//   71     FTFE->FSTAT |= FTFE_FSTAT_RDCOLERR_MASK;
//   72   } /* EndIf */
//   73   //����Flashģ������ݻ���
//   74   FMC->PFB01CR &= ~FMC_PFB01CR_B01DCE_MASK;
//   75   FMC->PFB23CR &= ~FMC_PFB23CR_B23DCE_MASK;
//   76 #endif
//   77 } 
        BX       LR               ;; return
//   78 
//   79 
//   80 /*
//   81  * LPLD_Flash_SectorErase
//   82  * ����Flash����
//   83  * 
//   84  * ����:
//   85  *    FlashPtr--������ַָ�룬�������ų���2048
//   86  *
//   87  * ���:
//   88  *    �������
//   89  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   90 uint8 LPLD_Flash_SectorErase(uint32 FlashPtr)
//   91 {
LPLD_Flash_SectorErase:
        MOVS     R1,R0
//   92   uint8 Return = FLASH_OK;
        MOVS     R0,#+0
//   93 #if defined(CPU_MK60DZ10) || defined(CPU_MK60D10)   
//   94   //�ȴ�CCIF��1
//   95   while (!(FTFL->FSTAT & FTFL_FSTAT_CCIF_MASK)){};
??LPLD_Flash_SectorErase_0:
        LDR.N    R2,??DataTable2  ;; 0x40020000
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+24
        BPL.N    ??LPLD_Flash_SectorErase_0
//   96   //д�������FCCOB�Ĵ���
//   97   FTFL->FCCOB0 = FLASH_CMD_ERSSCR;
        MOVS     R2,#+9
        LDR.N    R3,??DataTable2_3  ;; 0x40020007
        STRB     R2,[R3, #+0]
//   98   FTFL->FCCOB1 = (uint8) (FlashPtr >> 16);
        MOVS     R2,R1
        LSRS     R2,R2,#+16
        LDR.N    R3,??DataTable2_4  ;; 0x40020006
        STRB     R2,[R3, #+0]
//   99   FTFL->FCCOB2 = (uint8)((FlashPtr >> 8 ) & 0xFF);
        MOVS     R2,R1
        LSRS     R2,R2,#+8
        LDR.N    R3,??DataTable2_5  ;; 0x40020005
        STRB     R2,[R3, #+0]
//  100   FTFL->FCCOB3 = (uint8)( FlashPtr & 0xFF);
        LDR.N    R2,??DataTable2_6  ;; 0x40020004
        STRB     R1,[R2, #+0]
//  101   
//  102   //ִ������
//  103   FTFL->FSTAT |= FTFL_FSTAT_CCIF_MASK;    
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x80
        LDR.N    R2,??DataTable2  ;; 0x40020000
        STRB     R1,[R2, #+0]
//  104   //�ȴ��������
//  105   while (!(FTFL->FSTAT & FTFL_FSTAT_CCIF_MASK)) {};
??LPLD_Flash_SectorErase_1:
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??LPLD_Flash_SectorErase_1
//  106   
//  107   //���Flash���ʴ���
//  108   if (FTFL->FSTAT & FTFL_FSTAT_ACCERR_MASK)
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+26
        BPL.N    ??LPLD_Flash_SectorErase_2
//  109   {
//  110     FTFL->FSTAT |= FTFL_FSTAT_ACCERR_MASK;       //��������־
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x20
        LDR.N    R2,??DataTable2  ;; 0x40020000
        STRB     R1,[R2, #+0]
//  111     Return |= FLASH_FACCERR;                    //���·���ֵ
        ORRS     R0,R0,#0x1
        B.N      ??LPLD_Flash_SectorErase_3
//  112   }
//  113   //���Flash������־
//  114   else if (FTFL->FSTAT & FTFL_FSTAT_FPVIOL_MASK)
??LPLD_Flash_SectorErase_2:
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+27
        BPL.N    ??LPLD_Flash_SectorErase_4
//  115   {
//  116     FTFL->FSTAT |= FTFL_FSTAT_FPVIOL_MASK;
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.N    R2,??DataTable2  ;; 0x40020000
        STRB     R1,[R2, #+0]
//  117     Return |= FLASH_FPVIOL;
        ORRS     R0,R0,#0x2
        B.N      ??LPLD_Flash_SectorErase_3
//  118   }
//  119   //���Flash����ͻ����
//  120   else if (FTFL->FSTAT & FTFL_FSTAT_RDCOLERR_MASK)
??LPLD_Flash_SectorErase_4:
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+25
        BPL.N    ??LPLD_Flash_SectorErase_5
//  121   {
//  122     FTFL->FSTAT |= FTFL_FSTAT_RDCOLERR_MASK;
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        LDR.N    R2,??DataTable2  ;; 0x40020000
        STRB     R1,[R2, #+0]
//  123     Return |= FLASH_RDCOLERR;
        ORRS     R0,R0,#0x8
        B.N      ??LPLD_Flash_SectorErase_3
//  124   }
//  125   //���MGSTAT0�ǿɾ�������
//  126   else if (FTFL->FSTAT & FTFL_FSTAT_MGSTAT0_MASK)
??LPLD_Flash_SectorErase_5:
        LDR.N    R1,??DataTable2  ;; 0x40020000
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+31
        BPL.N    ??LPLD_Flash_SectorErase_3
//  127   {
//  128     Return |= FLASH_MGSTAT0;
        ORRS     R0,R0,#0x4
//  129   } 
//  130 #elif defined(CPU_MK60F12) || defined(CPU_MK60F15)
//  131   //�ȴ�CCIF��1
//  132   while (!(FTFE->FSTAT & FTFE_FSTAT_CCIF_MASK)){};
//  133   //д�������FCCOB�Ĵ���
//  134   FTFE->FCCOB0 = FlashCmd_SectorErase;
//  135   FTFE->FCCOB1 = (uint8_t) (FlashPtr >> 16);
//  136   FTFE->FCCOB2 = (uint8_t)((FlashPtr >> 8 ) & 0xFF);
//  137   FTFE->FCCOB3 = (uint8_t)( FlashPtr & 0xFF);
//  138 
//  139   //ִ������
//  140   FTFE->FSTAT |= FTFE_FSTAT_CCIF_MASK;    
//  141   //�ȴ��������
//  142   while (!(FTFE->FSTAT & FTFE_FSTAT_CCIF_MASK)) {};
//  143   //���Flash���ʴ���
//  144   if (FTFE->FSTAT & FTFE_FSTAT_ACCERR_MASK)
//  145   {
//  146     FTFE->FSTAT |= FTFE_FSTAT_ACCERR_MASK; //��������־
//  147     Return |= FLASH_FACCERR;              //���·���ֵ
//  148   }
//  149   //���Flash������־
//  150   else if (FTFE->FSTAT & FTFE_FSTAT_FPVIOL_MASK)
//  151   {
//  152     FTFE->FSTAT |= FTFE_FSTAT_FPVIOL_MASK;
//  153     Return |= FLASH_FPVIOL;
//  154   }
//  155   else if (FTFE->FSTAT & FTFE_FSTAT_RDCOLERR_MASK)
//  156   {
//  157     FTFE->FSTAT |= FTFE_FSTAT_RDCOLERR_MASK;
//  158     Return |= FLASH_RDCOLERR;
//  159   }
//  160   //���Flash����ͻ����
//  161   else if (FTFE->FSTAT & FTFE_FSTAT_MGSTAT0_MASK)
//  162   {
//  163     Return |= FLASH_MGSTAT0;
//  164   } 
//  165 #endif
//  166   return  Return;
??LPLD_Flash_SectorErase_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  167 }
//  168 
//  169 /*
//  170  * LPLD_Flash_ByteProgram
//  171  * ���Flash
//  172  * 
//  173  * ����:
//  174  *    FlashStartAdd--Flash�����ʼ��ַ
//  175  *    *DataSrcPtr--����Դָ��
//  176  *    NumberOfBytes--�����ֽڳ���
//  177  *
//  178  * ���:
//  179  *    �������
//  180  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  181 uint8 LPLD_Flash_ByteProgram(uint32 FlashStartAdd, uint32 *DataSrcPtr, uint32 NumberOfBytes)
//  182 {
LPLD_Flash_ByteProgram:
        PUSH     {R4,R5}
        MOVS     R3,R0
//  183   uint8 Return = FLASH_OK;
        MOVS     R0,#+0
//  184   
//  185   uint32 size_buffer;
//  186   
//  187   if (NumberOfBytes == 0)
        CMP      R2,#+0
        BNE.N    ??LPLD_Flash_ByteProgram_0
//  188   {
//  189     return FLASH_CONTENTERR;
        MOVS     R0,#+17
        B.N      ??LPLD_Flash_ByteProgram_1
//  190   }
//  191   else
//  192   {
//  193     size_buffer = (NumberOfBytes - 1)/BYTE_DIV + 1;
??LPLD_Flash_ByteProgram_0:
        SUBS     R2,R2,#+1
        LSRS     R2,R2,#+2
        ADDS     R2,R2,#+1
//  194   }
//  195 #if defined(CPU_MK60DZ10) || defined(CPU_MK60D10)
//  196   //�ȴ�ֱ��CCIF����
//  197   while (!(FTFL->FSTAT & FTFL_FSTAT_CCIF_MASK)){};
??LPLD_Flash_ByteProgram_2:
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+24
        BPL.N    ??LPLD_Flash_ByteProgram_2
//  198 
//  199   while ((size_buffer) && (Return == FLASH_OK))
??LPLD_Flash_ByteProgram_3:
        CMP      R2,#+0
        BEQ.N    ??LPLD_Flash_ByteProgram_4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??LPLD_Flash_ByteProgram_4
//  200   {
//  201     //дFLASH���FCCOB
//  202     FTFL->FCCOB0 = FLASH_CMD_PGM4;
        MOVS     R4,#+6
        LDR.N    R5,??DataTable2_3  ;; 0x40020007
        STRB     R4,[R5, #+0]
//  203     FTFL->FCCOB1 = (uint8)(FlashStartAdd >> 16);
        MOVS     R4,R3
        LSRS     R4,R4,#+16
        LDR.N    R5,??DataTable2_4  ;; 0x40020006
        STRB     R4,[R5, #+0]
//  204     FTFL->FCCOB2 = (uint8)((FlashStartAdd >> 8) & 0xFF);
        MOVS     R4,R3
        LSRS     R4,R4,#+8
        LDR.N    R5,??DataTable2_5  ;; 0x40020005
        STRB     R4,[R5, #+0]
//  205     FTFL->FCCOB3 = (uint8)(FlashStartAdd & 0xFF);
        LDR.N    R4,??DataTable2_6  ;; 0x40020004
        STRB     R3,[R4, #+0]
//  206     //���K60���ó�ΪС�˸�ʽ���������²���
//  207     FTFL->FCCOB4 = (uint8)(*((uint8*)DataSrcPtr+3));
        LDRB     R4,[R1, #+3]
        LDR.N    R5,??DataTable2_7  ;; 0x4002000b
        STRB     R4,[R5, #+0]
//  208     FTFL->FCCOB5 = (uint8)(*((uint8*)DataSrcPtr+2));
        LDRB     R4,[R1, #+2]
        LDR.N    R5,??DataTable2_8  ;; 0x4002000a
        STRB     R4,[R5, #+0]
//  209     FTFL->FCCOB6 = (uint8)(*((uint8*)DataSrcPtr+1));
        LDRB     R4,[R1, #+1]
        LDR.N    R5,??DataTable2_9  ;; 0x40020009
        STRB     R4,[R5, #+0]
//  210     FTFL->FCCOB7 = (uint8)(*((uint8*)DataSrcPtr+0));
        LDRB     R4,[R1, #+0]
        LDR.N    R5,??DataTable2_10  ;; 0x40020008
        STRB     R4,[R5, #+0]
//  211     //���K60���ó�Ϊ��˸�ʽ���������²���
//  212     //FTFL_FCCOB4 = (uint8)(*((uint_8*)DataSrcPtr+0));
//  213     //FTFL_FCCOB5 = (uint8)(*((uint_8*)DataSrcPtr+1));
//  214     //FTFL_FCCOB6 = (uint8)(*((uint_8*)DataSrcPtr+2));
//  215     //FTFL_FCCOB7 = (uint8)(*((uint_8*)DataSrcPtr+3));
//  216     //����FLASH��������
//  217     FTFL->FSTAT |= FTFL_FSTAT_CCIF_MASK;    
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        ORRS     R4,R4,#0x80
        LDR.N    R5,??DataTable2  ;; 0x40020000
        STRB     R4,[R5, #+0]
//  218     //�ȴ��������
//  219     while (!(FTFL->FSTAT & FTFL_FSTAT_CCIF_MASK)) {};
??LPLD_Flash_ByteProgram_5:
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+24
        BPL.N    ??LPLD_Flash_ByteProgram_5
//  220     
//  221     //���FLASH���ʴ���
//  222     if (FTFL->FSTAT & FTFL_FSTAT_ACCERR_MASK)
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+26
        BPL.N    ??LPLD_Flash_ByteProgram_6
//  223     {
//  224         
//  225         FTFL->FSTAT |= FTFL_FSTAT_ACCERR_MASK;
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        ORRS     R4,R4,#0x20
        LDR.N    R5,??DataTable2  ;; 0x40020000
        STRB     R4,[R5, #+0]
//  226     
//  227         Return |= FLASH_FACCERR;
        ORRS     R0,R0,#0x1
        B.N      ??LPLD_Flash_ByteProgram_7
//  228     }
//  229     //���FLASH��������
//  230     else if (FTFL->FSTAT & FTFL_FSTAT_FPVIOL_MASK)
??LPLD_Flash_ByteProgram_6:
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+27
        BPL.N    ??LPLD_Flash_ByteProgram_8
//  231     {
//  232         FTFL->FSTAT |= FTFL_FSTAT_FPVIOL_MASK;
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        ORRS     R4,R4,#0x10
        LDR.N    R5,??DataTable2  ;; 0x40020000
        STRB     R4,[R5, #+0]
//  233     
//  234         Return |= FLASH_FPVIOL;
        ORRS     R0,R0,#0x2
        B.N      ??LPLD_Flash_ByteProgram_7
//  235     }
//  236     
//  237     else if (FTFL->FSTAT & FTFL_FSTAT_RDCOLERR_MASK)
??LPLD_Flash_ByteProgram_8:
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+25
        BPL.N    ??LPLD_Flash_ByteProgram_9
//  238     {
//  239         FTFL->FSTAT |= FTFL_FSTAT_RDCOLERR_MASK;
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        ORRS     R4,R4,#0x40
        LDR.N    R5,??DataTable2  ;; 0x40020000
        STRB     R4,[R5, #+0]
//  240     
//  241         Return |= FLASH_RDCOLERR;
        ORRS     R0,R0,#0x8
        B.N      ??LPLD_Flash_ByteProgram_7
//  242     }
//  243     else if (FTFL->FSTAT & FTFL_FSTAT_MGSTAT0_MASK)
??LPLD_Flash_ByteProgram_9:
        LDR.N    R4,??DataTable2  ;; 0x40020000
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+31
        BPL.N    ??LPLD_Flash_ByteProgram_7
//  244     {
//  245         Return |= FLASH_MGSTAT0;
        ORRS     R0,R0,#0x4
//  246     } 
//  247     size_buffer --;
??LPLD_Flash_ByteProgram_7:
        SUBS     R2,R2,#+1
//  248     (uint32*)DataSrcPtr++;
        ADDS     R1,R1,#+4
//  249     FlashStartAdd +=4;
        ADDS     R3,R3,#+4
        B.N      ??LPLD_Flash_ByteProgram_3
//  250   }
//  251 #elif defined(CPU_MK60F12) || defined(CPU_MK60F15) 
//  252   //�ȴ�ֱ��CCIF����
//  253   while (!(FTFE->FSTAT & FTFE_FSTAT_CCIF_MASK)){};
//  254 
//  255   while ((size_buffer) && (Return == FLASH_OK))
//  256   {
//  257     //дFLASH���FCCOB
//  258     FTFE->FCCOB0 = FlashCmd_ProgramPhrase;
//  259     FTFE->FCCOB1 = (uint8_t)( FlashStartAdd >> 16);
//  260     FTFE->FCCOB2 = (uint8_t)((FlashStartAdd >>  8) & 0xFF);
//  261     FTFE->FCCOB3 = (uint8_t)( FlashStartAdd & 0xFF);
//  262     //���K60���ó�ΪС�˸�ʽ���������²���
//  263     FTFE->FCCOB4 = (uint8_t)(*((uint8_t*)DataSrcPtr+3));
//  264     FTFE->FCCOB5 = (uint8_t)(*((uint8_t*)DataSrcPtr+2));
//  265     FTFE->FCCOB6 = (uint8_t)(*((uint8_t*)DataSrcPtr+1));
//  266     FTFE->FCCOB7 = (uint8_t)(*((uint8_t*)DataSrcPtr+0));
//  267     FTFE->FCCOB8 = (uint8_t)(*((uint8_t*)DataSrcPtr+7));
//  268     FTFE->FCCOB9 = (uint8_t)(*((uint8_t*)DataSrcPtr+6));
//  269     FTFE->FCCOBA = (uint8_t)(*((uint8_t*)DataSrcPtr+5));
//  270     FTFE->FCCOBB = (uint8_t)(*((uint8_t*)DataSrcPtr+4));
//  271     //���K60���ó�Ϊ��˸�ʽ���������²���
//  272     //FTFE_FCCOB4 = (uint8_t)(*((uint_8*)DataSrcPtr+0));
//  273     //FTFE_FCCOB5 = (uint8_t)(*((uint_8*)DataSrcPtr+1));
//  274     //FTFE_FCCOB6 = (uint8_t)(*((uint_8*)DataSrcPtr+2));
//  275     //FTFE_FCCOB7 = (uint8_t)(*((uint_8*)DataSrcPtr+3));
//  276     //����FLASH��������
//  277     FTFE->FSTAT |= FTFE_FSTAT_CCIF_MASK;    
//  278     //�ȴ��������
//  279     while (!(FTFE->FSTAT & FTFE_FSTAT_CCIF_MASK)) {};
//  280 
//  281     //���FLASH���ʴ���
//  282     if (FTFE->FSTAT & FTFE_FSTAT_ACCERR_MASK)
//  283     {
//  284       FTFE->FSTAT |= FTFE_FSTAT_ACCERR_MASK;
//  285       Return |= FLASH_FACCERR;
//  286     }
//  287     //���FLASH��������
//  288     else if (FTFE->FSTAT & FTFE_FSTAT_FPVIOL_MASK)
//  289     {
//  290       FTFE->FSTAT |= FTFE_FSTAT_FPVIOL_MASK;
//  291       Return |= FLASH_FPVIOL;
//  292     }
//  293     else if (FTFE->FSTAT & FTFE_FSTAT_RDCOLERR_MASK)
//  294     {
//  295       FTFE->FSTAT |= FTFE_FSTAT_RDCOLERR_MASK;
//  296       Return |= FLASH_RDCOLERR;
//  297     }
//  298     else if (FTFE->FSTAT & FTFE_FSTAT_MGSTAT0_MASK)
//  299     {
//  300         Return |= FLASH_MGSTAT0;
//  301     } 
//  302     //����ƫ����
//  303     size_buffer --;
//  304     DataSrcPtr += 2;     
//  305     FlashStartAdd +=BYTE_DIV;
//  306   }
//  307 #endif
//  308   return  Return;
??LPLD_Flash_ByteProgram_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LPLD_Flash_ByteProgram_1:
        POP      {R4,R5}
        BX       LR               ;; return
//  309 } 

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4001f004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4001f008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40020008

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 498 bytes in section .text
// 
// 498 bytes of CODE memory
//
//Errors: none
//Warnings: none