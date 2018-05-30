%
% quintorthesis v1.0
% By Steven Schenk <sschenk@quintor.nl>
% Version 1.0 released 10/4/2018
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Quintorthesis}[2018/4/10 v1.0 Quintor thesis class]


%-------------------------- packages ---------------------
\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo

\usepackage{xcolor}
\usepackage{eso-pic}
\usepackage[a4paper, total={6.5in, 9in}]{geometry}
\usepackage[default,osfigures,scale=0.95]{opensans} 
\usepackage[T1]{fontenc}
\usepackage[strict]{changepage}
\usepackage{framed}

\graphicspath{ {images/}, {Bijlages/} }

%-------------------------- Initialize ---------------------
\LoadClass[a4paper,11pt]{report}
\definecolor{quintorred}{RGB}{184, 56, 71} 

\newcommand\BackgroundPic{%
\put(0,0){%
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
\includegraphics[width=\paperwidth,height=\paperheight,%
keepaspectratio]{cover.jpg}%
% \vfill
}}}


% ---------------------- Margin and sizes ---------------------
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{0.33in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}



% ------------------------- Title mage ----------------------------
\newcommand{\documenttype}[1]{\def\@documenttype{#1}}
\renewcommand\maketitle{
    \AddToShipoutPicture*{\BackgroundPic}
    
  \newgeometry{margin = 0in}
  \centering
  {\colorbox{quintorred}{\hspace{50pt}\parbox[b]{21cm}{\Huge \color{white} \hspace{1cm} \vspace{2cm}}}}
  \vspace{3.0cm}
  \parbox{0.8\textwidth}{
      \centering
      \vspace{2cm}      
  {\huge\bfseries \normalfont \color{gray} \@documenttype \par}
  {\Huge\bfseries \normalfont \@title \par}
  \vspace{4.0cm}
  {\LARGE \bfseries \normalfont \@author } \\
  {\Large \bfseries \normalfont \@date}
  }

{\includegraphics[width=0.35\textwidth]{quintor}}
}

% ---------------------- Roman Pages -----------------------------
\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

% --- Formal block --- %
\definecolor{formalshade}{RGB}{252, 232, 239}

\newenvironment{formal}{%
  \def\FrameCommand{%
    \hspace{0pt}%
    {\color{quintorred}\vrule width 2pt}%
    {\color{formalshade}\vrule width 4pt}%
    \colorbox{formalshade}%
  }%
  \MakeFramed{\advance\hsize-\width\FrameRestore}%
  \noindent\hspace{-4.55pt}% disable indenting first paragraph
  \begin{adjustwidth}{}{7pt}%
  \vspace{-8pt}%
}
{%
  \vspace{7pt}\end{adjustwidth}\endMakeFramed%
}