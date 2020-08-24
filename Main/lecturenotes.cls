% This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/4.0/
% or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2020/01/12 Lecture notes class]
\LoadClass{book}

% Page size and margins
\RequirePackage[letterpaper,
%	top= 1in,
%	bottom= 1in,
	left= 1in,
%	right= 2.5in,
	textwidth=4.5in,
	marginparsep = 0.25in,
	marginparwidth = 2in]{geometry}

% Scientific packages
\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{tikz} % Required for drawing custom shapes
\usetikzlibrary{arrows.meta}
\RequirePackage{tikzsymbols}
\RequirePackage{../Main/latex_qc_notation}
\RequirePackage{topcapt}
\RequirePackage{booktabs}
\RequirePackage{braket}
\RequirePackage[version=3,arrows=pgf]{mhchem}
\RequirePackage{cancel}

% Typography
\RequirePackage{mathspec}  % Includes amsmath.
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{titling}
\RequirePackage{enumitem}
\RequirePackage{bbding}
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{marginnote}
\RequirePackage{mparhack}
\RequirePackage{hyperref}
\RequirePackage{booktabs}
\RequirePackage{xcolor}

\hypersetup{
    colorlinks,
    linkcolor={white!10!black},
    citecolor={orange!80!black},
    urlcolor={red!80!black}
}

% Set fonts
\defaultfontfeatures{Mapping=tex-text}
\setallmainfonts[
  Path=../Fonts/Noto_Sans/,
  Scale=0.8333333333, %0.9166666667,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont= *-Bold,
  ItalicFont= *-Italic,
  BoldItalicFont= *-BoldItalic
]{NotoSans}

\newfontfamily\headingfont[ExternalLocation=../Fonts/Barlow_Condensed/]{BarlowCondensed}[ 
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont= *-SemiBold
]

\definecolor{LectureGreen}{RGB}{70,70,70}
\definecolor{LectureEmph}{RGB}{70,140,70}

\let\emph\relax % there's no \RedeclareTextFontCommand
\DeclareTextFontCommand{\emph}{\bfseries\color{LectureEmph}}



\newcommand\mychapformat[1]{%
  \parbox[t]{\dimexpr\textwidth+2in\relax}{\raggedright#1}}
  
% Chapter format \huge\bfseries \headingfont 
\titleformat{\chapter}[hang]{\huge\bfseries\headingfont\color{LectureGreen}}{{\Huge\thechapter}\textcolor{white!50!black}{~|~}}{0pt}{\mychapformat}
%\titleformat{\chapter}[hang]
% { % <format>
% %\color{white!20!black} \huge\headingfont
% }
% { % <label>
%% \color{white!20!black} \bfseries{\large\textsc{CHAPTER}}\ \thechapter \\ \noindent\rule{6in}{0.5pt}
% }{0pt}
% {\huge }
  
% Section format
\titleformat*{\section}{\color{white!20!black} \Large\headingfont\bfseries}

% Subsection format
\titleformat*{\subsection}{\normalsize\headingfont}
%\renewcommand{\maketitlehooka}{\headingfont}
\captionsetup[figure]{margin=0pt,font=small,labelfont=bf,name=Fig.}

%
% Custom colored boxes
%---------------------------------------------------------------------------------
\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

% Important equation box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=gray,
backgroundcolor=black!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt,
innerbottommargin=5pt]{ImportantBox}

%
% Custom theorem styles
%
\newtheoremstyle{ocrenumbox}% % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\color{gray}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\headingfont\color{gray}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
\renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square

\newtheoremstyle{blacknumex}% Theorem style name
{9pt}% Space above
{9pt}% Space below
{\small}% Body font set to small size
{} % Indent amount
{\small\bf\sffamily}% Theorem head font
{\;\newline}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\headingfont{\tiny\ensuremath{\blacksquare}}\nobreakspace\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}
}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\headingfont\bfseries\nobreakspace(#3).}}% Optional theorem note

\newtheoremstyle{blacknumbox} % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% Body font
{}% Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

% Exercise box	  
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
backgroundcolor=white,%gray!1,
linecolor=gray,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=2pt]{eBox}	

% Defines the theorem text style for each type of theorem to one of the three styles above
\newcounter{dummy} 
\numberwithin{dummy}{section}
\theoremstyle{ocrenumbox}
\newtheorem{problemT}{Problem}[section]
\newtheorem{exerciseT}{Exercise}[section]
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Example}[section]
%\theoremstyle{blacknumbox}
%\newtheorem{importantEquationT}[dummy]{ImportantEquation}


%% A custom itemize env
%
%
%\newenvironment{summary} {
%	\begin{enumerate}[label=(\alph*)]
%	\setlength{\itemsep}{3pt}
%	\setlength{\parskip}{0pt}
%	\setlength{\parsep}{0pt}
%}{
%	\end{enumerate}
%}

\newenvironment{terminal}
{
%\VerbatimEnvironment
\begin{verbatim}
}
%[numbers=left,fontsize=\scriptsize, stepnumber=3,
%                 frame=single,framerule=0.4mm,samepage=true]}
{\end{verbatim}}
% Creates an environment for each type of theorem and assigns it a theorem text style from the "Theorem Styles" section above and a colored box from above
\newenvironment{problem}
	{\begin{eBox}\begin{problemT}}
	{\end{problemT}\vspace{6pt}\end{eBox}}

\newenvironment{aside}
  {\begin{mdframed}[style=0,%
      leftline=false,rightline=false,leftmargin=2em,rightmargin=2em,%
          innerleftmargin=0pt,innerrightmargin=0pt,linewidth=0.75pt,%
      skipabove=7pt,skipbelow=7pt]\small}
  {\end{mdframed}}

\newenvironment{example}
	{\begin{exampleT}}
	{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}

\newenvironment{exercise}
	{\begin{eBox}\begin{exerciseT}}
	{\hfill{\color{gray}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}			

\newenvironment{ibox}
	{\begin{ImportantBox}}
	{\end{ImportantBox}}

\newenvironment{iequation}
	{\begin{ImportantBox}\begin{equation}}
	{\end{equation}\end{ImportantBox}}

\newenvironment{summary}
	{
	\section*{Summary}
		\begin{ImportantBox}
		\begin{itemize}[label=\raisebox{-0.75ex}{\HandRight}]
		\setlength{\itemsep}{3pt}
		\setlength{\parskip}{0pt}
		\setlength{\parsep}{0pt}
	}
	{\end{itemize}\end{ImportantBox}}

% A customized list of items
\newenvironment{myitems}
	{
		\begin{itemize}
		\setlength{\itemsep}{3pt}
		\setlength{\parskip}{0pt}
		\setlength{\parsep}{0pt}
	}
	{\end{itemize}}

\newcounter{mnotecount}
\renewcommand\themnotecount{$^{\textrm{\arabic{mnotecount}}}$}

\newcommand\mnote[1]{\refstepcounter{mnotecount}\themnotecount%$^{\arabic{mnotecount}}$
%\themnotecount%
	\marginpar{
		\setstretch{0.9}\themnotecount\footnotesize{#1}
	}
}
\newcommand\mfigure[1]{
	\marginpar{
		\setstretch{0.9}\textmd{\footnotesize{#1}}
	}
}

\newcommand\mdef[2]{
	\marginpar{
		\setstretch{0.9}\footnotesize{\textbf{#1}:~{#2}}
	}
}

\newcommand\mtodo[1]{$^\star$
	\marginpar{
		\setstretch{0.9}\footnotesize{\textcolor{orange!50!black}{#1}}
	}
}
