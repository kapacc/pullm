%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%	MDPI class for LaTeX files	 13 March 2026
%% %%	For any information please send an e-mail to:
%% %%		latex@mdpi.com
%% %%
%% %%	Initial class provided by:
%% %%		Stefano Mariani 
%% %%     Modified by:
%% %%		Dietrich Rordorf 
%% %%		Peter Harremoes 
%% %%		Zeno Schumacher 
%% %%		Maddalena Giulini 
%% %%		Andres Gartmann 
%% %%		Dr. Janine Daum 
%% %%		Xiu Li
%% %%     Versions:
%% %%		v1.0 before Dr. Janine Daum
%% %%		v2.0 when Dr. Janine Daum started (March 2013)
%% %%		v3.0 layout change September 2015
%%%%		v4.0 layout change December 2020
%%%%             v5.0 layout change December 2024
%%%%             v6.0 layout change December 2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Definitions/mdpi}[13/03/2026 MDPI paper class]

 %% PRELIMINARY DECLARATIONS
\LoadClass[10pt,a4paper]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{calc}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx,epstopdf}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[right,mathlines]{lineno}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{mathpazo}
\RequirePackage{booktabs}
\RequirePackage{titlesec}
\RequirePackage{etoolbox}
\RequirePackage{tabto}
\RequirePackage{xcolor, colortbl}
\RequirePackage{soul}
\newcommand{\highlighting}[1]{\colorbox{yellow}{#1}}
\RequirePackage{multirow}
\RequirePackage{microtype}
\RequirePackage{tikz}
\RequirePackage{refcount}
\RequirePackage{changepage}
\RequirePackage{attrib}
\RequirePackage{upgreek}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{pbox}
\RequirePackage{ragged2e}
\RequirePackage[subfigure]{tocloft}
\RequirePackage{marginnote}
\reversemarginpar
\RequirePackage{marginfix}
\RequirePackage{enotez}
\RequirePackage{xstring}
\RequirePackage[labelformat=simple]{subfig}
\renewcommand\thesubfigure{\normalfont(\textbf{\alph{subfigure}})}
\RequirePackage{alphalph}

%% OPTIONS
\def\@continuouspages{}
\newcommand{\continuouspages}[1]{\gdef\@continuouspages{#1}}

\input{Definitions/journalnames}
\DeclareOption{journal}{\ClassWarning{mdpi}{You used an invalid journal name or you have not specified the journal.}}

\DeclareOption{abstract}{\gdef\@arttype{Abstract}}
\DeclareOption{addendum}{\gdef\@arttype{Addendum}}
\DeclareOption{article}{\gdef\@arttype{Article}}
\DeclareOption{benchmark}{\gdef\@arttype{Benchmark}}
\DeclareOption{book}{\gdef\@arttype{Book}}
\DeclareOption{bookreview}{\gdef\@arttype{Book Review}}
\DeclareOption{briefcommunication}{\gdef\@arttype{Brief Communication}}
\DeclareOption{briefreport}{\gdef\@arttype{Brief Report}}
\DeclareOption{casereport}{\gdef\@arttype{Case Report}}
\DeclareOption{changes}{\gdef\@arttype{Changes}}
\DeclareOption{clinicopathologicalchallenge}{\gdef\@arttype{Clinicopathological Challenge}}
\DeclareOption{comment}{\gdef\@arttype{Comment}}
\DeclareOption{commentary}{\gdef\@arttype{Commentary}}
\DeclareOption{communication}{\gdef\@arttype{Communication}}
\DeclareOption{conceptpaper}{\gdef\@arttype{Concept Paper}}
\DeclareOption{conferenceproceedings}{\gdef\@arttype{Proceedings}}
\DeclareOption{correction}{\gdef\@arttype{Correction}}
\DeclareOption{conferencereport}{\gdef\@arttype{Conference Report}}
\DeclareOption{creative}{\gdef\@arttype{Creative}}
\DeclareOption{datadescriptor}{\gdef\@arttype{Data Descriptor}}
\DeclareOption{discussion}{\gdef\@arttype{Discussion}}
\DeclareOption{entry}{\gdef\@arttype{Entry}}
\DeclareOption{expressionofconcern}{\gdef\@arttype{Expression of Concern}}
\DeclareOption{extendedabstract}{\gdef\@arttype{Extended Abstract}}
\DeclareOption{editorial}{\gdef\@arttype{Editorial}}
\DeclareOption{essay}{\gdef\@arttype{Essay}}
\DeclareOption{erratum}{\gdef\@arttype{Erratum}}
\DeclareOption{fieldguide}{\gdef\@arttype{Field Guide}}
\DeclareOption{hypothesis}{\gdef\@arttype{Hypothesis}}
\DeclareOption{interestingimages}{\gdef\@arttype{Interesting Images}}
\DeclareOption{letter}{\gdef\@arttype{Letter}}
\DeclareOption{meetingreport}{\gdef\@arttype{Meeting Report}}
\DeclareOption{monograph}{\gdef\@arttype{Monograph}}
\DeclareOption{newbookreceived}{\gdef\@arttype{New Book Received}}
\DeclareOption{obituary}{\gdef\@arttype{Obituary}}
\DeclareOption{opinion}{\gdef\@arttype{Opinion}}
\DeclareOption{proceedingpaper}{\gdef\@arttype{Proceeding Paper}}
\DeclareOption{projectreport}{\gdef\@arttype{Project Report}}
\DeclareOption{reply}{\gdef\@arttype{Reply}}
\DeclareOption{retraction}{\gdef\@arttype{Retraction}}
\DeclareOption{review}{\gdef\@arttype{Review}}
\DeclareOption{perspective}{\gdef\@arttype{Perspective}}
\DeclareOption{protocol}{\gdef\@arttype{Protocol}}
\DeclareOption{shortnote}{\gdef\@arttype{Short Note}}
\DeclareOption{studyprotocol}{\gdef\@arttype{Study Protocol}}
\DeclareOption{supfile}{\gdef\@arttype{Supfile}}
\DeclareOption{systematicreview}{\gdef\@arttype{Systematic Review}}
\DeclareOption{technicalnote}{\gdef\@arttype{Technical Note}}
\DeclareOption{viewpoint}{\gdef\@arttype{Viewpoint}}
\DeclareOption{guidelines}{\gdef\@arttype{Guidelines}}
\DeclareOption{registeredreport}{\gdef\@arttype{Registered Report}}
\DeclareOption{tutorial}{\gdef\@arttype{Tutorial}}
\DeclareOption{giantsinurology}{\gdef\@arttype{Giants in Urology}}
\DeclareOption{urologyaroundtheworld}{\gdef\@arttype{Urology around the World}}
\DeclareOption{patentsummary}{\gdef\@arttype{Patent Summary}}

\DeclareOption{submit}{\gdef\@status{submit}}
\DeclareOption{accept}{\gdef\@status{accept}}

\DeclareOption{oneauthor}{\gdef\@authornum{author}}
\DeclareOption{moreauthors}{\gdef\@authornum{authors}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{notspecified,10pt,a4paper,article,submit,oneauthor}

\ProcessOptions\relax

\newcommand{\isBookContribution}{%
	\ifthenelse{\equal{\@arttype}{Book}%
	\OR \equal{\@arttype}{Monograph}%
	}%
}

\newcommand{\isMonograph}{%
       \ifthenelse{\equal{\@arttype}{Monograph}%
	}%
}

\newcommand{\isPreprints}{%
        \ifthenelse{\equal{\@journal}{preprints}%
         \OR \equal{\@journal}{preprintschicago}%
         \OR \equal{\@journal}{preprintsapa}%
	}%
}

\RequirePackage{amsthm}
\newtheoremstyle{mdpi}{12pt}{12pt}{\itshape}{}{\bfseries}{.}{.5em}{}

\renewcommand{\qed}{\unskip\nobreak\quad\qedsymbol}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{.}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}

 \theoremstyle{mdpi}
 \newcounter{theorem}\setcounter{theorem}{0}
 \newtheorem{Theorem}[theorem]{Theorem}
 \newcounter{lemma}\setcounter{lemma}{0}
 \newtheorem{Lemma}[lemma]{Lemma}
 \newcounter{corollary}\setcounter{corollary}{0}
 \newtheorem{Corollary}[corollary]{Corollary}
 \newcounter{proposition}\setcounter{proposition}{0}
 \newtheorem{Proposition}[proposition]{Proposition}
 \newcounter{characterization}\setcounter{characterization}{0}
 \newtheorem{Characterization}[characterization]{Characterization}
 \newcounter{property}\setcounter{property}{0}
 \newtheorem{Property}[property]{Property}
 \newcounter{problem}\setcounter{problem}{0}
 \newtheorem{Problem}[problem]{Problem}
 \newcounter{example}\setcounter{example}{0}
 \newtheorem{Example}[example]{Example}
 \newcounter{examplesanddefinitions}\setcounter{examplesanddefinitions}{0}
 \newtheorem{ExamplesandDefinitions}[examplesanddefinitions]{Examples and Definitions}
 \newcounter{remark}\setcounter{remark}{0}
 \newtheorem{Remark}[remark]{Remark}
 \newcounter{definition}\setcounter{definition}{0}
 \newtheorem{Definition}[definition]{Definition}
 \newcounter{hypothesis}\setcounter{hypothesis}{0}
 \newtheorem{Hypothesis}[hypothesis]{Hypothesis}
 \newcounter{notation}\setcounter{notation}{0}
 \newtheorem{Notation}[notation]{Notation}
 \newcounter{assumption}\setcounter{assumption}{0}
 \newtheorem{Assumption}[assumption]{Assumption}
 \newcounter{algorithm}\setcounter{algorithm}{0}
 \newtheorem{Algorithm}[algorithm]{Algorithm}

\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}

\newcommand{\isChicagoStyle}{
	\ifthenelse{\equal{\@journal}{arts}
		\OR \equal{\@journal}{genealogy}
		\OR \equal{\@journal}{histories}
		\OR \equal{\@journal}{humanities}
		\OR \equal{\@journal}{laws}
		\OR \equal{\@journal}{literature}
		\OR \equal{\@journal}{religions}
		\OR \equal{\@journal}{risks}
		\OR \equal{\@journal}{socsci}
             \OR \equal{\@journal}{preprintschicago}
             \OR \equal{\@journal}{chicagojournal}
		}
}

\newcommand{\isAPAStyle}{
	\ifthenelse{\equal{\@journal}{admsci}
		\OR \equal{\@journal}{aieduc}
		\OR \equal{\@journal}{behavsci}
		\OR \equal{\@journal}{businesses}
		\OR \equal{\@journal}{econometrics}
		\OR \equal{\@journal}{economies}
		\OR \equal{\@journal}{education}
		\OR \equal{\@journal}{ejihpe}
		\OR \equal{\@journal}{famsci}
		\OR \equal{\@journal}{games}
		\OR \equal{\@journal}{humans}
		\OR \equal{\@journal}{ijcs}
		\OR \equal{\@journal}{ijfs}
		\OR \equal{\@journal}{jintelligence}
		\OR \equal{\@journal}{journalmedia}
		\OR \equal{\@journal}{jrfm}
		\OR \equal{\@journal}{jsam}
		\OR \equal{\@journal}{languages}
		\OR \equal{\@journal}{peacestud}
		\OR \equal{\@journal}{projmanag}
		\OR \equal{\@journal}{psycholint}
		\OR \equal{\@journal}{publications}
		\OR \equal{\@journal}{tourismhosp}
		\OR \equal{\@journal}{youth}
             \OR \equal{\@journal}{preprintsapa}
             \OR \equal{\@journal}{apajournal}
		}
}

\newcommand{\isAPAandChicago}{
	\ifthenelse{\equal{\@journal}{arts}
		\OR \equal{\@journal}{genealogy}
		\OR \equal{\@journal}{histories}
		\OR \equal{\@journal}{humanities}
		\OR \equal{\@journal}{jintelligence}
		\OR \equal{\@journal}{laws}
		\OR \equal{\@journal}{literature}
		\OR \equal{\@journal}{religions}
		\OR \equal{\@journal}{risks}
		\OR \equal{\@journal}{socsci}
             \OR \equal{\@journal}{preprintschicago}
	      \OR \equal{\@journal}{admsci}
		\OR \equal{\@journal}{aieduc}
		\OR \equal{\@journal}{behavsci}
		\OR \equal{\@journal}{businesses}
		\OR \equal{\@journal}{econometrics}
		\OR \equal{\@journal}{economies}
		\OR \equal{\@journal}{education}
		\OR \equal{\@journal}{ejihpe}
		\OR \equal{\@journal}{famsci}
		\OR \equal{\@journal}{games}
		\OR \equal{\@journal}{humans}
		\OR \equal{\@journal}{ijcs}
		\OR \equal{\@journal}{ijfs}
		\OR \equal{\@journal}{journalmedia}
		\OR \equal{\@journal}{jrfm}
		\OR \equal{\@journal}{jsam}
		\OR \equal{\@journal}{languages}
		\OR \equal{\@journal}{peacestud}
		\OR \equal{\@journal}{projmanag}
		\OR \equal{\@journal}{psycholint}
		\OR \equal{\@journal}{publications}
		\OR \equal{\@journal}{tourismhosp}
		\OR \equal{\@journal}{youth}
             \OR \equal{\@journal}{preprintsapa}
             \OR \equal{\@journal}{chicagojournal}
             \OR \equal{\@journal}{apajournal}
		}
}

\isAPAStyle{%
\RequirePackage[natbibapa]{Definitions/mdpi_apacite}
          }{%
          \RequirePackage[sort&compress,sectionbib]{natbib}
}

\renewcommand\NAT@set@cites{%
  \ifNAT@numbers
    \ifNAT@super \let\@cite\NAT@citesuper
       \def\NAT@mbox##1{\unskip\nobreak\textsuperscript{##1}}%
       \let\citeyearpar=\citeyear
       \let\NAT@space\relax
       \def\NAT@super@kern{\kern\p@}%
    \else
       \let\NAT@mbox=\mbox
       \let\@cite\NAT@citenum
       \let\NAT@space\relax
       \let\NAT@super@kern\relax
    \fi
    \let\@citex\NAT@citexnum
    \let\@biblabel\NAT@biblabelnum
    \let\@bibsetup\NAT@bibsetnum
    \renewcommand\NAT@idxtxt{\NAT@name\NAT@spacechar\NAT@open\NAT@num\NAT@close}%
    \def\natexlab##1{}%
    \def\NAT@penalty{\penalty\@m}%
  \else
    \let\@cite\NAT@cite
    \let\@citex\NAT@citex
    \let\@biblabel\NAT@biblabel
    \let\@bibsetup\NAT@bibsetup
    \let\NAT@space\NAT@spacechar
    \let\NAT@penalty\@empty
    \renewcommand\NAT@idxtxt{\NAT@name\NAT@spacechar\NAT@open\NAT@date\NAT@close}%
    \def\natexlab##1{##1}%
  \fi}

\isAPAStyle{%
      \bibliographystyle{Definitions/mdpi_apacite}
          }{%
              \isChicagoStyle{%
	        \bibliographystyle{Definitions/mdpi_chicago}
	        \bibpunct{(}{)}{;}{x}{}{,}%
	        }{%
	            \bibliographystyle{Definitions/mdpi}
	            \bibpunct{[}{]}{,}{n}{}{,}%
       }%
}

\definecolor{bluecite}{HTML}{0875b7}

\newcommand{\crefnameDefinitions}{
	\crefname{figure}{Figure}{Figures}
	\crefname{table}{Table}{Tables}
	\crefname{section}{Section}{Sections}
	\crefname{appendix}{Appendix}{Appendices}
	\crefname{scheme}{Scheme}{Schemes}
	\crefname{chart}{Chart}{Charts}
	\crefname{paragraph}{Section}{Sections}
	\crefname{graph}{Graph}{Graphs}
}

\newcommand{\hyperrefpackage}{
      \isBookContribution{%
	\RequirePackage[unicode=true,bookmarksopen={true},pdffitwindow=true,colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,hyperfootnotes=false,pdfstartview={FitH},pdfpagemode=UseNone,pdfpagelabels]{hyperref}
	}{
	\ifthenelse{\equal{\@journal}{laws}}{
	\RequirePackage[unicode=true,bookmarksopen={true},pdffitwindow=true,colorlinks=true,linkcolor=bluecite,citecolor=bluecite,urlcolor=bluecite,hyperfootnotes=false,pdfstartview={FitH},pdfpagemode=UseNone]{hyperref}
	}{
	\RequirePackage[unicode=true,bookmarksopen={true},pdffitwindow=true,colorlinks=true,linkcolor=bluecite,citecolor=bluecite,urlcolor=bluecite,hyperfootnotes=true,pdfstartview={FitH},pdfversion=1.7,pdfpagemode=UseNone]{hyperref}
	}
}
\RequirePackage[capitalise,noabbrev]{cleveref}
}
\ifdef{\AddToHook}{
\DeclareHookRule{begindocument}{hyperref}{before}{mdpi}
	\AddToHook{begindocument/before}{
		\hyperrefpackage
             \crefnameDefinitions
		}
	}{
	     \hyperrefpackage
           \crefnameDefinitions
}

\ifdefined\XeTeXversion
    \typeout{Check out XeLaTex!}
    \else
    \pdfminorversion=7
\fi

\newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}}

\newcommand{\cleverefDefinitions}{
	\crefrangelabelformat{figure}{##3##1##4--##5##2##6}
	\crefrangelabelformat{table}{##3##1##4--##5##2##6}
	\crefrangelabelformat{section}{##3##1##4--##5##2##6}
	\crefrangelabelformat{appendix}{##3##1##4--##5##2##6}
	\crefrangelabelformat{scheme}{##3##1##4--##5##2##6}
	\crefrangelabelformat{chart}{##3##1##4--##5##2##6}
	\crefrangelabelformat{graph}{##3##1##4--##5##2##6}
}

\newcommand{\crefrangeconjunction}{--}
\newcommand{\fig}[1]{Figure~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}}
\newcommand{\sect}[1]{Section~\ref{#1}}
\newcommand{\app}[1]{Appendix~\ref{#1}}
\newcommand{\sche}[1]{Scheme~\ref{#1}}
\newcommand{\cchart}[1]{Chart~\ref{#1}}
\newcommand{\equ}[1]{\ref{#1}}
\newcommand{\boxref}[1]{Box~\ref{#1}}
\newcommand{\cgraph}[1]{Graph~\ref{#1}}

\newcommand{\org@maketitle}{}
\let\org@maketitle\maketitle
\def\maketitle{%
	\hypersetup{
		pdftitle={\@Title},
		pdfsubject={\@abstract},
		pdfkeywords={\@keyword},
		pdfauthor={\@AuthorNames}
	}%
	\org@maketitle
}

\setenotez{backref=true}
\DeclareInstance{enotez-list}{custom}{paragraph}{
	format=\fontsize{9}{11}\selectfont\leftskip0.76cm,
      number=\textsuperscript{\makebox[6mm][l]{#1}},
	notes-sep=0pt
}

\RequirePackage{scrextend}
\setlength{\skip\footins}{0.6cm}
\setlength{\footnotesep}{8pt}
\deffootnote{1.5em}{0em}{\textsuperscript{\thefootnotemark}\quad}

\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\tolerance=1000

\maxdeadcycles=10000

\linespread{1.165}

\setlength{\parindent}{0.75cm}
\newcommand{\dist}{1.7em}
\newcommand{\hang}{\hangafter=1\hangindent=\dist\noindent}

\def\instring#1#2{TT\fi\begingroup\edef\x{\endgroup\noexpand\in@{#1}{#2}}\x\ifin@}

\newcommand{\firstargument}{}
\newcommand{\Title}[1]{\gdef\@Title{#1}}
\def\@Author{}
\newcommand{\Author}[1]{\gdef\@Author{#1}}
\def\@AuthorNames{}
\newcommand{\AuthorNames}[1]{\gdef\@AuthorNames{#1}}
\newcommand{\firstpage}[1]{\gdef\@firstpage{#1}}
\newcommand{\doinum}[1]{\gdef\@doinum{#1}}

\newcommand\twodigits[1]{%
	\ifnum#1<10 0\number#1\else\number#1\fi
}

\newcommand\fivedigits[1]{%
	\ifnum#1<10 000\number#1\else
		\ifnum#1<100 00\number#1\else
			\ifnum#1<1000 0\number#1\else
				\ifnum#1<10000 \number#1\else
					\ifnum#1<100000 \number#1\else error\fi
				\fi
			\fi
		\fi
	\fi
}

\ifthenelse{\equal{\@journal}{molbank}
	\OR \equal{\@journal}{chemproc}
	\OR \equal{\@journal}{engproc}
	\OR \equal{\@journal}{eesp}
	\OR \equal{\@journal}{materproc}
	\OR \equal{\@journal}{blsf}
	\OR \equal{\@journal}{msf}
	\OR \equal{\@journal}{psf}
	\OR \equal{\@journal}{csmf}
	}{
	\doinum{10.3390/\@articlenumber}
	}{
	\doinum{10.3390/\@doiabbr\@pubvolume\twodigits\@issuenum\fivedigits\@articlenumber}
}

\newcommand\cutdigits[1]{%
	\ifnum#1>0 \number#1\else
		\ifnum#1<10000 \number#1\else error\fi
	\fi
}

\newcommand{\pubvolume}[1]{\gdef\@pubvolume{\cutdigits{#1}}}
\newcommand{\pubyear}[1]{\gdef\@pubyear{#1}}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand{\address}[2][]{\renewcommand{\firstargument}{#1}\gdef\@address{#2}}
\newcommand{\corresfirstargument}{}
\def\@corres{}
\newcommand{\corres}[2][]{\renewcommand{\corresfirstargument}{#1}\gdef\@corres{#2}}
\def\@conference{}
\newcommand{\conference}[1]{\gdef\@conference{#1}}
\def\@abstract{}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\def\@externaleditor{}
\newcommand{\externaleditor}[1]{\gdef\@externaleditor{#1}}
\def\@LSID{}
\newcommand{\LSID}[1]{\gdef\@LSID{#1}}
\def\@datereceived{}
\newcommand{\datereceived}[1]{\gdef\@datereceived{#1}}
\def\@daterevised{}
\newcommand{\daterevised}[1]{\gdef\@daterevised{#1}}
\def\@dateaccepted{}
\newcommand{\dateaccepted}[1]{\gdef\@dateaccepted{#1}}
\newcommand{\datepublished}[1]{\gdef\@datepublished{#1}}
\def\@datecorrected{}
\newcommand{\datecorrected}[1]{\gdef\@datecorrected{#1}}
\def\@dateretracted{}
\newcommand{\dateretracted}[1]{\gdef\@dateretracted{#1}}
\def\@pacs{}
\newcommand{\PACS}[1]{\gdef\@pacs{#1}}
\def\@msc{}
\newcommand{\MSC}[1]{\gdef\@msc{#1}}
\def\@jel{}
\newcommand{\JEL}[1]{\gdef\@jel{#1}}
\def\@keyword{}
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}
\def\@dataset{}
\newcommand{\dataset}[1]{\gdef\@dataset{#1}}
\def\@datasetlicense{}
\newcommand{\datasetlicense}[1]{\gdef\@datasetlicense{#1}}
\def\@featuredapplication{}
\newcommand{\featuredapplication}[1]{\gdef\@featuredapplication{#1}}
\def\@keycontribution{}
\newcommand{\keycontribution}[1]{\gdef\@keycontribution{#1}}
\def\@issuenum{}
\newcommand{\issuenum}[1]{\gdef\@issuenum{\cutdigits{#1}}}
\def\@firstnote{}
\newcommand{\firstnote}[1]{\gdef\@firstnote{#1}}
\def\@secondnote{}
\newcommand{\secondnote}[1]{\gdef\@secondnote{#1}}
\def\@thirdnote{}
\newcommand{\thirdnote}[1]{\gdef\@thirdnote{#1}}
\def\@fourthnote{}
\newcommand{\fourthnote}[1]{\gdef\@fourthnote{#1}}
\def\@fifthnote{}
\newcommand{\fifthnote}[1]{\gdef\@fifthnote{#1}}
\def\@sixthnote{}
\newcommand{\sixthnote}[1]{\gdef\@sixthnote{#1}}
\def\@seventhnote{}
\newcommand{\seventhnote}[1]{\gdef\@seventhnote{#1}}
\def\@eighthnotes{}
\newcommand{\eighthnotes}[1]{\gdef\@eighthnotes{#1}}
\def\@ninethnote{}
\newcommand{\ninethnote}[1]{\gdef\@ninethnote{#1}}
\def\@tenthnote{}
\newcommand{\tenthnote}[1]{\gdef\@tenthnote{#1}}
\def\@eleventhnote{}
\newcommand{\eleventhnote}[1]{\gdef\@eleventhnote{#1}}
\def\@simplesumm{}
\newcommand{\simplesumm}[1]{\gdef\@simplesumm{#1}}
\newcommand{\articlenumber}[1]{
	\ifthenelse{\equal{\@journal}{molbank}}{
		\gdef\@articlenumber{#1}%
		}{
		\gdef\@articlenumber{\cutdigits{#1}}%
		}
	}

\def\@externalbibliography{}
\newcommand{\externalbibliography}[1]{\gdef\@externalbibliography{#1}}
\def\@reftitle{}
\newcommand{\reftitle}[1]{\gdef\@reftitle{#1}}
\def\@longauthorlist{}
\newcommand{\longauthorlist}[1]{\gdef\@longauthorlist{#1}}
\def\@encyclopediadef{}
\newcommand{\encyclopediadef}[1]{\gdef\@encyclopediadef{#1}}
\def\@addhighlights{}
\newcommand{\addhighlights}[1]{\gdef\@addhighlights{#1}}
\def\@CorrStatement{}
\newcommand{\CorrStatement}[1]{\gdef\@CorrStatement{#1}}
\newcommand{\textcorrstatement}{\textbf{Correction Statement:} This article has been republished with a minor change.}
\def\@IsAssociation{}
\newcommand{\IsAssociation}[1]{\gdef\@IsAssociation{#1}}

\newcommand{\orcidicon}{\includegraphics[width=0.32cm]{Definitions/logo-orcid.pdf}}

\foreach \x in {A, ..., Z}{%
\expandafter\xdef\csname orcid\x\endcsname{\noexpand\href{https://orcid.org/\csname orcidauthor\x\endcsname}{\noexpand\orcidicon}}
}

\newcommand{\journalname}{\@journalshort}

\ifthenelse{\equal{\@journal}{preprints}
		\OR \equal{\@journal}{preprintschicago}
		\OR \equal{\@journal}{preprintsapa}
		\OR \equal{\@arttype}{Book}
		\OR \equal{\@arttype}{Monograph}}{%
	\fancypagestyle{plain}{%
		\fancyhf{}
		\isPreprints{}{
        		\fancyfoot[C]{\footnotesize\thepage}
        		}
		}
	}{%
	\ifthenelse{\equal{\@arttype}{Supfile}}{
		\fancypagestyle{plain}{
			\fancyhf{}
			\fancyhead[R]{\footnotesize S\thepage{} of S\pageref*{LastPage}\\\rule{\fulllength}{0.4pt}}
			\fancyhead[L]{\footnotesize \ifthenelse{\equal{\@status}{submit}}{Version {\@ \today} submitted to {\em \journalname}}{} \\\vspace{-2pt}\rule{\fulllength}{0.4pt}}
			}
		}{
		\fancypagestyle{plain}{
		\renewcommand{\footrulewidth}{0.4pt}
			\fancyhead{\null\vspace{8pt}}
			\fancyfoot[L]{\fontsize{8}{8}\selectfont
			\ifthenelse{\equal{\@status}{submit}}{Version {\@ \today} submitted to {\em \journalname}}{}
			}
			\fancyfoot[R]{\fontsize{8}{8}\selectfont {\url{https://doi.org/\@doinum}}}
		}
	}
}

\renewcommand{\@maketitle}{
	\isBookContribution{}{
		\ifthenelse{\equal{\@leftcolumnsplit}{\@empty}}{
			\marginnote[\contentleftcolumn]{}[\MyLen]
			}{}
		\isPreprints{\vspace{0.92cm}}{%
		\begin{adjustwidth}{-\extralength}{}
		}
	}
	\begin{flushleft}
	\ifthenelse{\equal{\@arttype}{Supfile}}{%
		\fontsize{18}{18}\selectfont\raggedright\hyphenpenalty=10000\tolerance=1000
		\noindent\textbf{Supplementary Materials: \@Title}\par
		\vspace{12pt}\fontsize{10}{10}\selectfont
		\noindent\boldmath\bfseries{\@Author}
		}{%
		\isBookContribution{}{\vspace*{-1.75cm}}
		{\ifthenelse{\equal{\@journal}{preprints}\OR \equal{\@journal}{preprintschicago}\OR \equal{\@journal}{preprintsapa}\OR \equal{\@arttype}{Book}\OR \equal{\@arttype}{Monograph}}{}{
			\vspace{-2pt}
			\ifthenelse{\equal{\@status}{submit}}{\vspace{5pt}\hfill \href{https://www.mdpi.com}{\includegraphics[height=1cm]{Definitions/logo-mdpi.eps}}}{}
			\par\rule{\fulllength}{0.4pt}
		}\par}
		{\vspace{14pt}\fontsize{10}{10}\selectfont
		\isBookContribution{}{\textit{\@arttype}}\par}
   		{\fontsize{18}{18}\selectfont\hyphenpenalty=10000\tolerance=1000
   		\isMonograph{}{\boldmath\bfseries{\@Title}}\par\vspace{12pt}}
		\ifthenelse{\equal{\@longauthorlist}{\@empty}}{}{\end{flushleft}\isPreprints{}{\end{adjustwidth}}\vspace{-2.5pt}}
   		{\hyphenpenalty=10000\tolerance=1000\isMonograph{}{\boldmath\bfseries{\@Author}}\par\vspace{12pt}}
		}
	\ifthenelse{\equal{\@longauthorlist}{\@empty}}{\end{flushleft}}{}
	\isBookContribution{}{\ifthenelse{\equal{\@longauthorlist}{\@empty}}{\isPreprints{}{\end{adjustwidth}}}{}}
		\ifthenelse{\equal{\@leftcolumnsplit}{\@empty}}{}{\marginnote[\contentleftcolumn]{}}
	 \isMonograph{\vspace{-2cm}}{}
	}

\newcommand{\leftcolFont}{%
	\linespread{1.71}\fontsize{7}{7}\selectfont\justify\hyphenpenalty=10000\tolerance=1000
}

\newcommand{\leftcolumnUpdatelogo}{
	\leftcolFont
	\ifthenelse{\equal{\@status}{submit}}{}{
		\href{https://crossmark.crossref.org/dialog?doi=\@doinum&domain=pdf&date_stamp=\the\year-\twodigits{\the\month}-\twodigits{\the\day}}{\includegraphics[height=.6cm]{Definitions/logo-updates.eps}}
	\vspace{-18pt}\\
		}
}

\newcommand{\leftcolExternalEditor}{
	\ifthenelse{\equal{\@externaleditor}{\@empty}}{}{
		\leftcolFont\raggedright
            \IfSubStr{\@externaleditor}{ and }{Academic Editors: \@externaleditor}{{\fontdimen2\font=1.4pt Academic Editor: \@externaleditor}}
	      \vspace{-4pt}
	}
}

\newcommand{\leftcolDates}{
\isPreprints{}{
	\leftcolFont
	\ifthenelse{\equal{\@journal}{proceedings}\OR \equal{\@journal}{chemproc}\OR \equal{\@journal}{engproc}\OR \equal{\@journal}{eesp}\OR \equal{\@journal}{materproc}\OR \equal{\@journal}{blsf}\OR \equal{\@journal}{msf}\OR \equal{\@journal}{psf}\OR \equal{\@journal}{csmf}}{
			Published: \@datepublished\\\vspace{-16pt}
			}{
			Received: \@datereceived\\
			\ifthenelse{\equal{\@daterevised}{\@empty}}{}{Revised: \@daterevised\\}
			Accepted: \@dateaccepted\\
			Published: \@datepublished
			\ifthenelse{\equal{\@datecorrected}{\@empty}}{}{\newline Corrected: \@datecorrected}
			\ifthenelse{\equal{\@dateretracted}{\@empty}}{}{\newline Retracted: \@dateretracted}\vspace{-4pt}
		}
	}
}

\newcommand{\leftcolumnCorrstatement}{
\isPreprints{}{
	\ifthenelse{\equal{\@CorrStatement}{yes}}{\leftcolFont\textcorrstatement\vspace{-2pt}}{\vspace{-2pt}}
	}
}

\newcommand{\leftcolumnCright}{
\isPreprints{}{
	\leftcolFont\raggedright\cright
     }
}

\newcommand{\contentleftcolumn}{
       \ifthenelse{\equal{\@arttype}{Supfile}\OR \equal{\@journal}{preprints}\OR \equal{\@journal}{preprintschicago}\OR \equal{\@journal}{preprintsapa}}{
          }{
	\ifthenelse{\equal{\@status}{submit}}{}{\leftcolumnUpdatelogo}
      \leftcolExternalEditor
	\leftcolDates
	\leftcolumnCorrstatement
	\leftcolumnCright
            }
}

\newlength{\MyLen}
\newsavebox{\MyBox}

\newcommand{\calculateMyLen}{
	\savebox{\MyBox}{
		\parbox[l]{\leftcolumnlength}{\contentleftcolumn}
	}
	\settototalheight{\MyLen}{\usebox{\MyBox}}
	\setlength{\MyLen}{\textheight-\MyLen-12pt}
}

\def\@leftcolumnsplit{}
\newcommand{\leftcolumnsplit}[1]{\gdef\@leftcolumnsplit{#1}}

\newcommand{\OptionOneA}{\leftcolExternalEditor\leftcolDates\vspace{-2pt}}
\newcommand{\OptionOneB}{\leftcolumnCright}
\newcommand{\OptionTwoA}{\leftcolExternalEditor\vspace{-10pt}}
\newcommand{\OptionTwoB}{\leftcolDates\vspace{-2pt}\vspace{6pt}\leftcolumnCright}
\newcommand{\OptionThreeA}{}
\newcommand{\OptionThreeB}{\leftcolExternalEditor\leftcolDates\vspace{-2pt}\vspace{6pt}\leftcolumnCright}

\newcommand{\maketitlen}{
	\isBookContribution{\vspace{12pt}}{
	\begin{flushleft}
	\begin{spacing}{1.35}
	\hyphenpenalty=10000\tolerance=1000
	\fontsize{8}{8}\selectfont
	{\ifthenelse{\equal{\firstargument}{1}}{}{\hang}\@address\par}
	{\ifthenelse{\equal{\@authornum}{author}}{}{\ifthenelse{\equal{\@corres}{\@empty}}{}{\hang\textbf{*} \tabto{\dist} \@corres}\par}}
	{\ifthenelse{\equal{\@conference}{\@empty}}{}{\hang$^{\dagger}$ \tabto{\dist} This paper is an extended version of our paper published in\space \@conference.}\par}
	{\ifthenelse{\equal{\@firstnote}{\@empty}}{}{\hang\ifthenelse{\equal{\@conference}{\@empty}}{$^\dagger$}{$^\ddagger$} \tabto{\dist} \@firstnote}\par}
	{\ifthenelse{\equal{\@secondnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\ddagger}$}{$^{\S}$} \tabto{\dist} \@secondnote}\par}
	{\ifthenelse{\equal{\@thirdnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\S}$}{$^{\|}$} \tabto{\dist} \@thirdnote}\par}
	{\ifthenelse{\equal{\@fourthnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\|}$}{$^\P$} \tabto{\dist} \@fourthnote}\par}
	{\ifthenelse{\equal{\@fifthnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\P}$}{**} \tabto{\dist} \@fifthnote}\par}
	{\ifthenelse{\equal{\@sixthnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{**}{$^{\dagger\dagger}$} \tabto{\dist} \@sixthnote}\par}
	{\ifthenelse{\equal{\@seventhnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\dagger\dagger}$}{$^{\ddagger\ddagger}$} \tabto{\dist} \@seventhnote}\par}
	{\ifthenelse{\equal{\@eighthnotes}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\ddagger\ddagger}$}{$^{\S\S}$} \tabto{\dist} \@eighthnotes}\par}
	{\ifthenelse{\equal{\@ninethnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\S\S}$}{$^{\|\|}$} \tabto{\dist} \@ninethnote}\par}
	{\ifthenelse{\equal{\@tenthnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\|\|}$}{$^{\P\P}$} \tabto{\dist} \@tenthnote}\par}
	{\ifthenelse{\equal{\@eleventhnote}{\@empty}}{}{\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\P\P}$}{***} \tabto{\dist} \@eleventhnote}\par}
	{\ifthenelse{\equal{\@LSID}{\@empty}}{}{\vskip12pt \@LSID}\par}
	\end{spacing}
	\end{flushleft}
}
}

\newcommand{\abstractkeywords}{
\isMonograph{}{\vspace{-8pt}
\ifthenelse{\equal{\@featuredapplication}{\@empty}}{}{\noindent\textbf{Featured Application\vspace{6pt}\\}\@featuredapplication\vspace{12pt}\par}
\ifthenelse{\equal{\@addhighlights}{\@empty}}{}{\noindent\textbf{Highlights\vspace{-6pt}\\}\addhighlights\vspace{12pt}\par}
\ifthenelse{\equal{\@simplesumm}{\@empty}}{}{\noindent\textbf{Simple Summary\vspace{6pt}\\}\@simplesumm\vspace{12pt}\par}
\ifthenelse{\equal{\@abstract}{\@empty}}{}{\noindent\textbf{Abstract\vspace{6pt}\\}\@abstract\vspace{12pt}\par}
\ifthenelse{\equal{\@encyclopediadef}{\@empty}}{}{\noindent\textbf{Definition\vspace{6pt}\\}\@encyclopediadef\vspace{12pt}\par}
\ifthenelse{\equal{\@dataset}{\@empty}}{}{\noindent\textbf{Dataset:\space}\@dataset\vspace{12pt}\par}
\ifthenelse{\equal{\@datasetlicense}{\@empty}}{}{\noindent\textbf{Dataset License:\space}\@datasetlicense\vspace{12pt}\par}
\ifthenelse{\equal{\@keyword}{\@empty}}{}{\noindent\textbf{Keywords:\space}\@keyword\vspace{12pt}\par}
\ifthenelse{\equal{\@keycontribution}{\@empty}}{}{\noindent\textbf{Key Contribution:\space}\@keycontribution\vspace{12pt}\par}
\ifthenelse{\equal{\@pacs}{\@empty}}{}{\noindent\textbf{PACS:\space}\@pacs\vspace{12pt}\par}
\ifthenelse{\equal{\@msc}{\@empty}}{}{\noindent\textbf{MSC:\space}\@msc\vspace{12pt}\par}
\ifthenelse{\equal{\@jel}{\@empty}}{}{\noindent\textbf{JEL Classification:\space}\@jel\vspace{12pt}\par}
\vspace{4pt}\isBookContribution{}{\hrule}\vspace{12pt}\normalsize
}}

\ifthenelse{\equal{\@arttype}{Supfile}}{\AfterEndPreamble{\maketitle\let\maketitle\relax\ifthenelse{\equal{\@status}{submit}}{\linenumbers}{}}}{\AfterEndPreamble{\maketitle\let\maketitle\relax\maketitlen\let\maketitlen\relax\ifthenelse{\equal{\@status}{submit}}{\linenumbers}{}\abstractkeywords}}

\AtBeginDocument{
	\calculateMyLen
	\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
	\DeclareSymbolFontAlphabet{\mathbb}{AMSb}
	\cleverefDefinitions
      \RequirePackage{url}
      \urlstyle{same}
     \def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
     \g@addto@macro{\UrlBreaks}{\UrlOrds}
     \g@addto@macro{\UrlBreaks}{\UrlDigits}
}

\AtEndPreamble{
	\def\@tablesize{}
	\newcommand{\tablesize}[1]{\gdef\@tablesize{#1}}
	\let\oldtabularx\tabularx
	\renewcommand{\tabularx}{\ifthenelse{\equal{\@tablesize}{\@empty}}{}{\@tablesize}\oldtabularx}
	\printretraction
}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\numberline}[1]{#1.~\space}

\setcounter{secnumdepth}{4}

\isMonograph{
	\titleformat{\section}[block]{\raggedright\fontsize{18}{18}\selectfont\bfseries}{\thesection.\space}{0pt}{}
	\titlespacing{\section}{0pt}{12pt}{8pt}
}{
	\titleformat{\section}[block]{\raggedright\fontsize{12}{12}\selectfont\bfseries}{\thesection.\space}{0pt}{}
	\titlespacing{\section}{0pt}{12pt}{3pt}
}

\titleformat{\subsection}[block]{\raggedright\fontsize{10}{10}\selectfont\itshape}{\thesubsection.\space}{0pt}{}
\titlespacing{\subsection}{0pt}{12pt}{3pt}

\titleformat{\subsubsection}[block]{\raggedright\fontsize{10}{10}\selectfont}{\thesubsubsection.\space}{0pt}{}
\titlespacing{\subsubsection}{0pt}{12pt}{3pt}

\titleformat{\paragraph}[block]{\raggedright\fontsize{10}{10}\selectfont}{}{0pt}{}
\titlespacing{\paragraph}{0pt}{12pt}{3pt}

\newcommand{\supplementary}[1]{\par\vspace{6pt}\noindent{\fontsize{9}{11.5}\selectfont\textbf{Supplementary Materials:} {#1}\par}}
\newcommand{\authorcontributions}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Author Contributions:} {#1}\par}}
\newcommand{\funding}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Funding:} {#1}\par}}
\newcommand{\institutionalreview}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Institutional Review Board Statement:} {#1}\par}}
\newcommand{\informedconsent}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Informed Consent Statement:} {#1}\par}}
\newcommand{\dataavailability}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Data Availability Statement:} {#1}\par}}
\newcommand{\durcstatement}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{DURC Statement:} {#1}\par}}
\newcommand{\publicinvolvement}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Public Involvement Statement:} {#1}\par}}
\newcommand{\guidelinesstandards}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Guidelines and Standards Statement:} {#1}\par}}
\newcommand{\acknowledgments}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Acknowledgments:} {#1}\par}}
\newcommand{\conflictsofinterest}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Conflicts of Interest:} {#1}\par}}
\newcommand{\entrylink}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Entry Link:} {#1}\par}}
\newcommand{\useofartificialintelligence}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Use of Artificial Intelligence:} {#1}\par}}
\newcommand{\reviewreports}[1]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Review Reports:} {#1}\par}}
\newcommand{\abbreviations}[2]{\vspace{12pt}\noindent{\fontsize{12}{12}\selectfont\textbf{#1}}{\par\vspace{3pt}\hspace{-0.85cm}{\fontsize{9}{11.2}\selectfont #2}\par}}
\newcommand{\specialsection}[2]{\vspace{12pt}\noindent{\selectfont\textbf{#1}\par\vspace{6pt}\noindent {\fontsize{9}{9}\selectfont #2}\par}}
\newcommand{\bio}[2]{\noindent{#1}\hspace{1.1cm}\noindent {\fontsize{9}{11.2}\selectfont \pbox[b]{13.86cm}{#2}}\par\vspace{6pt}}
\newcommand{\backnotes}[2]{\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{#1:} {#2}\par}}

\def\@appendixtitles{}
\newcommand{\appendixtitles}[1]{\gdef\@appendixtitles{#1}}
\def\@appendixsections{}
\newcommand{\appendixsections}[1]{\gdef\@appendixsections{#1}}
\def\@appendixstart{}
\newcommand{\appendixstart}[1]{\gdef\@appendixstart{#1}}

\renewcommand{\appendixstart}{
\setcounter{section}{0}\setcounter{subsection}{0}\setcounter{subsubsection}{0}
\setcounter{figure}{0}\setcounter{table}{0}\setcounter{scheme}{0}\setcounter{chart}{0}
\setcounter{boxenv}{0}\setcounter{equation}{0}\setcounter{theorem}{0}\setcounter{lemma}{0}
\setcounter{corollary}{0}\setcounter{proposition}{0}\setcounter{characterization}{0}
\setcounter{property}{0}\setcounter{problem}{0}\setcounter{example}{0}
\setcounter{examplesanddefinitions}{0}\setcounter{remark}{0}\setcounter{definition}{0}
\setcounter{hypothesis}{0}\setcounter{notation}{0}\setcounter{algorithm}{0}\setcounter{graph}{0}
}

\renewcommand{\appendix}{
\gdef\thesection{\AlphAlph{\value{section}}}
\gdef\thesubsection{\AlphAlph{\value{section}}.\@arabic\c@subsection}
\titleformat{\section}[block]{\raggedright\bfseries\fontsize{12}{12}\selectfont}{\fontsize{12}{12}\selectfont\bfseries\ifthenelse{\equal{\@appendixtitles}{yes}}{\appendixname~\thesection.}{\appendixname~\thesection~}}{0pt}{}
\titlespacing{\section}{0pt}{12pt}{3pt}
\titleformat{\subsection}[block]{\raggedright\itshape}{\ifthenelse{\equal{\@appendixtitles}{yes}}{\appendixname~\thesubsection.}{\appendixname~\thesubsection}}{0pt}{}
\titlespacing{\section}{0pt}{12pt}{3pt}
\titleformat{\subsubsection}[block]{\raggedright\selectfont}{\ifthenelse{\equal{\@appendixtitles}{yes}}{\appendixname~\thesubsubsection.}{\appendixname~\thesubsubsection}}{0pt}{}
\titlespacing{\section}{0pt}{12pt}{3pt}
\gdef\thesection{\AlphAlph{\value{section}}}
\gdef\thesubsection{\AlphAlph{\value{section}}.\@arabic\c@subsection}
\csname appendixmore\endcsname
\renewcommand{\thefigure}{A\arabic{figure}}\renewcommand{\thetable}{A\arabic{table}}
\renewcommand{\thescheme}{A\arabic{scheme}}\renewcommand{\thechart}{A\arabic{chart}}
\renewcommand{\theboxenv}{A\arabic{boxenv}}\renewcommand{\theequation}{A\arabic{equation}}
\renewcommand{\thetheorem}{A\arabic{theorem}}\renewcommand{\thelemma}{A\arabic{lemma}}
\renewcommand{\thecorollary}{A\arabic{corollary}}\renewcommand{\theproposition}{A\arabic{proposition}}
\renewcommand{\thecharacterization}{A\arabic{characterization}}\renewcommand{\theproperty}{A\arabic{property}}
\renewcommand{\theproblem}{A\arabic{problem}}\renewcommand{\theexample}{A\arabic{example}}
\renewcommand{\theexamplesanddefinitions}{A\arabic{examplesanddefinitions}}
\renewcommand{\theremark}{A\arabic{remark}}\renewcommand{\thedefinition}{A\arabic{definition}}
\renewcommand{\thehypothesis}{A\arabic{hypothesis}}\renewcommand{\thenotation}{A\arabic{notation}}
\renewcommand{\thealgorithm}{A\arabic{algorithm}}\renewcommand{\thegraph}{A\arabic{graph}}
}

\newlength{\leftcolumnlength}
\setlength{\leftcolumnlength}{4.1cm}
\newlength{\extralength}
\setlength{\extralength}{4.61cm}
\newlength{\fulllength}
\setlength{\fulllength}{21 cm - 1.27 cm - 1.27 cm}

\isPreprints{
	\RequirePackage[left=2.7cm,right=2.7cm,top=1.35cm,bottom=1.08cm,includehead,includefoot]{geometry}
}{
\isBookContribution{
	\RequirePackage[left=2.05cm,right=2.05cm,top=1.8cm,bottom=0.75cm,paperwidth=170mm,paperheight=244mm,footskip=20pt,headsep=24pt,includefoot]{geometry}
}{
	\RequirePackage[left=5.87cm,marginparwidth=4.1cm,marginparsep=0.51cm,right=1.27cm,top=1.27cm,bottom=1.08cm,footskip=36pt,headsep=24pt,includehead,includefoot]{geometry}
}
}

\isPreprints{}{%
\fancyheadoffset[L]{\extralength}
\isBookContribution{}{\fancyfootoffset[L]{\extralength}}
}

\newcommand{\startlandscape}{\isPreprints{\clearpage\paperwidth=\pdfpageheight\paperheight=\pdfpagewidth\pdfpageheight=\paperheight\pdfpagewidth=\paperwidth\newgeometry{layoutwidth=297mm,layoutheight=210mm,left=1.27cm,right=1.27cm,top=1.27cm,bottom=1.08cm,includehead,includefoot}\fancyheadoffset{0pt}\captionsetup{margin={0cm,0cm}}}{\clearpage\paperwidth=\pdfpageheight\paperheight=\pdfpagewidth\pdfpageheight=\paperheight\pdfpagewidth=\paperwidth\newgeometry{layoutwidth=297mm,layoutheight=210mm,left=1.27cm,right=1.27cm,top=1.27cm,bottom=1.08cm,includehead,includefoot}\fancyheadoffset{0pt}\captionsetup{margin={4.6cm,0cm}}}}

\newcommand{\finishlandscape}{\clearpage\paperwidth=\pdfpageheight\paperheight=\pdfpagewidth\pdfpageheight=\paperheight\pdfpagewidth=\paperwidth\restoregeometry\fancyheadoffset[L]{\extralength}\captionsetup{margin={0cm,0cm}}}

\RequirePackage{newfloat}
\DeclareFloatingEnvironment[]{listing}
\DeclareFloatingEnvironment[name=Box]{boxenv}
\DeclareFloatingEnvironment[]{chart}
\DeclareFloatingEnvironment[]{scheme}
\DeclareFloatingEnvironment[]{figurewide}
\DeclareFloatingEnvironment[]{graph}

\RequirePackage{caption}
\isPreprints{
\captionsetup[figure]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=on,justification=justified}
\captionsetup[scheme]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=on,justification=justified}
\captionsetup[listing]{position=top,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,singlelinecheck=on,justification=justified}
\captionsetup[chart]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=on,justification=justified}
\captionsetup[table]{position=top,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,singlelinecheck=on,justification=justified}
\captionsetup[boxenv]{position=top,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,singlelinecheck=on,justification=justified}
\captionsetup[graph]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=on,justification=justified}
}{
\captionsetup[figure]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=off,justification=justified}
\captionsetup[scheme]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=off,justification=justified}
\captionsetup[listing]{position=top,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,singlelinecheck=off,justification=justified}
\captionsetup[chart]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=off,justification=justified}
\captionsetup[table]{position=top,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,singlelinecheck=off,justification=justified}
\captionsetup[boxenv]{position=top,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,singlelinecheck=off,justification=justified}
\captionsetup[graph]{position=bottom,labelfont={bf,small,stretch=1.17},labelsep=period,textfont={small,stretch=1.17},aboveskip=6pt,belowskip=-6pt,singlelinecheck=off,justification=justified}
}

\newsavebox{\@justcentbox}
\newcommand{\justifyorcenter}[1]{\sbox\@justcentbox{#1}\ifdim\wd\@justcentbox>\hsize #1\else\centerline{#1}\fi}

\renewcommand\tabularxcolumn[1]{m{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}

\setitemize{topsep=3pt,parsep=0pt,itemsep=0pt,leftmargin=*,labelsep=5.5mm,align=parleft}
\setenumerate{topsep=3pt,parsep=0pt,itemsep=0pt,leftmargin=*,labelsep=5.5mm,align=parleft}
\setlist[description]{itemsep=0mm}

\renewenvironment{quote}{\list{}{\listparindent=0pt\leftmargin=0.75cm\rightmargin=0.75cm\topsep=3pt\parsep=3pt}\item\relax}{\endlist}

\ifthenelse{\equal{\@arttype}{Supfile}}{\renewcommand{\thefigure}{S\arabic{figure}}\renewcommand{\thetable}{S\arabic{table}}}{}

\newcommand{\linksupplementary}[1]{\url{https://www.mdpi.com/article/\@doinum/#1}}

\renewcommand\headrule{}

\pagestyle{fancy}
\lhead{\ifthenelse{\equal{\@journal}{preprints}\OR \equal{\@journal}{preprintschicago}\OR \equal{\@journal}{preprintsapa}\OR \equal{\@arttype}{Book}\OR \equal{\@arttype}{Monograph}}{}{\fontsize{8}{8}\selectfont\ifthenelse{\equal{\@status}{submit}}{\vspace{2pt}Version {\@ \today} submitted to {\em \journalname}}{\ifthenelse{\equal{\@arttype}{Supfile}}{{\em \journalname} {\bfseries \@pubyear}, {\em \@pubvolume}, \ifthenelse{\equal{\@continuouspages}{\@empty}}{\@articlenumber. }{} {\url{https://doi.org/\@doinum}}}{{\null\vspace{2pt}\em\journalname\ }{\bfseries\@pubyear}, {\em \@pubvolume}\ifthenelse{\equal{\@continuouspages}{\@empty}}{, \@articlenumber}{}}}\\\isPreprints{}{\rule{\fulllength}{0.4pt}}}}

\rhead{\isBookContribution{}{\ifthenelse{\equal{\@arttype}{Supfile}}{\fontsize{8}{8}\selectfont S\thepage{} of S\pageref*{LastPage}}{\ifthenelse{\equal{\@continuouspages}{\@empty}}{\fontsize{8}{8}\selectfont\thepage{} of \pageref*{LastPage}}{\fontsize{8}{8}\selectfont\thepage}}\\\isPreprints{}{\rule{\fulllength}{0.4pt}}}}

\cfoot{\isBookContribution{\fontsize{8}{8}\selectfont\thepage}{}}

\isBookContribution{}{\isPreprints{}{\rfoot{\fontsize{8}{8}\selectfont{\url{https://doi.org/\@doinum}}}}}

\def\@retractiondate{}
\newcommand{\retractiondate}[1]{\gdef\@retractiondate{#1}}
\def\@retractionnoticeyear{}
\newcommand{\retractionnoticeyear}[1]{\gdef\@retractionnoticeyear{#1}}
\def\@retractionnoticevolume{}
\newcommand{\retractionnoticevolume}[1]{\gdef\@retractionnoticevolume{#1}}
\def\@retractionnoticeidnumber{}
\newcommand{\retractionnoticeidnumber}[1]{\gdef\@retractionnoticeidnumber{#1}}
\def\@retractionnoticedoi{}
\newcommand{\retractionnoticedoi}[1]{\gdef\@retractionnoticedoi{#1}}
\newcommand{\printretraction}{\ifthenelse{\equal{\@retractiondate}{\@empty}}{}{\RequirePackage{draftwatermark}\SetWatermarkText{RETRACTED}\SetWatermarkScale{0.8}\fancypagestyle{plain}{\fancyhf{}\fancyfoot[L]{\footnotesize\st{\mbox{\textit{\journalname} \textbf{\@pubyear}, \textit\@pubvolume, }}\ifthenelse{\equal{\@continuouspages}{\@empty}}{\st{\@articlenumber}}{\st{\@firstpage}\ifnumcomp{\getpagerefnumber{LastPage}}{=}{\@firstpage}{}{\st{--\mbox{\pageref*{LastPage}}}}}\\This paper has been retracted. A retraction notice was published on \@retractiondate{} in \textit{\@journalfull} \textbf{\@retractionnoticeyear}, \textit{\@retractionnoticevolume}, \@retractionnoticeidnumber. https://doi.org/\@retractionnoticedoi}\fancyfoot[R]{\footnotesize\st{{\href{https://doi.org/\@doinum}{https://doi.org/\@doinum}}}}\renewcommand{\footrulewidth}{0.4pt}}}}

\renewcommand\bibname{References}
\renewcommand\@biblabel[1]{#1.\hfill}
\def\thebibliography#1{\emergencystretch 2em
\titleformat{\section}[block]{\raggedright\fontsize{12}{12}\selectfont\bfseries}{}{0pt}{}
     \isBookContribution{}{\section{\@reftitle}}
\fontsize{9}{11}\selectfont
\list{{\arabic{enumi}}}{\def\makelabel##1{\hss{##1}}
\topsep=0\p@\parsep=0\p@\partopsep=0\p@\itemsep=0\p@
\labelsep=1.5mm
\isAPAandChicago{\ifthenelse{\equal{\@externalbibliography}{\@empty}}{\itemindent=-7.7mm}{\itemindent=-3.3mm}}{\itemindent=0\p@}
\settowidth\labelwidth{\footnotesize[#1]}
\leftmargin\labelwidth\advance\leftmargin\labelsep
\usecounter{enumi}}
}
\let\endthebibliography=\endlist

\newcommand{\PublishersNote}{\null\par\noindent\fontsize{9}{11}\selectfont\textbf{Disclaimer/Publisher's Note:} The statements, opinions and data contained in all publications are solely those of the individual author(s) and contributor(s) and not of MDPI and/or the editor(s). MDPI and/or the editor(s) disclaim responsibility for any injury to people or property resulting from any ideas, methods, instructions or products referred to in the content.}

\newcommand{\cright}{
        \ifthenelse{\equal{\@arttype}{Supfile}}{}{
		\ifthenelse{\equal{\@status}{submit}}{\fontdimen2\font=1.2pt\raggedright\textbf{Copyright: }\copyright{} {\@ \the\year} by the \@authornum. Submitted to {\em\journalname} for possible open access publication under the terms and conditions of the }{{\raggedright\textbf{Copyright:} \copyright\ {\@copyrightyear} by the \@authornum. \ifthenelse{\equal{\@societyowner}{}}{}{Published by MDPI on behalf of the {\@societyowner}.} Licensee MDPI, Basel, Switzerland. This article is an open access article distributed under the terms and conditions of the }}
                \ifthenelse{\equal{\@journal}{ijtpp}}{\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{Creative Commons Attribution (CC BY-NC-ND) license}}{\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution (CC~BY) license}}.
	}
}

\RequirePackage{seqsplit}
  \newlength{\cellWidtha}\newlength{\cellWidthb}\newlength{\cellWidthc}\newlength{\cellWidthd}\newlength{\cellWidthe}
  \newlength{\cellWidthf}\newlength{\cellWidthg}\newlength{\cellWidthh}\newlength{\cellWidthi}\newlength{\cellWidthj}
  \newlength{\cellWidthk}\newlength{\cellWidthl}\newlength{\cellWidthm}\newlength{\cellWidthn}\newlength{\cellWidtho}
  \newlength{\cellWidthp}\newlength{\cellWidthq}\newlength{\cellWidthr}\newlength{\cellWidths}\newlength{\cellWidtht}
  \newlength{\cellWidthu}\newlength{\cellWidthv}\newlength{\cellWidthw}\newlength{\cellWidthx}\newlength{\cellWidthy}
  \newlength{\cellWidthz}\newlength{\cellWidthA}\newlength{\cellWidthB}\newlength{\cellWidthC}\newlength{\cellWidthD}
  \newlength{\cellWidthE}\newlength{\cellWidthF}\newlength{\cellWidthG}\newlength{\cellWidthH}\newlength{\cellWidthI}
  \newlength{\cellWidthJ}\newlength{\cellWidthK}\newlength{\cellWidthL}\newlength{\cellWidthM}\newlength{\cellWidthN}
  \newlength{\cellWidthO}\newlength{\cellWidthP}\newlength{\cellWidthQ}\newlength{\cellWidthR}\newlength{\cellWidthS}
  \newlength{\cellWidthT}\newlength{\cellWidthU}\newlength{\cellWidthV}\newlength{\cellWidthW}\newlength{\cellWidthX}
  \newlength{\cellWidthY}\newlength{\cellWidthZ}
 \newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}

\endinput
