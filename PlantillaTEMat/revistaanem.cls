%% revistaanem.cls
%% Copyright 2017 Asociación Nacional de Estudiantes de Matemáticas
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
%   http://www.latex-project.org/lppl/
% And version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is
%   Comisión de publicaciones de la
%   Asociación Nacional de Estudiantes de Matemáticas
%   mailto:publicaciones@anemat.com
%
% This work consists of the file revistaanem.cls

% Este archivo establece el formato de la revista TEMat de la ANEM. 
% Su uso es necesario cuando se quiera enviar un artículo a TEMat para su publicación.
% Para usarlo, cargar la clase escribiendo el comando \documentclass{revistaanem}.

\RequirePackage{expl3}[2015/11/15]
\RequirePackage{xparse,l3keys2e,silence,latexrelease}
\ExplSyntaxOn
\tl_const:Nn \c_revistaanem_Class_Name_tl        {revistaanem}
\tl_const:Nn \c_revistaanem_Class_Version_tl     {2.0.0}
\tl_const:Nn \c_revistaanem_Class_Date_tl        {2017/10/23}
\tl_const:Nn \c_revistaanem_Class_Description_tl {
  Clase~de~transición~para~artículos~de~TEMat
}

\msg_new:nnn
  { \c_revistaanem_Class_Name_tl }
  { error-bibliografia }
  { Error~al~cargar~la~bibliografía.\\
    El~comando~\noexpand\nuevabibliografia~ya~no~está~soportado,~
    usa~el~comando~\tl_to_str:c{addbibresource{#1}} en~su~lugar.~Ten~en~
    cuenta~que~debe~estar~en~el~preámbulo~(antes~del~
    \tl_to_str:c{begin{document}}).
  }

\ProvidesExplClass
  {\c_revistaanem_Class_Name_tl}
  {\c_revistaanem_Class_Date_tl}
  {\c_revistaanem_Class_Version_tl}
  {\c_revistaanem_Class_Description_tl}

\LoadClassWithOptions{TEMat-article}

\RequirePackage{atveryend}

\DeclareDocumentCommand\autor{s o m m m} {
  \IfBooleanTF {#1} {
    \author*{#4,~#3}
  }{
    \author{#4,~#3}
  }

  \IfNoValueF{#2} {
    \email{#2}
  }

  \affiliation{#5}
}

\let\agradecimientos\acknowledgements
\let\titulo\title

\appto\endabstract{\maketitle}

\let\resumen\abstract
\let\endresumen\endabstract

\let\ANEM@add@bib@resource\addsectionbib

\newcommand\nombrerevista{TEMat}

\DeclareDocumentCommand\nuevabibliografia{m} {
  \ANEM@add@bib@resource{#1}
  \AtVeryEndDocument{
    \msg_warning:nnn { \c_revistaanem_Class_Name_tl } { error-bibliografia } {#1}
  }
}
