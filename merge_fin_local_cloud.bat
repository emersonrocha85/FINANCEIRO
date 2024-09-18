@echo off

:: Captura a data no formato AAAA-MM-DD, independente da configuração regional
for /f "tokens=2-4 delims=/.- " %%a in ('date /t') do (set data=%%c-%%b-%%a)

:: Captura a hora no formato HH-MM
for /f "tokens=1-2 delims=: " %%h in ('time /t') do (set hora=%%h-%%i)

:: Define o caminho do log com a data e hora no nome
set logpath=C:\CONTROLE_FINANCEIRO\backup_fin\log_merge\merge_fin_local_cloud_%data%_%hora%.log

:: Verifica se o diretório de log existe, se não, cria
if not exist C:\CONTROLE_FINANCEIRO\backup_fin\log_merge\ (
    mkdir C:\CONTROLE_FINANCEIRO\backup_fin\log_merge\
)

:: Adiciona uma linha visual para iniciar o log
echo ====================================================== >> %logpath%
echo Backup iniciado em: %date% %time% >> %logpath%
echo ====================================================== >> %logpath%
echo. >> %logpath%

:: Executa o xcopy com os parâmetros desejados, copiando apenas os arquivos modificados no dia
xcopy C:\CONTROLE_FINANCEIRO\*.* "G:\Meu Drive\DOCUMENTOS\CONTROLE_FINANCEIRO"\*.* /s /e /f /h /y /D >> %logpath%

:: Adiciona uma linha visual para finalizar o log
echo. >> %logpath%
echo ====================================================== >> %logpath%
echo Backup concluído em: %date% %time% >> %logpath%
echo ====================================================== >> %logpath%
echo. >> %logpath%
