<h1>ENVIO DE EMAIL POR SCRIPT!</h1>

<h3>FAÇA ENVIO DE E-MAIL AUTOMATIZADO</h3>

<h4>Como funciona?</h4>
<p>O script instala o <a href="https://pt.wikipedia.org/wiki/Sendmail">sendmail</a> e o <a href="http://www.mutt.org/">mutt</a>.</p>
<p>Pede seu e-mail e senha e já configura o arquivo .muttrc</p>
<p>No final envia um e-mail para você mesmo com o tutorial de como usar no bash</p>
<p>Depois de instalado rode o exemplo abaixo para enviar e-mail por script.</p>
<code>echo 'Aqui coloque o corpo do e-mail' | mutt -s 'Aqui coloque o assunto do e-mail' DESTINO@EMAIL.COM -a LOCALDOANEXO LOCALDOOUTROANEXO</code>

<h4>Requerimentos</h4>
<p>sendmail - o script já instala</p>
<p>mutt - o script já instala</p>

<h4>Instalação</h4>
<p>Baixe o arquivo <a href="https://github.com/jorgediasdsg/email/blob/master/email.sh">email.sh</a></p>
<p>De permissão de execução para ele com o comando abaixo</p>
<code>sudo chmod +x email.sh</code>
<p>Rode o script de instalação com o comando abaixo</p>
<code>./email</code>

<h4>Dicas</h4>
<p>Crie uma senha de App no gmail para não usar a senha normal do e-mail.</p>
<a href="https://myaccount.google.com/apppasswords">CRIAR SENHA 2 ETAPAS NO GMAIL</a>
<p>Habilite sempre a verificação em 2 etapas no gmail para sua segurança</p>
<p>Se ver o erro abaixo é porque tem erro de senha, pode ser que não esteja usando app e esteja usando direto, se estiver fazendo isso <a href="clicar nesse link https://myaccount.google.com/lesssecureapps">clique aqui</a> e habilite a função de executar apps sem segurança na sua conta gmail.</p>
<code>SASL authentication failed</code>

<h4>Links úteis</h4>
<p>Fonte</p>
<a href="http://terminalroot.com.br/2018/03/como-enviar-e-mails-pelo-terminal.html">TERMINAL ROOT</a>
<p>http://www.mutt.org/</p>
<p>https://pt.wikipedia.org/wiki/Mutt_(cliente_de_email)</p>
<p>https://pt.wikipedia.org/wiki/Sendmail</p>
<p>https://wiki.gentoo.org/wiki/Mutt</p>
<p>https://www.youtube.com/watch?v=F0CluhlSUXE</p>
