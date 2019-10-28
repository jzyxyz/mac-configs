echo "User name?"
read $username 
git config --global user.name $username
echo "Email ?"
read $email 
git config --global user.email $email