export TIMEFMT=$'Time %*E %P CPU'

function encrypt () {time (encryptDir $1) }
function decrypt () {time (decryptDir $1) }

function encryptDir () {
    echo "Encrypting $1"
    tar czf $1.tar.gz $1
    gpg -e -r cypher $1.tar.gz
    mv $1.tar.gz.gpg $1.cypher
    rm -f $1.tar.gz
    rm -rf $1
    echo "Encrypted $1 to $1.cypher"
}

function decryptDir () {
    echo "Decrypting $1"
    local p=`echo $1 | sed -e 's/\.cypher$//'`;
    mv $1 $p.gpg
    gpg -d -o $p.tar.gz $p.gpg
    tar xzf $p.tar.gz
    rm -f $p.gpg
    rm -f $p.tar.gz
    echo "Decrypted $1 to $p"
}
