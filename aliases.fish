set icloud ~/Library/Mobile\ Documents/com~apple~CloudDocs/

alias vim='mvim -v'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias aws-sync-rahuldhir='aws s3 sync ~/code/sites/rahuldhir.github.io/ s3://rahuldhir.com --delete --exclude=".DS_Store" --exclude="node_modules/*" --exclude=".git/*" --exclude="notes/*" --exclude="files/*" --metadata-directive="REPLACE"'

alias aws-sync-notes='aws s3 sync ~/code/notes/ s3://rahuldhir.com/notes/ --delete --exclude=".DS_Store" --exclude=".git/*" --metadata-directive="REPLACE"'

alias aws-sync-resume='aws s3 sync ~/code/resume/ s3://rahuldhir.com/files/ --delete --exclude=".DS_Store" --metadata-directive="REPLACE"'

alias aws-sync-texaspredental='aws s3 sync ~/code/sites/texaspredental.org/ s3://texaspredental.org --delete --exclude=".DS_Store" --exclude="node_modules/*" --exclude=".git/*" --content-type="text/html" --metadata-directive="REPLACE" --profile TPS'

alias aws-sync-txbha='aws s3 sync ~/code/sites/txbha.org/ s3://txbha.org --delete --exclude=".DS_Store" --exclude="node_modules/*" --exclude=".git/*" --content-type="text/html" --metadata-directive="REPLACE" --profile TXBHA'

