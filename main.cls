\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{main.cls}[22/4/2018 Articles by Yegor Bugayenko]
\LoadClass[11pt,oneside]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[american]{babel}
\RequirePackage[
  paperwidth=6in, paperheight=9in,
  bindingoffset=0.25in, left=0.75in, right=0.75in, top=0.75in, bottom=1.25in
]{geometry}
\RequirePackage{setspace}
\RequirePackage{microtype}
\RequirePackage{indentfirst}

\pagestyle{empty}
\setlength{\topskip}{6pt}
\setlength{\parindent}{0pt} % indent first line
\setlength{\parskip}{0pt} % before par
\interfootnotelinepenalty=10000
\setstretch{1.1}

\RequirePackage{mathpazo} % Palantino font

\RequirePackage{xcolor}
\RequirePackage{hyperref}
  \hypersetup{colorlinks=true,allcolors=blue!40!black}
\RequirePackage[style=authoryear,sorting=nyt,backend=biber,
  hyperref=true,abbreviate=true,
  maxcitenames=1,maxbibnames=1]{biblatex}
  \addbibresource{/code/home/main.bib}
%  \DeclareLanguageMapping{american}{american-apa}

\RequirePackage{framed}
\renewenvironment{abstract}{\setlength{\parindent}{0pt}\begin{leftbar}\it}{\end{leftbar}}

\AtBeginDocument{\raggedbottom%
By \textbf{Yegor Bugayenko}\\
{\small
CEO of Zerocracy, Inc.\\
555 Bryant, Ste 470, Palo Alto, CA 94301\\
\texttt{yegor@zerocracy.com}\\
408.692.4742\\
\immediate\write18{./wordcount.sh tex/\jobname.tex > temp/\jobname.words 2>&1}
\input{temp/\jobname.words} words
}

\vspace{2em}
{\LARGE\bf \@title}
\setlength{\parindent}{18pt}
}

\AtEndDocument{%
  \printbibliography%
}

\endinput
