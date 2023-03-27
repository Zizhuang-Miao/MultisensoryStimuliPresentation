function vbl = DrawPattern(w, time, code)
%�ú��������ڴ���w�ϳ��ֱ���Ϊcode������Ӿ�pattern
%code�ǳ���Ϊ2���ַ������ڶ�λΪ'1'-'6'����ʾ�ڼ���pattern��
%��һλΪ'1'-'4'���ֱ��ʾ��׼�̼�������ƫ��̼�������ƫ��̼����Ӿ�ƫ��̼�
%�������timeΪ�̼����ֵ�ʱ��
%����ֵvblΪpattern�����һ��150ms�������ֵ�ʱ��
%���ߣ�����׳
%ѧ�ţ�1700017787

global slack color poly_vertices rectangle_rect circle_rect line_position

switch code(2)
    case '1'
        Screen('FillPoly', w, color{1}, poly_vertices{1});
        first_onset = Screen('Flip', w, time);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);    %һ���̼�����400ms
        Screen('FillRect', w, color{2}, rectangle_rect{2});
        Screen('FillOval', w, color{2}, circle_rect{2});
        second_onset = Screen('Flip', w, first_offset+0.15-slack); %�̼������150ms
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %����ƫ������
            Screen('FillOval', w, color{3}, circle_rect{8});
            Screen('DrawLine', w, color{3}, line_position{8}(1),...
                line_position{8}(2), line_position{8}(3), line_position{8}(4), 10);
        elseif code(1)=='4'     %�Ӿ�ƫ������
            Screen('FillOval', w, color{8}, circle_rect{3});
            Screen('FillRect', w, color{8}, rectangle_rect{3});
        else                    %��׼����������ƫ������
            Screen('FillOval', w, color{3}, circle_rect{3});
            Screen('FillRect', w, color{3}, rectangle_rect{3});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
    case '2'
        Screen('FillPoly', w, color{4}, poly_vertices{4});
        Screen('FillRect', w, color{4}, rectangle_rect{4});
        first_onset = Screen('Flip', w, time-slack);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);
        Screen('FillOval', w, color{3}, circle_rect{3});
        Screen('FillRect', w, color{3}, rectangle_rect{3});
        second_onset = Screen('Flip', w, first_offset+0.15-slack); 
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %����ƫ������
            Screen('FillPoly', w, color{5}, poly_vertices{1});
        elseif code(1)=='4'     %�Ӿ�ƫ������
            Screen('FillRect', w, color{2}, rectangle_rect{5});
        else                    %��׼����������ƫ������
            Screen('FillRect', w, color{5}, rectangle_rect{5});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
    case '3'
        Screen('FillRect', w, color{6}, rectangle_rect{6});
        first_onset = Screen('Flip', w, time-slack);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);
        Screen('FillPoly', w, color{7}, poly_vertices{7});
        Screen('FillRect', w, color{7}, rectangle_rect{7});
        second_onset = Screen('Flip', w, first_offset+0.15-slack); 
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %����ƫ������
            Screen('FillPoly', w, color{3}, poly_vertices{10});
            Screen('FillRect', w, color{3}, rectangle_rect{10});
            Screen('DrawLine', w, color{3}, line_position{10}(1,1), line_position{10}(1,2),...
                line_position{10}(1,3), line_position{10}(1,4), 10);
            Screen('DrawLine', w, color{3}, line_position{10}(2,1), line_position{10}(2,2),...
                line_position{10}(2,3), line_position{10}(2,4), 10);
        elseif code(1)=='4'     %�Ӿ�ƫ������
            Screen('FillRect', w, color{10}, rectangle_rect{5});
        else                    %��׼����������ƫ������
            Screen('FillRect', w, color{5}, rectangle_rect{5});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
    case '4'
        Screen('FillOval', w, color{3}, circle_rect{3});
        Screen('FillRect', w, color{3}, rectangle_rect{3});
        first_onset = Screen('Flip', w, time-slack);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);
        Screen('FillOval', w, color{8}, circle_rect{8});
        Screen('DrawLine', w, color{8}, line_position{8}(1),...
            line_position{8}(2), line_position{8}(3), line_position{8}(4), 10);
        second_onset = Screen('Flip', w, first_offset+0.15-slack); 
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %����ƫ������
            Screen('FillPoly', w, color{7}, poly_vertices{4});
            Screen('FillRect', w, color{7}, rectangle_rect{4});
        elseif code(1)=='4'     %�Ӿ�ƫ������
            Screen('FillRect', w, color{5}, rectangle_rect{7});
            Screen('FillPoly', w, color{5}, poly_vertices{7});
        else                    %��׼����������ƫ������
            Screen('FillRect', w, color{7}, rectangle_rect{7});
            Screen('FillPoly', w, color{7}, poly_vertices{7});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
    case '5'
        Screen('FillOval', w, color{8}, circle_rect{8});
        Screen('DrawLine', w, color{8}, line_position{8}(1),...
            line_position{8}(2), line_position{8}(3), line_position{8}(4), 10);
        first_onset = Screen('Flip', w, time-slack);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);
        Screen('FillPoly', w, color{1}, poly_vertices{1});
        second_onset = Screen('Flip', w, first_offset+0.15-slack); 
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %����ƫ������
            Screen('FillRect', w, color{9}, rectangle_rect{6});
        elseif code(1)=='4'     %�Ӿ�ƫ������
            Screen('FillRect', w, color{10}, rectangle_rect{9});
        else                    %��׼����������ƫ������
            Screen('FillRect', w, color{9}, rectangle_rect{9});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
    case '6'
        Screen('FillPoly', w, color{10}, poly_vertices{10});
        Screen('FillRect', w, color{10}, rectangle_rect{10});
        Screen('DrawLine', w, color{10}, line_position{10}(1,1), line_position{10}(1,2),...
            line_position{10}(1,3), line_position{10}(1,4), 10);
        Screen('DrawLine', w, color{10}, line_position{10}(2,1), line_position{10}(2,2),...
            line_position{10}(2,3), line_position{10}(2,4), 10);
        first_onset = Screen('Flip', w, time-slack);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);
        Screen('FillPoly', w, color{11}, poly_vertices{11});
        Screen('FillOval', w, color{11}, circle_rect{11});
        second_onset = Screen('Flip', w, first_offset+0.15-slack); 
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %����ƫ������
            Screen('FillOval', w, color{4}, circle_rect{3});
            Screen('FillRect', w, color{4}, rectangle_rect{3});
        elseif code(1)=='4'     %�Ӿ�ƫ������
            Screen('FillPoly', w, color{6}, poly_vertices{4});
            Screen('FillRect', w, color{6}, rectangle_rect{4});
        else                    %��׼����������ƫ������
            Screen('FillPoly', w, color{4}, poly_vertices{4});
            Screen('FillRect', w, color{4}, rectangle_rect{4});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
end
end