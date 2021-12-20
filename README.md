# auto-odin


`sudo apt-get install expect`

mkdir autoodin\
cd autoodin\
nano delegate.exp\
nano delegate.sh\
chmod +x delegate.exp delegate.sh\
screen -S autoodin\
for(( i=1; i <=9999; i++ ))\
do\
./delegate.exp\
done\
