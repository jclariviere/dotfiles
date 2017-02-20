# Admin privileges check
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    echo "Script must be run as admin for symlinks"
    exit
}


echo "[+] Setting up vim"
# download vim-plug
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))

# symlinks + install plugins
cmd /c mklink $HOME\_vimrc $HOME\dotfiles\vim\.vimrc
cmd /c mklink $HOME\_gvimrc $HOME\dotfiles\vim\.gvimrc.windows
Start-Process -Wait -NoNewWindow gvim "+PlugInstall +qall"


echo "`n`n[+] Setting up git"
cmd /c mklink $HOME\.gitconfig $HOME\dotfiles\git\.gitconfig
cp $HOME\dotfiles\git\.gitconfig.user.template $HOME\.gitconfig.user


echo "`n`n[+] Done! Don't forget to edit $HOME\.gitconfig.user"
