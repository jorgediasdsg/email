#!/bin/bash
#AUTOR JORGE DIAS jorgediasdsg@gmail.com https://github.com/jorgediasdsg/email https://gitlab1.cbm.sc.gov.br/redes/email
#PAINEL DE EXIBIÇÃO - NEM TÃO MINIFICADO ASSIM, MINIFICADO LEGIVEL... HEHE 
e(){ echo $1; }; echot(){ clear; seq 9 9 200 | paste -sd \X
e ""; e "   INSTALAÇÃO DE CLIENTE GMAIL PARA TERMINAL"; e ""; e "   $1"; e ""
if [ -n "$2" ]; then e "   $2"; e ""; fi; if [ -n "$3" ]; then e "   $3"; e ""; fi
if [ -n "$4" ]; then e "   $4"; e ""; fi; seq 9 9 200 | paste -sd \X; e ""; e ""; }
#CRIANDO E-MAIL DE CONFIRMAÇÃO.
cria_email(){ e "" > email.txt; e "Olá," >> email.txt; e "" >> email.txt; e "Se você está lendo essa mensagem é porque deu certo a coisa..." >> email.txt
e "" >> email.txt; e "agora que já tem configurado cliente de e-mail em seu computador você pode automatizar seus scripts." >> email.txt
e "" >> email.txt; e "Use o comando abaixo para isso..." >> email.txt; e "" >> email.txt; e "mutt -s 'ASSUNTO DO EMAIL' EMAIL@EMAIL.COM < CORPODOEMAIL.txt -a ANEXO.zip" >> email.txt
e "" >> email.txt; e "Até mais." >> email.txt; e ""; e "https://github.com/jorgediasdsg/email" >> email.txt; }
#INTERAÇÃO COM USUARIO CAPTURANDO EMAIL E SENHA.
insere_dados(){ echot "DIGITE SEU GMAIL"; read EMAILGMAIL; echot "DIGITE SEU NOME "; read NOME; echot "COPIE O LINK ABAIXO E COLE NO NAVEGADOR - FAÇA A SENHA PARA O APP" "https://myaccount.google.com/apppasswords" "CASO NÃO TENHA AUTENTICAÇÃO 2 ETAPAS E ESTIVER CONFIANDO EM APLICATIVOS INSEGUROS PODE DIGITAR SUA SENHA NORMAL" "COLE AQUI COM CTRL+SHIFT+V E APERTE ENTER"
read SENHAGMAIL; echot "CONFIRA AS INFORMAÇÕES E APERTE ENTER PARA CONTINUAR OU CTRL+C PARA CANCELAR" "EMAIL: $EMAILGMAIL NOME: $NOME SENHA DO APP: $SENHAGMAIL"; read APERTEENTER; }
#INSTALAÇÃO DOS APPS
instala_apps(){ sudo apt-get install sendmail -y; sudo apt-get install mutt -y; }
#CRIANDO BACKUP DO .muttrc CASO JÁ EXISTA
setup_conf(){ [ ! -d "$HOME/.muttrc" ] || echot "JÁ EXISTE UMA INSTALAÇÃO" "RENOMEANDO .OLD AGUARDE..."; mv $HOME/.muttrc $HOME/.muttrc-old
e "set ssl_starttls='yes' " >> $HOME/.muttrc; e "set ssl_force_tls='yes' " >> $HOME/.muttrc
e "set imap_user='$EMAILGMAIL' " >> $HOME/.muttrc; e "set imap_pass='*$SENHAGMAIL' " >> $HOME/.muttrc
e "set from='$EMAILGMAIL' " >> $HOME/.muttrc; e "set realname='$NOME' " >> $HOME/.muttrc
e "set folder='imaps://imap.gmail.com/' " >> $HOME/.muttrc; e "set spoolfile='imaps://imap.gmail.com/INBOX' " >> $HOME/.muttrc
e "set postponed='imaps://imap.gmail.com/[Gmail]/Drafts' " >> $HOME/.muttrc; e "set smtp_url='smtps://$EMAILGMAIL:$SENHAGMAIL@smtp.gmail.com:465/' " >> $HOME/.muttrc
e "set move='no' " >> $HOME/.muttrc; e "set imap_keepalive='900'" >> $HOME/.muttrc; }
#ENVIANDO E-MAIL CONFIRMAÇÃO COM ANEXO DO PROGRAMA/ REMOVENDO CORPO E-MAIL TEMPORÁRIO E FINALIZANDO
envia_confirmacao(){ mutt -s "Confirmação de email "$EMAILGMAIL $EMAILGMAIL < email.txt -a mail.sh; rm -rf email.txt; echot "INSTALAÇÃO ENCERRADA - CONFIRA SEU E-MAIL"; }
cria_email; insere_dados; instala_apps; setup_conf; envia_confirmacao
