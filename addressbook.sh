if [ ! -f addressbook.txt ]; then
    touch addressbook.txt
fi

add_entry() {
    name="$2"
    email="$3"
    echo "$name:$email" >> addressbook.txt
}

list_entries() {
    if [ -s addressbook.txt ]; then
        cat addressbook.txt | tr ':' ' '
    else
        echo "адресна книга порожня"
    fi
}

remove_entries() {
    name="$2"
    sed -i "/^$name:/d" addressbook.txt
}

clear_book() {
    > addressbook.txt
}

lookup_entries() {
    name="$2"
    grep "^$name:" addressbook.txt | while IFS=: read -r found_name email; do
        echo "$found_name: $email"
    done
}

case "$1" in
    "new")
        add_entry "$@"
        ;;
    "list")
        list_entries
        ;;
    "remove")
        remove_entries "$@"
        ;;
    "clear")
        clear_book
        ;;
    "lookup")
        lookup_entries "$@"
        ;;
    *)
        echo "Невідома команда. Використовуйте ./addressbook new/list/remove/clear/lookup"
        ;;
esac
