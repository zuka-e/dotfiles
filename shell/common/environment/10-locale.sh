case "$(locale -a 2> /dev/null)" in
  *'en_US.UTF-8'*)
    LANG='en_US.UTF-8'
    ;;
  *'C.UTF-8'*)
    LANG='C.UTF-8'
    ;;
esac

: "${LANG:=C}"

export LANG
