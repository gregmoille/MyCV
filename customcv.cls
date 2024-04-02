%% Start of file `Customcv.cls'.
% Gregory Moille -- 2020
% --------------------------------------
% based on the "Awesome CV Class" File and largely modified
%
% This class has been downloaded from:
% https://github.com/posquit0/Awesome-CV



%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{customcv}
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{ifxetex}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage[quiet]{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{unicode-math}
% \RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage[skins,,breakable]{tcolorbox}
\RequirePackage{parskip}
\RequirePackage{environ}
\RequirePackage{xargs}
\RequirePackage{makecell}
\RequirePackage{tabularx,booktabs}
\RequirePackage{longtable}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage[natbib=false,
            backend=biber,%bibtex
			maxcitenames=99,
			mincitenames=99,
			maxbibnames=99,
			minbibnames=1,
% 			giveinits=true,
			doi=true,
			url=false,
			isbn=true,
      firstinits=true,
			abbreviate=true,
			useauthor=true,
			sorting=ymdt,
			sortcites=true,
            autocite=plain,
            style = numeric-comp,
            % backrefstyle=two,
			bibencoding=utf8]{biblatex}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

\DeclareSortingTemplate{ymdt}{
  \sort{
    \field{presort}
  }
  \sort[final]{
    \field{sortkey}
  }
  \sort[direction=descending]{
    \field{sortyear}
    \field{year}
  }
  \sort[direction=descending]{
    \field[padside=left,padwidth=2,padchar=0]{month}
    \literal{00}
  }
  \sort[direction=descending]{
    \field[padside=left,padwidth=2,padchar=0]{day}
    \literal{00}
  }
  \sort{
    \field{sorttitle}
  }
  \sort{
    \field[padside=left,padwidth=4,padchar=0]{volume}
    \literal{0000}
  }
}


% \RequirePackage{tabularx}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
\geometry{left=2cm, top=1.5cm, right=10.0cm, bottom=2.0cm, footskip=.5cm}
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{bluegray}{HTML}{3f709a}
\definecolor{orangepantone}{HTML}{FF8F1C}
\definecolor{PANTONE19-4052}{HTML}{0F4C81}
\definecolor{PANTONE2152C}{HTML}{1A658F}
\definecolor{PANTONE2180C}{HTML}{3F6C7D}
\definecolor{PANTONE3541C}{HTML}{00939D}
\definecolor{PANTONE632C}{HTML}{0093B2}
\definecolor{PANTONE631C}{HTML}{3EB1C8}


% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

% \newfontfamily{\FAFR}{Font Awesome 6 Free Regular}
% \newfontfamily{\FAFS}{Font Awesome 6 Free Solid}
% \newfontfamily{\FAB}{Font Awesome 6 Brands Regular}
% \def\faEmail{{\FAFR \symbol{"F0E0}}} % Email
% \def\faPhone{\FAFS \symbol{"F095}} % Phone

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{26pt}{1em}\headerfontlight\scshape\color{awesome} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{26pt}{1em}\headerfont\scshape\color{text}#1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\headerfont\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentryhindextyle}[1]{{\fontsize{6pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{text} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{11pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{lighttext} #1}}


%% ---- 
% Biblio

\def\mblx@yearfrom{-1000}
\def\mblx@yearto{3000}

\newrobustcmd*{\setcheckfromtorange}[2]{%
  \def\mblx@yearfrom{#1}%
  \def\mblx@yearto{#2}%
}

\defbibcheck{fromto}{%
  \iffieldint{year}
    {\ifnumless{\thefield{year}}{\mblx@yearfrom}
       {\skipentry}
       {\ifnumgreater{\thefield{year}}{\mblx@yearto}
          {\skipentry}
          {}}}
    {\skipentry}}


% 

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\newcommand*{\researchinterests}[1]{\def\@researchinterests{#1}}
\def\@familyname{\@lastname}


\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\skype}[1]{\def\@skype{#1}}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}
\newcommand*{\xing}[1]{\def\@xing{#1}}
\newcommand*{\medium}[1]{\def\@medium{#1}}
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------

\renewcommand{\arraystretch}{0.75}
%  === HEADER =====
% ================================
\newlength{\tablemargin}
\setlength{\tablemargin}{10pt}
\setlength{\tabcolsep}{\tablemargin}
\newcommand*{\makecvheader}[1][C]{%
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
    \newbool{isstart}%
    \setbool{isstart}{true}%
    \newlength{\longword}%
    \newlength{\addresslength}%
    \newlength{\firstheight}%
    \settowidth{\longword}{\headerfirstnamestyle{\@firstname}}%
    \settowidth{\addresslength}{\headeraddressstyle{\@address}}%
    \settoheight{\firstheight}{\headerfirstnamestyle{\@firstname}}
    \begin{tabular}[t]{@{\hskip0pt}l @{\hskip0pt} l}
    \resizebox*{!}{2\firstheight + 1.5ex}{%
        \null\hspace{-1.5pt}\begin{minipage}[t]{\longword}%
             \resizebox*{\longword}{!}{\headerfirstnamestyle{\@firstname}}
            \vspace{-2ex}\\
            \resizebox*{\longword}{!}{\headerlastnamestyle{\@lastname}}
        \end{minipage}
        }%    
        &%
        \resizebox*{!}{2\firstheight + 0.5ex}{
            \begin{minipage}[t]{\addresslength}%
                \vspace{-1.2\firstheight}
                \headeraddressstyle{\@address}\\
                \headersocialstyle{\@mobile}\\
                \headersocialstyle{ \href{mailto:\@email}{\@email}}\\
            \end{minipage}
        }
    \end{tabular}
    \hfill
    \begin{tabular}[t]{@{\hskip0pt}l @{\hskip0pt} r}
    %   \vspace{-1.2\firstheight}
        \begin{minipage}[t]{0.3\textwidth}%
                \vspace{-1.1\firstheight}
                \headeraddressstyle{\textsc{Research Interests:}}\\
                \headersocialstyle{\@researchinterests}\\
        \end{minipage}
       
            % \headersocialstyle{ \href{mailto:\@email}{\faEnvelope~~\@email}}\\
      
    \end{tabular}
    \vskip -2ex
    \rule{\addresslength}{0.25pt}
    \vskip 0.35cm
}

%  === FOOTER =====
% ================================
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

%  === SECTIONS =====
% ================================
\newcommand{\cvsectiontitle}[2]{%
    \sectionstyle{#1}%
}
\newcommand{\cvsection}[2]{%
    \ifempty{#2}{%
        \sectionstyle{#1}%
    }{\sectionstyle{#1} \\
      \sectionstyle{#2}
    }
}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}%
  \vspace{0mm}%
  \subsectionstyle{#1}%
}

%  === PARAGRAPH =====
% ================================
\newcommand*{\cvparagraph}[1]{%
      &%
        % \begin{minipage}[t]{\textwidth - 2cm}
        %   \paragraphstyle{#1}
        #1
        % \end{minipage}
}
\renewcommand{\arraystretch}{0}
%  === CV Entries =====
% ===============================
\newcommand*{\cventries}[2]{
    \begin{tcolorbox}[
      blanker,
      width=\textwidth-3.1cm,enlarge left by=3.1cm,
      before skip=0pt,
      left=0pt,right=0pt,top=0pt,bottom=10pt,
      breakable,
    %   borderline={0.5pt}{0pt},
      overlay unbroken and first={%
        \node[inner sep=0pt,outer sep=0pt,text width=3.1cm,
          align=none,
          below right]
          at ([xshift=-3.1cm]frame.north west)%
        %   [rectangle,draw]
      {%
        #1 %  <------------------------
      };}]
    #2
    \end{tcolorbox}
}

\newcommand*{\cventry}[5]{%
\begin{tabular}[t]{@{\hskip0pt}p{\textwidth - 2.4cm - 1pt} @{\hskip0pt} @{\hskip0pt}p{2.4cm}@{\hskip0pt}}%
    \ifempty{#1}{\entrytitlestyle{#2}\\[2ex]}{
        \ifempty{#2#3}%
          {\entrypositionstyle{#1} & \entrydatestyle{#4} \\[1ex]}
          {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\[2.25ex]
          \entrypositionstyle{#1} & \entrydatestyle{#4} \\[2ex]}
          }\\
    \multicolumn{2}{@{\hskip0pt}@{\hskip0pt} L{\textwidth}@{\hskip0pt}@{\hskip0pt} }{\descriptionstyle{#5}}\hfill
  \end{tabular}\\\vskip-4ex%
}

\newcommand*{\cvsubentry}[2]{
    \begin{tabular}[t]{@{\hskip0pt}p{3cm}@{\hskip0pt}}
        \entrytitlestyle{#1}\\[3ex]
        \descriptionstyle{#2}
    \end{tabular}
}


% === Education =====
% ================================
\newcommand*{\cveducations}[1]{
    #1 %
    \vspace{2ex}
}
\newcommand*{\cveducation}[4]{%
\linespread{0.6}\selectfont
    \begin{tabular}[t]{@{\hskip0pt}>{\raggedright}p{3.1cm}@{\hskip0pt} @{\hskip0pt}p{2.4cm}@{\hskip0pt}}%
        \entrytitlestyle{#1} & \entrylocationstyle{#3}\\[2ex]
        \entrypositionstyle{#2} & \entrydatestyle{#4}
    \end{tabular}\hspace{-2.1pt}%
}

% === Education =====
% ================================
\newcommand*{\cvacademics}[1]{
    #1 %
    \vspace{2ex}
}
\newcommand*{\cvacademic}[2]{%
\linespread{0.6}\selectfont
    \begin{tabular}[t]{@{\hskip0pt}>{\raggedright}p{7.8cm}@{\hskip0pt}}%
        \entrytitlestyle{#1}\\[1ex]
        #2
    \end{tabular}\hspace{-4.1pt}%
}

\newcommand*{\cvacademicentry}[4]{%
\linespread{0.6}\selectfont
    \begin{tabular}[t]{@{\hskip0pt}>{\raggedright}p{2cm}@{\hskip0pt}@{\hskip0pt}>{\raggedright}p{2.4cm}@{\hskip0pt}@{\hskip0pt}>{\raggedright}p{1cm}@{\hskip0pt}@{\hskip0pt}>{\raggedright}p{2.4cm}@{\hskip0pt}}%
        \descriptionstyle{#1} &\descriptionstyle{#2} &\descriptionstyle{#3} &\entrydatestyle{#4} 
    \end{tabular}\hspace{-4.1pt}%
}


% === SKILLS =====
% ================================
\newcommand*{\cvskills}[1]{%
    &\hspace{-\tablemargin}\vspace{-1.37ex}%
    
    #1
}
\newcommand*{\cvskillentry}[2]{%
    \begin{tabular}[t]{@{\hskip0pt}l@{\hskip0pt}}%
        \entrytitlestyle{#1}\\[1ex]
        \begin{tabular}[b]{@{\hskip0pt}l@{\hskip0pt}@{\hskip0pt}p{3.4em}@{\hskip0pt}}
            #2
        \end{tabular}
  \end{tabular}
}

\newcommand*{\cvskill}[2]{
    \descriptionstyle{#1} & \grade{#2}\\[0.75ex]
}
\newcommand*{\grade}[1]{%
    \begin{tikzpicture}
    \clip (1*0.66em-.3em,-.3em) rectangle (5*0.66em +.5em ,.3em);
    \foreach \x in {1,2,...,5}{
        \path[{fill=lightgray}] (\x*0.66 em,0) circle (.175em);
    }
    \begin{scope}
    \clip (0.66em-.3em,-.3em) rectangle (#1*0.66em +.5em ,.3em);
    \foreach \x in {1,2,...,5}{
        \path[{fill=awesome}] (\x*0.66 em,0) circle (.175em);
    }
    \end{scope}
    \end{tikzpicture}%
}
% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-1ex}
%   \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
%   \end{justify}
%   \vspace{-1ex}
}

% darktext
% graytext
% lightext
% ==== Bibliography style === 
% ======================================
\newcommand*{\authorliststyle}[1]{\fontsize{9pt}{1em}\upshape\color{text}{#1}}
\newcommand*{\titlestyle}[1]{\fontsize{9pt}{1em}\itshape\color{graytext}{#1}}
\newcommand*{\journalstyle}[1]{\fontsize{9pt}{1em}\bodyfontlight\scshape\color{text}{#1}}

\defbibenvironment{bibnonum}
  {\list
     {}
     {\setlength{\leftmargin}{\bibhang}%
      \setlength{\itemindent}{-\leftmargin}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}}
  {\endlist}
  {\item}
  
\newenvironment{cvlist}
{
  \vspace{-1ex}\begin{itemize}[leftmargin=2ex]%
  }
  {\end{itemize}}

 \defbibenvironment{bibbullet}
  {\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text}
  \vspace{-1ex}\begin{itemize}[leftmargin=2ex, nosep, noitemsep]%
  }
  {\end{itemize}}
  {\item}

\AtEveryBibitem{\clearfield{month}}
	\AtEveryBibitem{\clearfield{read}}
	\AtEveryBibitem{\clearfield{date-added}}
	\AtEveryBibitem{\clearfield{date-modified}}
	\AtEveryBibitem{\clearfield{file}}
	% \AtEveryBibitem{\clearfield{number}}
	\AtEveryBibitem{\clearfield{local-url}}
	\AtEveryBibitem{\clearfield{uri}}
	\DeclareFieldFormat[article, unpublished]{volume}{{#1}}
	\DeclareFieldFormat[article, unpublished]{pages}{#1}
    \DeclareFieldFormat[article, unpublished]{journaltitle}{#1}
    \DeclareFieldFormat[article, unpublished]{title}{#1}
% 	\DeclareFieldFormat[article,thesis]{date}{#1}
% 	\DeclareFieldFormat[incollection]{title}{"#1"}
    % \DeclareFieldFormat[inproceedings]{title}{\textit{#1}}
    % \DeclareFieldFormat[inproceedings]{booktitle}{\textup{#1}}
    \DeclareFieldFormat[book, inproceedings]{date}{(#1)}
	\renewcommand{\UrlFont}{\small}

	\ExecuteBibliographyOptions{doi=false}
	\ExecuteBibliographyOptions{doi=false}
	\DeclareFieldFormat{doilink}{%
	\iffieldundef{doi}{#1}%
	{\href{http://dx.doi.org/\thefield{doi}}{#1}}}

	\DeclareFieldFormat{urllink}{%
	\iffieldundef{url}{#1}%
	{\href{\thefield{url}}{#1}}}

% \DeclareFieldFormat{labelnumber}{\mkbibdesc{#1}}
%   \newrobustcmd*{\mkbibdesc}[1]{%
%   \number\numexpr\csuse{entrycount:\therefsection}+1-#1\relax}
  
 \DeclareBibliographyDriver{book}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \usebibmacro{author/translator+others}%
    \setunit{\labelnamepunct}\newblock
    \printtext[urllink]{%
    \usebibmacro{title}%
    }%
    \newunit%
    \setunit{\bibpagerefpunct}\newblock
    \usebibmacro{note+pages}
    \newunit%
    \usebibmacro{byeditor+others}
    \usebibmacro{publisher+location+date}%
    \newunit%
    \usebibmacro{pageref}
    \usebibmacro{finentry}}

  \DeclareBibliographyDriver{article}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\itshape\usebibmacro{title}}%
    \newunit
    \newunit\newblock
    \usebibmacro{byauthor}%
    \newunit\newblock
    \usebibmacro{bytranslator+others}%
    \newunit\newblock
    \printfield{version}%
    \newunit\newblock
    \printtext[doilink]{%
        \journalstyle{\usebibmacro{journal+issuetitle}}%
        \newunit
        \usebibmacro{byeditor+others}%
        \newunit
        \newunit\newblock
        \usebibmacro{doi+eprint+url}%
        \newunit\newblock
        % \usebibmacro{addendum+pubstate}%
        \setunit{\bibpagerefpunct}\newblock
    }%
    % \newunit%
    % \usebibmacro{pageref}
    % \usebibmacro{note}
    \descriptionstyle{\printfield{note}}
    \usebibmacro{finentry}}
  

    \DeclareBibliographyDriver{misc}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\itshape\usebibmacro{title}}%
    \newunit
    \newunit\newblock
    \usebibmacro{byauthor}%
    % \newunit\newblock
    % \usebibmacro{bytranslator+others}%
    % \newunit\newblock
    % \printfield{version}%
    \newunit\newblock
    \printtext[doilink]{%
        \journalstyle{\usebibmacro{journal+issuetitle}}%
        \newunit
        \usebibmacro{byeditor}%
        \newunit
        \newunit\newblock
        % \usebibmacro{doi+eprint+url}%
        % \newunit\newblock
        % \usebibmacro{addendum+pubstate}%
        \setunit{\bibpagerefpunct}
        \newblock
    }%
    % \newunit%
    % \usebibmacro{pageref}
    % \usebibmacro{note}
    % \descriptionstyle{\printfield{note}}
    % \usebibmacro{finentry}
    }
    
    
    
  \DeclareBibliographyDriver{unpublished}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\itshape\usebibmacro{title}}%
    \newunit
    \newunit\newblock
    \usebibmacro{byauthor}%
    \newunit\newblock
    \usebibmacro{bytranslator+others}%
    \newunit\newblock
    \printfield{version}%
    \newunit\newblock
    \printtext[doilink]{%
    \journalstyle{\usebibmacro{journal}}%
    \newunit
    \usebibmacro{byeditor+others}%
    \newunit
    \newunit\newblock
    \usebibmacro{doi+eprint+url}%
    \newunit\newblock
    % \usebibmacro{addendum+pubstate}%
    \setunit{\bibpagerefpunct}\newblock
    }%
    \newunit%
    \usebibmacro{pageref}
    % \usebibmacro{note}
    \descriptionstyle{\printfield{note}}
    \usebibmacro{finentry}}

 \DeclareBibliographyDriver{online}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\itshape\usebibmacro{title}}%
    \newunit
    \newunit\newblock
    \usebibmacro{byauthor}%
    \newunit\newblock
    \usebibmacro{bytranslator+others}%
    \newunit\newblock
    \printfield{version}%
    \newunit\newblock
    \printtext[doilink]{%
    \journalstyle{\usebibmacro{journal+issuetitle}}%
    \newunit
    \usebibmacro{byeditor+others}%
    \newunit
    \newunit\newblock
    \usebibmacro{doi+eprint+url}%
    \printtext[urllink]{\usebibmacro{url}}
    \newunit\newblock
    % \usebibmacro{addendum+pubstate}%
    \setunit{\bibpagerefpunct}\newblock
    }%
    \newunit%
    \usebibmacro{pageref}
    % \usebibmacro{note}
    \descriptionstyle{\printfield{note}}
    \usebibmacro{finentry}}

  \DeclareBibliographyDriver{inproceedings}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\itshape\usebibmacro{title}\newblock}
    \printtext[urllink]{%
    \descriptionstyle{\usebibmacro{booktitle}}%
    \descriptionstyle{\usebibmacro{date}}%
    }%
    \newunit%
    \setunit{\bibpagerefpunct}\newblock
    \newunit%
   \usebibmacro{byeditor+others}
    \newunit%
    \usebibmacro{pageref}
    \usebibmacro{finentry}}

  \DeclareBibliographyDriver{incollection}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \printtext[urllink]{%
    \titlestyle{\usebibmacro{maintitle+booktitle}}%
    }%
    \newunit%
    \titlestyle{\usebibmacro{title}}%
    \setunit{\bibpagerefpunct}\newblock
    \usebibmacro{note+pages}
    \newunit%
    \descriptionstyle{\usebibmacro{publisher+location+date}}
    \newunit%
    \newunit%
    \usebibmacro{pageref}
    \usebibmacro{finentry}}

  \DeclareBibliographyDriver{thesis}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\printtext[urllink]{\usebibmacro{title}}}
    \newunit%
    \usebibmacro{note+pages}
    \descriptionstyle{PhD Thesis}
    \descriptionstyle{\usebibmacro{date}}%
    \newunit%
    \usebibmacro{pageref}
    \usebibmacro{finentry}}

  % \DeclareBibliographyDriver{misc}{%
  %   \usebibmacro{bibindex}%
  %   \usebibmacro{begentry}%
  %   \setunit{\labelnamepunct}\newblock
  %   \printtext[urllink]{\usebibmacro{title}}
  %   \newunit%
  %   \usebibmacro{publisher+location+date}
  %   \newunit%
  %   \usebibmacro{pageref}
  %   \usebibmacro{finentry}}

  \DeclareBibliographyDriver{report}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \descriptionstyle{\usebibmacro{author/translator+others}}%
    \setunit{\labelnamepunct}\newblock
    \titlestyle{\printtext[urllink]{\usebibmacro{title}}}
    \newunit%
    \descriptionstyle{Tech. Report}
    \descriptionstyle{\usebibmacro{publisher+location+date}}
    \newunit%
    \usebibmacro{pageref}
    \usebibmacro{finentry}}
