:: 'Progra~2' refers to 'Program Files (x86)', 'Progra~1', 'Program Files'
:: Please ensure that you have Notepad++, NppExec, Miktex and SumatraPDF installed
:: In NppExec, add lines 4 and 5.
:: NPP_SAVE
:: "C:\Progra~2\Notepad++\miktex_to_latex.bat" "$(CURRENT_DIRECTORY)" "$(NAME_PART)" "$(NAME_PART).pdf"

:: Change Drive and  to File Directory  
%~d1  
cd %1

:: Run Cleanup  
call:cleanup  

:: Run pdflatex -&gt; bibtex -&gt; pdflatex -&gt; pdflatex  
pdflatex %2  
bibtex  %2  
:: If you are using multibib the following will run bibtex on all aux files  
:: FOR /R . %%G IN (*.aux) DO bibtex %%G  
pdflatex %2  
pdflatex %2  

:: Run Cleanup  
call:cleanup  

:: Open PDF  
START "" "C:\Progra~1\SumatraPDF\SumatraPDF.exe" %3 -reuse-instance  

:: Cleanup Function  
:cleanup  
del *.dvi
del *.out
:: del *.log 
:: del *.aux  
:: del *.bbl    
:: del *.blg  
:: del *.brf  

goto:eof  
