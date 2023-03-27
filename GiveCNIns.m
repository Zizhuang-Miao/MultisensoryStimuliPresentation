function GiveCNIns(w, x, y, color, varargin)
%在窗口w上呈现一行或多行指导语，支持中文输入
%每一个可变输入可以是指导语中的一行，也可以是一个cell，cell内每一元素表示一行文字
%x和y为所有指导语位置的中心，color为文字的颜色
%作者：苗子壮
%学号：1700017787

if nargin == 5
    ele = varargin{1};
    s = size(ele);
    n = s(1);
    upcenter = y-(n-1)*40;         %第一行字的中心高度
    for i = 1:n
        bRect= Screen('TextBounds', w, double(ele{i}));
        Screen('DrawText',w,double(ele{i}),x-bRect(3)/2,upcenter+(i-1)*80-bRect(4)/2,color);
    end
else
    upcenter = y-(nargin-5)*40;    %第一行字的中心高度
    for i = 5:nargin
        bRect= Screen('TextBounds', w, double(varargin{i-4}));
        Screen('DrawText',w,double(varargin{i-4}),x-bRect(3)/2,upcenter+(i-5)*80-bRect(4)/2,color);
    end
end

end