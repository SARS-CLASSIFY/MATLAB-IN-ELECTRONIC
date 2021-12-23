classdef imghandle < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        Menu      matlab.ui.container.Menu
        img1      matlab.ui.control.UIAxes
        img2      matlab.ui.control.UIAxes
        img3      matlab.ui.control.UIAxes
        img4      matlab.ui.control.UIAxes
        Button    matlab.ui.control.Button
        Button_2  matlab.ui.control.Button
        Label     matlab.ui.control.Label
    end

%init function 
    properties (Access = private)
        im;
        gray_img;
        img_adj;
        HIS_ENABLE = 0;%��������
        point_flag = 0;%�����
        
    end
    
    methods (Access = private)
        %���1����
        function Histogram_draw(app)
            w1=app.gray_img;
            [Y,X]=size(w1); % Y Row , X column
            grayvalue=unique(w1);
            imginfo=[];
            for i=1:length(grayvalue)
                    [ANSy,ANSx]=find(w1==grayvalue(i));
                    imginfo.gray(i)=grayvalue(i);
                    imginfo.position{i}=[ANSy,ANSx];
                    imginfo.count(i)=length(ANSy)/(Y*X);
            end
            stem(app.img2,imginfo.gray,imginfo.count,'Marker','none');%stem(x� y)����x���� y����������
            xlabel(app.img2,'��'),ylabel(app.img2,'����'),axis(app.img2,[0 255 0 max(imginfo.count)]);
            title(app.img2,'�����');
        end
        
        
        %���2����
        function Histogram2_draw(app)
            w2=app.img_adj;
            [Y,X]=size(w2); % Y Row , X column
            grayvalue=unique(w2);
            imginfo=[];
            for i=1:length(grayvalue)
                    [ANSy,ANSx]=find(w2==grayvalue(i));
                    imginfo.gray(i)=grayvalue(i);
                    imginfo.position{i}=[ANSy,ANSx];
                    imginfo.count(i)=length(ANSy)/(Y*X);
            end
            stem(app.img4,imginfo.gray,imginfo.count,'Marker','none');%stem(x� y)����x���� y����������
            xlabel(app.img4,'��'),ylabel(app.img4,'����'),axis(app.img4,[0 255 0 max(imginfo.count)]);
            title(app.img4,'�����');
        end
        
        %�������
        function [x1 ,x2] = selectDataPoints(app, ax)
            roi = drawpoint(ax);
            x1 = roi.Position(1);
            roi2 = drawpoint(ax);
            x2 = roi2.Position(1);
        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
%             xlabel(app.img2,'��'),ylabel(app.img2,'����'),axis(app.img2,[0 255 0 1]);
%             title(app.img2,'�����');
%             
%             xlabel(app.img4,'��'),ylabel(app.img4,'����'),axis(app.img4,[0 255 0 1]);
%             title(app.img4,'�����');
        end

        % Menu selected function: Menu
        function MenuSelected(app, event)
            [filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.tif';'*.*'},"����");%������������������������
            if isequal(filename,0)||isequal(pathname,0)%������������������������
                errordlg("������","��");%��������
            else
                file_name=strcat(pathname,filename);%����������������
                app.im=imread(file_name);%����
                %����
                app.gray_img=rgb2gray(app.im);
                imshow(app.gray_img,'Parent',app.img1);%�����app.img1
                app.HIS_ENABLE = 1;
            end
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            if(app.HIS_ENABLE == 1)
                Histogram_draw(app);
                app.point_flag = 1;%���
            else             
                errordlg("PLEASE CHOOSE A FILE","error");%��������
            end
        end

        % Button pushed function: Button_2
        function Button_2Pushed(app, event)
            if(app.point_flag == 1)
                [x1, x2] = selectDataPoints(app, app.img2);
                
                app.img_adj = imadjust(app.gray_img,[0 1],[x1/255 x2/255]);
                
                imshow(app.img_adj,'Parent',app.img3);
                Histogram2_draw(app);%���������
                
                app.point_flag = 0;
            else
                errordlg("PLEASE DRAW THE HIS","error");%��������  
            end
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 665 504];
            app.UIFigure.Name = 'MATLAB App';

            % Create Menu
            app.Menu = uimenu(app.UIFigure);
            app.Menu.MenuSelectedFcn = createCallbackFcn(app, @MenuSelected, true);
            app.Menu.Text = '����';

            % Create img1
            app.img1 = uiaxes(app.UIFigure);
            title(app.img1, '����')
            xlabel(app.img1, '')
            ylabel(app.img1, '')
            app.img1.TitleFontWeight = 'bold';
            app.img1.Position = [32 246 284 188];

            % Create img2
            app.img2 = uiaxes(app.UIFigure);
            title(app.img2, '�����')
            xlabel(app.img2, '')
            ylabel(app.img2, '')
            app.img2.TitleFontWeight = 'bold';
            app.img2.Position = [344 246 284 188];

            % Create img3
            app.img3 = uiaxes(app.UIFigure);
            title(app.img3, '������')
            xlabel(app.img3, '')
            ylabel(app.img3, '')
            app.img3.TitleFontWeight = 'bold';
            app.img3.Position = [32 59 284 188];

            % Create img4
            app.img4 = uiaxes(app.UIFigure);
            title(app.img4, '��������')
            xlabel(app.img4, '')
            ylabel(app.img4, '')
            app.img4.TitleFontWeight = 'bold';
            app.img4.Position = [344 59 284 188];

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [124 18 100 25];
            app.Button.Text = '�������';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.Position = [436 18 100 25];
            app.Button_2.Text = '����';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontName = '����';
            app.Label.FontSize = 24;
            app.Label.Position = [260 455 173 34];
            app.Label.Text = '�������';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = imghandle

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end