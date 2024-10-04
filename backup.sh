echo 'backup start' > /home/ubuntu/gb.log

tar -cvzf backup.tgz /cantina/content

aws s3 cp backup.tgz s3://galax9/cantina/

echo backup complete >> /home/ubuntu/gb.log