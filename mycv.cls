\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mycv}[2011/09/18 Insti Standard Template CV]
%\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
%\setlength{\textwidth}{6.5in}
%\setlength{\textheight}{8in}

%Loads the article class as the base template for further changes
\LoadClass[10pt]{article}

%Following are all the packages required for this class file
\RequirePackage{titlesec}
\RequirePackage{charter}
\RequirePackage[hmargin=.5in, vmargin=-0.05in]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{array}

%Define fields that the user can set
\makeatletter
  \newcommand{\RollNumber}[1]{\def \@RollNumber {#1}}
  \newcommand{\Address}[1]{\def \@Address {#1}}
  \newcommand{\PhoneNumber}[1]{\def \@PhoneNumber {#1}}
  \newcommand{\Email}[1]{\def \@Email {#1}}
  \newcommand{\CourseVar}[1]{\def \@CourseVar {#1}}
  \RollNumber{}
  \Address{}
  \PhoneNumber{}
  \Email{}
  \CourseVar{}
\makeatother


%Defines how the title will look
\makeatletter
\def \maketitle{%
  \thispagestyle{empty}
  \pagestyle{empty}
  \begin{minipage}{\textwidth}
    \raggedright \vspace{1.5em}
    {\Large \scshape \textbf{\@author} {} $|$ \@RollNumber}
    \vspace{0.2em}

    {\small \scshape \@CourseVar}
    \vspace{.35em}
  \end{minipage}
  \\[.1em] 
  \begin{minipage}{.33\textwidth}
    \raggedright
    \@Address %Address of the student
  \end{minipage} 
  \begin{minipage}{.33\textwidth}
    \begin{center}
      \@PhoneNumber %Phone number of the student
    \end{center}
  \end{minipage}
  \begin{minipage}{.33\textwidth}
    \raggedleft
    \@Email %Email id of the student
  \end{minipage}
  \vspace{-.5em} \hrule
}
\makeatother



%Define lengths that might be used later on in the document
\newlength{\EduTableOne}
\newlength{\EduTableTwo}
\newlength{\EduTableThree}
\newlength{\EduTableFour}

%Create a new variable TwoColumn to check for a two-column format
\newif\ifLeftTwoColumn
\newif\ifRightTwoColumn
\newif\ifTwoColumn
\newif\ifCourse

%Set paragraph indent and lengths of previously defined variables
\setlength{\parindent}{0em}
\settowidth{\EduTableOne}{\textbf{M.Sc Bioinformatics}}
\settowidth{\EduTableTwo}{\textbf{Panjab University, Chandigarh}}
\settowidth{\EduTableThree}{\textbf{Total/CGPA/Rank}}
\settowidth{\EduTableFour}{\textbf{completion}}



%Reformat section, subsection and subsubsection as needed
\titleformat{\section}{\Large\scshape\raggedright}{}{0em}{}[\titlerule]
% \titleformat{\subsection}{\large\scshape\raggedright}{$\bullet$}{.5em}{}
\titleformat{\subsection}{\large\scshape\raggedright}{}{0em}{}
\titleformat{\subsubsection}[runin]{\bf\large\raggedright}{$\bullet$}{.5em}{}

%Change the spacing options for section, subsection and subsubsection
%The first parameter specifies the gap from the margin in the default case
%and the indentation just before the title for runin
%The second parameter specifies the vertical space before the title
%The third parameter specifies the separation between title and text
\titlespacing{\section}{0em}{0.35em}{0.35em}
\titlespacing{\subsection}{0em}{.25em}{.05em}
\titlespacing{\subsubsection}{1.5em}{.25em}{.2em}

% Defines a new environment called Education that is dedicated for 
% creating the table for filling in details about education. The command
% \EduDetails must be used in order to enter stuff in here
% \newenvironment{EducationTable}{%
%   \begin{center}%
%     \begin{tabular*}{\textwidth}{@{}p{.28\textwidth}@{\hspace{-2mm}}p{.32\textwidth}@{\hspace{-4mm}}c@{\hspace{-2mm}}c@{}}%
%       \textbf{Program} & \textbf{Institution} & \textbf{CGPA/Rank} & \textbf{Completion} \\[-0.5ex]
% }
% {\end{tabular*}%
% \end{center}%
% }

% \newenvironment{EducationTable}{%
%   \begin{center}%
%     \normalsize
%     \setlength{\tabcolsep}{3pt}
%     \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}l@{\hspace{2mm}}c@{\hspace{2mm}}r@{}}%
%       \textbf{Program} & \textbf{Institution} & \textbf{CGPA} & \textbf{Year} \\[-0.3ex]
% }
% {\end{tabular*}%
% \end{center}%
% }

% \newcommand{\EduDetails}[5]{%
%   #1 & #2 & \begin{tabular}[c]{@{}c@{}} #3 \\ {\small #4} \end{tabular} & #5 \\[0.5em]
% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{EducationTable}{%
  \begin{center}%
    \normalsize
    \setlength{\tabcolsep}{3pt}
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}l@{\hspace{2mm}}c@{\hspace{2mm}}r@{}}%
      \textbf{Program} & \textbf{Institution} & \textbf{CGPA/Marks} & \textbf{Year} \\[-0.3ex]
}
{%
\end{tabular*}%
\end{center}%
}

\newcommand{\EduDetails}[5]{%
  #1 & #2 & \begin{tabular}[c]{@{}c@{}} #3 \\ {\small \textcolor{mygray}{#4}} \end{tabular} & #5 \\[-1em]
}

\newcommand{\EduFootnote}[1]{%
  \vspace{-0.5em}
  \hspace*{\fill}\scriptsize\textit{#1}\par
}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
% %Create a new environment specifically for course related content
% \newenvironment{Course}{%
%   \TwoColumntrue
%   \vspace{-0.55em}
%   \begin{multicols}{2}
%     \raggedright
% }
% {
% \end{multicols}
% \TwoColumnfalse
% }
%\newenvironment{Course}[1]{%
%  \LeftTwoColumntrue
%  \RightTwoColumnfalse
%  \Coursetrue
%  \section{#1}
%  \begin{tabular*}{.8\textwidth}{p{0.4\textwidth} p{0.4\textwidth}}
%}
%{\end{tabular*}
%\RightTwoColumntrue
%\LeftTwoColumnfalse
%\Coursefalse
%}


%Define new commands
%Define a new dated section type (NOT needed for IITM format)
\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}

%Define a new dated subsection that can be used for filling in project 
%durations etc.
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill \small #2}%
}

%Define a new command called \Point which will take care of indentation and 
%allow you to fill in stuff inside a subsection
\newcommand{\Point}[1]{%
  \subsubsection[]{}%
  \raggedright
  \hangindent=3em\hangafter=1\noindent%
  \ifTwoColumn
    \parbox[t]{.4\textwidth}{#1}
  \else#1%
  \fi
  \par%
}


%\newcommand{\Point}[1]{%
%  %\subsubsection{}
%  \ifCourse
%    \ifLeftTwoColumn
%      
%      \begin{minipage}{.4\textwidth}
%	\subsubsection{} #1
%      \end{minipage}
%      \RightTwoColumntrue
%      \LeftTwoColumnfalse
%    %\fi
%    %\ifRightTwoColumn%
%    \else
%      \begin{minipage}{.4\textwidth}
%	\subsubsection{} #1
%      \end{minipage}
%      \RightTwoColumnfalse
%      \LeftTwoColumntrue
%    \fi
%  \else
%    \subsubsection{} 
%    \hangindent=3.45em\hangafter=1\noindent%
%    #1
%  \fi
%}


%Define the \EduDetails command that must be used inside an Education
%environment defined above
