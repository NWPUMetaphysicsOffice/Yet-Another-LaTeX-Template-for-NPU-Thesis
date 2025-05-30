%%
%% This is file `yanputhesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% yanputhesis.dtx  (with options: `class')
%% Copyright (C) 2022 by Shangkun Shen
%% 
%% It may be distributed and/or modified under the conditions of the LaTeX
%% Project Public License, either version 1.3b of this license or (at your
%% option) any later version. The latest version of this license is in
%%     https://www.latex-project.org/lppl.txt
%% and version 1.3b or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{yanputhesis}
    [2023/03/07 v1.8.5 Yet Another NPU Thesis Template]
%%=============================================================================%
%% 文档选项和基础文档类型控制
%%-----------------------------------------------------------------------------%
\RequirePackage{xkeyval}                                    % 参数控制相关
\newif\if@npu@lang@chs                                      % 中文版本标记
\newif\if@npu@type@phd                                      % 博士版本标记
\newif\if@npu@type@mst                                      % 硕士版本标记
\newif\if@npu@type@bcl                                      % 本科版本标记
\newif\if@npu@academic										% 学术学位标记
\newif\if@npu@output@blindreview                            % 盲评版本标记
\newif\if@npu@font@adobe                                    % Adobe 字体标记
\newif\if@npu@font@winfonts                                 % 强制使用 Win 字体
\def\set@lang@chs{\@npu@lang@chstrue}                       % 设置中文版本
\def\set@lang@eng{\@npu@lang@chsfalse}                      % 设置英文版本
\def\set@type@phd{     \@npu@type@phdtrue\@npu@type@mstfalse\@npu@type@bclfalse}
\def\set@type@master{  \@npu@type@phdfalse\@npu@type@msttrue\@npu@type@bclfalse}
\def\set@type@bachelor{\@npu@type@phdfalse\@npu@type@mstfalse\@npu@type@bcltrue}
\DeclareOptionX{lang}[chs]{\csname set@lang@#1\endcsname}
\DeclareOptionX{degree}[phd]{\csname set@type@#1\endcsname}
\DeclareOptionX{blindreview}[true]{\csname @npu@output@blindreview#1\endcsname}
\DeclareOptionX{adobe}[true]{\csname @npu@font@adobe#1\endcsname}
\DeclareOptionX{winfonts}[true]{\csname @npu@font@winfonts#1\endcsname}
\DeclareOptionX{academic}[true]{\csname @npu@academic#1\endcsname}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}} % 传递参数到 book 类
\ExecuteOptionsX{lang=chs}                                  % 默认为中文版本
\ExecuteOptionsX{degree=phd}                                % 默认为博士版本
\ExecuteOptionsX{academic=true}                             % 默认为学术型硕博
\ExecuteOptionsX{blindreview=false}                         % 默认不开启盲评模式
\ExecuteOptionsX{adobe=false}                               % 默认不用 Adobe 字体
\ExecuteOptionsX{winfonts=false}                            % 默认不开启强制选项
\ProcessOptionsX \relax                                     %
\LoadClass[11pt, a4paper, openany, twoside]{book}           % 默认双面印刷
\RequirePackage{etoolbox}                                   % LaTeX 补丁工具
\RequirePackage{amssymb}                                    % AMS 数学符号
%%=============================================================================%
%%=============================================================================%
%% 盲评版本的文字替换功能
%%-----------------------------------------------------------------------------%
\newcommand\@npu@replaceitwithblank[1]{{\setlength{%        % 替换成相同宽度空白
                \fboxsep}{0pt}\colorbox{white}{\phantom{#1}}}}
\newcommand\@npu@replaceitwithblack[1]{{\setlength{%        % 替换成涂黑方块
                \fboxsep}{0pt}\colorbox{black}{\phantom{#1}}}}
\newcommand\@npu@replaceitwithstars{ *** }                  % 替换成 3 个星号
\newcommand{\blindreview}[1]{\if@npu@output@blindreview%    % 空白盲评标记
        \@npu@replaceitwithblank{#1}\relax\else #1\fi}      %
\newcommand{\blackbox}[1]{\if@npu@output@blindreview%       % 涂黑盲评标记
        \@npu@replaceitwithblack{#1}\relax\else #1\fi}      %
\newcommand{\markname}[1]{\if@npu@output@blindreview%       % 打星盲评标记
        \@npu@replaceitwithstars\relax\else #1\fi}          %
%%=============================================================================%
%%=============================================================================%
%% 格式控制及组件控制
%%-----------------------------------------------------------------------------%
\RequirePackage{geometry}                                   % 纸张尺寸及页边距
\geometry{a4paper,                                          % A4 纸张
    left=2.5cm, right=2.5cm, top=2.54cm, bottom=2.54cm,     % 页边距
    headheight=0.53cm, headsep=0.51cm, footskip=0.79cm}     % 页眉页脚位置
%%-----------------------------------------------------------------------------%
\RequirePackage[                                            % 超链接设置
    unicode=true,                                           % 允许 Unicode
    colorlinks=false,                                       % 不改变文字颜色
    pdfborder={0 0 0}]{hyperref}                            % 不显示边框
\hypersetup{                                                % Acrobat 默认设置
    bookmarks=true,                                         % 显示书签页
    pdftoolbar=true,                                        % 显示工具栏
    pdfmenubar=true,                                        % 显示菜单栏
    pdffitwindow=true,                                      % 缩放以适应窗口大小
    pdfstartview={FitH},                                    % 适合窗口宽度
    pdfnewwindow=true,                                      % 以新窗口打开链接
}                                                           %
\RequirePackage{bookmark}                                   %
%%-----------------------------------------------------------------------------%
\RequirePackage{type1cm}                                    % 设置字号与行距
\newcommand{\sChuhao}{\fontsize{42pt}{63pt}\selectfont}     % 初号，1.5 倍
\newcommand{\sYihao}{\fontsize{26pt}{36pt}\selectfont}      % 一号，1.4 倍
\newcommand{\sErhao}{\fontsize{22pt}{28pt}\selectfont}      % 二号，1.25 倍
\newcommand{\sXiaoer}{\fontsize{18pt}{18pt}\selectfont}     % 小二，单倍
\newcommand{\sSanhao}{\fontsize{16pt}{24pt}\selectfont}     % 三号，1.5 倍
\newcommand{\sXiaosan}{\fontsize{15pt}{22pt}\selectfont}    % 小三，1.5 倍
\newcommand{\sSihao}{\fontsize{14pt}{21pt}\selectfont}      % 四号，1.5 倍
\newcommand{\sHgXiaosi}{\fontsize{13pt}{19pt}\selectfont}   % 半小四，1.5 倍
\newcommand{\sLgXiaosi}{\fontsize{12.5pt}{13pt}\selectfont} % 半小四，约 1 倍
\newcommand{\sXiaosi}{\fontsize{12pt}{14.4pt}\selectfont}   % 小四，1.2 倍
\newcommand{\sLargeWuhao}{\fontsize{11pt}{11pt}\selectfont} % 大五，单倍
\newcommand{\sWuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}  % 五号，单倍
\newcommand{\sXiaowu}{\fontsize{9pt}{9pt}\selectfont}       % 小五，单倍
\newcommand{\sDefault}{\fontsize{12pt}{20pt}\selectfont}    % 小四，1.67 倍
%%-----------------------------------------------------------------------------%
\RequirePackage{ifplatform}                                 % 跨平台字体控制依赖
\newcommand\defaultSog{SimSun}                              % 宋体，用于正文
\newcommand\defaultHei{SimHei}                              % 黑体，用于标题
\newcommand\defaultKai{KaiTi}                               % 楷体，一般用于强调
\newcommand\defaultFag{FangSong}                            % 仿宋，一般用于强调
\if@npu@font@winfonts\relax                                 % 检测 de 选项
\else                                                       %
    \if@npu@font@adobe                                      % 检测 Adobe 选项
        \renewcommand\defaultSog{Adobe Song Std}            % 宋体，用于正文
        \renewcommand\defaultHei{Adobe Heiti Std}           % 黑体，用于标题
        \renewcommand\defaultKai{Adobe Kaiti Std}           % 楷体，一般用于强调
        \renewcommand\defaultFag{Adobe Fangsong Std}        % 仿宋，一般用于强调
    \else                                                   % 使用系统自带字体
        \ifwindows\relax\fi                                 % Windows 使用默认字体
        \iflinux\relax\fi                                   % Linux 使用默认字体
        \ifmacosx                                           % macOS 环境
            \renewcommand\defaultSog{STSongti-SC-Regular}   % 宋体，用于正文
            \renewcommand\defaultHei{STHeiti}               % 黑体，用于标题
            \renewcommand\defaultKai{STKaiti}               % 楷体，一般用于强调
            \renewcommand\defaultFag{STFangSong}            % 仿宋，一般用于强调
        \fi                                                 %
    \fi                                                     %
\fi                                                         %
\newcommand\defaultEngFont{Times New Roman}                 % 英文文本默认字体
\newcommand\defaultEngSansFont{\defaultHei}                 % 英文 Sans 字体
\newcommand\codeFont{Consolas}                              % 等宽英文默认字体
%%-----------------------------------------------------------------------------%
\RequirePackage{fontspec}                                   % 设置字体
\RequirePackage[SlantFont, BoldFont, CJKchecksingle]{xeCJK} % 设置中文字体
\defaultfontfeatures{Mapping=tex-text}                      % 启用 TeX Ligatures
\setCJKmainfont[ItalicFont=\defaultKai, AutoFakeBold]{\defaultSog}
\setCJKsansfont[ItalicFont=\defaultKai, AutoFakeBold]{\defaultSog}
\setCJKfamilyfont{song}{\defaultSog}                        % 设置 CJK 字体族
\setCJKfamilyfont{hei}{\defaultHei}                         %
\setCJKfamilyfont{kai}{\defaultKai}                         %
\setCJKfamilyfont{fang}{\defaultFag}                        %
\setCJKfamilyfont{eng}{\defaultEngFont}                     %
\setsansfont{\defaultEngSansFont}                           %
\setmonofont{\codeFont}                                     %
\setmainfont{\defaultEngFont}                               %
\newcommand{\fSong}{\CJKfamily{song}}                       % 宋体: fSong
\newcommand{\fHei}{\CJKfamily{hei}}                         % 黑体: fHei
\newcommand{\fKai}{\CJKfamily{kai}}                         % 楷体: fKai
\newcommand{\fFang}{\CJKfamily{fang}}                       % 仿宋: fFang
\newcommand{\fEng}{\CJKfamily{eng}}                         % 英文: fEng
\XeTeXlinebreaklocale "zh"                                  % 使用中文的换行风格
\XeTeXlinebreakskip = 0pt plus 1pt                          % 换行逻辑的弹性大小
%%-----------------------------------------------------------------------------%
\RequirePackage{indentfirst}                                % 段首空格设置
\setlength\parindent{24pt}                                  % 段首空格长度
\setlength\parskip{0pt}                                     % 段落间距
\renewcommand{\baselinestretch}{1.0}                        % 行距
%%-----------------------------------------------------------------------------%
\RequirePackage{ulem}                                       % 下划线
\newcommand\dlmu@underline[2][5cm]{\hspace{1pt}\underline{  %
        \hb@xt@ #1{\hss#2\hss}}\hspace{3pt}}                %
\let\coverunderline\dlmu@underline                          %
%%-----------------------------------------------------------------------------%
\RequirePackage{layouts}                                    % 页面具体尺寸信息
%%-----------------------------------------------------------------------------%
\RequirePackage[sf]{titlesec}                               % 章节标题格式
\RequirePackage{titletoc}                                   % 目录格式
\setcounter{secnumdepth}{3}                                 % 标题计数器深度
\setcounter{tocdepth}{2}                                    % 目录中标题深度
\titleformat{\chapter}[hang]{\normalfont\sSanhao\filcenter  %
    \sffamily\fHei}{\sffamily\fHei\sSanhao{\chaptertitlename}}{20pt}{\sSanhao}%
\titleformat{\section}[hang]{\sffamily\fHei\sSihao}{%       %
    \sffamily\fHei\sSihao\thesection}{0.5em}{}{}            %
\titleformat{\subsection}[hang]{\sffamily\fHei\sHgXiaosi}{% %
    \sffamily\fHei\sHgXiaosi\thesubsection}{0.5em}{}{}      %
\titleformat{\subsubsection}[hang]{\sffamily\fHei}{%        % 小标题: (4) 标题
    (\arabic{subsubsection})}{0.5em}{}{}                    %
\titlespacing{\chapter}{0pt}{-2pt}{14pt}                    % 缩小标题之间缩进
\titlespacing{\section}{0pt}{7pt}{0em}                      %
\titlespacing{\subsection}{0pt}{6.5pt}{0em}                 %
\titlespacing{\subsubsection}{0pt}{0.25em}{0pt}             %
\titlespacing{\paragraph}{0pt}{0.25em}{0pt}                 %
\dottedcontents{section}[1.16cm]{}{1.8em}{5pt}              % 定义目录中各级标题
\dottedcontents{subsection}[2.00cm]{}{2.7em}{5pt}           % 之间的格式以及缩进
\dottedcontents{subsubsection}[2.86cm]{}{3.4em}{5pt}        %
\newcommand{\nwpu@chs@chaptercname}[1]{第 #1 章}            % 目录章节中文标题
\newcommand{\nwpu@eng@chaptercname}[1]{Chapter #1}          % 目录章节英文标题
\if@npu@lang@chs                                            % 中文本地化显示
    \titlecontents{chapter}[0pt]{\fSong\sLgXiaosi\vspace{   %
            0.5em}}{\contentsmargin{0pt}\fSong\makebox[0pt  %
        ][l]{\nwpu@chs@chaptercname{\thecontentslabel}}\hspace{%
            3.5em}}{\contentsmargin{0pt}\fSong}{\titlerule*[%
            .5pc]{.}\contentspage}[\vspace{0em}]            %
\else                                                       %
    \newlength{\contents@titlewidth}                        %
    \newlength{\contents@appendixwidth}                     %
    \settowidth{\contents@titlewidth}{\sLgXiaosi Chapter 000}%
    \settowidth{\contents@appendixwidth}{\sLgXiaosi Appendix M00}
    \titlecontents{chapter}[0pt]{\fSong\sLgXiaosi\vspace{   %
            0.5em}}{\contentsmargin{0pt}\fSong\makebox[0pt  %
        ][l]{\nwpu@eng@chaptercname{\thecontentslabel}}\hspace{%
            \contents@titlewidth}}{\contentsmargin{0pt}\fSong}{
        \titlerule*[.5pc]{.}\contentspage}[\vspace{0em}]    %
\fi                                                         %
%%-----------------------------------------------------------------------------%
\RequirePackage{fancyhdr}                                   % 页眉设置
\RequirePackage{fancyref}                                   %
\newcommand{\npu@headrule}{                                 %
    \rlap{\rule[.7\baselineskip]{\headwidth}{3.4pt}}        %
    \vspace{-1.07\baselineskip}                             %
    \rule[.5\baselineskip]{\headwidth}{0.6pt}               %
    \vspace{-.8\baselineskip}                               %
}                                                           %
\renewcommand{\headrule}{                                   %
    \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi  %
    \npu@headrule                                           %
}                                                           %
\if@npu@lang@chs                                            % 中英文章节页眉设置
    \renewcommand{\chaptermark}[1]{                         %
        \markboth{\nwpu@chs@chaptercname\thechapter~~ #1}{}}%
\else                                                       %
    \renewcommand{\chaptermark}[1]{                         %
        \markboth{\nwpu@eng@chaptercname\thechapter~~ #1}{}}%
\fi                                                         %
\pagestyle{fancyplain}                                      % 新增版式 fancyplain
\fancyhf{}                                                  % 清空原有页眉页脚
\fancyfoot[C, C]{\sWuhao{\thepage}}                         % 页脚中央显示页码
\fancyhead{}                                                % 页眉清除原有设置
\fancyhead[COH]{\sXiaowu{\leftmark}}                        %
\if@npu@lang@chs                                            % 中文论文环境
    \fancyhead[CEH]{\sXiaowu{\nwpu@chs@header}}             %
\else                                                       % 英文论文环境
    \fancyhead[CEH]{\sXiaowu{\nwpu@eng@header}}             %
\fi                                                         %
%%-----------------------------------------------------------------------------%
\RequirePackage[numbers, sort&compress]{natbib}             % 参考文献
\let\oldcite\cite                                           % 参考文献
\renewcommand{\cite}[1]{\textsuperscript{\oldcite{#1}}}     % 上标引用形式
%%-----------------------------------------------------------------------------%
\RequirePackage{enumerate}                                  % 编号列表
\RequirePackage{enumitem}                                   % 列表格式控制
\setlist{nosep}                                             % 消除间距
\setlist{noitemsep}                                         % 消除列表间距
\setlist{nolistsep}                                         % 消除列表间距
%%-----------------------------------------------------------------------------%
\RequirePackage{graphicx}                                   % 插图功能
\RequirePackage[final]{pdfpages}                            % 插入其他 pdf 文件
\RequirePackage{xcolor}                                     % 颜色库
\RequirePackage{tikz}                                       % tikz 矢量图绘制
\RequirePackage[labelsep=quad]{caption}                     % 浮动体标题控制
\RequirePackage{subcaption}                                 % 子图
\RequirePackage{wrapfig}                                    % 文字环绕
\RequirePackage{multirow, makecell}                         % 合并单元格
\RequirePackage{longtable}                                  % 长表格（跨页表格）
\RequirePackage{booktabs}                                   % 三线表
\RequirePackage{tabularx}                                   % 定宽表格
\RequirePackage{setspace}                                   % 空白长度控制
\RequirePackage{ragged2e}                                   % 对齐
\DeclareCaptionFont{cWuhao}{\sWuhao}                        % 图表标题为五号
\captionsetup[table]{labelfont=cWuhao, textfont=cWuhao, aboveskip=10pt, belowskip=0pt}
\captionsetup[figure]{labelfont=cWuhao, textfont=cWuhao, aboveskip=10pt, belowskip=0pt}
\captionsetup[subtable]{labelformat=simple, aboveskip=10pt, belowskip=-5pt}
\captionsetup[subfigure]{labelformat=simple, aboveskip=10pt, belowskip=-5pt}
\AtBeginEnvironment{tabular}{\sWuhao}                       % 表格内容为五号
\AtBeginEnvironment{tabularx}{\sWuhao}                      %
\newcolumntype{C}{>{\centering\arraybackslash}X}            % 等宽居中
\newcolumntype{L}{>{\raggedright\arraybackslash}X}          % 等宽左对齐
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}           % 等宽右对齐
\newcolumntype{Q}[1]{>{\raggedleft\let\newline\\%           % 指定宽度右对齐
        \arraybackslash\hspace{0pt}}p{#1}}                  %
\newcolumntype{O}[1]{>{\centering\let\newline\\%            % 指定宽度居中
        \arraybackslash\hspace{0pt}}p{#1}}                  %
\newcolumntype{P}[1]{>{\raggedright\let\newline\\%          % 指定宽度左对齐
        \arraybackslash\hspace{0pt}}p{#1}}                  %
\renewcommand{\arraystretch}{1.4}                           % 表格行高为 1.4 倍
\setlength\heavyrulewidth{1.5pt}                            % 表格上下线宽 1.5 磅
\setlength\lightrulewidth{1pt}                              % 表格中线宽 1.0 磅
%%-----------------------------------------------------------------------------%
\RequirePackage[thmmarks]{ntheorem}                         % 定理环境格式
\theorembodyfont{\normalfont\itshape}                       % 主体文字格式
\theoremseparator{\quad}                                    % 标题与主体间隔
\setlength\topsep{0pt}                                      % 设置定理环境间距
\theorempreskip{0pt}                                        % 节前空白大小
\theorempostskip{0pt}                                       % 节后空白大小
\def\thm@space@setup{                                       %
    \thm@preskip=0pt                                        %
    \thm@postskip=0pt}                                      %
\AtBeginDocument{                                           %
    \setlength{\abovedisplayskip}{0pt}                      %
    \setlength{\belowdisplayskip}{0pt}                      %
    \setlength{\abovedisplayshortskip}{0pt}                 %
    \setlength{\belowdisplayshortskip}{0pt}}                %
{\theoremsymbol{\ensuremath{\square}}                       % 证明环境 囗
    \if@npu@lang@chs\newtheorem*{proof}{证明}\else\newtheorem*{proof}{Proof}\fi}
\newcommand{\qedinEquation}{{\rlap{$\qquad\square$}}}       % 公式中添加证毕符号
\if@npu@lang@chs                                            % 定制中文定理环境
    \newtheorem{theorem}{定理}[chapter]                     %
    \newtheorem{axiom}[theorem]{公理}                       %
    \newtheorem{corollary}[theorem]{推论}                   %
    \newtheorem{lemma}[theorem]{引理}                       %
    \newtheorem{definition}[theorem]{定义}                  %
    \newtheorem{example}[theorem]{例}                       %
    \newtheorem{proposition}[theorem]{命题}                 %
\else                                                       % 定制英文定理环境
    \newtheorem{theorem}{Theorem}[chapter]                  %
    \newtheorem{axiom}[theorem]{Axiom}                      %
    \newtheorem{corollary}[theorem]{Corollary}              %
    \newtheorem{lemma}[theorem]{Lemma}                      %
    \newtheorem{definition}[theorem]{Definition}            %
    \newtheorem{example}[theorem]{Example}                  %
    \newtheorem{proposition}[theorem]{Proposition}          %
\fi                                                         %
%%-----------------------------------------------------------------------------%
\RequirePackage{listings}                                   % 添加插入代码控制
\lstset{                                                    % 代码样式
    basicstyle=\color[HTML]{000000}\small\ttfamily,         % 等宽字体 10pt 字号
    numbers=left,                                           % 左侧加入行号
    numberstyle=\tiny,                                      % 行号 6pt 字号
    numbersep=5pt,                                          % 行号与代码间隔
    tabsize=4,                                              % 制表符大小
    extendedchars=true,                                     % 拓展字符集显示汉字
    breaklines=true,                                        % 允许自动换行
    keywordstyle=\color[HTML]{0000FF}\bfseries,             % 关键字样式
    numberstyle=\color[HTML]{ff8000},                       % 数字样式
    commentstyle=\color[HTML]{008000}\bfseries,             % 注释样式
    stringstyle=\color[HTML]{A31515}\ttfamily,              % 字符串样式
    showspaces=false,                                       % 不显示空格字符
    showtabs=false,                                         % 不显示制表符
    frame=shadowbox,                                        % 添加阴影边框
    framexrightmargin=5pt,                                  % 边框右边缩进
    framexbottommargin=4pt,                                 % 边框底端缩进
    rulesepcolor=\color[HTML]{C0C0C0},                      % 边框颜色
    showstringspaces=false,                                 % 显示字符串内空格
    escapeinside=`',                                        % 逃逸字符以显示公式
}                                                           %
\lstloadlanguages{C++, Java, Python, Matlab, R, Mathematica}% 默认加载常用语言
%%-----------------------------------------------------------------------------%
\RequirePackage{algorithm}                                  % 算法流程
\RequirePackage{algpseudocode}                              % 伪代码
%%-----------------------------------------------------------------------------%
\RequirePackage{appendix}                                   % 添加附录功能
%%-----------------------------------------------------------------------------%
\RequirePackage[intoc]{nomencl}                             % 添加符号表功能
\RequirePackage{multicol}                                   % 页面具体尺寸信息
\makenomenclature                                           % 单栏符号表
\@ifundefined{chapter}{\def\npu@nomsec{section}}{\def\npu@nomsec{chapter}}
\def\thenomenclature{%
    % \newlength{\npu@columnsep@save}
    % \setlength{\npu@columnsep@save}{\columnsep}
    % \setlength{\columnsep}{20pt}
    % \begin{multicols}{2}[%
    \csname\npu@nomsec\endcsname*{\nomname}
    \@mkboth{\nomname}{\nomname}%
    \if@intoc\addcontentsline{toc}{\npu@nomsec}{\nomname}\fi
    \nompreamble % \raggedcolumns
    % ]
    \list{}{\labelsep=15pt\labelwidth\nom@tempdim\leftmargin\labelwidth\advance
        \leftmargin\labelsep\itemsep\nomitemsep\let\makelabel\nomlabel}%
}
\def\endthenomenclature{\endlist
    % \end{multicols}
    % \setlength{\columnsep}{\npu@columnsep@save}
    \nompostamble}
%%=============================================================================%
%%=============================================================================%
%% 引用设置及本地化处理
%%-----------------------------------------------------------------------------%
\if@npu@lang@chs                                            % 中文引用提示文字
    \renewcommand{\figurename}{图}                          %
    \renewcommand{\figureautorefname}{图}                   %
    \renewcommand{\tablename}{表}                           %
    \renewcommand{\tableautorefname}{表}                    %
    \renewcommand{\bibname}{参考文献}                       %
    \renewcommand{\contentsname}{目{\quad}录}               %
    \renewcommand{\listfigurename}{图目录}                  %
    \renewcommand{\listtablename}{表目录}                   %
    \renewcommand{\appendixautorefname}{附录}               %
    \def\equationautorefname#1#2\null{式#1(#2\null)}        %
    \def\sectionautorefname#1#2\null{#2\null{ }节}          %
    \def\subsectionautorefname#1#2\null{#2\null{ }小节}     %
    \renewcommand{\theoremautorefname}{定理}                %
    \newcommand{\axiomautorefname}{公理}                    %
    \newcommand{\corollaryautorefname}{推论}                %
    \newcommand{\lemmaautorefname}{引理}                    %
    \newcommand{\definitionautorefname}{定义}               %
    \newcommand{\exampleautorefname}{例}                    %
    \newcommand{\propositionautorefname}{命题}              %
    \newcommand{\algorithmname}{算法}                       %
    \newcommand{\algorithmautorefname}{算法}                %
    \floatname{algorithm}{算法}                             %
    \renewcommand{\lstlistingname}{代码片段}                %
    \newcommand{\lstlistingautorefname}{代码片段}           %
    \renewcommand{\nomname}{符号表}                         %
\else                                                       % 英文引用提示文字
    \renewcommand{\figureautorefname}{Fig.}                 %
    \renewcommand{\tableautorefname}{Table}                 %
    \def\equationautorefname#1#2\null{Eq.#1(#2\null)}       %
    \renewcommand{\lstlistingname}{Code Snippet}            %
    \newcommand{\lstlistingautorefname}{Code Snippet}       %
    \renewcommand{\nomname}{Symbols}                        %
\fi                                                         %
%%-----------------------------------------------------------------------------%
\renewcommand{\chaptername}{第 \thechapter 章}              % 章节名
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}      % 图编号格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}            % 子图编号格式
\renewcommand{\thetable}{\thechapter-\arabic{table}}        % 图编号格式
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}% 算法编号格式
\@addtoreset{algorithm}{chapter}                            % 按章节编号
\renewcommand{\theequation}{\thechapter-\arabic{equation}}  % 公式编号格式
\renewcommand{\thetheorem}{\thechapter.\arabic{theorem}}    % 定理编号格式
\renewcommand{\theaxiom}{\thechapter.\arabic{axiom}}        % 公理编号格式
\renewcommand{\thecorollary}{\thechapter.\arabic{corollary}}% 推论编号格式
\renewcommand{\thelemma}{\thechapter.\arabic{lemma}}        % 引理编号格式
\renewcommand{\thedefinition}{\thechapter.\arabic{definition}} % 定义编号格式
\renewcommand{\theexample}{\thechapter.\arabic{example}}    % 例子编号格式
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@chs@schoolname}{西北工业大学}             % 文档字符串设置
\newcommand{\nwpu@eng@schoolname}{Northwestern Polytechnical University}
\if@npu@type@phd                                            % 博士学位名
    \newcommand{\nwpu@chs@degree}{博士}                     %
    \newcommand{\nwpu@eng@degree}{Doctor}                   %
\fi                                                         %
\if@npu@type@mst                                            % 硕士学位名
    \newcommand{\nwpu@chs@degree}{硕士}                     %
    \newcommand{\nwpu@eng@degree}{Master}                   %
\fi                                                         %
\if@npu@type@bcl                                            % 学士学位名
    \newcommand{\nwpu@chs@degree}{学士}                     %
    \newcommand{\nwpu@eng@degree}{Bachelor}                 %
\fi                                                         %
\if@npu@type@bcl                                            % 本科特殊设置
    \newcommand{\nwpu@chs@doctitle}{本科毕业设计论文}       % 文档名和页眉
    \newcommand{\nwpu@chs@header}{{\nwpu@chs@schoolname}本科毕业设计论文}
\else                                                       % 其他页眉统一设置
    \newcommand{\nwpu@chs@doctitle}{{\nwpu@chs@degree}学位论文}
    \newcommand{\nwpu@chs@header}{\nwpu@chs@schoolname\nwpu@chs@doctitle}
\fi                                                         %
\if@npu@academic											% 控制内封模板的首项名称
	\newcommand{\nwpu@chs@innerCoverFirstOption}{学科专业}	 % 学术学位应该是学科专业
	\newcommand{\nwpu@chs@outerCoverFirstOption}{学{\enspace}科{\enspace}专{\enspace}业}
\else
	\newcommand{\nwpu@chs@innerCoverFirstOption}{专业领域}	 % 专业学位应该是专业领域
	\newcommand{\nwpu@chs@outerCoverFirstOption}{专{\enspace}业{\enspace}领{\enspace}域}
\fi
\newcommand{\nwpu@eng@doctitle}{\nwpu@eng@degree Thesis}    % 英文文档名和页眉
\newcommand{\nwpu@eng@header}{\nwpu@eng@doctitle of \nwpu@eng@schoolname}

%%-----------------------------------------------------------------------------%
\if@npu@lang@chs                                            % 定制中文特殊页面
    \newcommand{\nwpu@page@ack}{致{\quad}谢}                %
    \newcommand{\nwpu@page@acp}{在学期间发表的学术成果和参加%
        科研情况}                                           %
\else                                                       % 定制英文特殊页面
    \newcommand{\nwpu@page@ack}{Acknowledgements}           %
    \newcommand{\nwpu@page@acp}{Published Papers and        %
        Participated in Scientific Research During the Study%
        for \nwpu@eng@degree Degree}                        %
\fi                                                         %
%%=============================================================================%
%%=============================================================================%
%% 中文占位符及个人信息填写
%%-----------------------------------------------------------------------------%
\newcommand{\chs@colon}{\char"FF1A}                         % 中文冒号
\newcommand{\chs@space}{\char"3000}                         % 全角空格
\newcommand{\chs@period}{\char"3002}                        % 中文句号
\newcommand{\chs@question}{\char"FF1F}                      % 中文问号
\newcommand{\chs@exclamation}{\char"FF01}                   % 中文感叹号
\newcommand{\chs@comma}{\char"FF0C}                         % 中文逗号
\newcommand{\chs@semicolon}{\char"FF1B}                     % 中文分号
\newcommand{\chs@leftparenthesis}{\char"FF08}               % 左括号
\newcommand{\chs@rightparenthesis}{\char"FF09}              % 右括号
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@chs@title}{\chs@space}                    % 标题（中文）
\newcommand{\nwpu@chs@author}{\chs@space}                   % 作者（中文）
\newcommand{\nwpu@chs@date}{\chs@space}                     % 日期（中文）
\newcommand{\nwpu@chs@school}{\chs@space}                   % 学院（中文）
\newcommand{\nwpu@chs@major}{\chs@space}                    % 专业（中文）
\newcommand{\nwpu@chs@advisor}{\chs@space}                  % 导师（中文）
\newcommand{\nwpu@chs@advisorAcademicRank}{\chs@space}      % 导师职称（中文）
\newcommand{\nwpu@chs@funding}{\chs@space}                  % 基金赞助（中文）
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@eng@title}{\chs@space}                    % 标题（英文）
\newcommand{\nwpu@eng@author}{\chs@space}                   % 作者（英文）
\newcommand{\nwpu@eng@date}{\chs@space}                     % 日期（英文）
\newcommand{\nwpu@eng@school}{\chs@space}                   % 学院（英文）
\newcommand{\nwpu@eng@major}{\chs@space}                    % 专业（英文）
\newcommand{\nwpu@eng@advisor}{\chs@space}                  % 导师（英文）
\newcommand{\nwpu@eng@advisorAcademicRank}{\chs@space}      % 导师职称（英文）
\newcommand{\nwpu@eng@funding}{\chs@space}                  % 基金赞助（英文）
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@uid}{2000123456}                          % default 学号
\newcommand{\nwpu@funding}{\chs@space}                      % 基金资助
%%-----------------------------------------------------------------------------%
\renewcommand{\title}[2]{                                   % 设置题目
    \renewcommand{\nwpu@chs@title}{#1}                      %
    \renewcommand{\nwpu@eng@title}{#2}                      %
}                                                           %
\renewcommand{\author}[2]{                                  % 设置作者
    \renewcommand{\nwpu@chs@author}{#1}                     %
    \renewcommand{\nwpu@eng@author}{#2}                     %
}                                                           %
\renewcommand{\date}[2]{                                    % 设置日期
    \renewcommand{\nwpu@chs@date}{#1}                       %
    \renewcommand{\nwpu@eng@date}{#2}                       %
}                                                           %
\newcommand{\school}[2]{                                    % 设置学院
    \renewcommand{\nwpu@chs@school}{#1}                     %
    \renewcommand{\nwpu@eng@school}{#2}                     %
}                                                           %
\newcommand{\major}[2]{                                     % 设置专业
    \renewcommand{\nwpu@chs@major}{#1}                      %
    \renewcommand{\nwpu@eng@major}{#2}                      %
}                                                           %
\newcommand{\advisor}[2]{                                   % 设置导师
    \renewcommand{\nwpu@chs@advisor}{#1}                    %
    \renewcommand{\nwpu@eng@advisor}{#2}                    %
}                                                           %
\newcommand{\advisorAcademicRank}[2]{                       % 导师学术等级
	\renewcommand{\nwpu@chs@advisorAcademicRank}{#1}        %
	\renewcommand{\nwpu@eng@advisorAcademicRank}{#2}        %
}  
\newcommand{\funding}[2]{                                   % 设置基金资助
    \renewcommand{\nwpu@chs@funding}{#1}                    %
    \renewcommand{\nwpu@eng@funding}{#2}                    %
}                                                           %  
\newcommand{\studentnumber}[1]{\renewcommand{\nwpu@uid}{#1}}% 设置学号
%%=============================================================================%
%%=============================================================================%
%% 封皮页
%%-----------------------------------------------------------------------------%
\newcommand{\make@nwpu@coverpage}{                          % 设置封皮页
    \thispagestyle{empty}                                   % 清空页面格式
    \newlength{\coverpage@infowidth}                        % 基本信息表格宽度
    \settowidth{\coverpage@infowidth}{\sWuhao 学校代码~:~ 2000000000}
    \newlength{\coverpage@detailwidth}                      % 具体信息对齐宽度
    \settowidth{\coverpage@detailwidth}{\sSanhao 申请学位日期}
    \begin{titlepage}                                       %
        \bfseries                                           %
        \renewcommand{\baselinestretch}{1.25}               % 1.25 倍行距
        \begin{center}                                      %
            \hfill \fHei \sWuhao                            %
            \begin{minipage}{\coverpage@infowidth}          % 排版基本信息表
                \vspace{.5cm}                               %
                \renewcommand\arraystretch{1.2}             %
                \begin{tabular}{|c|c|}\hline                %
                    {学 \hfill 校 \hfill 代 \hfill 码} & 10699     \\ \hline
                    {分   \hfill    类    \hfill   号} & O242      \\ \hline
                    {密           \hfill           级} & 公开      \\ \hline
                    {学           \hfill           号} & \nwpu@uid \\ \hline
                \end{tabular}                               %
            \end{minipage} \par                             % 排版结束
            \vspace{21\baselineskip}                        % 21 * 10.5pt * 1.25
            \fSong \sErhao \begin{minipage}[t]{2cm}         % 排版标题
                \hfill {\fHei \sErhao 题目} \\              %
            \end{minipage}                                  %
            \fHei \sErhao \setbox123=\hbox{                 %
                \begin{minipage}[t]{12cm}                   %
                    \begin{center} \nwpu@chs@title \end{center}
                \end{minipage}                              %
            }                                               %
            \setbox124=\hbox{                               %
                \begin{minipage}[t]{12cm}                   %
                    \begin{center}                          %
                        \uline{\hfill\quad\hfill} \\        %
                        \uline{\hfill\quad\hfill} \\        %
                    \end{center}                            %
                \end{minipage}                              %
            }                                               %
            \hspace{-0.5cm}                                 %
            \copy123\kern-\wd123\box124\par                 % 排版结束
            \sWuhao \vspace{3\baselineskip}                 % 2 * 10.5pt * 1.25
            \sSanhao \fSong \begin{minipage}{5cm}           % 排版具体信息
                {\bf 作者} \uline{\hfill \bf \nwpu@chs@author \hfill}
            \end{minipage} \par                             %
            \sWuhao \vspace{4\baselineskip}                 % 3 * 10.5pt * 1.25
            \sSanhao \fSong \begin{minipage}{12.5cm}        %
                \noindent                                   %
                \makebox[\coverpage@detailwidth][s]{        %
                \bf \nwpu@chs@outerCoverFirstOption}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@major} \hfill}} \par
                \makebox[\coverpage@detailwidth][s]{        %
                \bf 指{\enspace}导{\enspace}教{\enspace}师}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@advisor\nwpu@chs@advisorAcademicRank} \hfill}} \par
                \makebox[\coverpage@detailwidth][s]{        %
                \bf 培{\enspace}养{\enspace}单{\enspace}位}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@school} \hfill}} \par
                \makebox[\coverpage@detailwidth][s]{        %
                \bf 申{\enspace}请{\enspace}日{\enspace}期}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@date} \hfill}}
            \end{minipage}                                  % 排版结束
            \vspace{2.5\baselineskip}                       % 2.5 * 24pt * 1.25
        \end{center}                                        %
    \end{titlepage} \fSong \normalsize \newpage \clearpage  %
}                                                           %
%%-----------------------------------------------------------------------------%
%% 中文标题页
%%-----------------------------------------------------------------------------%
\newcommand{\make@nwpu@chs@title}{                          % 设置中文标题页
    \thispagestyle{empty}                                   % 清空页面格式
    \newlength{\chstitle@hwidtha}                           % 大标题宽度
    \settowidth{\chstitle@hwidtha}{\sSanhao\nwpu@chs@schoolname}
    \newlength{\chstitle@hwidthb}                           % 小标题宽度
    \settowidth{\chstitle@hwidthb}{\sYihao\nwpu@chs@doctitle}
    \begin{titlepage}                                       %
        \renewcommand{\baselinestretch}{1.5}                % 1.5 倍行距
        \fSong \sSanhao \par \vspace{1\baselineskip}        % 1 * 21pt * 1.5
        \begin{center}                                      %
            \makebox[1.41667\chstitle@hwidtha][s]{\sSanhao\nwpu@chs@schoolname} \par
            \vspace*{5mm}                                   %
            \makebox[1.41667\chstitle@hwidthb][s]{\sYihao\nwpu@chs@doctitle} \par
            \vspace*{5mm}                                   %
            \sSihao \par \vspace{6\baselineskip}            % 6 * 21pt * 1.5
            \fSong \sErhao                                  % 排版标题
            \begin{minipage}[t]{2cm} \hfill {题目：} \\ \end{minipage}
            \setbox123=\hbox{                               %
                \begin{minipage}[t]{12cm}                   %
                    \begin{center} \nwpu@chs@title \end{center}
                \end{minipage}                              %
            }                                               %
            \setbox124=\hbox{                               %
                \begin{minipage}[t]{12cm}                   %
                    \begin{center}                          %
                        \uline{\hfill\quad\hfill} \\        %
                        \uline{\hfill\quad\hfill} \\        %
                    \end{center}                            %
                \end{minipage}                              %
            }                                               %
            \hspace{-1cm}                                   %
            \copy123\kern-\wd123\box124 \fSong \sWuhao \par % 排版结束
            \vspace{7\baselineskip}                         % 7 * 10.5pt * 1.5
            \sSanhao \nwpu@chs@innerCoverFirstOption：\coverunderline[5.5cm]{\nwpu@chs@major} \\
            \sSanhao 作{\qquad}者：\coverunderline[5.5cm]{\nwpu@chs@author} \\
            \sSanhao 指导教师：\coverunderline[5.5cm]{\nwpu@chs@advisor} \\
            \fSong \sWuhao \par                             %
            \vspace{2\baselineskip}                         % 2 * 10.5pt * 1.5
            \fSong \sSanhao \nwpu@chs@date                  %
        \end{center}                                        %
    \end{titlepage} \fSong \normalsize \newpage \clearpage  %
}                                                           %
%%-----------------------------------------------------------------------------%
%% 英文标题页
%%-----------------------------------------------------------------------------%
\newcommand{\make@nwpu@eng@title}{                          % 设置英文标题页
    \thispagestyle{empty}                                   % 清空页面格式
    \begin{titlepage}                                       %
        \linespread{1.2} \fEng \sXiaosan \par               % 1.2 倍行距
        \vspace{1\baselineskip}                             % 1 * 22pt * 1.2
        \begin{center}                                      %
            \fEng \sErhao \textbf{\nwpu@eng@title} \par     %
            \fSong \sXiaoer \vspace{3\baselineskip}         %
            \fEng \sXiaosan \textbf{By} \par                %
            \fEng \sXiaosan \textbf{\nwpu@eng@author} \par  %
            \fEng \sXiaosan \textbf{Under the Supervision of \nwpu@eng@advisorAcademicRank} \\
            \fEng \sXiaosan \textbf{\nwpu@eng@advisor} \par %
            \fSong \sSanhao \vspace{4\baselineskip}         %
            \fEng \sXiaosan A Dissertation Submitted to \\  %
            \fEng \sXiaosan {\nwpu@eng@schoolname} \\       %
            \fSong \sSanhao \vspace{1\baselineskip}         %
            \fEng In Partial Fulfillment of The Requirement \\
            \fEng For The Degree of \\                      %
            \fEng {\nwpu@eng@degree} of \textbf{\nwpu@eng@major}
            \fSong \sXiaosan \par \vspace{3\baselineskip}   %
            \fEng \sXiaosan Xi'an, P.R. China \\            %
            \fEng \sXiaosan {\nwpu@eng@date}                %
        \end{center}                                        %
    \end{titlepage} \fSong \normalsize \newpage             %
    \thispagestyle{empty} \cleardoublepage                  %
}                                                           %
%%-----------------------------------------------------------------------------%
%% 生成标题页
%%-----------------------------------------------------------------------------%
\renewcommand{\maketitle}{                                  % 重制 maketitle
    \make@nwpu@coverpage                                    % 封皮页
    \make@nwpu@chs@title                                    % 中文标题页
    \make@nwpu@eng@title                                    % 英文标题页
}                                                           %
%%=============================================================================%
%%=============================================================================%
%% 学位论文评阅人和答辩委员会名单
%%-----------------------------------------------------------------------------%
\catcode `\@ = 11\relax
\def\npu@replicate#1{\expandafter\npu@replicate@aux\romannumeral\number #1000Q{}}
\def\npu@replicate@aux#1{\csname npu@replicate@aux@#1\endcsname}
\long\def\npu@replicate@aux@m#1Q#2#3{\npu@replicate@aux#1Q{#2#3}{#3}}
\long\def\npu@replicate@aux@Q#1#2{#1}
%%-----------------------------------------------------------------------------%
\newcommand{\npu@text}[1]{\relax\sDefault{#1}}
\newcommand{\expert}[3]{\npu@text{#1} & \npu@text{#2} & \npu@text{#3} \\ }
\newcommand{\expertBlindReview}{\expert{全盲评阅}{无}{无}}
\newcommand{\fullBlindReview}[1]{\npu@replicate{#1}{\expertBlindReview}}
\newcommand{\defenseDate}[1]{\sDefault\textbf{答辩日期}%
    & \multicolumn{3}{c}{\sDefault{#1}} \\ }
\newcommand{\defenseChair}[3]{\sDefault\textbf{主席} & \expert{#1}{#2}{#3} }
\newcommand{\committeeMember}[3]{\sDefault\textbf{委员} & \expert{#1}{#2}{#3} }
\newcommand{\defenseSecretary}[3]{\sDefault\textbf{秘书} & \expert{#1}{#2}{#3} }
%%-----------------------------------------------------------------------------%
\newcommand{\makeCommitteePage}[1]{                         %
    \thispagestyle{empty}                                   % 清空页面格式
    \begin{titlepage}                                       %
        \linespread{1.2} \fEng \sXiaosan \par               % 1.2 倍行距
        \vspace{1\baselineskip}                             % 1 * 22pt * 1.2
        \begin{center}                                      %
            \fHei \sSanhao {学位论文评阅人和答辩委员会名单} \par
            #1\relax                                        %
        \end{center}                                        %
    \end{titlepage} \fSong \normalsize \newpage             %
    \thispagestyle{empty} \cleardoublepage}                 %
%%-----------------------------------------------------------------------------%
\newcommand{\reviewers}[1]{                                 %
    \fSong \sDefault \vspace{\baselineskip}                 %
    \fSong \sSihao \vspace{0.3\baselineskip}                %
    \fHei \sSihao {学位论文评阅人名单} \par                 %
    \fSong \sSihao \vspace{0.3\baselineskip}                %
    \let\oldarraystretch=\arraystretch                      %
    \renewcommand{\arraystretch}{2.10}                      %
    \begin{tabularx}{15.27cm}{O{3.71cm}O{2.83cm}O{8.73cm}}  %
        \expert{\textbf{姓名}}{\textbf{职称}}{\textbf{工作单位}}
        #1\relax                                            %
    \end{tabularx}                                          %
    \renewcommand{\arraystretch}{\oldarraystretch}}         %
%%-----------------------------------------------------------------------------%
\newcommand{\committee}[2]{                                 %
    \fSong \sDefault \vspace{\baselineskip}                 %
    \fSong \sSihao \vspace{0.3\baselineskip}                %
    \fHei \sSihao {答辩委员会名单} \par                     %
    \fSong \sSihao \vspace{0.3\baselineskip}                %
    \let\oldarraystretch=\arraystretch                      %
    \renewcommand{\arraystretch}{2.10}                      %
    \begin{tabularx}{15.44cm}{O{3.76cm}O{2.68cm}O{2.25cm}O{6.75cm}}
        \defenseDate{#1} \sDefault\textbf{答辩委员会} & %   %
        \expert{\textbf{姓名}}{\textbf{职称}}{\textbf{工作单位}}
        #2\relax                                            %
    \end{tabularx}                                          %
    \renewcommand{\arraystretch}{\oldarraystretch}}         %
%%=============================================================================%
%%=============================================================================%
%% 中文摘要及关键词
%%-----------------------------------------------------------------------------%
\newenvironment{abstract}{                                  %
\pagenumbering{Roman}                                       % 页码使用大写罗马字母
\setcounter{page}{1}                                        % 页码从 1 开始
\renewcommand{\baselinestretch}{1.0}                        % 默认单倍行距
\newcommand{\sep}{\!；}                                     % 中文关键词间隔符
\sDefault                                                   %
\chapter[摘{\quad}要]{摘{\quad}要}                          %
\markboth{摘{\quad}要}{摘{\quad}要}                         %
}{\vfill\sWuhao\noindent\nwpu@chs@funding\par\cleardoublepage}
\newenvironment{keywords}{                                  %
    \vspace{1\baselineskip} \par                            %
    \noindent \textbf{关键词：}}{}                          %
%%-----------------------------------------------------------------------------%
%% 英文摘要及关键词
%%-----------------------------------------------------------------------------%
\newenvironment{engabstract}{                               %
    \newcommand{\ensep}{\!; }                               % 英文关键词间隔符
    \sDefault                                               %
    \chapter[ABSTRACT]{\selectfont\rmfamily\fEng\textbf{Abstract}}%
    \markboth{Abstract}{ABSTRACT}                           %
}{\vfill\sWuhao\noindent\nwpu@eng@funding\par\cleardoublepage}
\newenvironment{engkeywords}{                               %
    \vspace{1\baselineskip} \par                            %
    \noindent \textbf{Key Words:}}{}                        %
%%=============================================================================%
%%=============================================================================%
%% 目录页
%%-----------------------------------------------------------------------------%
\let\old@toc\tableofcontents                                % 目录
\renewcommand{\tableofcontents}{                            %
    \sDefault\phantomsection                                %
    % \addcontentsline{toc}{chapter}{\contentsname}           %
    \bookmark[dest=\HyperLocalCurrentHref, level=0]{\contentsname}
    \old@toc \cleardoublepage                               %
}                                                           %
\let\old@lof\listoffigures                                  % 图目录
\renewcommand{\listoffigures}{                              %
    \sDefault\phantomsection                                %
    \addcontentsline{toc}{chapter}{\listfigurename}         %
    \old@lof \cleardoublepage                               %
}                                                           %
\let\old@log\listoftables                                   % 表目录
\renewcommand{\listoftables}{                               %
    \sDefault\phantomsection                                %
    \addcontentsline{toc}{chapter}{\listtablename}          %
    \old@log \cleardoublepage                               %
}                                                           %
%%=============================================================================%
%%=============================================================================%
%% 参考文献及附录处理
%%-----------------------------------------------------------------------------%
\let\old@bibliography\bibliography                          % 保护原有附录环境
\renewcommand{\bibliography}[1]{                            %
    \phantomsection\addcontentsline{toc}{chapter}{参考文献} %
    \renewcommand{\baselinestretch}{1.0}                    %
    \fontsize{12pt}{13pt}\selectfont                        %
    \setlength{\bibsep}{0.5ex}                              %
    \sDefault \old@bibliography{#1} \cleardoublepage        % 参考文献 bib 文件
}                                                           %
%%-----------------------------------------------------------------------------%
\patchcmd{\hyper@makecurrent}{%                             % 附录章节引用补丁
    \ifx\Hy@param\Hy@chapterstring                          %
        \let\Hy@param\Hy@chapapp\fi}{\iftoggle{inappendix}{%% 修复附录中章节引用
        \@checkappendixparam{chapter}%                      %
        \@checkappendixparam{section}%                      %
        \@checkappendixparam{subsection}%                   %
        \@checkappendixparam{subsubsection}%                %
        \@checkappendixparam{paragraph}%                    %
        \@checkappendixparam{subparagraph}%                 %
    }{}}{}{\errmessage{failed to patch}}                    %
\newcommand*{\@checkappendixparam}[1]{%                     %
    \def\@checkappendixparamtmp{#1}%                        %
    \ifx\Hy@param\@checkappendixparamtmp                    %
        \let\Hy@param\Hy@appendixstring                     %
    \fi}                                                    %
\newtoggle{inappendix}\togglefalse{inappendix}              %
\apptocmd{\appendix}{\toggletrue{inappendix}}{}{\errmessage{failed to patch}}
\apptocmd{\subappendices}{\toggletrue{inappendix}}{}{\errmessage{failed to patch}}
\appto\appendix{\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}}
\appto\listoffigures{\addtocontents{lof}{\protect\setcounter{tocdepth}{1}}}
\appto\listoftables{\addtocontents{lot}{\protect\setcounter{tocdepth}{1}}}
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@chs@appendixname}[1]{附录 #1}             % 目录附录中文标题
\newcommand{\nwpu@eng@appendixname}[1]{Appendix #1}         % 目录附录英文标题
\let\old@appendix\appendix                                  % 保护原有附录环境
\renewcommand{\appendix}{                                   % 在原有基础上定制
    \old@appendix                                           %
    \setcounter{chapter}{0}                                 % 重置章节编号
    \renewcommand{\nwpu@chs@chaptercname}{\nwpu@chs@appendixname}
    \renewcommand{\nwpu@eng@chaptercname}{\nwpu@eng@appendixname}
    \if@npu@lang@chs                                        % 中文本地化显示
        \renewcommand{\appendixname}{附录}                  % 目录
        \titlecontents{chapter}[0pt]{\fSong\sLgXiaosi\vspace{0.5em}}{%
            \contentsmargin{0pt}\fSong\makebox[0pt][l]{%    %
                \nwpu@chs@appendixname{\thecontentslabel}}\hspace{3.5em}}{%
            \contentsmargin{0pt}\fSong}{\titlerule*[.5pc]{.}%
            \contentspage}[\vspace{0em}]                    %
    \else                                                   % 英文使用默认环境
        \titlecontents{chapter}[0pt]{\fSong\sLgXiaosi\vspace{0.5em}}{%
            \contentsmargin{0pt}\fSong\makebox[0pt][l]{%    %
                \nwpu@eng@appendixname{\thecontentslabel}}\hspace{%
                \contents@appendixwidth}}{\contentsmargin{0pt}\fSong}{%
            \titlerule*[.5pc]{.}\contentspage}[\vspace{0em}]%
    \fi                                                     %
    \titleformat{\chapter}[hang]{\normalfont\sSanhao\filcenter\sffamily\fHei}{%
        \sffamily\fHei\sSanhao{\appendixname~\thechapter}}{20pt}{\sSanhao}
    \renewcommand{\thechapter}{\Alph{chapter}}              %
    \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
    \renewcommand{\theequation}{\Alph{chapter}-\arabic{equation}}
    \renewcommand{\thetable}{\Alph{chapter}-\arabic{table}} %
    \renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
    \renewcommand{\thetheorem}{\Alph{chapter}.\arabic{theorem}}
    \renewcommand{\theaxiom}{\Alph{chapter}.\arabic{axiom}} %
    \renewcommand{\thecorollary}{\Alph{chapter}.\arabic{corollary}}
    \renewcommand{\thelemma}{\Alph{chapter}.\arabic{lemma}} %
    \renewcommand{\thedefinition}{\Alph{chapter}.\arabic{definition}}
    \renewcommand{\theexample}{\Alph{chapter}.\arabic{example}}
}                                                           %
%%=============================================================================%
%%=============================================================================%
%% 附页部分
%%-----------------------------------------------------------------------------%
\newenvironment{acknowledgements}{                          % 致谢
    \renewcommand{\baselinestretch}{1.0}                    %
    \sDefault                                               %
    \phantomsection\chapter*{\nwpu@page@ack}                %
    \markboth{\nwpu@page@ack}{\nwpu@page@ack}               %
    \addcontentsline{toc}{chapter}{\nwpu@page@ack}          %
    \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}   %
}{\par \cleardoublepage}                                    %
%%-----------------------------------------------------------------------------%
\newenvironment{accomplishments}{                           % 参加科研情况
    \renewcommand{\baselinestretch}{1.0}                    %
    \sDefault                                               %
    \phantomsection\chapter*{\nwpu@page@acp}                %
    \markboth{\nwpu@page@acp}{}                             %
    \addcontentsline{toc}{chapter}{\nwpu@page@acp}          %
    \newlength{\oldparindent}                               %
    \setlength{\oldparindent}{\parindent}                   %
    \setlength{\parindent}{0pt}                             %
}{\setlength{\parindent}{\oldparindent} \cleardoublepage}   %
%%-----------------------------------------------------------------------------%
\newcommand{\makestatement}{                                % 知识产权与原创性声明
\begin{titlepage}
    \vspace*{-1.5mm}
    \begin{minipage}{149.6mm}
        \begin{center}
            \renewcommand{\baselinestretch}{1.5}\fSong\sSihao\par
            {\bf 西北工业大学}\par
            {\bf 学位论文知识产权声明书}\par
        \end{center}
        \renewcommand{\baselinestretch}{2.22}\fSong\fontsize{10.6pt}{10.6pt}\selectfont
        {\qquad}本人完全了解学校有关保护知识产权的规定，即：研究生在校攻读学位期间论文工作的
        知识产权单位属于西北工业大学。学校有权保留并向国家有关部门或机构送交论文的复印件
        和电子版。本人允许论文被查阅和借阅。学校可以将本学位论文的全部或部分内容编入有关
        数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。同时本人
        保证，毕业后结合学位论文研究课题再撰写的文章一律注明作者单位为西北工业大学。\par
        {\qquad}本学位论文属于（在以下方框内打“√”）：\par
        {\qquad}$\square$\hspace*{0.7em}保密论文，保密期
        （\hspace*{2.5em}年\hspace*{2.5em}月\hspace*{2.5em}日
        至\hspace*{2.5em}年\hspace*{2.5em}月\hspace*{2.5em}日）。\par
        {\qquad}$\square$\hspace*{0.7em}公开论文。\par
        {\qquad}~\par
        {\qquad}学位论文作者签名{~:~}\underline{\qquad\qquad\qquad}\hfill
        指导教师签名{~:~}\underline{\qquad\qquad\qquad}\par
        \hspace*{8em}{年\hspace*{1.5em}月\hspace*{1.5em}日}\hfill
        \hspace*{12em}{年\hspace*{1.5em}月\hspace*{1.5em}日}\hspace*{1.5em}\par
        {\qquad}~\par
        \vspace*{2.1mm}
        \hbox to \hsize{\leaders\hbox to 0.6em{\hss--\hss}\hfill} \par
        \vspace*{-13mm}
        {\qquad}~\par
        \vspace*{2mm}
        \begin{center}
            \renewcommand{\baselinestretch}{1.45}\fSong\sSihao
            {\bf 西北工业大学}\par
            {\bf 学位论文原创性声明}\par
        \end{center}
        \vspace*{4mm}
        \hspace*{6mm}\begin{minipage}{141.6mm}
            \renewcommand{\baselinestretch}{2.22}\fSong\fontsize{10.6pt}{10.6pt}\selectfont
            {\qquad}\mbox{秉承学校严谨的学风和优良的科学道德，本人郑重声明：所呈交的学位论文，是本}
            \mbox{人在导师的指导下进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容}
            \mbox{和致谢的地方外，本论文不包含任何其他个人或集体已经公开发表或撰写过的研究成果，}
            \mbox{不包含本人或其他已申请学位或其他用途使用过的成果。对本文的研究做出重要贡献的}
            \mbox{个人和集体，均已在文中以明确方式表明。}\par
            {\qquad}本人学位论文与资料若有不实，愿意承担一切相关的法律责任。\par
            \vspace*{1.5mm}
            \hspace*{21em}\hfill 学位论文作者签名{~:~}\underline{\qquad\qquad\quad}\par
            \vspace*{2mm}
            \hspace*{10em}\hfill {年\hspace*{1.5em}月\hspace*{1.5em}日}\hspace*{1.5em}
        \end{minipage}
    \end{minipage}
\end{titlepage}
}                                                           %
%%=============================================================================%


%% 
%% This work consists of the file  yanputhesis.dtx
%% and the derived files           yanputhesis.ins,
%%                                 yanputhesis.pdf,
%%                                 yanputhesis.cls.
%% 
%%
%% End of file `yanputhesis.cls'.
