function pixel = degree2pixel(width, inch, ratio1, ratio2, distance, degree)
%�ú������ڼ��㲢����ĳһ�ӽǶ�Ӧ��������
%��������У�width����Ļ�Ŀ�ȣ���λ�����أ���inch����Ļ�ߴ磨��λ��Ӣ�磩
%ratio1��ratio2�ֱ�����Ļ��߱ȵķ��Ӻͷ�ĸ��������Ļ�����16:9����ô��������ratio1Ϊ16��ratio2Ϊ9
%distance�Ǳ���˫�۾���Ļ�ľ��루��λ�����ף�
%degree�ǽǶ��Ƶ��ӽǴ�С
%���ߣ�����׳
%ѧ�ţ�1700017787

pixel = width/(inch*2.54*ratio1/sqrt(ratio1^2+ratio2^2)) * distance * tand(degree);

end