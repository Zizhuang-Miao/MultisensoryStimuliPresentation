function GiveCNIns(w, x, y, color, varargin)
%�ڴ���w�ϳ���һ�л����ָ���֧����������
%ÿһ���ɱ����������ָ�����е�һ�У�Ҳ������һ��cell��cell��ÿһԪ�ر�ʾһ������
%x��yΪ����ָ����λ�õ����ģ�colorΪ���ֵ���ɫ
%���ߣ�����׳
%ѧ�ţ�1700017787

if nargin == 5
    ele = varargin{1};
    s = size(ele);
    n = s(1);
    upcenter = y-(n-1)*40;         %��һ���ֵ����ĸ߶�
    for i = 1:n
        bRect= Screen('TextBounds', w, double(ele{i}));
        Screen('DrawText',w,double(ele{i}),x-bRect(3)/2,upcenter+(i-1)*80-bRect(4)/2,color);
    end
else
    upcenter = y-(nargin-5)*40;    %��һ���ֵ����ĸ߶�
    for i = 5:nargin
        bRect= Screen('TextBounds', w, double(varargin{i-4}));
        Screen('DrawText',w,double(varargin{i-4}),x-bRect(3)/2,upcenter+(i-5)*80-bRect(4)/2,color);
    end
end

end