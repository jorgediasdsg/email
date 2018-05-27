#!/bin/bash
#AUTOR JORGE DIAS
#jorgediasdsg@gmail.com
echot(){
clear	
echo "----------------------------------------------------------------------------------"
echo ""
echo "   INSTALAÇÃO DE CLIENTE GMAIL PARA TERMINAL"
echo ""
echo "   $1"
echo ""
if [ -n "$2" ]; then
echo "   $2"
echo ""
fi
if [ -n "$3" ]; then
echo "   $3"
echo ""
fi
if [ -n "$4" ]; then
echo "   $4"
echo ""
fi
echo "----------------------------------------------------------------------------------"
}
echot "DIGITE SEU GMAIL"
read EMAILGMAIL
echot "DIGITE SEU NOME"
read NOME
echot "COPIE O LINK ABAIXO E COLE NO NAVEGADOR - FAÇA A SENHA PARA O APP" "https://myaccount.google.com/apppasswords" "CASO NÃO TENHA AUTENTICAÇÃO 2 ETAPAS E ESTIVER CONFIANDO EM APLICATIVOS INSEGUROS PODE DIGITAR SUA SENHA NORMAL" "COLE AQUI COM CTRL+SHIFT+V E APERTE ENTER"
read SENHAGMAIL
echot "CONFIRA AS INFORMAÇÕES E APERTE ENTER PARA CONTINUAR OU CTRL+C PARA CANCELAR" "EMAIL: $EMAILGMAIL NOME: $NOME SENHA DO APP: $SENHAGMAIL"
read APERTEENTER
sudo apt-get install sendmail -y
sudo apt-get install mutt -y
if [ ! -d "$HOME/.muttrc" ]; then
	echot "JÁ EXISTE UMA INSTALAÇÃO" "RENOMEANDO .OLD AGUARDE..."
	mv $HOME/.muttrc $HOME/.muttrc-old
fi
echo "set ssl_starttls='yes' " >> $HOME/.muttrc
echo "set ssl_force_tls='yes' " >> $HOME/.muttrc
echo "set imap_user='$EMAILGMAIL' " >> $HOME/.muttrc
echo "set imap_pass='*$SENHAGMAIL' " >> $HOME/.muttrc
echo "set from='$EMAILGMAIL' " >> $HOME/.muttrc
echo "set realname='$NOME' " >> $HOME/.muttrc
echo "set folder='imaps://imap.gmail.com/' " >> $HOME/.muttrc
echo "set spoolfile='imaps://imap.gmail.com/INBOX' " >> $HOME/.muttrc
echo "set postponed='imaps://imap.gmail.com/[Gmail]/Drafts' " >> $HOME/.muttrc
echo "set smtp_url='smtps://$EMAILGMAIL:$SENHAGMAIL@smtp.gmail.com:465/' " >> $HOME/.muttrc
echo "set move='no' " >> $HOME/.muttrc
echo "set imap_keepalive='900'" >> $HOME/.muttrc
echo "Se você recebeu esse e-mail é porque está funcionando a parada. USE ESSE MODELO PARA ENVIAR VIA BASH echo 'Aqui coloque o corpo do e-mail' | mutt -s 'Aqui coloque o assunto do e-mail' DESTINO@EMAIL.COM -a LOCALDOANEXO LOCALDOOUTROANEXO" | mutt -s "Confirmação de email" $EMAILGMAIL
echot "INSTALAÇÃO ENCERRADA - CONFIRA SEU E-MAIL" "SIGA O MODELO ABAIXO PARA ENVIO POR SCRIPT" "echo 'Aqui coloque o corpo do e-mail' | mutt -s 'Aqui coloque o assunto do e-mail' DESTINO@EMAIL.COM -a LOCALDOANEXO LOCALDOOUTROANEXO"
