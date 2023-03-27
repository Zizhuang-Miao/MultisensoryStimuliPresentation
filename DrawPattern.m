function vbl = DrawPattern(w, time, code)
%该函数用于在窗口w上呈现编码为code代表的视觉pattern
%code是长度为2的字符串，第二位为'1'-'6'，表示第几种pattern；
%第一位为'1'-'4'，分别表示标准刺激、听觉偏离刺激、视听偏离刺激和视觉偏离刺激
%输入参数time为刺激呈现的时间
%返回值vbl为pattern中最后一个150ms空屏呈现的时间
%作者：苗子壮
%学号：1700017787

global slack color poly_vertices rectangle_rect circle_rect line_position

switch code(2)
    case '1'
        Screen('FillPoly', w, color{1}, poly_vertices{1});
        first_onset = Screen('Flip', w, time);
        first_offset = Screen('Flip',w, first_onset+0.4-slack);    %一个刺激呈现400ms
        Screen('FillRect', w, color{2}, rectangle_rect{2});
        Screen('FillOval', w, color{2}, circle_rect{2});
        second_onset = Screen('Flip', w, first_offset+0.15-slack); %刺激间空屏150ms
        second_offset = Screen('Flip',w, second_onset+0.4-slack);
        if code(1)=='3'         %视听偏离条件
            Screen('FillOval', w, color{3}, circle_rect{8});
            Screen('DrawLine', w, color{3}, line_position{8}(1),...
                line_position{8}(2), line_position{8}(3), line_position{8}(4), 10);
        elseif code(1)=='4'     %视觉偏离条件
            Screen('FillOval', w, color{8}, circle_rect{3});
            Screen('FillRect', w, color{8}, rectangle_rect{3});
        else                    %标准条件或听觉偏离条件
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
        if code(1)=='3'         %视听偏离条件
            Screen('FillPoly', w, color{5}, poly_vertices{1});
        elseif code(1)=='4'     %视觉偏离条件
            Screen('FillRect', w, color{2}, rectangle_rect{5});
        else                    %标准条件或听觉偏离条件
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
        if code(1)=='3'         %视听偏离条件
            Screen('FillPoly', w, color{3}, poly_vertices{10});
            Screen('FillRect', w, color{3}, rectangle_rect{10});
            Screen('DrawLine', w, color{3}, line_position{10}(1,1), line_position{10}(1,2),...
                line_position{10}(1,3), line_position{10}(1,4), 10);
            Screen('DrawLine', w, color{3}, line_position{10}(2,1), line_position{10}(2,2),...
                line_position{10}(2,3), line_position{10}(2,4), 10);
        elseif code(1)=='4'     %视觉偏离条件
            Screen('FillRect', w, color{10}, rectangle_rect{5});
        else                    %标准条件或听觉偏离条件
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
        if code(1)=='3'         %视听偏离条件
            Screen('FillPoly', w, color{7}, poly_vertices{4});
            Screen('FillRect', w, color{7}, rectangle_rect{4});
        elseif code(1)=='4'     %视觉偏离条件
            Screen('FillRect', w, color{5}, rectangle_rect{7});
            Screen('FillPoly', w, color{5}, poly_vertices{7});
        else                    %标准条件或听觉偏离条件
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
        if code(1)=='3'         %视听偏离条件
            Screen('FillRect', w, color{9}, rectangle_rect{6});
        elseif code(1)=='4'     %视觉偏离条件
            Screen('FillRect', w, color{10}, rectangle_rect{9});
        else                    %标准条件或听觉偏离条件
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
        if code(1)=='3'         %视听偏离条件
            Screen('FillOval', w, color{4}, circle_rect{3});
            Screen('FillRect', w, color{4}, rectangle_rect{3});
        elseif code(1)=='4'     %视觉偏离条件
            Screen('FillPoly', w, color{6}, poly_vertices{4});
            Screen('FillRect', w, color{6}, rectangle_rect{4});
        else                    %标准条件或听觉偏离条件
            Screen('FillPoly', w, color{4}, poly_vertices{4});
            Screen('FillRect', w, color{4}, rectangle_rect{4});
        end
        third_onset = Screen('Flip', w, second_offset+0.15-slack);
        vbl = Screen('Flip',w, third_onset+0.4-slack);
end
end