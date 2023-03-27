function pixel = degree2pixel(width, inch, ratio1, ratio2, distance, degree)
%该函数用于计算并返回某一视角对应的像素数
%输入参数中，width是屏幕的宽度（单位：像素），inch是屏幕尺寸（单位：英寸）
%ratio1、ratio2分别是屏幕宽高比的分子和分母，例如屏幕规格是16:9，那么可以输入ratio1为16、ratio2为9
%distance是被试双眼距屏幕的距离（单位：厘米）
%degree是角度制的视角大小
%作者：苗子壮
%学号：1700017787

pixel = width/(inch*2.54*ratio1/sqrt(ratio1^2+ratio2^2)) * distance * tand(degree);

end