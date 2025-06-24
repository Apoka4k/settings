# Sftp into machines
sftp-jupyter() {
    echo -e "\e[36mAdd ssh key\e[0m"
    ssh-add ${HOME}/.ssh/trya-ecommerce-ftpaccess.pem
    echo -e "\e[36mOpen ssh tunnel\e[0m"
    cmd="ssh -o ExitOnForwardFailure=yes -f -N -L 2221:ecommerce.local:22 ftpaccess@bastion.trya.it"
    ${cmd}
    echo -e "\e[32mExample of sftp commands\e[0m"
    echo -e -e "  \e[32mftp>\e[0m get -r /notebooks/* ${HOME}/notebooks/infinity_fit"
    echo -e -e "  \e[32mftp>\e[0m put -r ${HOME}/notebooks/infinity_fit/* /notebooks"
    echo -e "\e[36mStart sftp session\e[0m"
    sftp -P 2221 ftpaccess@127.0.0.1
    echo -e "\e[36mSftp session closed\e[0m"
    echo -e "\e[36mClose ssh tunnel\e[0m"
    pid=$(pgrep ssh -a | grep "${cmd}" | head -n1 | awk '{print $1;}')
    kill ${pid}
    echo -e "\e[36mDone\e[0m"
}

sftp-infinity-jupyter() {
    echo -e "\e[36mAdd ssh key\e[0m"
    ssh-add ${HOME}/.ssh/trya-infinity-ftpaccess.pem
    echo -e "\e[36mOpen ssh tunnel\e[0m"
    cmd="ssh -o ExitOnForwardFailure=yes -f -N -L 2221:infinity.local:22 infinity_ftpaccess@bastion.trya.it"
    ${cmd}
    echo -e "\e[32mExample of sftp commands\e[0m"
    echo -e -e "  \e[32mftp>\e[0m get -r /notebooks/* ${HOME}/notebooks/infinity_fit"
    echo -e -e "  \e[32mftp>\e[0m put -r ${HOME}/notebooks/infinity_fit/* /notebooks"
    echo -e "\e[36mStart sftp session\e[0m"
    sftp -P 2221 infinity_ftpaccess@127.0.0.1
    echo -e "\e[36mSftp session closed\e[0m"
    echo -e "\e[36mClose ssh tunnel\e[0m"
    pid=$(pgrep ssh -a | grep "${cmd}" | head -n1 | awk '{print $1;}')
    kill ${pid}
    echo -e "\e[36mDone\e[0m"
}

# Open workbench logs with visual studio code
alias sql-log="code ${HOME}/.mysql/workbench/log/"

# Login into ECR
ecr-login() {
    echo -e "\e[36mLog into ECR\e[0m"
    aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 162572974850.dkr.ecr.eu-west-1.amazonaws.com
    echo -e "\e[36mDone\e[0m"
}

# Tools
export PATH=${PATH}:${HOME}/trya/tools/cutinsole
export PATH=${PATH}:${HOME}/trya/tools/mirror
export PATH=${PATH}:${HOME}/trya/tools/resize
export PATH=${PATH}:${HOME}/trya/tools/compute_features
export PATH=${PATH}:${HOME}/trya/tools/compute_main_features
export PATH=${HOME}/android-studio/bin:${PATH}

# Docker aliases
alias docker-compose="docker compose"

# Duplicate a docker volume
dup_vol() {
    OLD_VOLUME=${1}
    NEW_VOLUME=${OLD_VOLUME}_2
    AUXILIARY_OS=ubuntu:20.04
    echo "Volume: ${OLD_VOLUME}"
    echo "New volume: ${NEW_VOLUME}"
    echo "Auxiliary OS: ${AUXILIARY_OS}"
    CMD="docker volume create --name ${NEW_VOLUME}"
    echo ${CMD}
    ${CMD}
    CMD="docker container run --rm -it \
-v ${OLD_VOLUME}:/tmp/${OLD_VOLUME} \
-v ${NEW_VOLUME}:/tmp/${NEW_VOLUME} \
${AUXILIARY_OS} \
cp --recursive --preserve=all --no-dereference --verbose /tmp/${OLD_VOLUME} /tmp/${NEW_VOLUME}"
    echo ${CMD}
    ${CMD}
}

# SSH into machines
alias ssh-add-bastion="ssh-add ${HOME}/.ssh/trya-bastion-host.pem"
alias ssh-add-backend="ssh-add-bastion && ssh-add ${HOME}/.ssh/trya-backend.pem"
ssh-backend() {
    ssh-add-backend && ssh -A -J ec2-user@bastion.trya.it $@
}
alias ssh-add-website="ssh-add ${HOME}/.ssh/trya-website.pem"
alias ssh-add-standalone-3="ssh-add ${HOME}/.ssh/trya-standalone-3.pem"
alias ssh-add-standalone-4="ssh-add ${HOME}/.ssh/trya-standalone-4.pem"
alias ssh-add-reportify="ssh-add ${HOME}/.ssh/light-sail-default.pem"

alias ssh-bastion="ssh-add-bastion && ssh ec2-user@bastion.trya.it"
alias ssh-infinity-jupyter="ssh-backend ec2-user@10.0.1.177"
alias ssh-infinity="ssh-backend ec2-user@10.0.1.133"
alias ssh-jupyter="ssh-backend ec2-user@10.0.1.194"
alias ssh-production="ssh-backend ubuntu@10.0.1.90"
alias ssh-production-2="ssh-backend ubuntu@10.0.1.247"
alias ssh-staging="ssh-backend ubuntu@10.0.1.19"
alias ssh-testing="ssh-backend ubuntu@10.0.1.91"
alias ssh-telegram="ssh-add-standalone-4 && ssh ubuntu@34.245.34.231"
alias ssh-website="ssh-add-website && ssh ubuntu@34.243.161.233"
alias ssh-website-fitfeet="ssh-add-website && ssh ubuntu@3.254.101.218"
alias ssh-testing-marketplace="ssh-backend ubuntu@10.0.1.243"
alias ssh-production-marketplace="ssh-backend ubuntu@10.0.1.33"
alias ssh-fitter="ssh-add-standalone-3 && ssh ubuntu@54.246.26.188"
alias ssh-website-armin="ssh-add-website && ssh ubuntu@54.229.107.39"
alias ssh-reportify="ssh-add-reportify && ssh ubuntu@3.69.30.194"

# People git signature
alias set-matteo="git commit --amend --no-edit --author=\"Matteo Schieven <matteo.schieven@trya.it>\""
alias set-joseph="git commit --amend --no-edit --author=\"Joseph D'Souza <joseph.souza@trya.it>\""
alias set-michele="git commit --amend --no-edit --author=\"Michele Sbicego <michele.sbicego@trya.it>\""
alias set-giovanni="git commit --amend --no-edit --author=\"Giovanni Castiglioni <castigiova@gmail.com>\""
alias set-james="git commit --amend --no-edit --author=\"james charles <jjcvision@gmail.com>\""
alias set-apoka="git commit --amend --no-edit --author=\"Apoka <apoka.4k@gmail.com>\""
alias set-riccardo="git commit --amend --no-edit --author=\"RiccardoMiolato <riccardomiolato@gmail.com>\""

# Default conda environment
conda activate tryacli
