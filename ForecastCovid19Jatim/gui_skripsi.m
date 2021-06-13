function varargout = gui_skripsi(varargin)
% GUI_SKRIPSI MATLAB code for gui_skripsi.fig
%      GUI_SKRIPSI, by itself, creates a new GUI_SKRIPSI or raises the existing
%      singleton*.
%
%      H = GUI_SKRIPSI returns the handle to a new GUI_SKRIPSI or the handle to
%      the existing singleton*.
%
%      GUI_SKRIPSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SKRIPSI.M with the given input arguments.
%
%      GUI_SKRIPSI('Property','Value',...) creates a new GUI_SKRIPSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_skripsi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_skripsi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_skripsi

% Last Modified by GUIDE v2.5 10-Jun-2021 16:46:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_skripsi_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_skripsi_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui_skripsi is made visible.
function gui_skripsi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_skripsi (see VARARGIN)

% Choose default command line output for gui_skripsi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_skripsi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_skripsi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.


function edit1_Callback(hObject, eventdata, handles)

% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, ~, handles)
[baseName, folder] = uigetfile('*.xls');
fullFileName = fullfile(folder,baseName);
handles.name = fullFileName;
handles.name_index = 'index.xls';
set(handles.edit1,'string',baseName);
guidata(hObject, handles)

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function pushbutton1_Callback(hObject, eventdata, handles)
try
wb = waitbar(0.2,'Load Data');
akurasi_tinggi = get(handles.checkbox2,'Value');
export_excel = get(handles.checkbox3,'Value');

cla(handles.axes1);
cla(handles.axes2);
[~,tgl] = xlsread('tanggal.xlsx','A1:A120');
x=xlsread(handles.name_index,'H2:H60');
f=xlsread(handles.name,'C2:C60'); 
[~,txt]=xlsread(handles.name,'B2:B2');
nama_kota = txt{1};
%x=xlsread(name2,'A:A');
%f=xlsread(name2,'B:B');
n=numel(x);
disp('berhasil');
pause(2);
waitbar(0.3,wb,'Forecasting Data');
for j=1:n-1
delf(1,j)=f(j+1)-f(j);
end

for i=2:n-1 
for j=1:n-i
delf(i,j)=delf(i-1,j+1)-delf(i-1,j);
end
end

h=x(2)-x(1);
xcari=120;
prediksi = zeros(xcari,1);
kota = cell(xcari,1);
%nama kota
kota(1:xcari,1) = txt;
index = 1;

pause(2);
waitbar(0.4,wb,'Forecasting Progress');

for index=1:xcari
%xcari=input( 'Nilai x yang dicari = ' ); 
b=(index-x(1))/h;
i=1;
hasil=f(1); 
for j=1:n-1
i=i*(b-j+1)/j; 
hasil=hasil+(delf(j,1))*i;
end
%disp(['i 	= ',num2str(b)]);
%disp(['f(x) = ',num2str(round(hasil,6))]); 
%jawab=input( 'Coba cari x lain? (y/n)' ,'s');
if hasil<0
    hasil = hasil*(-1);
end
%------------------------------------------------smoo
hasil = floor(smoothm(hasil));
%--------------------------------------------------------
format shortg
%disp(round(hasil,6));
prediksi(index,1) = hasil;
%index = index+1;
end
pause(2);
waitbar(0.5,wb,'Forecasting Progress');
prediksi(43:xcari) = smoothn(prediksi(43:xcari));

prediksi(43:xcari) = sort(prediksi(43:xcari));
if akurasi_tinggi > 0
p = polyfit(x,f,1);
pp = polyval(p,1:1:xcari);
prediksi(43:xcari) = pp(43:xcari);
end
pause(2);
waitbar(0.6,wb,'Forecasting Completed');
%p = polyfit(f(46:xcari),prediksi(46:xcari),1);
%prediksi(46:xcari) = polyval(p,x(46:xcari));
%[aData,pData] = prepareCurveData(f(46:xcari),prediksi(46:xcari));
%ft = fittype('poly3');
%[fitresult, gof] = fit(aData,pData,ft);
%prediksi(46:xcari) = pData;
%disp(pData);

label = cell(1,2);
label{1} = sprintf('%s','MAPE');
label{2} = sprintf('%s','RMSE');

pause(2);
waitbar(0.7,wb,'Error Calculating');

filename = sprintf('%s%s%s','output/',num2str(nama_kota),'.xls');
disp(filename);
range = sprintf('%s%s%s%s','A1',':','A',num2str(xcari));
range2 = sprintf('%s%s%s%s','B1',':','B',num2str(xcari));
range3 = sprintf('%s%s%s%s','C1',':','C',num2str(xcari));
pause(2);
waitbar(0.8,wb,'Error Calculating Completed');

disp(range);
if export_excel > 0
xlswrite(filename,kota,range)
xlswrite(filename,prediksi,range2)
xlswrite(filename,tgl,range3);
pause(2);
waitbar(0.9,wb,'Write Data Into Excel');
end

mape = zeros(1,59);
rsme = zeros(1,59);
for n=1:59
mape(n) = ((f(n)-prediksi(n))/f(n))*100;
rsme(n) = (f(n)-prediksi(n))^2;
if(mape(n)<0)
    mape(n) = mape(n)*(-1);
end
end
mape_tmp=0;
rsme_tmp=0;
for n=1:59
    mape_tmp = mape_tmp + mape(n);
    rsme_tmp = rsme_tmp + rsme(n);
end

error = zeros(1,2);
error(1) = mape_tmp/59;
error(2) = sqrt((rsme_tmp/59));
if export_excel > 0
xlswrite(filename,label,'D1:E1')
xlswrite(filename,error,'D2:E2')
end
set(handles.edit2,'string',num2str(mape_tmp/59));
set(handles.edit3,'string',sqrt((rsme_tmp/59)));
label1 = sprintf('hasil forecast %s',nama_kota);
label = sprintf('data faktual %s',nama_kota);

hold(handles.axes1,'on')
plot(handles.axes1,x(1:59),prediksi(1:59),'o');
plot(handles.axes1,x(1:59),f(1:59));
legend(handles.axes1,label1,label);
hold(handles.axes1,'off')

label2 = sprintf('hasil forecast %s',nama_kota);
plot(handles.axes2,prediksi);
legend(handles.axes2,label2);
if export_excel>0
set(handles.edit4,'string',filename);
else
set(handles.edit4,'string','-');
end

pause(3);
waitbar(1.0,wb,'Finishing');
pause(3);
close(wb);
catch ME
  cla(handles.axes1);
  cla(handles.axes2);
  close(wb);
  errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
    ME.stack(1).name, ME.stack(1).line, ME.message);
  fprintf(1, '%s\n', errorMessage); % Print to command window.
  uiwait(warndlg(errorMessage));  % Popup message alert to user.
end
guidata(hObject, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(~, ~, ~)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(~, ~, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, ~, ~)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, ~, ~)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(~, ~, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, ~, ~)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
