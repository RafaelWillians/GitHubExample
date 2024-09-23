# Comandos Básicos Git

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


## Clonar

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


### Gerar a chave SSH.
```
git config --global user.email "email@email.com"
git config --global user.name "Seu Nome"
ssh-keygen -t ed25519 -C "email@email.com"
```

#### Windows
Via Windows, abrir PowerShell como administrador e ativar o ssh-agent

```
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent
```

Depois no terminal, adicionar a chave SSH
```
ssh-add c:/Users/Seu_Usuario/.ssh/id_ed25519
```

#### Linux (utilizado Linux Mint)

Via SSH
```
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
```

Alternativa: Instalado o CLI do GitHub para poder conectar.
```sh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
&& gh auth login
```


#### Após gerar chave SSH

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

Podemos adicionar remote, mas muitas vezes apenas adicionaremos remoto via upstream ao adicionar uma branch.

```sh
git remote add ...
git branch -u origin nova-feature
```

## Stashing

```
git stash
git stash list
git stash save meu-nome
git stash apply
git stash pop
```

## Merge

```sh
git checkout dev
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

## Adicionar PAT

```
export GH_TOKEN="inserir_token_aqui"
```

## Tags

Para aplicarmos tags no nosso repo (para quando criarmos releases e mantermos o histórico delas)

```
git tag 1.0.0
git push --tags
git checkout 1.0.0
git tag -d 1.0.0
git push -delete origin 1.0.0
```

## Executar Workflow manual

```sh
gh workflow run manual.yml -f name=mona -f greeting=hello -F data=@mydata
echo '{"name":"rafa", "greeting":"hello"}' | gh workflow run manual.yml --json
```

## Webhook
```sh
curl -X POST \
-H "Accept: application/vnd.github+json" \
-H "Authorization: token {PAT} \
-d '{"event_type": "webhook", "client_payload": {"key": "value"} }' \
https://api.github.com/repos/{owner}/{repo}/dispatches
```