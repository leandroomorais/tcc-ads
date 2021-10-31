%%
%% Customização do abnTeX2 para a Instituição IFRN
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is SEU_NOME, SEU_EMAIL
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}

%
% Repassa todos os parametros a classe abntex2, 
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}
%
%
% alterando a capa
\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \center
    {\normalsize\MakeUppercase\imprimirinstituicao}
    
    \vspace*{1cm}
    
    {\normalsize\MakeUppercase\imprimirautor}

    \vfill
    \begin{center}
    \bfseries\normalsize\MakeUppercase\imprimirtitulo
    \end{center}
    \vfill
    
    \normalsize\MakeUppercase\imprimirlocal

    \normalsize\MakeUppercase\imprimirdata
    
    \vspace*{1cm}
  \end{capa}
}


% alterando a folha de rosto 

\makeatletter

\renewcommand{\folhaderostocontent}{
\begin{center}
%{\ABNTEXchapterfont\normalsize\MakeUppercase\imprimirinstituicao}
%    
%    \vspace*{1cm}
    
{\normalsize\MakeUppercase\imprimirautor}

\vspace*{\fill}\vspace*{\fill}

\begin{center}
\bfseries\normalsize\MakeUppercase\imprimirtitulo
\end{center}

\vspace*{\fill}

\abntex@ifnotempty{\imprimirpreambulo}{%
  \hspace{.45\textwidth}
  \begin{minipage}{.5\textwidth}
  \SingleSpacing
  \imprimirpreambulo\par
  \imprimirorientadorRotulo~\imprimirorientador  \par
  \imprimircoorientadorRotulo~\imprimircoorientador
  \end{minipage}%
  \vspace*{\fill}
}%

%{\large\imprimirorientadorRotulo~\imprimirorientador\par}
%
%\abntex@ifnotempty{\imprimircoorientador}{%
%  {\large\imprimircoorientadorRotulo~\imprimircoorientador}%
%}%
%
%\vspace*{\fill}
%
%{\abntex@ifnotempty{\imprimirinstituicao}{\imprimirinstituicao\vspace*{\fill}}}

{\normalsize\MakeUppercase\imprimirlocal}

\par

{\normalsize\imprimirdata}
\vspace*{1cm}
\end{center}
}

\makeatother

% -----------------------------------------------------------------------------
% Dedicatória
% -----------------------------------------------------------------------------
\makeatletter
\renewenvironment{dedicatoria}[1][]
{%
	\ifthenelse{\equal{#1}{}}{%
		\PRIVATEbookmarkthis{\dedicatorianame}
	}{\pretextualchapter{#1}}
	
	\vspace*{\fill}
	
	\begin{flushright}
		\begin{minipage}{.5\textwidth}
			\begin{SingleSpacing}
				\setlength\parindent{0pt}
				\setlength\parskip{12pt}
			}
			{%
			\end{SingleSpacing}
		\end{minipage}
	\end{flushright}
}
\makeatother

% -----------------------------------------------------------------------------
% Epígrafe
% -----------------------------------------------------------------------------
\makeatletter
\renewenvironment{epigrafe}[1][]
{%
	\ifthenelse{\equal{#1}{}}
	{%
		\PRIVATEbookmarkthis{\epigraphname}
	}{\pretextualchapter{#1}}
	
	\vspace*{\fill}
	
	\begin{flushright}
		\begin{minipage}{.5\textwidth}
			\begin{SingleSpacing}
				\setlength\parindent{0pt}
				\setlength\parskip{12pt}
			}
			{%
			\end{SingleSpacing}
		\end{minipage}
	\end{flushright}
}
\makeatother
%Alterações no súmario e listas (figuras,simbolos etc)

%Gerar a fonte da seção maiúscula (limitação da classe memoir)
\makeatletter
\let\oldcontentsline\contentsline
\def\contentsline#1#2{%
	\expandafter\ifx\csname l@#1\endcsname\l@section
	\expandafter\@firstoftwo
	\else
	\expandafter\@secondoftwo
	\fi
	{%
		\oldcontentsline{#1}{\MakeTextUppercase{#2}}%
	}{%
		\oldcontentsline{#1}{#2}%
	}%
}
\makeatother

\makeatletter

\renewcommand\cftdotsep\cftnodots   %não exibir pontos nas listas de figuras, sumario etc

\renewcommand{\ABNTEXchapterfontsize}{\normalsize\bfseries}
\setboolean{ABNTEXupperchapter}{true} %titulos maiusculos e negrito

%1111

% Edição das fontes adotadas no sumário
\renewcommand{\cftpartfont}{\larger}
%Secao Primaria (Chapter): Negrito
\renewcommand{\cftchapterfont}{\bfseries} 
\renewcommand{\cftchapterpagefont}{\normalsize\cftchapterfont}
%
\renewcommand{\cftsectionfont}{\normalsize}
\renewcommand{\cftsectionpagefont}{\cftsectionfont}
%
\renewcommand{\cftsubsectionfont}{\normalsize}
\renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}
%
\renewcommand{\cftsubsubsectionfont}{\normalsize\bfseries}
\renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
%
\renewcommand{\cftparagraphfont}{\textit}
\renewcommand{\cftparagraphpagefont}{\cftparagraphfont}


%modifica (no texto) as fontes das seções, subseções ...

\renewcommand{\ABNTEXsectionfont}{\scshape}
\setsecheadstyle{\uppercase}
\renewcommand{\ABNTEXsubsectionfont}{\scshape}
\setsubsecheadstyle{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfont}{\scshape}
\setsubsubsecheadstyle{\bfseries}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\scshape}
\setsubsubsubsecheadstyle{\itshape}
\makeatother

\newcommand{\refanexo}[1]{\hyperref[#1]{Anexo~\ref{#1}}}