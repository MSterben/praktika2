if [ "$#" -ne 3 ]; then
  echo "Потрібно передати 3 аргументи: каталог, оригінальне розширення та нове розширення"
  exit 1
fi

directory="$1"
original_extension="$2"
new_extension="$3"

if [ ! -d "$directory" ]; then
  echo "Каталог '$directory' не існує."
  exit 1
fi

for file in "$directory"/*."$original_extension"; do
  if [ -e "$file" ]; then

    filename=$(basename "$file")

    new_filename="${filename%.*}.$new_extension"
    mv "$file" "$directory/$new_filename"

    echo "Переіменовую '$filename' на '$new_filename'"
  fi
done
