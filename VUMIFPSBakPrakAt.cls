%% VUMIFPSBakPrakAt.cls
%% Created by Andrius Pukšta, based on VUMIFPSbakalaurinis.cls available at:
%% https://github.com/LIKS/bachelor_thesis_template_vu_mif_se
%% Latest version available here: https://github.com/yjhn/bachelor_practice_report_template_vu_mif_se
%% Any suggestions or contributions are welcome!
%
%% License CC BY 4.0 (see more at http://creativecommons.org/licenses/by/4.0/)
% You are free to (a) share - copy and redistribute the material in any medium
% or format (b) adapt - remix, transform, and build upon the material for any
% purpose, even commercially. As long as you give appropriate credit, provide a
% link to the license, and indicate if changes were made.


% Bakalauro praktikos ataskaitos apiforminimas pagal Vilniaus universiteto
% Matematikos ir informatikos fakulteto Programų sistemų katedros reikalavimus
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VUMIFPSBakPrakAt}[2023/03/23 1.0 VU MIF SE bachelor practice report class]
\LoadClass[12pt, a4paper]{article}
\RequirePackage{LTPlius}  % Nustatymų sulietuvinimas
\RequirePackage{fontspec} % Šrifto pasirinkimui
% Teksto šriftas bus Palemonas.
% Naujos Palemono versijos talpinamos
% https://vlkk.lt/palemonas
\setmainfont[
    Path=fonts/Palemonas3.2.05/,
    Ligatures=TeX,
    Extension=.ttf,
    UprightFont=*-nm,
    BoldFont=*-bd,
    ItalicFont=*-it,
    BoldItalicFont=*-bi,
]{Palem3.2.05}

\RequirePackage{setspace} % Intervalas tarp eilučių
\RequirePackage[
    left=3cm,
    top=2cm,
    right=1.5cm,
    bottom=2cm,
    footskip=0.6cm,
]{geometry}  % Lapo paraštės
\sloppy  % Tolygiai paskirsto tekstą nuo kairės iki dešinės paraštės
\RequirePackage[titles]{tocloft} % Turinio eilučių išlygiavimo nustatymui
\RequirePackage{fancyhdr} % Puslapio numerio vietos nustatymui
\pagestyle{fancy}

% Nustatoma puslapio numerio vieta puslapyje
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyfoot[R]{\thepage} % Numeris bus puslapio apačioje dešinėje

\RequirePackage{caption}

% Informacijos tituliniame puslapyje kintamieji
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\status}[1]{\def\@status{#1}}
\newcommand{\PracticeOrganization}[1]{\def\@PracticeOrganization{#1}}
\newcommand{\OrganizationPracticeSupervisor}[1]{\def\@OrganizationPracticeSupervisor{#1}}
\newcommand{\UniversityPracticeSupervisor}[1]{\def\@UniversityPracticeSupervisor{#1}}

% Pirmos eilutės paragrafe atitraukimas 1 cm
\setlength{\parindent}{1cm}

% Nustatomas bibliografijos stilius
\RequirePackage[
    alldates=iso,
    seconds=true,
    autolang=none,
    backend=biber,
    sortcites=true,
    sorting=anyt,
    giveninits=true,
    style=iso-alphabetic,
    abbreviate=true,
    minalphanames=3,
    maxalphanames=3,
    maxnames=9,
    minnames=4,
]{biblatex}

\DefineBibliographyStrings{lithuanian}{%
    % Literatūros sąrašas.
    references = {Šaltiniai},
    in = {},
    % Terminai, vartojami biblatex-iso690 bibliografijos stiliuje.
    % Žr. https://github.com/michal-h21/biblatex-iso690/wiki/Translation-Guideline
    urlalso = {prieiga per internetą},
    urlfrom = {prieiga per internetą},
    urlseen = {žiūrėta},
    % Žr. https://terminai.vlkk.lt/konsultacijos/1986-on-line-prijungtas-prijungtis
    online = {internetinis},
}

% Autorius rašomas kaip Vardas Pavardė, ne Pavardė, Vardas
\DeclareNameAlias{default}{given-family}
% Skirtukai tarp autorių padaromi kableliais
\DeclareDelimFormat{multinamedelim}{\addcomma\space}
\DeclareDelimFormat{finalnamedelim}{\addcomma\space}
% Nepaverčiame pavardžių didžiosiomis raidėmis
\renewcommand{\familynameformat}[1]{#1}

% Pliuso ženklas, kuris rodomas esant >3 autoriams, sumažinamas ir pakeliamas
\renewcommand*{\labelalphaothers}{\textsuperscript{+}}

% Nutildome įspėjimus dėl neegzistuojančių failų.
\usepackage{silence}
\WarningFilter{biblatex}{File 'american-iso.lbx' not found!}
\WarningFilter{biblatex}{File 'lithuanian-iso.lbx' not found!}

% TODO: pašalinti csquotes.cfg failą 2025 metais, nes csquotes
% paketas pridėjo lietuvišką kabučių stilių 2023-01-24, tad nebereikės
% specialios konfigūracijos, kai nauja versija bus plačiai prieinama
\RequirePackage[style=lithuanian]{csquotes}

% -------------------------------
% Titulinio puslapio formatavimas
% -------------------------------
\newcommand{\@textunder}[1]{%
    \parbox[t]{2.5cm}{%
        \makebox[2.5cm]{\raisebox{-1.4ex}{\small{(#1)}}}%
    }
}

\newcommand{\@signatureplace}{\@textunder{parašas}}

\newcommand{\checkifdefined}[2]{%
    % Patikriname, ar visa reikalinga informacija tituliniam puslapiui
    % buvo nurodyta. #1 yra tikrinama reikšmė (be \ priekyje),
    % #2 - klaidos pranešimas.
    \@ifundefined{#1}{\PackageError{VUMIF}{#2}{Add the missing command}}%
}

% #1 is spacing on the left, #2 is ruler width.
\newcommand{\@addunderline}[2]{%
    \nointerlineskip\moveright#1\vbox{\hrule width #2 height 0.5pt}%\nointerlineskip
}

\renewcommand\maketitle{\begin{titlepage}%
  \checkifdefined{@university}%
    {Tituliniame puslapyje nenurodytas universitetas (komanda \protect\university)}
  \checkifdefined{@faculty}%
    {Tituliniame puslapyje nenurodytas fakultetas (komanda \protect\faculty)}
  \checkifdefined{@department}%
    {Tituliniame puslapyje nenurodyta studijų programa (komanda \protect\department)}
  % Specialiai pašaliname titulinio puslapio numerį (nors jo ir šiaip nėra),
  % kad nerodytų įspėjimo dėl pakartotinai naudojamo 1 puslapio numerio
  \pagenumbering{gobble}%
  ~
  \begin{center}
      {\setstretch{1.3}\large \MakeUppercase{\@university} \\
         \MakeUppercase{\@faculty} \\
         \MakeUppercase{\@department}\par }

     \vskip 2.5cm
     {\singlespacing \large{\MakeUppercase{\@title}} \par}
  \end{center}
    \vskip 3cm
    \begin{flushleft}
      \qquad Praktiką atliko: \quad \textbf{\@author} \hspace{\fill} \@signatureplace \hspace{2cm} \par
      \hspace{9.3em} \textbf{\@status} \\
      \vspace{0.8cm}
      \qquad Praktikos institucija: \quad \textbf{\@PracticeOrganization} \\
      %\@addunderline{4.5cm}{300pt}
      \vspace{0.8cm}
      \qquad Organizacijos praktikos vadovas: \quad \textbf{\@OrganizationPracticeSupervisor} \\
      %\@addunderline{4.5cm}{300pt}
      \vspace{0.8cm}
      \qquad Organizacijos praktikos vadovo įvertinimas: \hspace{0.3cm}\underline{\hspace{7cm}} \\
      \hspace{10.7cm} {\small (įvertinimas, parašas)} \\
      \vspace{0.3cm}
      \qquad Universiteto praktikos vadovas: \quad \textbf{\@UniversityPracticeSupervisor} \hspace{0.5em} \@signatureplace
    \end{flushleft}
    \vskip 1cm
    \begin{flushright}
        \begin{tabular}[t]{l c}
            \small{Ataskaitos įteikimo data} & \underline{\hspace{11em}} \\
            \small{Registracijos Nr.} & \underline{\hspace{11em}} \\
            \small{Įvertinimas} & \underline{\hspace{11em}} \\
            & \small{(data, įvertinimas, parašas)}
        \end{tabular}
    \end{flushright}
  \vfill
  \begin{center}
    \@date%
  \end{center}
  \vskip 0.4cm
  \@thanks
  \end{titlepage}%
  % Tolesni puslapiai numeruojami įprastai
  \pagenumbering{arabic}%
  % Atlaisviname panaudotus kintamuosius
  \global\let\@outputtitle\relax
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@papertype\@empty
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@university\@empty
  \global\let\@faculty\@empty
  \global\let\@department\@empty
  \global\let\@institute\@empty
  \global\let\@papertype\@empty
  \global\let\@supervisor\@empty
  \global\let\@reviewer\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\department\relax
  \global\let\supervisor\relax
  \global\let\@signatureplace\relax
  \global\let\checkifdefined\relax
  \setcounter{footnote}{0}%
  % Nustatome dokumentui 1,5 tarpo tarp eilučių intervalą
  \onehalfspacing
}

% Skyriaus pavadinimas, turinyje neturintis numerio
\newcommand{\sectionnonum}[1]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
}

% Skyriaus pavadinimas, neturintis numerio bei neįeinantis į turinį
\newcommand{\sectionnonumnocontent}[1]{%
    \section*{#1}%
    \sectionbookmark{#1}% Sukuriame PDF nuorodą
}

\renewcommand\tableofcontents{%
    % Turinys su viengubu intervalu tarp eilučių
    \begin{singlespacing}%
        \section*{%
            \bf\normalsize\centering\MakeUppercase\contentsname%
            \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
        }%
        \sectionbookmark{\contentsname}% Sukuriame PDF nuorodą į turinį
        \@starttoc{toc}%
    \end{singlespacing}%
    \newpage%
}

% Tarpai tarp taškų turinyje
\renewcommand{\@dotsep}{1}

% Pakeitimai sekcijos eilutėms turinyje:
% 1. Turinyje turi taškai bėgti ir iki sekcijų
% 2. Nėra vertikalaus tarpo prieš sekcijos turinio eilutę
% 3. Ne pusstoris, o paprastas šriftas
\renewcommand\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0.6em \@plus\p@}
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode {
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      % Skyrių pavadinimai paverčiami vien didžiosiomis raidėmis
      \MakeUppercase{#1}}\nobreak\
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
     \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}


% Sekcija pradeda naują puslapį
\renewcommand{\section}{%
    \cleardoublepage%
    \@startsection{section}{1}{\z@}%
        {-3.5ex \@plus -1ex \@minus -.2ex}%
        {2.3ex \@plus.2ex}%
        {\normalfont\Large\bfseries}%
}

% Priedų formatavimas
\renewcommand{\appendix}{%
    \@ifundefined{@firstappendix}{%
        \newcounter{appendixcounter}%
        \sectionnonum{Priedai}%
        \newcommand{\@firstappendix}{}%
        \newcommand{\@appendix}{nr. \arabic{appendixcounter}}%
    }{%
        \cleardoublepage%
    }%
    \secdef\@Appendix\@sAppendix%
}

\def\@Appendix[#1]#2{%
    \refstepcounter{appendixcounter}%
    \addcontentsline{toc}{subsection}%
        {\arabic{appendixcounter} priedas.~#2}%
    {\large\bfseries\appendixname\ \@appendix\par
     #2\par}% \nohyphens\centering#2\par}%
    \sectionmark{#1}\vspace{\baselineskip}%
    \footnotesize%
}

\def\@sAppendix#1{%
    {\flushright\large\bfseries\appendixname\par
     \centering#1\par}% \nohyphens\centering#1\par}%
    \vspace{\baselineskip}%
    \footnotesize
}

% Apibrėžiame ketvirto lygio skyrius
\newcommand{\subsubsubsection}{\subsubparagraph}

\renewcommand\subsubsubsection{\@startsection{paragraph}{4}{0ex}{-3.25ex plus -1ex minus
-0.2ex}{1.5ex plus 0.2ex}{\normalfont\normalsize\bfseries}}

\stepcounter{secnumdepth}
\stepcounter{tocdepth}
\renewcommand{\paragraph}{\subparagraph}

% Turinio skyrių indentavimo nustatymas. Kiekvienam skyriui nustatoma:
% 1. Atitraukimo iš kairės plotis
% 2. Vietos, skiriama skaičiams, plotis
\renewcommand*\l@subsection{\@dottedtocline{2}{0.1cm}{0.87cm}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{0.8cm}{1.22cm}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{1.5cm}{1.52cm}}

% Raktinių žodžių komandos
\newcommand\keywords[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Keywords:}\; \textbf{#1}
}
\newcommand\raktiniaizodziai[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Raktiniai žodžiai:}\; \textbf{#1}
}

% Tarpai tarp išnašų eilučių nustatomi į 1,5 eilutės
\let\oldfootnote\footnote
\renewcommand{\footnote}[1]{\oldfootnote{\onehalfspacing #1}}

% Panaikinami dvigubi tarpai tarp sąrašo elementų
\RequirePackage{enumitem}
\setlist{nosep}

% float paketas turi būti užkraunamas anksčiau nei hyperref
\RequirePackage{float}

% Nuorodos turinyje ir kitur padaromos aktyviomis
\RequirePackage[hidelinks,linktoc=all]{hyperref}

% Pataisymas, kad veiktų kompiliavimas su LuaLaTeX.
% TODO: galima pašalinti 2025 m., nes pataisymas jau yra
% naujausioje hyperref paketo versijoje:
% https://github.com/latex3/hyperref/issues/121
% Kompiliavimas su LuaLaTeX padaro, kad veiktų turinio skyrių nuorodos
% į puslapius (su XeLaTeX neveikia).
\RequirePackage{iftex}
\ifLuaTeX
  \let\ORG@hyper@linkstart\hyper@linkstart
  \protected\def\hyper@linkstart#1#2{%
    \lowercase{\ORG@hyper@linkstart{#1}{#2}}}
\fi

% Nustatomas PDF pavadinimas ir autorius
\AtBeginDocument{
    \hypersetup{pdftitle = {\@title}}
    \@ifundefined{@secondauthor}{
        \hypersetup{pdfauthor = {\@author}}
    }{
        \hypersetup{pdfauthor = {\@author\ and \@secondauthor}}
    }
}

% Paimta iš https://tex.stackexchange.com/a/330535
\RequirePackage{bookmark}
\newcommand*{\sectionbookmark}[1][]{%
  \bookmark[%
    level=section,%
    dest=\@currentHref,%
    #1%
  ]%
}

% Algoritmai apjuosiami kraštine
\RequirePackage[boxed]{algorithm}

% Algoritmai laikomi paveiksliukais, todėl turi vadintis pav.
\DeclareCaptionLabelFormat{alg}{#2 #1}
\captionsetup[algorithm]{name=pav.,labelformat=alg,labelsep=space}

% Algoritmų numeracija turi sutapti su paveiksliukų
\let\c@algorithm\c@figure
\let\ftype@algorithm\ftype@figure
