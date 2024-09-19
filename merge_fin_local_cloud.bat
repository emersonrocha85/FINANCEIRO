@echo off

:: Captura a data no formato AAAA-MM-DD, independente da configuração regional
for /f "tokens=2-4 delims=/.- " %%a in ('date /t') do (set data=%%c-%%b-%%a)

:: Define o caminho do log com a data no nome
set logpath=C:\CONTROLE_FINANCEIRO\backup_fin\log_merge\merge_fin_local_cloud_%data%.log

:: Verifica se o diretório de log existe, se não, cria
if not exist C:\CONTROLE_FINANCEIRO\backup_fin\log_merge\ (
    mkdir C:\CONTROLE_FINANCEIRO\backup_fin\log_merge\
)

:: Captura a data e hora atuais para registro no log
echo %date% %time% - Iniciando backup >> %logpath%

:: Executa o xcopy com os parâmetros desejados, copiando apenas os arquivos modificados no dia
xcopy C:\CONTROLE_FINANCEIRO\*.* "G:\Meu Drive\DOCUMENTOS\CONTROLE_FINANCEIRO"\*.* /s /e /f /h /y /D >> %logpath%

:: Finaliza o log com a data e hora atuais
echo %date% %time% - Backup concluído >> %logpath%

