/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/DIST/home/peters/nadja_cam_repo/I2C/i2cmaster.vhd";
extern char *IEEE_P_2592010699;



static void work_a_1235049095_1775861178_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;

LAB0:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8800);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 3592U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 8912);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3912U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 8976);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4232U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 9040);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 5192U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 9104);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 4872U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 9168);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 4552U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t2 = (t0 + 9232);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 5512U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t2 = (t0 + 9296);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t15;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 5832U);
    t4 = *((char **)t2);
    t15 = *((int *)t4);
    t2 = (t0 + 9360);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t15;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 6152U);
    t4 = *((char **)t2);
    t2 = (t0 + 15544U);
    t5 = ((IEEE_P_2592010699) + 4000);
    xsi_array_value_range_check(t5, t4, t2, 8U);
    t8 = (t0 + 9424);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 6472U);
    t4 = *((char **)t2);
    t2 = (t0 + 15560U);
    t5 = ((IEEE_P_2592010699) + 4000);
    xsi_array_value_range_check(t5, t4, t2, 8U);
    t8 = (t0 + 9488);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t4, 8U);
    xsi_driver_first_trans_fast(t8);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(88, ng0);
    t4 = (t0 + 8912);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 8976);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 9040);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 9104);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 9168);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 9232);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 9296);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 9360);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(96, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t4 = t2;
    memset(t4, (unsigned char)2, 8U);
    t5 = (t0 + 9424);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(97, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t4 = t2;
    memset(t4, (unsigned char)2, 8U);
    t5 = (t0 + 9488);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    goto LAB9;

}

static void work_a_1235049095_1775861178_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14, &&LAB15, &&LAB16, &&LAB17, &&LAB18, &&LAB19, &&LAB20, &&LAB21};

LAB0:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(121, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9616);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9680);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(123, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9744);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(124, ng0);
    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9808);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(125, ng0);
    t1 = (t0 + 4392U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9872);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(126, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 9936);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(127, ng0);
    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t1 = (t0 + 10000);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(128, ng0);
    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t1 = (t0 + 15560U);
    t4 = ((IEEE_P_2592010699) + 4000);
    xsi_array_value_range_check(t4, t2, t1, 8U);
    t5 = (t0 + 10064);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(129, ng0);
    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t1 = (t0 + 15544U);
    t4 = ((IEEE_P_2592010699) + 4000);
    xsi_array_value_range_check(t4, t2, t1, 8U);
    t5 = (t0 + 10128);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(135, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(136, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(137, ng0);
    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 == 0);
    if (t3 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(141, ng0);
    t1 = (t0 + 5672U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t11 = (t8 - 1);
    if (t11 < 0LL)
        goto LAB5;

LAB6:    if (t11 > 126LL)
        goto LAB5;

LAB7:    t1 = (t0 + 10000);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t11;
    xsi_driver_first_trans_fast(t1);

LAB3:    xsi_set_current_line(145, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(146, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    xsi_set_current_line(138, ng0);
    t1 = (t0 + 10000);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(139, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB3;

LAB5:    xsi_value_out_of_range_error_int64(0LL, 126LL, t11);
    goto LAB7;

LAB8:    xsi_set_current_line(278, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB95;

LAB97:
LAB96:    t1 = (t0 + 8816);
    *((int *)t1) = 1;

LAB1:    return;
LAB9:    xsi_set_current_line(147, ng0);
    t4 = (t0 + 9552);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    goto LAB8;

LAB10:    xsi_set_current_line(149, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t12 = (t3 == (unsigned char)3);
    if (t12 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB8;

LAB11:    xsi_set_current_line(189, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB41;

LAB43:
LAB42:    goto LAB8;

LAB12:    xsi_set_current_line(195, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB44;

LAB46:
LAB45:    goto LAB8;

LAB13:    xsi_set_current_line(201, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB47;

LAB49:
LAB48:    goto LAB8;

LAB14:    xsi_set_current_line(207, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB50;

LAB52:
LAB51:    goto LAB8;

LAB15:    xsi_set_current_line(213, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB53;

LAB55:
LAB54:    goto LAB8;

LAB16:    xsi_set_current_line(218, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t12 = (t3 == (unsigned char)3);
    if (t12 != 0)
        goto LAB56;

LAB58:
LAB57:    goto LAB8;

LAB17:    xsi_set_current_line(224, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB59;

LAB61:
LAB60:    goto LAB8;

LAB18:    xsi_set_current_line(241, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB71;

LAB73:
LAB72:    goto LAB8;

LAB19:    xsi_set_current_line(259, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB86;

LAB88:
LAB87:    goto LAB8;

LAB20:    xsi_set_current_line(265, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB89;

LAB91:
LAB90:    goto LAB8;

LAB21:    xsi_set_current_line(271, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB92;

LAB94:
LAB93:    goto LAB8;

LAB22:    xsi_set_current_line(274, ng0);
    t1 = (t0 + 9552);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB23:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t13 = *((unsigned char *)t4);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(153, ng0);
    t1 = (t0 + 9744);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB27:    xsi_set_current_line(156, ng0);
    t1 = (t0 + 9936);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(158, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t12 = (t3 == (unsigned char)3);
    if (t12 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(161, ng0);
    t1 = (t0 + 9680);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB30:    xsi_set_current_line(164, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t12 = (t3 == (unsigned char)3);
    if (t12 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(167, ng0);
    t1 = (t0 + 9872);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB33:    xsi_set_current_line(170, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t12 = (t3 == (unsigned char)3);
    if (t12 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(179, ng0);
    t1 = (t0 + 9552);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(180, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;

LAB36:    xsi_set_current_line(183, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 15560U);
    t4 = ((IEEE_P_2592010699) + 4000);
    xsi_array_value_range_check(t4, t2, t1, 8U);
    t5 = (t0 + 10064);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    goto LAB24;

LAB26:    xsi_set_current_line(151, ng0);
    t1 = (t0 + 9744);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB27;

LAB29:    xsi_set_current_line(159, ng0);
    t1 = (t0 + 9680);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB30;

LAB32:    xsi_set_current_line(165, ng0);
    t1 = (t0 + 9872);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB33;

LAB35:    xsi_set_current_line(171, ng0);
    t1 = (t0 + 3752U);
    t4 = *((char **)t1);
    t13 = *((unsigned char *)t4);
    if (t13 != 0)
        goto LAB38;

LAB40:    xsi_set_current_line(174, ng0);
    t1 = (t0 + 9552);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB39:    xsi_set_current_line(177, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB36;

LAB38:    xsi_set_current_line(172, ng0);
    t1 = (t0 + 9552);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB39;

LAB41:    xsi_set_current_line(190, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(191, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB42;

LAB44:    xsi_set_current_line(196, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(197, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB45;

LAB47:    xsi_set_current_line(202, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(203, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB48;

LAB50:    xsi_set_current_line(208, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(209, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB51;

LAB53:    xsi_set_current_line(214, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)7;
    xsi_driver_first_trans_fast(t1);
    goto LAB54;

LAB56:    xsi_set_current_line(219, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(220, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB57;

LAB59:    xsi_set_current_line(225, ng0);
    t1 = (t0 + 5352U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t12 = (t8 == 8);
    if (t12 != 0)
        goto LAB62;

LAB64:    xsi_set_current_line(232, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5352U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t11 = (7 - t8);
    t15 = (t11 - 7);
    t16 = (t15 * -1);
    t17 = (1 * t16);
    t18 = (0U + t17);
    t1 = (t0 + 10128);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_delta(t1, t18, 1, 0LL);

LAB63:    xsi_set_current_line(235, ng0);
    t8 = (252 / 4);
    t11 = (t8 - 1);
    if (t11 < 0LL)
        goto LAB68;

LAB69:    if (t11 > 126LL)
        goto LAB68;

LAB70:    t1 = (t0 + 10000);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = t11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(236, ng0);
    t1 = (t0 + 9552);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)9;
    xsi_driver_first_trans_fast(t1);
    goto LAB60;

LAB62:    xsi_set_current_line(226, ng0);
    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t13 = *((unsigned char *)t5);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB65;

LAB67:    xsi_set_current_line(229, ng0);
    t1 = (t0 + 9808);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB66:    goto LAB63;

LAB65:    xsi_set_current_line(227, ng0);
    t1 = (t0 + 9808);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB66;

LAB68:    xsi_value_out_of_range_error_int64(0LL, 126LL, t11);
    goto LAB70;

LAB71:    xsi_set_current_line(242, ng0);
    t1 = (t0 + 5352U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t12 = (t8 == 8);
    if (t12 != 0)
        goto LAB74;

LAB76:    xsi_set_current_line(252, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t11 = (t8 + 1);
    if (t11 < 0LL)
        goto LAB80;

LAB81:    if (t11 > 8LL)
        goto LAB80;

LAB82:    t1 = (t0 + 9936);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(253, ng0);
    t1 = (t0 + 9552);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(254, ng0);
    t8 = (252 / 4);
    t11 = (t8 - 1);
    if (t11 < 0LL)
        goto LAB83;

LAB84:    if (t11 > 126LL)
        goto LAB83;

LAB85:    t1 = (t0 + 10000);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = t11;
    xsi_driver_first_trans_fast(t1);

LAB75:    goto LAB72;

LAB74:    xsi_set_current_line(243, ng0);
    t1 = (t0 + 4072U);
    t5 = *((char **)t1);
    t13 = *((unsigned char *)t5);
    if (t13 != 0)
        goto LAB77;

LAB79:    xsi_set_current_line(248, ng0);
    t1 = (t0 + 9552);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(249, ng0);
    t1 = (t0 + 9616);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB78:    goto LAB75;

LAB77:    xsi_set_current_line(244, ng0);
    t1 = (t0 + 9552);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)10;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(245, ng0);
    t1 = (t0 + 9616);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(246, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB78;

LAB80:    xsi_value_out_of_range_error_int64(0LL, 8LL, t11);
    goto LAB82;

LAB83:    xsi_value_out_of_range_error_int64(0LL, 126LL, t11);
    goto LAB85;

LAB86:    xsi_set_current_line(260, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(261, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB87;

LAB89:    xsi_set_current_line(266, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(267, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB90;

LAB92:    xsi_set_current_line(272, ng0);
    t1 = (t0 + 9552);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB93;

LAB95:    xsi_set_current_line(279, ng0);
    t8 = (252 / 2);
    t11 = (t8 - 1);
    if (t11 < 0LL)
        goto LAB98;

LAB99:    if (t11 > 126LL)
        goto LAB98;

LAB100:    t1 = (t0 + 10000);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB96;

LAB98:    xsi_value_out_of_range_error_int64(0LL, 126LL, t11);
    goto LAB100;

}

static void work_a_1235049095_1775861178_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    char *t9;
    int t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB6, &&LAB7, &&LAB8, &&LAB9, &&LAB10, &&LAB10, &&LAB9, &&LAB11, &&LAB12, &&LAB13};

LAB0:    xsi_set_current_line(285, ng0);
    t1 = (t0 + 10192);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(286, ng0);
    t1 = (t0 + 10256);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(287, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t3 = (t0 + 10320);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(289, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t8);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 8832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(291, ng0);
    t3 = (t0 + 10384);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(292, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB4:    xsi_set_current_line(294, ng0);
    t1 = (t0 + 10192);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(295, ng0);
    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    if (t8 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(298, ng0);
    t1 = (t0 + 10256);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB15:    xsi_set_current_line(301, ng0);
    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t1 = (t0 + 15496U);
    t3 = ((IEEE_P_2592010699) + 4000);
    xsi_array_value_range_check(t3, t2, t1, 8U);
    t4 = (t0 + 10320);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(303, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t8 = *((unsigned char *)t2);
    if (t8 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(307, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(308, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB18:    goto LAB2;

LAB5:    xsi_set_current_line(312, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(313, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(316, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(317, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB7:    xsi_set_current_line(320, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(321, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(324, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(325, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB9:    xsi_set_current_line(328, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(329, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t11 = (t10 != 8);
    if (t11 == 1)
        goto LAB23;

LAB24:    t8 = (unsigned char)0;

LAB25:    if (t8 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(332, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t12 = (t10 == 8);
    if (t12 == 1)
        goto LAB32;

LAB33:    t11 = (unsigned char)0;

LAB34:    if (t11 == 1)
        goto LAB29;

LAB30:    t8 = (unsigned char)0;

LAB31:    if (t8 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(335, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB27:
LAB21:    goto LAB2;

LAB10:    xsi_set_current_line(340, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(341, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t11 = (t10 != 8);
    if (t11 == 1)
        goto LAB38;

LAB39:    t8 = (unsigned char)0;

LAB40:    if (t8 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(344, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t10 = *((int *)t2);
    t12 = (t10 == 8);
    if (t12 == 1)
        goto LAB47;

LAB48:    t11 = (unsigned char)0;

LAB49:    if (t11 == 1)
        goto LAB44;

LAB45:    t8 = (unsigned char)0;

LAB46:    if (t8 != 0)
        goto LAB41;

LAB43:    xsi_set_current_line(347, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB42:
LAB36:    goto LAB2;

LAB11:    xsi_set_current_line(352, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(353, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB12:    xsi_set_current_line(356, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(357, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB13:    xsi_set_current_line(360, ng0);
    t1 = (t0 + 10384);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(361, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB14:    xsi_set_current_line(296, ng0);
    t1 = (t0 + 10256);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB15;

LAB17:    xsi_set_current_line(304, ng0);
    t1 = (t0 + 10384);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(305, ng0);
    t1 = (t0 + 10448);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB18;

LAB20:    xsi_set_current_line(330, ng0);
    t1 = (t0 + 6312U);
    t4 = *((char **)t1);
    t1 = (t0 + 5352U);
    t5 = *((char **)t1);
    t13 = *((int *)t5);
    t14 = (7 - t13);
    t15 = (t14 - 7);
    t16 = (t15 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t14);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t1 = (t4 + t18);
    t19 = *((unsigned char *)t1);
    t6 = (t0 + 10448);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t20 = (t9 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t19;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB21;

LAB23:    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t12 = *((unsigned char *)t3);
    t8 = t12;
    goto LAB25;

LAB26:    xsi_set_current_line(333, ng0);
    t1 = (t0 + 10448);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB27;

LAB29:    t1 = (t0 + 4392U);
    t4 = *((char **)t1);
    t23 = *((unsigned char *)t4);
    t8 = t23;
    goto LAB31;

LAB32:    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t19 = *((unsigned char *)t3);
    t22 = (!(t19));
    t11 = t22;
    goto LAB34;

LAB35:    xsi_set_current_line(342, ng0);
    t1 = (t0 + 6312U);
    t4 = *((char **)t1);
    t1 = (t0 + 5352U);
    t5 = *((char **)t1);
    t13 = *((int *)t5);
    t14 = (7 - t13);
    t15 = (t14 - 7);
    t16 = (t15 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t14);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t1 = (t4 + t18);
    t19 = *((unsigned char *)t1);
    t6 = (t0 + 10448);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t20 = (t9 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t19;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB36;

LAB38:    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t12 = *((unsigned char *)t3);
    t8 = t12;
    goto LAB40;

LAB41:    xsi_set_current_line(345, ng0);
    t1 = (t0 + 10448);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB42;

LAB44:    t1 = (t0 + 4392U);
    t4 = *((char **)t1);
    t23 = *((unsigned char *)t4);
    t8 = t23;
    goto LAB46;

LAB47:    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t19 = *((unsigned char *)t3);
    t22 = (!(t19));
    t11 = t22;
    goto LAB49;

}


extern void work_a_1235049095_1775861178_init()
{
	static char *pe[] = {(void *)work_a_1235049095_1775861178_p_0,(void *)work_a_1235049095_1775861178_p_1,(void *)work_a_1235049095_1775861178_p_2};
	xsi_register_didat("work_a_1235049095_1775861178", "isim/test_CC_isim_beh.exe.sim/work/a_1235049095_1775861178.didat");
	xsi_register_executes(pe);
}
