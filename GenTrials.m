function condition = GenTrials(code)
%该函数用来产生三个阶段的试次条件
%作者：苗子壮
%学号：1700017787

switch code
    case 1    %第一个阶段，生成70个试次，顺序随机、相邻不重复、每种pattern11或12个
        cond = zeros(1,72);
        counter = zeros(1,6);         %用该数组记录每个条件已经出现了多少次，最多出现12次
        raw = repmat(11:16, [1 30]);    
        raw = Shuffle(raw, 2);        %先生成180个pattern，并随机化
        cond(1) = raw(1);
        counter(mod(raw(1),10)) = 1;
        c = 2;
        for i = 2:180                 %剔除相邻的重复pattern，或已经达到12个的pattern
            if raw(i)==cond(c-1) || counter(mod(raw(i),10)) >= 12
                continue
            else
                cond(c) = raw(i);
                counter(mod(raw(i),10)) = counter(mod(raw(i),10))+1;
                c = c+1;
            end
            if c > 72              %已获得符合条件的72个pattern的序列
                break
            end
        end
        if c <= 72                 %如果符合条件的序列不足72个，重新做一次
            cond = GenTrials(1);
        end
        condition = cond(1:70);    %返回前70个试次
    
    case 2       %第二个阶段，生成340个试次，顺序随机、相邻不重复、每种pattern19或20个
                 %同一类deviant pattern不相邻
        cond = zeros(1,340);
        counter = zeros(4,6);         %用该矩阵记录每个条件已经出现了多少次，最多出现14次
        raw = [repmat(11:16, [1 40]), repmat(21:26, [1 40]),...
            repmat(31:36, [1 40]), repmat(41:46, [1 40])];    
        raw = Shuffle(raw, 2);        %先生成960个pattern的序列，并随机化
        cond(1) = raw(1);
        counter(floor(raw(1)/10),mod(raw(1),10)) = 1;
        c = 2;
        for i = 2:960              %遍历整个序列，只保留符合条件的pattern
            if raw(i)==cond(c-1) || counter(floor(raw(i)/10),mod(raw(i),10))...
                    >= 14 || ((floor(cond(c-1)/10)~=1 && floor(raw(i)/10)==floor(cond(c-1)/10)))
                continue
            else
                cond(c) = raw(i);
                counter(floor(raw(i)/10),mod(raw(i),10)) = counter(floor(raw(i)/10),mod(raw(i),10)) + 1;
                c = c+1;
            end
            if c > 336              %已获得符合条件的336个、每种pattern各14个的序列
                break
            end
        end
        if c <= 336                 %如果符合条件的序列不足336个，重新做一次
            cond = GenTrials(2);
        end
        a = 1;
        for i = randperm(4)         %再在四种条件里各随机生成一种，组成序列里最后四个pattern
            cond(336+a) = i*10+randi(6);
            a = a+1;
        end
        condition = cond;    %输出340个pattern的序列
        
    case 3      %第三个阶段
        stdpat = Shuffle(repmat(11:16, [1 6]), 2);    %36个标准pattern
        devpat = Shuffle([repmat(21:26, [1 2]),repmat(31:36, [1 2]),...
            repmat(41:46, [1 2])], 2);               %36个deviant pattern
        pos = Shuffle(repmat([1 -1], [1 18]));       %用1或-1表示dev先呈现或std先呈现
        condition = [stdpat', devpat', pos'];
end
end