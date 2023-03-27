function FillBuffer(code)
%该函数用于将code代表的pattern中的声音刺激装载入PsychPortAudio装置
%code为实验条件编码字符串，第二位为'1'-'6'，表示第几种pattern
%第一位为'1'-'4'，分别表示标准刺激、听觉偏离刺激、视听偏离刺激和视觉偏离刺激
%作者：苗子壮
%学号：1700017787

global sr pa intensity note fill_lag

aud = [];

switch code(2)
    case '1'
        aud = [intensity(1)*note(1,:), zeros(1,sr*0.15),...
            intensity(2)*note(2,:), zeros(1, sr*0.15)];
        if code(1) == '2'
            aud = [aud, intensity(8)*note(3,:)];
        elseif code(1) == '3'
            aud = [aud, intensity(3)*note(8,:)];
        else
            aud = [aud, intensity(3)*note(3,:)];
        end
        aud = [aud; aud];
    case '2'
        aud = [intensity(4)*note(4,:), zeros(1,sr*0.15),...
            intensity(3)*note(3,:), zeros(1, sr*0.15)];
        if code(1) == '2'
            aud = [aud, intensity(1)*note(5,:)];
        elseif code(1) == '3'
            aud = [aud, intensity(5)*note(1,:)];
        else
            aud = [aud, intensity(5)*note(5,:)];
        end
        aud = [aud; aud];
    case '3'
        aud = [intensity(6)*note(6,:), zeros(1,sr*0.15),...
            intensity(7)*note(7,:), zeros(1, sr*0.15)];
        if code(1) == '2'
            aud = [aud, intensity(5)*note(3,:)];
        elseif code(1) == '3'
            aud = [aud, intensity(3)*note(10,:)];
        else
            aud = [aud, intensity(3)*note(3,:)];
        end
        aud = [aud; aud];
    case '4'
        aud = [intensity(3)*note(3,:), zeros(1,sr*0.15),...
            intensity(8)*note(8,:), zeros(1, sr*0.15)];
        if code(1) == '2'
            aud = [aud, intensity(4)*note(7,:)];
        elseif code(1) == '3'
            aud = [aud, intensity(7)*note(4,:)];
        else
            aud = [aud, intensity(7)*note(7,:)];
        end
        aud = [aud; aud];
    case '5'
        aud = [intensity(8)*note(8,:), zeros(1,sr*0.15),...
            intensity(1)*note(1,:), zeros(1, sr*0.15)];
        if code(1) == '2'
            aud = [aud, intensity(3)*note(9,:)];
        elseif code(1) == '3'
            aud = [aud, intensity(9)*note(10,:)];
        else
            aud = [aud, intensity(9)*note(9,:)];
        end
        aud = [aud; aud];
    case '6'
        aud = [intensity(10)*note(10,:), zeros(1,sr*0.15),...
            intensity(11)*note(11,:), zeros(1, sr*0.15)];
        if code(1) == '2'
            aud = [aud, intensity(6)*note(4,:)];
        elseif code(1) == '3'
            aud = [aud, intensity(4)*note(3,:)];
        else
            aud = [aud, intensity(4)*note(4,:)];
        end
        aud = [aud; aud];
end
aud = [zeros(2, round(sr*(0.15-fill_lag))), aud];     %在声音刺激前段加入(0.15-fill_lag)s的空白
PsychPortAudio('FillBuffer', pa, aud);
end