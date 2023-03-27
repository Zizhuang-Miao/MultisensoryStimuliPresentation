function condition = GenTrials(code)
%�ú����������������׶ε��Դ�����
%���ߣ�����׳
%ѧ�ţ�1700017787

switch code
    case 1    %��һ���׶Σ�����70���ԴΣ�˳����������ڲ��ظ���ÿ��pattern11��12��
        cond = zeros(1,72);
        counter = zeros(1,6);         %�ø������¼ÿ�������Ѿ������˶��ٴΣ�������12��
        raw = repmat(11:16, [1 30]);    
        raw = Shuffle(raw, 2);        %������180��pattern���������
        cond(1) = raw(1);
        counter(mod(raw(1),10)) = 1;
        c = 2;
        for i = 2:180                 %�޳����ڵ��ظ�pattern�����Ѿ��ﵽ12����pattern
            if raw(i)==cond(c-1) || counter(mod(raw(i),10)) >= 12
                continue
            else
                cond(c) = raw(i);
                counter(mod(raw(i),10)) = counter(mod(raw(i),10))+1;
                c = c+1;
            end
            if c > 72              %�ѻ�÷���������72��pattern������
                break
            end
        end
        if c <= 72                 %����������������в���72����������һ��
            cond = GenTrials(1);
        end
        condition = cond(1:70);    %����ǰ70���Դ�
    
    case 2       %�ڶ����׶Σ�����340���ԴΣ�˳����������ڲ��ظ���ÿ��pattern19��20��
                 %ͬһ��deviant pattern������
        cond = zeros(1,340);
        counter = zeros(4,6);         %�øþ����¼ÿ�������Ѿ������˶��ٴΣ�������14��
        raw = [repmat(11:16, [1 40]), repmat(21:26, [1 40]),...
            repmat(31:36, [1 40]), repmat(41:46, [1 40])];    
        raw = Shuffle(raw, 2);        %������960��pattern�����У��������
        cond(1) = raw(1);
        counter(floor(raw(1)/10),mod(raw(1),10)) = 1;
        c = 2;
        for i = 2:960              %�����������У�ֻ��������������pattern
            if raw(i)==cond(c-1) || counter(floor(raw(i)/10),mod(raw(i),10))...
                    >= 14 || ((floor(cond(c-1)/10)~=1 && floor(raw(i)/10)==floor(cond(c-1)/10)))
                continue
            else
                cond(c) = raw(i);
                counter(floor(raw(i)/10),mod(raw(i),10)) = counter(floor(raw(i)/10),mod(raw(i),10)) + 1;
                c = c+1;
            end
            if c > 336              %�ѻ�÷���������336����ÿ��pattern��14��������
                break
            end
        end
        if c <= 336                 %����������������в���336����������һ��
            cond = GenTrials(2);
        end
        a = 1;
        for i = randperm(4)         %����������������������һ�֣��������������ĸ�pattern
            cond(336+a) = i*10+randi(6);
            a = a+1;
        end
        condition = cond;    %���340��pattern������
        
    case 3      %�������׶�
        stdpat = Shuffle(repmat(11:16, [1 6]), 2);    %36����׼pattern
        devpat = Shuffle([repmat(21:26, [1 2]),repmat(31:36, [1 2]),...
            repmat(41:46, [1 2])], 2);               %36��deviant pattern
        pos = Shuffle(repmat([1 -1], [1 18]));       %��1��-1��ʾdev�ȳ��ֻ�std�ȳ���
        condition = [stdpat', devpat', pos'];
end
end