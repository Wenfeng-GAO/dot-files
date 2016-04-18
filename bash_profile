alias lsa="ls -Gal"
alias ls="ls -G"

# connect to raspberry host
alias raspberry="ssh pi@192.168.0.101"
alias raspberry_addr="pi@192.168.0.101"
#alias mincong="ssh wenfeng@5.135.186.8"
#alias raspberry="ssh wenfeng@192.168.1.55"
alias ll="ls -l"
alias jca="javac-algs4"
alias ja="java-algs4"
alias lst='ls -R | grep ":$" | sed -e '"'"'s/:$//'"'"' -e '"'"'s/[^-][^\/]*\//--/g'"'"' -e '"'"'s/^/   /'"'"' -e '"'"'s/-/|/'"'"


alias clang="clang++ -std=c++11 -stdlib=libstdc++"


# JAVA_HOME
export JAVA_HOME="$(/usr/libexec/java_home)"

# Editor
export EDITOR='vim'
