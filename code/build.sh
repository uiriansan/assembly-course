if [ "$#" -lt 1 ]; then
    echo -e "\nMissing <file>"
    exit
fi

FILE="$1"
BASE_FILE=$(basename "$FILE" | cut -d"." -f1)
nasm -f elf -o "$BASE_FILE".o "$FILE"
ld -m elf_i386 -o "$BASE_FILE" "$BASE_FILE".o

if [[ "$1" =~ ^(-r|-run|r|run)$ ]] || [[ "$2" =~ ^(-r|-run|r|run)$ ]]; then
    ./"$BASE_FILE"
fi
