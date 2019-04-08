/********************************************************************
 *                                                                  *
 *  EXAMPLE #1                                                      *
 *                                                                  *
 *  小球沿屏幕穿越彩带                                               *
 *                                                                  *
 *                                                                  *
 ********************************************************************/
#include <stdio.h>

#include <graphics.h>
#include <math.h>
#include <malloc.h>

void main()
{
   int gd=VGA, gm=VGAHI;      /* 图形函数用的变量 */

   /* ------------  动画用的变量 ------------*/
   int x;                     /* 用于计算路径的变量 */
   void *bitmap;              /* 保存位图用的变量   */


   /* ------------ 初始化图形设备 ------------*/
   initgraph(&gd, &gm, "c:\\tc20\\bgi");

   /* ------------ 制作并保存位图 ------------*/
   setcolor(RED);
   setfillstyle(SOLID_FILL, RED);
   pieslice(20, 20, 0, 360, 20);

   /* ------------ 分配内存，并保存位图 -------*/
   bitmap = malloc(imagesize(0, 0, 40, 40));
   getimage(0, 0, 40, 40, bitmap);

   /* ------------ 清除屏幕，绘制背景 ---------*/
   cleardevice();
   for(x = 0; x < 16; x++)
   {
      setfillstyle(SOLID_FILL, x);
      bar(x*40, 0, x*40+40, 480);
   }

   /*------------- 进行动画 ------------------*/
   for(x = 0; x < 640; x++)
   {
      putimage(x*40, 80, bitmap, COPY_PUT);
      putimage(x*40, 160, bitmap, XOR_PUT);
	  putimage(x*40, 240, bitmap, NOT_PUT);
      putimage(x*40, 320, bitmap, AND_PUT);

     delay(2000);
	  getch();

/*      if(kbhit()) break;     /* 按任意键退出 */

      /*putimage(x*40, 220, bitmap, XOR_PUT);

      if(x >= 639) x = 0;*/
  }

   /*------------- 释放内存 ------------------*/
   free(bitmap);

   /*------------- 关闭图形模式 --------------*/
   closegraph();
}
