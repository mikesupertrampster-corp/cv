% Intro Options
\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\RequirePackage[lmargin=0.9cm, vmargin=0.85cm, rmargin=0.9cm]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{pifont}
\RequirePackage[document]{ragged2e}

% Publications
\RequirePackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{date}{HTML}{666666}
\definecolor{title}{HTML}{1D76E2}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Title Font Definitions
% Used for Name  and Section Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def \pathtitlefont {fonts/sourcesanspro/}
\def \firstnamefont {sourcesanspro-SemiBold}
\def \secondnamefont {sourcesanspro-light}
\def \titlefont {\firstnamefont}
\def \namefontsize {9.5}

% Main Font Definitions
\def \pathmainfont {fonts/inter/}
\def \mainfont {inter-light}
\def \mainfontbold {inter-semibold}
\def \mainfontsize {9.5}
\def \mainsansfont {inter-light}

% Main Subheading Font Definitions
% Used for company name and sub-skills
\def \pathsubheadingfont {\pathtitlefont}
\def \subheadingfont {\titlefont}
\def \subheadingsize {12}

% Main Job Descriptor and Location Font Definitions
% Used for company name and sub-skills
\def \pathdescriptorfont {\pathsubheadingfont}
\def \descriptorfont {\secondnamefont}
\def \descriptorsize {10}
\def \pathlocationfont {\pathsubheadingfont}
\def \locationfont {\subheadingfont}
\def \locationsize {8pt}

% Main Monospace Font Definitions
% Used for Job Title and Contact Line
\def \pathmonofont {fonts/officecodeprod/}
\def \monofont {OfficeCodeProD-Light}

% Set main fonts
\RequirePackage{fontspec}
\setmainfont[Color=primary, Path = \pathmainfont,BoldFont=\mainfontbold,UprightFeatures={SizeFeatures={Size=\mainfontsize}},BoldFeatures={SizeFeatures={Size=\mainfontsize}}]{\mainfont}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = \pathmainfont,UprightFeatures={SizeFeatures={Size=\mainfontsize}}]{\mainsansfont}

% Date command
\RequirePackage[absolute]{textpos}
\RequirePackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
\color{date}\fontspec[Path = \pathmainfont]{\mainfont}\fontsize{8pt}{10pt}\selectfont
Last Updated on \today
\end{textblock}}

% Name command
\newcommand{\namesection}[4]{
\RaggedRight{
\color{title}
\fontsize{40pt}{50pt}
\fontspec[Path = \pathtitlefont]{\firstnamefont}\selectfont #1
\fontspec[Path = \pathtitlefont]{\secondnamefont}\selectfont #2
} \\[5pt]

\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
\vspace{-15pt}

\RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{14pt}{14pt}\selectfont #3}

\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
\vspace{-15pt}

\RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{10pt}{14pt}\selectfont #4}

\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
\vspace{-15pt}
}

% Section separators
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{5pt}{5pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{5pt}}

% Headings command
\titleformat{\section}{\color{title}
\scshape\fontspec[Path = \pathtitlefont]{\titlefont}\fontsize{16pt}{24pt}\selectfont \raggedright}{}{0em}{}

% Subheadings command
\titleformat{\subsection}{\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{14pt}\selectfont\bfseries\uppercase}{}{0em}{}

% Subheadings on the right
\newcommand{\runsubsection}[1]{\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{14pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\scshape\fontspec[Path = \pathdescriptorfont]{\descriptorfont}\fontsize{\descriptorsize}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{\color{headings}\raggedright\fontspec[Path = \pathlocationfont]{\locationfont}\fontsize{\locationsize}{12pt}\selectfont {#1\\} \normalfont}

% Contact Line
\newcommand{\contactline}[2]{\begingroup
\setbox0=\hbox{
\includegraphics[scale=0.20,trim={1.4cm 1.25cm -0.4cm 0cm}]{icons/main/github.png}{#1}\hspace{0.3cm}
\includegraphics[scale=0.20,trim={0cm 1.25cm -0.4cm 0cm}]{icons/main/linkedin.png}{#2}\hspace{0.3cm}
}\parbox{\wd0}{\box0}\endgroup}

% Inline Centered Logo
\newcommand{\vcenteredinclude}[2]{\begingroup
\setbox0=\hbox{\includegraphics[scale=0.10,trim={0 0.7cm 0cm 0cm}]{#1} {#2}}
\parbox{\wd0}{\box0}\endgroup}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
\vspace{-\topsep}\begin{itemize}[label=\ding{212}]\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}
