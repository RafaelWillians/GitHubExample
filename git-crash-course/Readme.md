## Pasta Oculta Git

Há uma pasta oculta chamada `.git` que indica que o nosso projeto é um repo git.

Se precisarmos criar um repo git em um novo projeto, criamos a pasta e inicializamos aquele repo usando o comando `git init`.

```sh
mkdir /workspaces/tmp/new-project
cd /workspaces/tmp/new-project/
git init
touch Readme.md
code Readme.md
# Editar o arquivo Readme.md e salvar.
git status
git add .
git commit -a -m "Adicionar Readme inicial"
```


## Cloning

Podemos clonar repos de três formas: HTTPS, SSH e GitHub CLI.

Como estamos usando o GitHub Codespaces, iremos criar um diretório temporário no nosso workspace.

```sh
mkdir /workspaces/tmp
cd /workspaces/tmp
```

Para conectar com o repo remotamente (via VSCode por exemplo), é necessário gerar um PAT (Personal Access Token) no site do GitHub. 

[GitHub Settings](https://github.com/settings/profile) > Developer Settings > Personal access tokens > [Fine-graned tokens](https://github.com/settings/tokens?type=beta)

Como princípio de Privilégio Mínimo, ideal é atribuir o mínimo necessário de permissões.
Para poder dar commits, habilitei somente as permissões de repositório Commit statuses (Read and Write) e Contents (Read and Write).

## SSH


Gerar a chave SSH.
```
git config --global user.email "email@email.com"
git config --global user.name "Seu Nome"
ssh-keygen -t ed25519 -C "email@email.com"
```

Via Windows, abrir PowerShell como administrador e ativar o ssh-agent

```
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent
```

Depois no terminal, adicionar a chave SSH
```
ssh-add c:/Users/Seu_Usuario/.ssh/id_ed25519
```

Copiar a chave pública ssh
```
cat ssh id_ed25519.pub
```

No site do GitHub, adicionar chave SSH e colar a chave pública copiada. 

Depois, testar conexão com o comando abaixo e tentar dar commit e push.
```
ssh -T git@github.com
```





## HTTPS

```sh
git clone https://github.com/RafaWilliansAC2/GitHubExample.git
cd GitHubExample/
```

## Commits

"Setar" o editor global

```sh
git config --global core.editor emacs
```

Para dar commit com uma mensagem direto pelo CLI, sem precisar abrir um editor.

```sh
git commit -m "mensagem do commit"
```

## Branches

Lista as branches do projeto.
```
git branch
```

Criar nova branch.
```
git branch branch-name
```

Selecionar branch específica.
```
git checkout branch-name
```


## Remotes

## Stashing

## Merging

```sh
git merge main
```

## Add

Quando desejamos dar staging nas alterações que serão incluídas no commit.
Podemos usar o . para adicionar todos os arquivos possíveis.

```sh
git add Readme.md
git add .
```

## Reset

Reset permite voltar as mudanças de Staged para Unstaged.
Útil para quando precisarmos reverter todos os arquivos, para não serem commitados.

```sh
git add .
git reset
```

## Status

Git status permite mostrar quais arquivos serão ou não commitados.

```sh
git status
```

## Gitconfig file

O arquivo gitconfig armazena as configurações globais do Git, como email, nome, editor, entre outras.

Mostrar o conteúdo do arquivo .gifconfig

```sh
git config --list
```

Na primeira instalação local do Git, precisamos "setar" o nome e o email.

```sh
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

## Log

Mostra as alterações recentes, SHA, data/hora e mensagens dos commits

```sh
git log
```

## Push

Quando precisamos subir um repo para nossa origem remota (para o GitHub por exemplo)

```sh
git push
```