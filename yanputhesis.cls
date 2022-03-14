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
    [2022/02/18 v1.6.0 Yet Another NPU Thesis Template]
%%=============================================================================%
%% 文档选项和基础文档类型控制
%%-----------------------------------------------------------------------------%
\RequirePackage{xkeyval}
\newif\if@npu@lang@chs                                      % 中文版本标记
\newif\if@npu@type@phd                                      % 博士版本标记
\newif\if@npu@type@mst                                      % 硕士版本标记
\newif\if@npu@type@bcl                                      % 本科版本标记
\newif\if@npu@output@blindreview                            % 盲评版本标记
\newif\if@npu@font@adobe                                    % Adobe 字体标记
\def\set@lang@chs{\@npu@lang@chstrue}                       % 设置中文版本
\def\set@lang@eng{\@npu@lang@chsfalse}                      % 设置英文版本
\def\set@type@phd{     \@npu@type@phdtrue\@npu@type@mstfalse\@npu@type@bclfalse}
\def\set@type@master{  \@npu@type@phdfalse\@npu@type@msttrue\@npu@type@bclfalse}
\def\set@type@bachelor{\@npu@type@phdfalse\@npu@type@mstfalse\@npu@type@bcltrue}
\DeclareOptionX{lang}[chs]{\csname set@lang@#1\endcsname}
\DeclareOptionX{degree}[phd]{\csname set@type@#1\endcsname}
\DeclareOptionX{blindreview}[true]{\csname @npu@output@blindreview#1\endcsname}
\DeclareOptionX{adobe}[true]{\csname @npu@font@adobe#1\endcsname}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}} % 传递参数到 book 类
\ExecuteOptionsX{lang=chs}                                  % 默认为中文版本
\ExecuteOptionsX{degree=phd}                                % 默认为博士版本
\ExecuteOptionsX{blindreview=false}                         % 默认不开启盲评模式
\ExecuteOptionsX{adobe=false}                               % 默认不用 Adobe 字体
\ProcessOptionsX \relax                                     %
\LoadClass[11pt, a4paper, openany, twoside]{book}           % 默认双面印刷
%%=============================================================================%
%%=============================================================================%
%% 格式控制及组件控制
%%-----------------------------------------------------------------------------%
\RequirePackage{geometry}                                   % 纸张尺寸及页边距
\geometry{a4paper,                                          % A4 纸张
    left=2.5cm, right=2.5cm, top=2.54cm, bottom=2.54cm}     % 页边距
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
%%-----------------------------------------------------------------------------%
\RequirePackage{type1cm}                                    % 设置字号与行距
\newcommand{\sChuhao}{\fontsize{42pt}{63pt}\selectfont}     % 初号, 1.5 倍
\newcommand{\sYihao}{\fontsize{26pt}{36pt}\selectfont}      % 一号, 1.4 倍
\newcommand{\sErhao}{\fontsize{22pt}{28pt}\selectfont}      % 二号, 1.25 倍
\newcommand{\sXiaoer}{\fontsize{18pt}{18pt}\selectfont}     % 小二, 单倍
\newcommand{\sSanhao}{\fontsize{16pt}{24pt}\selectfont}     % 三号, 1.5 倍
\newcommand{\sXiaosan}{\fontsize{15pt}{22pt}\selectfont}    % 小三, 1.5 倍
\newcommand{\sSihao}{\fontsize{14pt}{21pt}\selectfont}      % 四号, 1.5 倍
\newcommand{\sHgXiaosi}{\fontsize{13pt}{19pt}\selectfont}   % 半小四, 1.5 倍
\newcommand{\sLgXiaosi}{\fontsize{12.5pt}{13pt}\selectfont} % 半小四, 约 1 倍
\newcommand{\sXiaosi}{\fontsize{12pt}{14.4pt}\selectfont}   % 小四, 1.2 倍
\newcommand{\sLargeWuhao}{\fontsize{11pt}{11pt}\selectfont} % 大五, 单倍
\newcommand{\sWuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}  % 五号, 单倍
\newcommand{\sXiaowu}{\fontsize{9pt}{9pt}\selectfont}       % 小五, 单倍
\newcommand{\sDefault}{\fontsize{12pt}{20pt}\selectfont}    % 小四, 1.67 倍
%%-----------------------------------------------------------------------------%
\RequirePackage{ifplatform}                                 % 跨平台字体控制依赖
\if@npu@font@adobe                                          % 检测 Adobe 选项
    \newcommand\defaultSog{Adobe Song Std}                  % 宋体，用于正文
    \newcommand\defaultHei{Adobe Heiti Std}                 % 黑体，用于标题
    \newcommand\defaultKai{Adobe Kaiti Std}                 % 楷体，一般用于强调
    \newcommand\defaultFag{Adobe FangSong Std}              % 仿宋，一般用于强调
\else                                                       % 使用系统自带字体
    \ifwindows                                              % Windows 环境
        \newcommand\defaultSog{SimSun}                      % 宋体，用于正文
        \newcommand\defaultHei{SimHei}                      % 黑体，用于标题
        \newcommand\defaultKai{KaiTi}                       % 楷体，一般用于强调
        \newcommand\defaultFag{FangSong}                    % 仿宋，一般用于强调
    \fi                                                     %
    \ifmacosx                                               % macOS 环境
        \newcommand\defaultSog{STSongti-SC-Regular}         % 宋体，用于正文
        \newcommand\defaultHei{STHeiti}                     % 黑体，用于标题
        \newcommand\defaultKai{STKaiti}                     % 楷体，一般用于强调
        \newcommand\defaultFag{STFangSong}                  % 仿宋，一般用于强调
    \fi                                                     %
    \iflinux                                                % Linux 环境
        \newcommand\defaultSog{SimSun}                      % 宋体，用于正文
        \newcommand\defaultHei{SimHei}                      % 黑体，用于标题
        \newcommand\defaultKai{KaiTi}                       % 楷体，一般用于强调
        \newcommand\defaultFag{FangSong}                    % 仿宋，一般用于强调
    \fi                                                     %
\fi                                                         %
\newcommand\defaultEngFont{Times New Roman}                 % 英文文本默认字体
\newcommand\codeFont{Consolas}                              % 等宽英文默认字体
%%-----------------------------------------------------------------------------%
\RequirePackage{fontspec}                                   % 设置字体
\RequirePackage[SlantFont, BoldFont, CJKchecksingle]{xeCJK} % 设置中文字体
\defaultfontfeatures{Mapping=tex-text}                      % 启用 TeX Ligatures
\setCJKmainfont[ItalicFont=\defaultKai, BoldFont=\defaultHei]{\defaultSog}
\setCJKsansfont[ItalicFont=\defaultKai, BoldFont=\defaultHei]{\defaultSog}
\setCJKfamilyfont{song}{\defaultSog}                        % 设置 CJK 字体族
\setCJKfamilyfont{hei}{\defaultHei}                         %
\setCJKfamilyfont{kai}{\defaultKai}                         %
\setCJKfamilyfont{fang}{\defaultFag}                        %
\setCJKfamilyfont{eng}{\defaultEngFont}                     %
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
\setlength\parindent{2em}                                   % 段首空格长度
\setlength\parskip{0pt}                                     % 段落间距
\renewcommand{\baselinestretch}{1.0}                        % 行距
%%-----------------------------------------------------------------------------%
\RequirePackage{ulem}                                       % 下划线
\newcommand\dlmu@underline[2][5cm]{\hspace{1pt}\underline{  %
    \hb@xt@ #1{\hss#2\hss}}\hspace{3pt}}                    %
\let\coverunderline\dlmu@underline                          %
%%-----------------------------------------------------------------------------%
\RequirePackage{layouts}                                    % 文字分栏排版
%%-----------------------------------------------------------------------------%
\RequirePackage[sf]{titlesec}                               % 章节标题格式
\RequirePackage{titletoc}                                   % 目录格式
\setcounter{secnumdepth}{3}                                 % 标题计数器深度
\setcounter{tocdepth}{2}                                    % 目录中标题深度
\titleformat{\chapter}[hang]{\normalfont\sSanhao\filcenter  %
    \fHei\bf}{\fHei\sSanhao{\chaptertitlename}}{20pt}{      %
    \sSanhao}                                               %
\titleformat{\section}[hang]{\fHei\bf\sSihao}{              %
    \fHei\sSihao\thesection}{0.5em}{}{}                     %
\titleformat{\subsection}[hang]{\fHei\bf\sHgXiaosi}{        %
    \sHgXiaosi\thesubsection}{0.5em}{}{}                    %
\titleformat{\subsubsection}[hang]{\fHei\bf}{               % 小标题: (4) 标题
    (\arabic{subsubsection})}{0.5em}{}{}                    %
\titlespacing{\chapter}{0pt}{-8pt}{11pt}                    % 缩小标题之间缩进
\titlespacing{\section}{0pt}{7pt}{0em}                      %
\titlespacing{\subsection}{0pt}{6.5pt}{0em}                 %
\titlespacing{\subsubsection}{0pt}{0.25em}{0pt}             %
\dottedcontents{section}[1.16cm]{}{1.8em}{5pt}              % 定义目录中各级标题
\dottedcontents{subsection}[2.00cm]{}{2.7em}{5pt}           % 之间的格式以及缩进
\dottedcontents{subsubsection}[2.86cm]{}{3.4em}{5pt}        %
\titlecontents{chapter}[0pt]{\fSong\sLgXiaosi\vspace{       %
    0.5em}}{\contentsmargin{0pt}\fSong\makebox[0pt][l]{     %
    \thecontentslabel}\hspace{1.5em}}{\contentsmargin{      %
    0pt}\fSong}{\titlerule*[.5pc]{.}\contentspage}[         %
    \vspace{0em}]                                           %
%%-----------------------------------------------------------------------------%
\RequirePackage{fancyhdr}                                   % 页眉设置
\RequirePackage{fancyref}                                   %
\addtolength{\topmargin}{0.5cm}                             %
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
\renewcommand{\chaptermark}[1]{                             % 章节页眉设置
    \markboth{\thechapter~~ #1}{}}                          %
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
\newcommand{\ucite}[1]{$^{\mbox{\scriptsize\cite{#1}}}$}    % 上标引用形式
%%-----------------------------------------------------------------------------%
\RequirePackage{enumerate}                                  % 编号列表
\RequirePackage{enumitem}                                   % 列表格式控制
\setlist{noitemsep}                                         % 消除列表间距
\setlist{nolistsep}                                         % 消除列表间距
%%-----------------------------------------------------------------------------%
\RequirePackage{graphicx}                                   % 插图功能
\RequirePackage[final]{pdfpages}                            % 插入其他 pdf 文件
\RequirePackage{xcolor}                                     % 颜色库
\RequirePackage{tikz}                                       % tikz 矢量图绘制
\RequirePackage[labelsep=quad]{caption}                     % 浮动体标题控制
\RequirePackage{subfigure}                                  % 子图
\RequirePackage{wrapfig}                                    % 文字环绕
\RequirePackage{multirow, makecell}                         % 合并单元格
\RequirePackage{longtable}                                  % 长表格（跨页表格）
\RequirePackage{booktabs}                                   % 三线表
\RequirePackage{tabularx}                                   % 定宽表格
\RequirePackage{setspace}                                   % 空白长度控制
\RequirePackage{ragged2e}                                   % 对齐
\DeclareCaptionFont{cWuhao}{\sWuhao}                        % 图表标题为五号
\captionsetup[table]{labelfont=cWuhao,textfont=cWuhao}      %
\captionsetup[figure]{labelfont=cWuhao,textfont=cWuhao}     %
\let\oldtabular\tabular                                     % 表格内容为五号
\renewcommand{\tabular}{\sWuhao\oldtabular}                 %
\let\oldtabularx\tabularx                                   %
\renewcommand{\tabularx}{\sWuhao\oldtabularx}               %
\newcolumntype{C}{>{\centering\arraybackslash}X}            % 等宽居中
\newcolumntype{L}{>{\raggedright\arraybackslash}X}          % 等宽左对齐
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}           % 等宽右对齐
\renewcommand{\arraystretch}{1.4}                           % 表格行高为 1.4 倍
%%-----------------------------------------------------------------------------%
\RequirePackage[amsthm, thmmarks]{ntheorem}                 % 定理环境格式
\renewcommand{\qedsymbol}{$\blacksquare$}                   % 证毕符号 囗
\renewenvironment{proof}[1][\proofname]{\par\pushQED{\qed}  % 证明环境
    \normalfont\topsep{0pt}\partopsep{0pt}\trivlist\item[   %
        \hspace{5\labelsep}\strong #1\@addpunct{:}          %
    ]\ignorespaces}{\popQED\endtrivlist\@endpefalse}        %
%%-----------------------------------------------------------------------------%
\RequirePackage{listings}                                   % 添加插入代码控制
\lstset{                                                    % 代码样式
    basicstyle=\color[HTML]{000000}\footnotesize\ttfamily,  % 等宽字体 9pt 字号
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
%%=============================================================================%
%%=============================================================================%
%% 引用设置及本地化处理
%%-----------------------------------------------------------------------------%
\if@npu@lang@chs                                            % 中文引用提示文字
    \renewcommand{\figurename}{图}                          %
    \renewcommand{\tablename}{表}                           %
    \renewcommand{\bibname}{参考文献}                       %
    \renewcommand{\contentsname}{目{\quad}录}               %
    \renewcommand{\listfigurename}{图目录}                  %
    \renewcommand{\listtablename}{表目录}                   %
    \renewcommand{\figureautorefname}{图}                   %
    \renewcommand{\tableautorefname}{表}                    %
    \renewcommand{\appendixautorefname}{附录}               %
    \def\equationautorefname#1#2\null{式#1(#2\null)}        %
    \renewcommand{\proofname}{证明}                         %
    \renewcommand{\lstlistingname}{代码片段}                %
    \newcommand{\lstlistingautorefname}{代码片段}           %
\else                                                       % 英文引用提示文字
    \renewcommand{\figureautorefname}{Fig.}                 %
    \renewcommand{\tableautorefname}{Table}                 %
    \renewcommand{\appendixautorefname}{Appendix}           %
    \def\equationautorefname#1#2\null{Eq.#1(#2\null)}       %
    \renewcommand{\lstlistingname}{Code Snippet}            %
    \newcommand{\lstlistingautorefname}{Code Snippet}       %
\fi                                                         %
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
\renewcommand{\chaptername}{\thechapter~~}                  % 章节名
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}      % 图编号格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}            % 子图编号格式
\renewcommand{\thetable}{\thechapter-\arabic{table}}        % 图编号格式
\renewcommand{\theequation}{\thechapter-\arabic{equation}}  % 公式编号格式
\renewcommand{\thetheorem}{\thechapter.\arabic{theorem}}    % 定理编号格式
\renewcommand{\theaxiom}{\thechapter.\arabic{axiom}}        % 公理编号格式
\renewcommand{\thecorollary}{\thechapter.\arabic{corollary}}% 推论编号格式
\renewcommand{\thelemma}{\thechapter.\arabic{lemma}}        % 引理编号格式
\renewcommand{\thedefinition}{\thechapter.\arabic{definition}} % 定义编号格式
\renewcommand{\theexample}{\thechapter.\arabic{example}}    % 例子编号格式
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@chs@schoolname}{西北工业大学}             % 文档字符串设置
\newcommand{\nwpu@eng@schoolname}{Northwestern Polytechnical University}                  %
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
    \newcommand{\nwpu@chs@doctitle}{本科毕业设计论文}       % 文档名
    \newcommand{\nwpu@chs@header}{                          % 页眉
        \nwpu@chs@schoolname 本科毕业设计论文}              %
\else                                                       % 其他页眉统一设置
    \newcommand{\nwpu@chs@doctitle}{{\nwpu@chs@degree}学位论文}
    \newcommand{\nwpu@chs@header}{                          % 页眉
        \nwpu@chs@schoolname\nwpu@chs@doctitle}             %
\fi                                                         %
\newcommand{\nwpu@eng@doctitle}{\nwpu@eng@degree Thesis}    % 英文文档名
\newcommand{\nwpu@eng@header}{                              % 英文页眉
    \nwpu@eng@doctitle of \nwpu@eng@schoolname}             %
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
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@eng@title}{\chs@space}                    % 标题（英文）
\newcommand{\nwpu@eng@author}{\chs@space}                   % 作者（英文）
\newcommand{\nwpu@eng@date}{\chs@space}                     % 日期（英文）
\newcommand{\nwpu@eng@school}{\chs@space}                   % 学院（英文）
\newcommand{\nwpu@eng@major}{\chs@space}                    % 专业（英文）
\newcommand{\nwpu@eng@advisor}{\chs@space}                  % 导师（英文）
%%-----------------------------------------------------------------------------%
\newcommand{\nwpu@uid}{2000123456}                          % 学号
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
\newcommand{\studentnumber}[1]{\renewcommand{\nwpu@uid}{#1}}% 设置学号
\newcommand{\funding}[1]{\renewcommand{\nwpu@funding}{#1}}  % 设置基金资助
%%=============================================================================%
%%=============================================================================%
%% 封皮页
%%-----------------------------------------------------------------------------%
\newcommand{\make@nwpu@coverpage}{                          % 设置封皮页
\thispagestyle{empty}                                       % 清空页面格式
\newlength{\coverpage@infowidth}                            % 基本信息表格宽度
\settowidth{\coverpage@infowidth}{\sWuhao 学校代码~:~ 2000000000}
\newlength{\coverpage@detailwidth}                          % 具体信息对齐宽度
\settowidth{\coverpage@detailwidth}{\sSanhao 申请学位日期}  %
\begin{titlepage}                                           %
    \bfseries                                               %
    \linespread{1.25}                                       % 1.25 倍行距
    \begin{center}                                          %
        \hfill \fHei \sWuhao                                %
        \begin{minipage}{\coverpage@infowidth}              % 排版基本信息表
            \vspace{.5cm}                                   %
            \renewcommand\arraystretch{1.2}                 %
            \begin{tabular}{|c|c|}\hline                    %
                {学 \hfill 校 \hfill 代 \hfill 码} & 10699     \\ \hline
                {分   \hfill    类    \hfill   号} & O242      \\ \hline
                {密           \hfill           级} & 公开      \\ \hline
                {学           \hfill           号} & \nwpu@uid \\ \hline
             \end{tabular}                                  %
        \end{minipage} \par                                 % 排版结束
        \vspace{9cm} \fSong \sErhao                         %
        \begin{minipage}[t]{2cm}                            % 排版标题
            \hfill {\bfseries \sYihao 题目} \\              %
        \end{minipage}                                      %
        \fHei \sErhao                                       %
        \setbox123=\hbox{                                   %
            \begin{minipage}[t]{12cm}                       %
                \begin{center} \nwpu@chs@title \end{center} %
            \end{minipage}                                  %
        }                                                   %
        \setbox124=\hbox{                                   %
            \begin{minipage}[t]{12cm}                       %
                \begin{center}                              %
                    \uline{\hfill\quad\hfill} \\            %
                    \uline{\hfill\quad\hfill} \\            %
                \end{center}                                %
            \end{minipage}                                  %
        }                                                   %
        \hspace{-0.5cm}                                     %
        \copy123\kern-\wd123\box124 \fKai \sSanhao \par     % 排版结束
        \vspace{3\baselineskip}                             % => 3 * 24pt * 1.25
        \begin{minipage}{5cm}                               % 排版具体信息
            {作者} \uline{\hfill \nwpu@chs@author \hfill}   %
        \end{minipage} \par                                 %
        \vspace{2.5\baselineskip}                           % => 2.5 * 24pt * 1.25
        \begin{minipage}{12.5cm}                            %
            \noindent                                       %
            \makebox[\coverpage@detailwidth][s]{学科、专业}\hspace{0.2cm}
            {\uline{\hfill \makebox{\fSong \nwpu@chs@major } \hfill}} \par
            \vspace{0.5\baselineskip}                       % => 0.5 * 24pt * 1.25
            \makebox[\coverpage@detailwidth][s]{指导教师}\hspace{0.2cm}
            {\uline{\hfill \makebox{\fSong \nwpu@chs@advisor } \hfill}} \par
            \vspace{0.5\baselineskip}                       % => 0.5 * 24pt * 1.25
            \makebox[\coverpage@detailwidth][s]{申请学位日期}\hspace{0.2cm}
            {\uline{\hfill \makebox{\fSong \nwpu@chs@date } \hfill}}
        \end{minipage}                                      % 排版结束
        \vspace{2.5\baselineskip}                           % => 2.5 * 24pt * 1.25
    \end{center}                                            %
\end{titlepage} \fSong \normalsize \newpage \clearpage      %
}                                                           %
%%-----------------------------------------------------------------------------%
%% 中文标题页
%%-----------------------------------------------------------------------------%
\newcommand{\make@nwpu@chs@title}{                          % 设置中文标题页
\thispagestyle{empty}                                       % 清空页面格式
\newlength{\chstitle@hwidtha}                               % 大标题宽度
\settowidth{\chstitle@hwidtha}{\sSanhao\nwpu@chs@schoolname}%
\newlength{\chstitle@hwidthb}                               % 小标题宽度
\settowidth{\chstitle@hwidthb}{\sYihao\nwpu@chs@doctitle}   %
\begin{titlepage}                                           %
    \linespread{1.5} \fSong \sSanhao \par                   % 1.5 倍行距
    \vspace{1\baselineskip}                                 % => 1 * 21pt * 1.5
    \begin{center}                                          %
        \makebox[1.41667\chstitle@hwidtha][s]{\sSanhao\nwpu@chs@schoolname} \par
        \vspace*{5mm}                                       %
        \makebox[1.41667\chstitle@hwidthb][s]{\sYihao\nwpu@chs@doctitle} \par
        \vspace*{5mm}                                       %
        \sSihao （学位研究生）\par                          %
        \vspace{6\baselineskip}                             % => 6 * 21pt * 1.5
        \fSong \sErhao                                      % 排版标题
        \begin{minipage}[t]{2cm} \hfill {题目：} \\ \end{minipage}
        \setbox123=\hbox{                                   %
            \begin{minipage}[t]{12cm}                       %
                \begin{center} \nwpu@chs@title \end{center} %
            \end{minipage}                                  %
        }                                                   %
        \setbox124=\hbox{                                   %
            \begin{minipage}[t]{12cm}                       %
                \begin{center}                              %
                    \uline{\hfill\quad\hfill} \\            %
                    \uline{\hfill\quad\hfill} \\            %
                \end{center}                                %
            \end{minipage}                                  %
        }                                                   %
        \hspace{-1cm}                                       %
        \copy123\kern-\wd123\box124 \fSong \sWuhao \par     % 排版结束
        \vspace{7\baselineskip}                             % => 7 * 10.5pt * 1.5
        \sSanhao 作{\qquad}者：\coverunderline[5.5cm]{\nwpu@chs@author} \\
        \sSanhao 学科专业：\coverunderline[5.5cm]{\nwpu@chs@major} \\
        \sSanhao 指导教师：\coverunderline[5.5cm]{\nwpu@chs@advisor} \\
        \fSong \sWuhao \par                                 %
        \vspace{2\baselineskip}                             % => 2 * 10.5pt * 1.5
        \fSong \sSanhao \nwpu@chs@date                      %
    \end{center}                                            %
\end{titlepage} \fSong \normalsize \newpage \clearpage      %
}                                                           %
%%-----------------------------------------------------------------------------%
%% 英文标题页
%%-----------------------------------------------------------------------------%
\newcommand{\make@nwpu@eng@title}{                          % 设置英文标题页
\thispagestyle{empty}                                       % 清空页面格式
\begin{titlepage}                                           %
    \linespread{1.2} \fEng \sXiaosan \par                   % 1.2 倍行距
    \vspace{1\baselineskip}                                 % => 1 * 22pt * 1.2
    \begin{center}                                          %
        \fEng \sErhao \textbf{\nwpu@eng@title} \par         %
        \fSong \sXiaoer \vspace{3\baselineskip}             %
        \fEng \sXiaosan \textbf{By} \par                    %
        \fEng \sXiaosan \textbf{\nwpu@eng@author} \par      %
        \fSong \sXiaosan \vspace{1\baselineskip}            %
        \fEng \sXiaosan \textbf{Under the Supervision of Professor} \\
        \fEng \sXiaosan \textbf{\nwpu@eng@advisor} \par     %
        \fSong \sSanhao \vspace{3\baselineskip}             %
        \fEng \sXiaosan A Dissertation Submitted to \\      %
        \fEng \sXiaosan {\nwpu@eng@schoolname} \\           %
        \fSong \sSanhao \vspace{1\baselineskip}             %
        \fEng In partial fulfillment of the requirement \\  %
        \fEng For the degree of \\                          %
        \fEng {\nwpu@eng@degree} of \textbf{\nwpu@eng@major}%
        \fSong \sXiaosan \par \vspace{3\baselineskip}       %
        \fEng \sXiaosan Xi'an, P.R. China \\                %
        \fEng \sXiaosan {\nwpu@eng@date}                    %
    \end{center}                                            %
\end{titlepage} \fSong \normalsize \newpage                 %
\thispagestyle{empty} \cleardoublepage                      %
}                                                           %
%%-----------------------------------------------------------------------------%
%% 生成标题页
%%-----------------------------------------------------------------------------%
\renewcommand{\maketitle}{                                  % 重制 maketitle
    \make@nwpu@coverpage                                    % 封皮页
    % \newpage \clearpage                                     %
    \make@nwpu@chs@title                                    % 中文标题页
    % \newpage \clearpage                                     %
    \make@nwpu@eng@title                                    % 英文标题页
    % \newpage \thispagestyle{empty} \cleardoublepage         %
    \pagenumbering{Roman}                                   % 页码使用大写罗马字母
    \setcounter{page}{1}                                    % 页码从 1 开始
    \renewcommand{\baselinestretch}{1.0}                    % 默认单倍行距
}                                                           %
%%=============================================================================%
%%=============================================================================%
%% 中文摘要及关键词
%%-----------------------------------------------------------------------------%
\newenvironment{abstract}{                                  %
    \sDefault                                               %
    \chapter[摘{\quad}要]{摘{\quad}要}                      %
    \markboth{摘{\quad}要}{摘{\quad}要}                     %
}{\vfill\sWuhao \noindent \nwpu@funding \par \cleardoublepage}%
\newenvironment{keywords}{                                  %
    \vspace{2\baselineskip} \par                            %
    \noindent \textbf{关键词：}\quad}{}                     %
%%-----------------------------------------------------------------------------%
%% 英文摘要及关键词
%%-----------------------------------------------------------------------------%
\newenvironment{engabstract}{                               %
    \sDefault                                               %
    \chapter[\textbf{ABSTRACT}]{Abstract}                   %
    \markboth{Abstract}{ABSTRACT}}{\cleardoublepage}        %
\newenvironment{engkeywords}{                               %
    \vspace{2\baselineskip} \par                            %
    \noindent \textbf{Key Words:}\quad}{}                   %
%%=============================================================================%
%%=============================================================================%
%% 目录页
%%-----------------------------------------------------------------------------%
\let\old@toc\tableofcontents                                % 目录
\renewcommand{\tableofcontents}{                            %
    \sDefault\phantomsection\addcontentsline{toc}{chapter}{ %
        \contentsname} \old@toc \cleardoublepage            %
}                                                           %
\let\old@lof\listoffigures                                  % 图目录
\renewcommand{\listoffigures}{                              %
    \sDefault\phantomsection\addcontentsline{toc}{chapter}{ %
        \listfigurename} \old@lof \cleardoublepage          %
}                                                           %
\let\old@log\listoftables                                   % 表目录
\renewcommand{\listoftables}{                               %
    \sDefault\phantomsection\addcontentsline{toc}{chapter}{ %
        \listtablename} \old@log \cleardoublepage           %
}                                                           %
%%=============================================================================%
%%=============================================================================%
%% 参考文献及附录处理
%%-----------------------------------------------------------------------------%
\let\old@bibliography\bibliography                          % 保护原有附录环境
\renewcommand{\bibliography}[1]{                            %
    \phantomsection \addcontentsline{toc}{chapter}{参考文献}%
    \sDefault \bibliographystyle{nputhesis}                 % 参考文献格式
    \old@bibliography{#1} \cleardoublepage                  % 参考文献 bib 文件
}                                                           %
%%-----------------------------------------------------------------------------%
\let\old@appendix\appendix                                  % 保护原有附录环境
\renewcommand{\appendix}{                                   % 在原有基础上定制
    \old@appendix                                           %
    \setcounter{chapter}{0}                                 % 重置章节编号
    \if@npu@lang@chs                                        % 中文本地化显示
        \renewcommand{\thechapter}{附录\Alph{chapter}}      %
        \renewcommand{\appendixname}{附录}                  %
    \else                                                   % 英文使用默认环境
        \renewcommand{\thechapter}{Appendix \Alph{chapter}} %
        \renewcommand{\appendixname}{Appendix}              %
    \fi                                                     %
    \titleformat{\chapter}[hang]{\normalfont\sSanhao        %
        \filcenter\fHei\bf}{\fHei\sSanhao{\thechapter}}{    %
        20pt}{\sSanhao}                                     %
    \titlecontents{chapter}[0pt]{\fSong\sLgXiaosi\vspace{   %
        0.5em}}{\contentsmargin{0pt}\fSong\makebox[0pt][l]{ %
        \thecontentslabel}\hspace{4em}}{\contentsmargin{    %
        0pt}\fSong}{\titlerule*[.5pc]{.}\contentspage}[     %
        \vspace{0em}]                                       %
    \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
    \renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
    \renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
    \renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
    \renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
    \renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
    \renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
    \renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
    \renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
    \renewcommand{\theexample}{\alph{chapter}.\arabic{example}}
}                                                           %
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%%=============================================================================%
%%-----------------------------------------------------------------------------%
%%=============================================================================%

%% 
%% This work consists of the file  yanputhesis.dtx
%% and the derived files           yanputhesis.ins,
%%                                 yanputhesis.pdf,
%%                                 yanputhesis.cls.
%% 
%%
%% End of file `yanputhesis.cls'.
