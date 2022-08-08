function varargout = stateoverflow(varargin)
% STATEOVERFLOW MATLAB code for stateoverflow.fig
%      STATEOVERFLOW, by itself, creates a new STATEOVERFLOW or raises the existing
%      singleton*.
%
%      H = STATEOVERFLOW returns the handle to a new STATEOVERFLOW or the handle to
%      the existing singleton*.
%
%      STATEOVERFLOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATEOVERFLOW.M with the given input arguments.
%
%      STATEOVERFLOW('Property','Value',...) creates a new STATEOVERFLOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stateoverflow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stateoverflow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stateoverflow

% Last Modified by GUIDE v2.5 23-Dec-2020 12:01:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stateoverflow_OpeningFcn, ...
                   'gui_OutputFcn',  @stateoverflow_OutputFcn, ...
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


% --- Executes just before stateoverflow is made visible.
function stateoverflow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stateoverflow (see VARARGIN)

% Choose default command line output for stateoverflow
handles.output = hObject;
handles.VidObj = VideoReader('anghel.mp4');
handles.nFrames = handles.VidObj.NumberOfFrames;
handles.videoPos = 1; % Current video position, starts at first frame.

snapshot = read(handles.VidObj,handles.videoPos); %Here we use the stored video position
imshow(snapshot),title(handles.videoPos);

% Choose default command line output for stateoverflow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stateoverflow wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stateoverflow_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pushbutton2
 h = warndlg('Butonul play a fost apasat, pentru a opri apasa din nou','Play')
while get(hObject,'Value')  && handles.videoPos < handles.nFrames 
   
    pause(0.5);
    handles.videoPos=handles.videoPos+1;     % Increment the stored position
    snapshot = read(handles.VidObj,handles.videoPos); % Here we use the stored video position 
    imshow(snapshot),title(handles.videoPos);
    end

guidata(hObject,handles) % Save the modifications done at the handles structure at the figure handle


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    handles.videoPos=handles.videoPos+1;     % Increment the stored position
    snapshot = read(handles.VidObj,handles.videoPos); % Here we use the stored video position 
    imshow(snapshot),title(handles.videoPos);
end
guidata(hObject,handles) % Save the modifications done at the handles structure at the figure handle


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') && handles.videoPos>1
    handles.videoPos=handles.videoPos-1;     % Increment the stored position
    snapshot = read(handles.VidObj,handles.videoPos); % Here we use the stored video position 
    imshow(snapshot),title(handles.videoPos);
end
guidata(hObject,handles) % Save the modifications done at the handles structure at the figure handle


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') && handles.videoPos<handles.nFrames-9
    handles.videoPos=handles.videoPos+10;     % Increment the stored position
    snapshot = read(handles.VidObj,handles.videoPos); % Here we use the stored video position 
    imshow(snapshot),title(handles.videoPos);
end
guidata(hObject,handles) % Save the modifications done at the handles structure at the figure handle


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') && handles.videoPos>10
    handles.videoPos=handles.videoPos-10;     % Increment the stored position
    snapshot = read(handles.VidObj,handles.videoPos); % Here we use the stored video position 
    imshow(snapshot),title(handles.videoPos);
end
guidata(hObject,handles) % Save the modifications done at the handles structure at the figure handle
